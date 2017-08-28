# $NetBSD$

BUILDLINK_TREE+=	groonga

.if !defined(GROONGA_BUILDLINK3_MK)
GROONGA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.groonga+=	groonga>=7.0.4
BUILDLINK_PKGSRCDIR.groonga?=	../../textproc/groonga
BUILDLINK_INCDIRS.groonga+=	include/groonga

.include "../../devel/editline/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif	# GROONGA_BUILDLINK3_MK

BUILDLINK_TREE+=	-groonga
