# $NetBSD: Makefile,v 1.1 2021/03/06 21:05:33 leot Exp $

DISTNAME=	wfuzz-3.1.0
CATEGORIES=	security python
MASTER_SITES=	${MASTER_SITE_PYPI:=w/wfuzz/}

MAINTAINER=	leot@NetBSD.org
HOMEPAGE=	http://wfuzz.io/
COMMENT=	Web application fuzzer
LICENSE=	gnu-gpl-v2

DEPENDS+=	${PYPKGPREFIX}-chardet-[0-9]*:../../converters/py-chardet
DEPENDS+=	${PYPKGPREFIX}-curl-[0-9]*:../../www/py-curl
DEPENDS+=	${PYPKGPREFIX}-pyparsing>=2.4:../../devel/py-pyparsing
DEPENDS+=	${PYPKGPREFIX}-six-[0-9]*:../../lang/py-six

USE_LANGUAGES=			# none

# Only for Python 3
PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
