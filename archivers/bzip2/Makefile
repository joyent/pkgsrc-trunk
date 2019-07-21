# $NetBSD: Makefile,v 1.55 2019/07/21 11:51:24 nia Exp $
#

DISTNAME=	bzip2-1.0.8
CATEGORIES=	archivers
MASTER_SITES=	https://sourceware.org/pub/bzip2/
DISTFILES=	# empty

MAINTAINER=	joerg@NetBSD.org
HOMEPAGE=	https://sourceware.org/bzip2/
COMMENT=	Block-sorting file compressor
LICENSE=	zlib # ish

REPLACE_SH=	bzdiff bzgrep bzmore

MAKE_JOBS_SAFE=		no
USE_LIBTOOL=		yes
USE_MULTIARCH=		bin lib

.include "../../mk/compiler.mk"

CFLAGS+=		${CPPFLAGS}
.if !empty(CC_VERSION:Mgcc*)
CFLAGS+=		-Wall -Winline -fomit-frame-pointer
.endif

INSTALLATION_DIRS=	bin${BINARCHSUFFIX} include lib${LIBARCHSUFFIX} ${PKGMANDIR}/man1

do-extract:
	${CP} -r ${FILESDIR} ${WRKSRC}

do-install:
	${LIBTOOL} --mode=install ${INSTALL_LIB} ${WRKSRC}/libbz2.la ${DESTDIR}${PREFIX}/lib${LIBARCHSUFFIX}
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} ${WRKSRC}/bzip2 ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}
	${LN} -f ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzip2 ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bunzip2
	${LN} -f ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzip2 ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzcat
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} ${WRKSRC}/bzip2recover ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}
	${INSTALL_MAN} ${WRKSRC}/bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	cd ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1 && rm -f bunzip2.1 bzcat.1 bzip2recover.1
	${LN} -f -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bunzip2.1
	${LN} -f -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzcat.1
	${LN} -f -s bzip2.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzip2recover.1
	${INSTALL_DATA} ${WRKSRC}/bzlib.h ${DESTDIR}${PREFIX}/include
	${INSTALL_SCRIPT} ${WRKSRC}/bzmore ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzmore
	${LN} -f -s bzmore ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzless
	${INSTALL_MAN} ${WRKSRC}/bzmore.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${LN} -f -s bzmore.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzless.1
	${INSTALL_SCRIPT} ${WRKSRC}/bzdiff ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzdiff
	${LN} -f -s bzdiff ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzcmp
	${INSTALL_MAN} ${WRKSRC}/bzdiff.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${LN} -f -s bzdiff.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzcmp.1
	${INSTALL_SCRIPT} ${WRKSRC}/bzgrep ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzgrep
	${LN} -f -s bzgrep ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzegrep
	${LN} -f -s bzgrep ${DESTDIR}${PREFIX}/bin${BINARCHSUFFIX}/bzfgrep
	${INSTALL_MAN} ${WRKSRC}/bzgrep.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${LN} -f -s bzgrep.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzegrep.1
	${LN} -f -s bzgrep.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/bzfgrep.1

.include "../../mk/bsd.pkg.mk"
