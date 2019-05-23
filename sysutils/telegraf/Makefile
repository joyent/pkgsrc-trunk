# $NetBSD$

DISTNAME=       telegraf-1.9.5
MASTER_SITES=	${MASTER_SITE_GITHUB:=influxdata/}
GITHUB_PROJECT=	telegraf
CATEGORIES=	sysutils
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/influxdata/telegraf
COMMENT=	Plugin-driven server agent for collecting & reporting metrics
LICENSE=	mit

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/influxdata/telegraf

PKG_SYSCONFSUBDIR=	telegraf

DATADIR=	${VARBASE}/lib/telegraf
LOGDIR=		${VARBASE}/log/telegraf

BUILD_DEFS+=		TELEGRAF_USER TELEGRAF_GROUP VARBASE
FILES_SUBST+=		TELEGRAF_USER=${TELEGRAF_USER:Q}
FILES_SUBST+=		TELEGRAF_GROUP=${TELEGRAF_GROUP:Q}
FILES_SUBST+=		DATADIR=${DATADIR:Q}
FILES_SUBST+=		LOGDIR=${LOGDIR:Q}

TELEGRAF_USER?=		telegraf
TELEGRAF_GROUP?=	telegraf
OWN_DIRS_PERMS+=	${DATADIR} ${TELEGRAF_USER} ${TELEGRAF_GROUP} 0700
OWN_DIRS_PERMS+=	${LOGDIR} ${TELEGRAF_USER} ${TELEGRAF_GROUP} 0700
PKG_USERS_VARS+=	TELEGRAF_USER
PKG_GROUPS_VARS+=	TELEGRAF_GROUP
PKG_GROUPS=		${TELEGRAF_GROUP}
PKG_USERS=		${TELEGRAF_USER}:${TELEGRAF_GROUP}
RCD_SCRIPTS=		telegraf

INSTALLATION_DIRS+=	bin etc/telegraf etc/logrotate.d share/doc/telegraf share/examples/telegraf share/examples/telegraf/logrotate.d

DOC_FILES+=	LICENSE README.md CHANGELOG.md
BIN_FILES+=	telegraf
CONF_FILES+=	${PREFIX}/share/examples/${PKGBASE}/telegraf.conf ${PKG_SYSCONFDIR}/telegraf.conf
CONF_FILES+=	${PREFIX}/share/examples/${PKGBASE}/logrotate.d/telegraf ${PKG_SYSCONFDIR}/../logrotate.d/telegraf

# go language executables don't have SSP support
CHECK_SSP_SKIP= bin/*

.include "../../mk/bsd.prefs.mk"

# the library used by the system input plugin segfaults on Solaris/Illumos.
.if ${OPSYS} == "SunOS"
SUBST_CLASSES+=	fix_config
SUBST_STAGE.fix_config= pre-build
SUBST_MESSAGE.fix_config=	Disabling broken plugins on Solaris/Illumos
SUBST_FILES.fix_config+=	etc/telegraf.conf
SUBST_SED.fix_config+=	-e 's/\$\[\[inputs\.system\]\]/\#[[inputs.system]]/'
.endif

.include "go-deps.mk"

INFLUX_GO_FLAGS=	-s
INFLUX_GO_FLAGS+=	-X main.version=${PKGVERSION_NOREV}
INFLUX_GO_FLAGS+=	-X main.commit=${GITHUB_TAG}
INFLUX_GO_FLAGS+=	-X main.branch=pkgsrc
INFLUX_GO_FLAGS+=	-X main.buildstamp=pkgsrc

do-build:
	${RUN} ${PKGSRC_SETENV} ${MAKE_ENV} \
		${GO} build -ldflags "${INFLUX_GO_FLAGS}" ${GO_BUILD_PATTERN}
	${RUN} ${PKGSRC_SETENV} ${MAKE_ENV} \
		${GO} install -ldflags "${INFLUX_GO_FLAGS}" ${GO_BUILD_PATTERN}

do-install:
.for idir in ${INSTALLATION_DIRS}
	${MKDIR}  ${DESTDIR}${PREFIX}/${idir}
.endfor
.for x in ${BIN_FILES}
	${INSTALL_PROGRAM} ${WRKDIR}/bin/${x}	\
	  ${DESTDIR}${PREFIX}/bin/${x}
.endfor
.for x in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${x} \
	  ${DESTDIR}${PREFIX}/share/doc/telegraf/${x}
.endfor
	${INSTALL_DATA} ${WRKSRC}/etc/telegraf.conf ${DESTDIR}${PREFIX}/share/examples/${PKGBASE}/
	${INSTALL_DATA} ${WRKSRC}/etc/logrotate.d/telegraf ${DESTDIR}${PREFIX}/share/examples/${PKGBASE}/logrotate.d/telegraf

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
