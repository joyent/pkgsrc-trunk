<<<<<<< HEAD
# $NetBSD: buildlink3.mk,v 1.1 2016/09/16 06:49:12 adam Exp $
=======
# $NetBSD: buildlink3.mk,v 1.1 2021/05/13 15:25:20 jdolecek Exp $
>>>>>>> netbsd/trunk

BUILDLINK_TREE+=	mysql-server

.if !defined(MYSQL_SERVER_BUILDLINK3_MK)
MYSQL_SERVER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mysql-server+=	mysql-server>=5.7.12
BUILDLINK_ABI_DEPENDS.mysql-server?=	mysql-server>=5.7.12
BUILDLINK_PKGSRCDIR.mysql-server?=	../../databases/mysql57-server
BUILDLINK_LIBDIRS.mysql-server?=	lib

.endif	# MYSQL_SERVER_BUILDLINK3_MK

BUILDLINK_TREE+=	-mysql-server
