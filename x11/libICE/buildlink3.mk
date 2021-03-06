# $NetBSD: buildlink3.mk,v 1.7 2018/01/07 13:04:38 rillig Exp $

.include "../../mk/bsd.fast.prefs.mk"

.if ${X11_TYPE} != "modular"  && \
    !exists(${X11BASE}/lib/pkgconfig/ice.pc) && \
    !exists(${X11BASE}/lib${LIBABISUFFIX}/pkgconfig/ice.pc)
.include "../../mk/x11.buildlink3.mk"
.else

BUILDLINK_TREE+=	libICE

.  if !defined(LIBICE_BUILDLINK3_MK)
LIBICE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libICE+=	libICE>=0.99.1
BUILDLINK_PKGSRCDIR.libICE?=	../../x11/libICE
.  endif # LIBICE_BUILDLINK3_MK

BUILDLINK_TREE+=	-libICE

.endif
