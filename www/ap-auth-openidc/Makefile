# $NetBSD: Makefile,v 1.7 2018/12/13 19:52:24 adam Exp $

DISTNAME=	mod_auth_openidc-2.4.0
PKGNAME=	${DISTNAME:S/mod/${APACHE_PKG_PREFIX}/:S/_/-/g}
PKGREVISION=	5
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=zmartzone/}
GITHUB_PROJECT=	mod_auth_openidc
GITHUB_TYPE=	release
GITHUB_RELEASE=	v${PKGVERSION_NOREV}

HOMEPAGE=	https://github.com/zmartzone/mod_auth_openidc
COMMENT=	OpenID Connect Relying Party implementation for Apache HTTP Server 2.x
LICENSE=	apache-2.0

DEPEND+=	devel/cjose
DEPEND+=	textproc/jansson

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-apxs2=${APXS}
USE_TOOLS+=		gmake
USE_TOOLS+=		pkg-config

APACHE_MODULE=		yes

INSTALLATION_DIRS+=	lib/httpd

do-install:
	${INSTALL_LIB} ${WRKSRC}/src/.libs/mod_auth_openidc.so \
	    ${DESTDIR}${PREFIX}/lib/httpd

.include "../../mk/apache.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../textproc/jansson/buildlink3.mk"
.include "../../devel/cjose/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
