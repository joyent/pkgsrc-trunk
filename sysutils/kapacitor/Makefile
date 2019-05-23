# $NetBSD$

DISTNAME=       kapacitor-1.5.2
MASTER_SITES=	${MASTER_SITE_GITHUB:=influxdata/}
CATEGORIES=	sysutils
GITHUB_PROJECT=	kapacitor
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/influxdata/kapacitor
COMMENT=	Framework for processing, monitoring, and alerting on time series data
LICENSE=	mit

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/influxdata/kapacitor

PKG_SYSCONFSUBDIR=	kapacitor

REPLACE.kapacitor.old=       /etc/kapacitor
REPLACE.kapacitor.new=       ${PKG_SYSCONFDIR}
REPLACE_FILES.kapacitor=     share/examples/kapacitor/kapacitor.conf

DATADIR=	${VARBASE}/lib/kapacitor
LOGDIR=		${VARBASE}/log/kapacitor

BUILD_DEFS+=		KAPACITOR_USER KAPACITOR_GROUP VARBASE
FILES_SUBST+=		KAPACITOR_USER=${KAPACITOR_USER:Q}
FILES_SUBST+=		KAPACITOR_GROUP=${KAPACITOR_GROUP:Q}
FILES_SUBST+=		DATADIR=${DATADIR:Q}
FILES_SUBST+=		LOGDIR=${LOGDIR:Q}

KAPACITOR_USER?=	kapacitor
KAPACITOR_GROUP?=	kapacitor
OWN_DIRS_PERMS+=	${DATADIR} ${KAPACITOR_USER} ${KAPACITOR_GROUP} 0700
OWN_DIRS_PERMS+=	${LOGDIR} ${KAPACITOR_USER} ${KAPACITOR_GROUP} 0700
PKG_USERS_VARS+=	KAPACITOR_USER
PKG_GROUPS_VARS+=	KAPACITOR_GROUP
PKG_GROUPS=		${KAPACITOR_GROUP}
PKG_USERS=		${KAPACITOR_USER}:${KAPACITOR_GROUP}
RCD_SCRIPTS=		kapacitor

INSTALLATION_DIRS+=	bin etc/logrotate.d etc/kapacitor share/doc/kapacitor share/kapacitor/telegraf share/examples/kapacitor/logrotate.d

DOC_FILES+=	LICENSE LICENSE_OF_DEPENDENCIES.md DESIGN.md README.md CHANGELOG.md
BIN_FILES+=	kapacitor kapacitord
CONF_FILES+=    ${PREFIX}/share/examples/${PKGBASE}/kapacitor.conf ${PKG_SYSCONFDIR}/kapacitor.conf
CONF_FILES+=    ${PREFIX}/share/examples/${PKGBASE}/logrotate.d/kapacitor ${PKG_SYSCONFDIR}/../logrotate.d/kapacitor

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
	  ${DESTDIR}${PREFIX}/share/doc/kapacitor/${x}
.endfor
	${INSTALL_DATA} ${WRKSRC}/etc/kapacitor/kapacitor.conf ${DESTDIR}${PREFIX}/share/examples/${PKGBASE}/
	${INSTALL_DATA} ${WRKSRC}/etc/logrotate.d/kapacitor ${DESTDIR}${PREFIX}/share/examples/${PKGBASE}/logrotate.d/kapacitor

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
