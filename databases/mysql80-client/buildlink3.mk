<<<<<<< HEAD
# $NetBSD: buildlink3.mk,v 1.3 2019/02/05 20:19:55 adam Exp $
=======
# $NetBSD: buildlink3.mk,v 1.2 2021/05/18 14:28:44 jperkin Exp $
>>>>>>> netbsd/trunk

BUILDLINK_TREE+=	mysql-client

.if !defined(MYSQL_CLIENT_BUILDLINK3_MK)
MYSQL_CLIENT_BUILDLINK3_MK:=

<<<<<<< HEAD
BUILDLINK_API_DEPENDS.mysql-client+=	mysql-client>=8.0<8.1
BUILDLINK_ABI_DEPENDS.mysql-client+=	mysql-client>=8.0<8.1
=======
BUILDLINK_API_DEPENDS.mysql-client+=	mysql-client>=8.0.19<8.1
>>>>>>> netbsd/trunk
BUILDLINK_PKGSRCDIR.mysql-client?=	../../databases/mysql80-client
BUILDLINK_INCDIRS.mysql-client?=	include/mysql
BUILDLINK_LIBDIRS.mysql-client?=	lib

.include "../../devel/libevent/buildlink3.mk"
<<<<<<< HEAD
=======
.include "../../archivers/zstd/buildlink3.mk"
>>>>>>> netbsd/trunk
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # MYSQL_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-mysql-client
