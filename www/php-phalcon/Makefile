# $NetBSD$
#

DISTNAME=	phalcon-${PHALCON_VERSION}
PKGNAME=	${PHP_PKG_PREFIX}-${DISTNAME}
CATEGORIES=	www

HOMEPAGE=		http://phalconphp.com/
COMMENT=		Phalcon is a web framework implemented as a C extension offering high performance and lower resource consumption
LICENSE=		php

DOCDIR=			${PREFIX}/share/doc
INSTALLATION_DIRS=	${DOCDIR}

USE_TOOLS+=	gmake

.include "../../lang/php/phpversion.mk"

BUILD_DEPENDS+=	re2c>=0.15.3:../../devel/re2c

PHALCON_VERSION=	3.2.4
GIT_REPOSITORIES=	phalcon
GIT_REPO.phalcon=	git://github.com/phalcon/cphalcon.git
.if ${_PHP_VERSION} == "53" || ${_PHP_VERSION} == "54"
GIT_TAG.phalcon=	phalcon-v${PHALCON_VERSION}
.else
GIT_TAG.phalcon=	v${PHALCON_VERSION}
.endif

WRKSRC=			${WRKDIR}/phalcon/ext

USE_LANGUAGES+=		c c++

.include "../../mk/bsd.pkg.mk"
