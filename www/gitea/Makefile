# $NetBSD: Makefile,v 1.34 2020/05/20 22:37:40 teutat3s Exp $

DISTNAME=	gitea-1.11.5
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-gitea/}
CATEGORIES=	www
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	tuxillo@quantumachine.net
HOMEPAGE=	https://gitea.io/
COMMENT=	Compact self-hosted Git service
LICENSE=	mit

GO_DIST_BASE=		${DISTNAME}
GO_SRCPATH=		code.gitea.io/gitea

.include "../../lang/go/go-vars.mk"
.include "options.mk"

BUILD_DEFS+=	VARBASE GITEA_USER GITEA_GROUP

EXTRACT_USING=	bsdtar
USE_TOOLS+=	gmake ggrep pax
DEPENDS+=	git-base-[0-9]*:../../devel/git-base
BUILD_DEPENDS+=	nodejs:../../lang/nodejs
BUILD_DEPENDS+=	npm:../../lang/npm

EGDIR=		${PREFIX}/share/examples/gitea

OWN_DIRS_PERMS+=	${VARBASE}/log/gitea ${GITEA_USER} ${GITEA_GROUP} 0755
OWN_DIRS_PERMS+=	${VARBASE}/db/gitea ${GITEA_USER} ${GITEA_GROUP} 0755
OWN_DIRS_PERMS+=	${PKG_SYSCONFDIR}/conf ${GITEA_USER} ${GITEA_GROUP} 0755

GITEA_USER?=	git
GITEA_GROUP?=	git

PKG_GROUPS_VARS+=	GITEA_GROUP
PKG_USERS_VARS+=	GITEA_USER

PKG_SYSCONFSUBDIR=	gitea

INSTALLATION_DIRS+=	sbin share/gitea share/examples/gitea

PKG_GROUPS=	${GITEA_GROUP}
PKG_USERS=	${GITEA_USER}:${GITEA_GROUP}

PKG_SHELL.${GITEA_USER}=	${SH}
PKG_HOME.${GITEA_USER}=		${VARBASE}/db/gitea

SUBST_CLASSES+=		fix-var
SUBST_STAGE.fix-var=	pre-configure
SUBST_MESSAGE.fix-var=	Replace some vars
SUBST_FILES.fix-var=	${WRKDIR}/app.ini.sample
SUBST_VARS.fix-var=	VARBASE GITEA_USER

MAKE_DIRS+=	${PKG_SYSCONFDIR}/conf

CONF_FILES_PERMS+=	${EGDIR}/app.ini.sample ${PKG_SYSCONFDIR}/conf/app.ini \
			${GITEA_USER} ${GITEA_GROUP} 0600

FILES_SUBST+=	GITEA_USER=${GITEA_USER}
FILES_SUBST+=	GITEA_GROUP=${GITEA_GROUP}
FILES_SUBST+=	GITEA_USER_HOME=${VARBASE}/db/gitea
FILES_SUBST+=	GITEA_SHARE_DIR=${PREFIX}/share/gitea

RCD_SCRIPTS+=	gitea

MAKE_TARGET=	build
MAKE_ENV+=	TAGS="${GO_TAGS}"

pre-patch:
	${CP} ${FILESDIR}/app.ini.sample ${WRKDIR}/
	${CP} ${WRKDIR}/${DISTNAME}/.eslint* ${WRKSRC}/
	${CP} ${WRKDIR}/${DISTNAME}/.stylelintrc ${WRKSRC}/
	echo ${PKGVERSION_NOREV} > ${WRKSRC}/VERSION

do-build:
	cd ${WRKSRC} && ${BUILD_MAKE_CMD}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/gitea ${DESTDIR}${PREFIX}/sbin
	cd ${WRKSRC}/options && ${PAX} -rw -pp . ${DESTDIR}${PREFIX}/share/gitea/options/
	cd ${WRKSRC}/templates && ${PAX} -rw -pp . ${DESTDIR}${PREFIX}/share/gitea/templates/
	cd ${WRKSRC}/public && ${PAX} -rw -pp . ${DESTDIR}${PREFIX}/share/gitea/public/

post-install:
	${INSTALL_DATA} ${WRKDIR}/app.ini.sample ${DESTDIR}${EGDIR}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
