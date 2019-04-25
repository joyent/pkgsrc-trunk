# $NetBSD$

GITHUB_PROJECT=	influxdb
PKGVERSION_NOREV= 1.7.5
DISTNAME=       influxdb-1.7.5
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GITHUB:=influxdata/}
MAINTAINER=    pkgsrc-users@NetBSD.org
HOMEPAGE=      https://github.com/influxdata/influxdb
COMMENT=       Scalable datastore for metrics, events, and real-time analytics
LICENSE=	mit

# despite being the default value, this explicit declaration is required for things
# to build properly.
EXTRACT_SUFX=   .tar.gz

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/influxdata/influxdb

BUILD_DEPENDS+=			asciidoc-[0-9]*:../../textproc/asciidoc
BUILD_DEPENDS+=			xmlto-[0-9]*:../../textproc/xmlto
USE_TOOLS+=	gmake

PKG_SYSCONFSUBDIR=	influxdb

DATADIR=	${VARBASE}/lib/influxdb
LOGDIR=		${VARBASE}/log/influxdb

SUBST_CLASSES+=		fix-cfg
SUBST_STAGE.fix-cfg=	pre-configure
SUBST_MESSAGE.fix-cfg=	Disabling phone-home in sample config
SUBST_FILES.fix-cfg=	etc/config.sample.toml
SUBST_SED.fix-cfg=	-e 's/^\# reporting-disabled = false/reporting-disabled = true/'

BUILD_DEFS+=		INFLUXDB_USER INFLUXDB_GROUP VARBASE
FILES_SUBST+=		INFLUXDB_USER=${INFLUXDB_USER:Q}
FILES_SUBST+=		INFLUXDB_GROUP=${INFLUXDB_GROUP:Q}
FILES_SUBST+=		DATADIR=${DATADIR:Q}
FILES_SUBST+=		LOGDIR=${LOGDIR:Q}

INFLUXDB_USER?=		influxdb
INFLUXDB_GROUP?=	influxdb
OWN_DIRS_PERMS+=	${DATADIR} ${INFLUXDB_USER} ${INFLUXDB_GROUP} 0700
OWN_DIRS_PERMS+=	${LOGDIR} ${INFLUXDB_USER} ${INFLUXDB_GROUP} 0700
PKG_USERS_VARS+=	INFLUXDB_USER
PKG_GROUPS_VARS+=	INFLUXDB_GROUP
PKG_GROUPS=		${INFLUXDB_GROUP}
PKG_USERS=		${INFLUXDB_USER}:${INFLUXDB_GROUP}
RCD_SCRIPTS=		influxdb

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1 etc/influxdb share/doc/influxdb share/examples/influxdb

DOC_FILES+=	LICENSE DEPENDENCIES.md QUERIES.md README.md CHANGELOG.md
BIN_FILES+=	influx influx_inspect influx_stress influx_tsm influxd stress_test_server test_client
CONF_FILES+=	${PREFIX}/share/examples/${PKGBASE}/config.sample.toml ${PKG_SYSCONFDIR}/config.toml

# extracted dependencies with target print-go-deps
.include "./go-deps.mk"

do-build:
	${RUN} ${PKGSRC_SETENV} ${MAKE_ENV} ${GO} build -ldflags "-s -X main.version=${PKGVERSION_NOREV} -X main.commit=${GITHUB_TAG} -X main.buildstamp=pkgsrc" ${GO_BUILD_PATTERN}
	${RUN} ${PKGSRC_SETENV} ${MAKE_ENV} ${GO} install -ldflags "-s -X main.version=${PKGVERSION_NOREV} -X main.commit=${GITHUB_TAG} -X main.buildstamp=pkgsrc" ${GO_BUILD_PATTERN}

do-install:
	cd ${WRKSRC}/man && ${SETENV} ${PKGSRC_MAKE_ENV} ${MAKE_PROGRAM}
.for idir in ${INSTALLATION_DIRS}
	${MKDIR}  ${DESTDIR}${PREFIX}/${idir}
.endfor
	for manpage in ${WRKSRC}/man/*.1 ; do \
		${INSTALL_MAN} $$manpage ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1 ; \
	done
.for x in ${BIN_FILES}
	${INSTALL} ${WRKDIR}/bin/${x}	\
	  ${DESTDIR}${PREFIX}/bin/${x}
.endfor
.for x in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${x} \
	  ${DESTDIR}${PREFIX}/share/doc/influxdb/${x}
.endfor
	${INSTALL_DATA} ${WRKSRC}/etc/config.sample.toml ${DESTDIR}${PREFIX}/share/examples/${PKGBASE}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
