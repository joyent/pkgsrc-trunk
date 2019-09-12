# $NetBSD: Makefile,v 1.21 2018/08/15 13:55:00 ryoon Exp $

DISTNAME=	cjose-0.6.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=cisco/}
GITHUB_RELEASE=	v${PKGVERSION_NOREV}
GITHUB_PROJECT=	cjose

MAINTAINER=	pkgsrc-users@NetBSD.org
#HOMEPAGE=	https://github.org/cisco/cjose
COMMENT=	C library implementing the Javascript Object Signing and Encryption (JOSE)
LICENSE=	MIT	

GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--with-openssl=/opt/local --prefix=/opt/local --with-jansson=/opt/local
USE_LIBTOOL=		YES
USE_MULTIARCH=		lib
USE_PKGLOCALEDIR=	YES

.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/jansson/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
