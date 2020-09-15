# $NetBSD: Makefile,v 1.53 2020/04/24 11:41:37 nia Exp $

DISTNAME=	M2Crypto-0.36.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
PKGREVISION=	1
CATEGORIES=	security python
MASTER_SITES=	${MASTER_SITE_PYPI:=M/M2Crypto/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gitlab.com/m2crypto/m2crypto
COMMENT=	Crypto and SSL toolkit for Python
LICENSE=	m2crypto-license

.include "../../lang/python/pyversion.mk"

PLIST_VARS+=	typing
USE_LANGUAGES+=      c c++11

.if ${_PYTHON_VERSION} == 27
DEPENDS+=	${PYPKGPREFIX}-typing-[0-9]*:../../devel/py-typing
PLIST.typing=	yes
.endif

PYSETUPBUILDARGS=	build_ext --openssl=${BUILDLINK_PREFIX.openssl}

pre-configure:
	${LN} -sf ${PREFIX}/bin/swig3.0 ${BUILDLINK_DIR}/bin/swig

.include "../../devel/swig3/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
