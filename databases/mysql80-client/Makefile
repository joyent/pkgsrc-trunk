<<<<<<< HEAD
# $NetBSD: Makefile,v 1.20 2019/02/05 20:19:55 adam Exp $

PKGNAME=	${DISTNAME:S/-/-client-/}
COMMENT=	MySQL database client and libraries
=======
# $NetBSD: Makefile,v 1.2 2021/05/24 19:49:30 wiz Exp $

PKGNAME=	${DISTNAME:S/-/-client-/}
PKGREVISION=	1
COMMENT=	MySQL 8, a free SQL database (client)

CONFLICTS=	mysql3-client-[0-9]* mariadb-client-[0-9]*
>>>>>>> netbsd/trunk

.include "Makefile.common"

CMAKE_ARGS+=		-DWITHOUT_SERVER=ON
UNWRAP_FILES+=		scripts/mysql_config
INFO_FILES=		yes
<<<<<<< HEAD
.for dir in client include libmysql man scripts testclients
INSTALL_DIRS+=		${WRKDIR}/build/${dir}
.endfor
=======
INSTALL_DIRS+=		client include libmysql man scripts testclients
>>>>>>> netbsd/trunk

.include "../../mk/bsd.pkg.mk"
