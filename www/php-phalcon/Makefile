# $NetBSD$
#

MODNAME=		phalcon
PECL_VERSION=		3.2.4
DISTNAME=		phalcon-${PECL_VERSION}
PKGNAME=		${PHP_PKG_PREFIX}-${DISTNAME}
CATEGORIES=		www
MASTER_SITES=		${MASTER_SITE_GITHUB:=phalcon/}

HOMEPAGE=		http://phalconphp.com/
COMMENT=		Web framework implemented as a C extension offering high performance
LICENSE=		php

DOCDIR=			${PREFIX}/share/doc
INSTALLATION_DIRS=	${DOCDIR}

USE_TOOLS+=		gmake pkg-config

.include "../../lang/php/phpversion.mk"

BUILD_DEPENDS+=		re2c>=0.15.3:../../devel/re2c

DEPENDS+=		${PHP_PKG_PREFIX}-curl>=5.6.0:../../www/php-curl
DEPENDS+=		${PHP_PKG_PREFIX}-gd>=5.6.0:../../graphics/php-gd
DEPENDS+=		${PHP_PKG_PREFIX}-json>=5.6.0:../../textproc/php-json
DEPENDS+=		${PHP_PKG_PREFIX}-mbstring>=5.6.0:../../converters/php-mbstring
DEPENDS+=		${PHP_PKG_PREFIX}-pdo>=5.6.0:../../databases/php-pdo
DEPENDS+=		${PHP_PKG_PREFIX}-pdo_mysql>=5.6.0:../../databases/php-pdo_mysql

GITHUB_PROJECT=		cphalcon
GITHUB_TAG=		v${PKGVERSION_NOREV}
EXTRACT_SUFX=		.tar.gz

USE_LANGUAGES+=		c c++

PHP_VERSIONS_ACCEPTED=	56 70 71

.if ${MACHINE_ARCH} == "x86_64"
  .if ${PKG_PHP_VERSION} >= 70
WRKSRC=			${WRKDIR}/${GITHUB_PROJECT}-${PECL_VERSION}/build/php7/64bits
  .else
WRKSRC=			${WRKDIR}/${GITHUB_PROJECT}-${PECL_VERSION}/build/php5/64bits
  .endif
.endif

.if ${MACHINE_ARCH} == "i386"
  .if ${PKG_PHP_VERSION} >= 70
WRKSRC=			${WRKDIR}/${GITHUB_PROJECT}-${PECL_VERSION}/build/php7/32bits
  .else
WRKSRC=			${WRKDIR}/${GITHUB_PROJECT}-${PECL_VERSION}/build/php5/32bits
  .endif
.endif

.include "../../databases/php-pdo/buildlink3.mk"
.include "../../textproc/php-json/buildlink3.mk"
.include "../../lang/php/ext.mk"
.include "../../mk/bsd.pkg.mk"
