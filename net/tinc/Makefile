# $NetBSD: Makefile,v 1.27 2017/09/08 13:53:25 jperkin Exp $

DISTNAME=	tinc-1.0.32
CATEGORIES=	net
MASTER_SITES=	http://www.tinc-vpn.org/packages/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.tinc-vpn.org/
COMMENT=	Virtual Private Network (VPN) daemon
LICENSE=	gnu-gpl-v2

BUILD_DEFS+=		VARBASE

INFO_FILES=		yes
USE_TOOLS+=		msgfmt
GNU_CONFIGURE=		yes

SUBST_CLASSES+=		mdoc
SUBST_FILES.mdoc=	doc/tinc.conf.5.in
SUBST_SED.mdoc+=	-e '/^$$/d'
SUBST_STAGE.mdoc=	pre-patch
EGDIR=			${PREFIX}/share/examples/tinc
TINC_USER?=		tinc
TINC_GROUP?=		tinc

PKG_GROUPS_VARS+=       TINC_GROUP
PKG_USERS_VARS+=        TINC_USER

PKG_GROUPS=             ${TINC_GROUP}
PKG_USERS=              ${TINC_USER}:${TINC_GROUP}
PKG_SHELL.${TINC_USER}=	${SH}

OWN_DIRS+=	${VARBASE}/log/tinc

INSTALLATION_DIRS= share/examples/tinc

PKG_SYSCONFSUBDIR= tinc

CONF_FILES_PERMS+= ${EGDIR}/tinc.conf ${PKG_SYSCONFDIR}/default/tinc.conf \
	${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 644
CONF_FILES_PERMS+= ${EGDIR}/tinc-up ${PKG_SYSCONFDIR}/default/tinc-up \
	${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 755
CONF_FILES_PERMS+= ${EGDIR}/tinc-down ${PKG_SYSCONFDIR}/default/tinc-down \
	${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 755


MAKE_DIRS+=${PKG_SYSCONFDIR}/default

.include "../../mk/bsd.prefs.mk"

.if ${INIT_SYSTEM} == "smf"
SMF_METHODS=	tinc
MESSAGE_SRC+=	MESSAGE.smf
MESSAGE_SUBST+=	PKG_SYSCONFDIR={PKG_SYSCONFDIR:Q}
.endif

post-install:
	${INSTALL_DATA} ${FILESDIR}/tinc.conf ${DESTDIR}${EGDIR}
	${INSTALL_DATA} ${FILESDIR}/tinc-up ${DESTDIR}${EGDIR}
	${INSTALL_DATA} ${FILESDIR}/tinc-down ${DESTDIR}${EGDIR}

.include "../../archivers/lzo/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
