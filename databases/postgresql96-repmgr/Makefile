# $NetBSD$

DISTNAME=               repmgr-4.0.1

PKGNAME=                postgresql${PGSQL_VERSION}-${DISTNAME}
CATEGORIES=             databases
MASTER_SITES=           ${MASTER_SITE_GITHUB:=2ndQuadrant/}
GITHUB_PROJECT=         repmgr
GITHUB_TAG=             v${PKGVERSION_NOREV}

MAINTAINER=             pkgsrc-users@NetBSD.org
HOMEPAGE=               https://github.com/2ndQuadrant/repmgr/
COMMENT=                The Most Popular Replication Manager for PostgreSQL (Postgres)
LICENSE=                gnu-gpl-v3

DEPENDS+=               postgresql${PGSQL_VERSION}-client>=0:../../databases/postgresql${PGSQL_VERSION}-client

GNU_CONFIGURE=          yes
USE_TOOLS+=             gmake

PKG_SYSCONFSUBDIR?=     postgresql
EGDIR=                  ${PREFIX}/share/examples/repmgr
CONF_FILES+=            ${EGDIR}/repmgr.conf.sample ${PKG_SYSCONFDIR}/repmgr.conf

INSTALLATION_DIRS+=     share/doc/repmgr ${EGDIR}

post-install:
		${INSTALL_DATA} ${WRKSRC}/README.md \
			${DESTDIR}${PREFIX}/share/doc/repmgr
		${INSTALL_DATA} ${WRKSRC}/repmgr.conf.sample \
			${DESTDIR}${PREFIX}/share/examples/repmgr

.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
