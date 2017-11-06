# $NetBSD: Makefile,v 1.36 2014/01/11 14:42:01 adam Exp $

DISTNAME=	eggdrop-1.8.2
CATEGORIES=	chat
MASTER_SITES=	https://ftp.eggheads.org/pub/eggdrop/source/1.8/
EXTRACT_SUFX=	.tar.gz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.eggheads.org/
COMMENT=	IRC robot with TCL scripting and multi-channel ability

MAKE_JOBS_SAFE=	no

PLIST_VARS=		dynamic
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}
CONFIGURE_ENV+=		TCLLIB="${PREFIX}/lib" TCLINC="${PREFIX}/include"
CFLAGS+=		-DLANGDIR=\"${PREFIX}/share/eggdrop/language\"

.include "../../mk/bsd.prefs.mk"

EGDIR=		${PREFIX}/share/examples/eggdrop
CONF_FILES=	${EGDIR}/eggdrop.conf ${PKG_SYSCONFDIR}/eggdrop.conf

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1
INSTALLATION_DIRS+=	lib/eggdrop
INSTALLATION_DIRS+=	share/doc
INSTALLATION_DIRS+=	share/eggdrop
INSTALLATION_DIRS+=	share/examples/eggdrop

post-patch:
	cd ${WRKSRC} && ${SED} -e 's,modules/,${PREFIX}/lib/eggdrop/,' \
		-e 's,source scripts/,source ${PREFIX}/share/eggdrop/scripts/,' \
		-e 's,set help-path .*,set help-path "${PREFIX}/share/eggdrop/help/",' \
		-e 's,set text-path .*,set text-path "${PREFIX}/share/eggdrop/text/",' \
		-e 's,set motd .*,set motd "${PREFIX}/share/eggdrop/text/motd",' \
		-e 's,set telnet-banner .*,set telnet-banner "${PREFIX}/share/eggdrop/text/banner",' \
		< eggdrop.conf > eggdrop.conf.dist.new

post-configure:
	cd ${WRKSRC} && ${MAKE} config

do-install: do-install-program
do-install-program:
	cd "${WRKSRC}" && ${SETENV} ${MAKE_ENV} ${MAKE} DEST=${WRKDIR}/eggdrop install
	# Makefile has already used bsdinstall so permissions are set correctly
	cp -fr ${WRKDIR}/eggdrop/scripts ${DESTDIR}${PREFIX}/share/eggdrop/
	cp -fr ${WRKDIR}/eggdrop/help ${DESTDIR}${PREFIX}/share/eggdrop/
	cp -fr ${WRKDIR}/eggdrop/language ${DESTDIR}${PREFIX}/share/eggdrop/
	cp -fr ${WRKDIR}/eggdrop/text ${DESTDIR}${PREFIX}/share/eggdrop/
	cp -fr ${WRKDIR}/eggdrop/eggdrop ${DESTDIR}${PREFIX}/bin/
	cp -fr ${WRKDIR}/eggdrop/doc ${DESTDIR}${PREFIX}/share/doc/eggdrop
	mv -f ${DESTDIR}${PREFIX}/share/doc/eggdrop/man1/* ${DESTDIR}/${PREFIX}/${PKGMANDIR}/man1/
	${INSTALL_DATA} ${WRKSRC}/eggdrop.conf.dist.new ${DESTDIR}${EGDIR}/eggdrop.conf

.include "../../lang/tcl/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

.if defined(NOPIC)
BUILD_TARGET=	static
.else
BUILD_TARGET=	eggdrop
PLIST.dynamic=	yes
do-install: do-install-modules
do-install-modules:
	${INSTALL_LIB} ${WRKDIR}/eggdrop/modules/* \
		${DESTDIR}${PREFIX}/lib/eggdrop
.endif
