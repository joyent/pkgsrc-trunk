# $NetBSD: Makefile,v 1.20 2019/02/05 20:19:55 adam Exp $

PKGNAME=	${DISTNAME:S/-/-client-/}
COMMENT=	MySQL database client and libraries

.include "Makefile.common"

CMAKE_ARGS+=		-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
INFO_FILES=		yes
.for dir in client include libmysql man scripts testclients
INSTALL_DIRS+=		${WRKDIR}/build/${dir}
.endfor

.include "../../mk/bsd.pkg.mk"
