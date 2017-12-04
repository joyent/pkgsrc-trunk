# $NetBSD$

GITHUB_PROJECT=         repmgr
PKGVERSION=             4.0.1 
DISTNAME=               v${PKGVERSION}
PKGNAME=                postgresql96-repmgr-${PKGVERSION}
CATEGORIES=             databases
MASTER_SITES=           ${MASTER_SITE_GITHUB:=2ndQuadrant/}
DIST_SUBDIR=            ${GITHUB_PROJECT}

MAINTAINER=             pkgsrc-users@NetBSD.org
HOMEPAGE=               https://github.com/2ndQuadrant/repmgr/
COMMENT=                The Most Popular Replication Manager for PostgreSQL (Postgres)
LICENSE=                gnu-gpl-v3

WRKSRC=                 ${WRKDIR}/repmgr-3.3.2

BUILD_MAKE_FLAGS=       USE_PGXS=1
INSTALL_MAKE_FLAGS=     USE_PGXS=1
USE_TOOLS+=             gmake

.include "../../databases/postgresql96-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
