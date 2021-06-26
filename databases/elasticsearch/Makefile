# $NetBSD: Makefile,v 1.51 2020/05/17 00:54:00 tnn Exp $

DISTNAME=	elasticsearch-7.13.2
GITHUB_TAG=	v7.13.2
CATEGORIES=	databases textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=elastic/}

MAINTAINER=	imil@NetBSD.org
HOMEPAGE=	http://www.elasticsearch.org/
COMMENT=	Distributed RESTful Search Engine
LICENSE=	apache-2.0

# Uses javah, which doesn't exist in JDK10+ anymore.
PKG_JVMS_ACCEPTED=	openjdk15

# The JNA version should match the one that ES ships with.
JNA=			5.7.0

BUILD_DEPENDS+=	apache-ant-[0-9]*:../../devel/apache-ant

USE_LANGUAGES=	c c++
USE_JAVA=	run
USE_JAVA2=	8
USE_TOOLS+=	bash:run gmake pax pkg-config

PKG_SYSCONFSUBDIR=	elasticsearch
EGDIR=			${PREFIX}/share/examples/elasticsearch

ES_USER?=	elasticsearch
ES_GROUP?=	${ES_USER}

CONFS=		elasticsearch.yml jvm.options log4j2.properties
.for f in ${CONFS}
CONF_FILES_PERMS+=	${EGDIR}/${f} ${PKG_SYSCONFDIR}/${f} ${ES_USER} ${ES_GROUP} 0600
.endfor
DOCS=		LICENSE.txt NOTICE.txt README.asciidoc

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=	ES_USER ES_GROUP ES_DBDIR ES_LOGDIR ES_PIDDIR VARBASE

ES_BASEDIR?=	${PREFIX}/lib/elasticsearch
ES_DBDIR?=	${VARBASE}/db/elasticsearch
ES_LOGDIR?=	${VARBASE}/log/elasticsearch
ES_PIDDIR?=	${VARBASE}/run

PKG_USERS_VARS+=	ES_USER
PKG_GROUPS_VARS+=	ES_GROUP
PKG_GROUPS=		${ES_GROUP}
PKG_USERS=		${ES_USER}:${ES_GROUP}

FILES_SUBST+=		JAVA_HOME=${PKG_JAVA_HOME:Q} ES_USER=${ES_USER}	\
			ES_GROUP=${ES_GROUP} ES_BASEDIR=${ES_BASEDIR}	\
			ES_LOGDIR=${ES_LOGDIR} ES_PIDDIR=${ES_PIDDIR}	\
			ES_DBDIR=${ES_DBDIR} 				\
			DISTNAME=${DISTNAME}

RCD_SCRIPTS=		elasticsearch

OWN_DIRS+=		${ES_BASEDIR}/plugins
OWN_DIRS_PERMS+=	${ES_LOGDIR} ${ES_USER} ${ES_GROUP} 0700
OWN_DIRS_PERMS+=	${ES_DBDIR} ${ES_USER} ${ES_GROUP} 0700
OWN_DIRS_PERMS+=	${PREFIX}/etc/elasticsearch ${ES_USER} ${ES_GROUP} 0700
MAKE_DIRS+=		${PKG_SYSCONFDIR}/scripts

REPLACE_BASH+=		bin/elasticsearch*
INSTALLATION_DIRS+=	bin ${ES_BASEDIR}/bin
INSTALLATION_DIRS+=	${EGDIR} ${PREFIX}/share/doc/elasticsearch

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	distribution/src/bin/elasticsearch-env distribution/src/config/elasticsearch.yml
SUBST_VARS.paths=	PKG_JAVA_HOME PKG_SYSCONFDIR ES_DBDIR ES_BASEDIR ES_LOGDIR

BUILDLINK_TRANSFORM+=	rm:-Wno-unknown-warning-option
BUILDLINK_TRANSFORM+=	rm:-Werror

do-build:
	${_ULIMIT_CMD} cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ./gradlew localDistro

do-install:
.for f in ${CONFS}
	${INSTALL_DATA} ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/config/${f} ${DESTDIR}${EGDIR}
.endfor
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f}	\
		${DESTDIR}${PREFIX}/share/doc/elasticsearch
.endfor
	${INSTALL_SCRIPT} ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/bin/elasticsearch ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/bin/elasticsearch-env ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/bin/elasticsearch-keystore ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/bin/elasticsearch-plugin ${DESTDIR}${PREFIX}/bin

	# Use the dylib from the official JNA distribution (since building it locally causes segfaults).
	mkdir ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-{es,prebuilt}
	cd ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-es && jar xf ../jna-${JNA}-1.jar && mkdir com/sun/jna/sunos-x86-64
	cd ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-prebuilt && curl -OL https://github.com/java-native-access/jna/raw/${JNA}/lib/native/sunos-x86-64.jar && jar xf sunos-x86-64.jar
	mv ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-prebuilt/libjnidispatch.so ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-es/com/sun/jna/sunos-x86-64/libjnidispatch.so
	cd ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-es && jar cf ../jna-${JNA}-1.jar com/
	rm -Rf ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT/lib/jna-{es,prebuilt}

	cd ${WRKSRC}/build/distribution/local/elasticsearch-${PKGVERSION}-SNAPSHOT && ${PAX} -rw -pp bin lib logs modules plugins ${DESTDIR}${ES_BASEDIR}
	find ${DESTDIR}${ES_BASEDIR} -name '*.orig' -exec rm {} \;
	chmod -x ${DESTDIR}${ES_BASEDIR}/bin/elasticsearch-sql-cli-7.13.2-SNAPSHOT.jar
	find ${DESTDIR}${ES_BASEDIR} -name '*-SNAPSHOT.jar' | while read i ; do mv "$$i" "$${i%-SNAPSHOT.jar}.jar" ; done
# Remove irrelevant precompiled binaries and libs
	${RM} -rf ${DESTDIR}${ES_BASEDIR}/modules/x-pack-ml/platform/windows-x86_64
.if empty(MACHINE_PLATFORM:MDarwin-*-x86_64)
	${RM} -rf ${DESTDIR}${ES_BASEDIR}/modules/x-pack-ml/platform/darwin-x86_64
.endif
.if empty(MACHINE_PLATFORM:MLinux-*-x86_64)
	${RM} -rf ${DESTDIR}${ES_BASEDIR}/modules/x-pack-ml/platform/linux-x86_64
.endif

.include "../../devel/libffi/buildlink3.mk"
.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
