# $NetBSD: buildlink3.mk,v 1.3 2019/02/05 20:19:55 adam Exp $

BUILDLINK_TREE+=	mysql-client

.if !defined(MYSQL_CLIENT_BUILDLINK3_MK)
MYSQL_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mysql-client+=	mysql-client>=8.0<8.1
BUILDLINK_ABI_DEPENDS.mysql-client+=	mysql-client>=8.0<8.1
BUILDLINK_PKGSRCDIR.mysql-client?=	../../databases/mysql80-client
BUILDLINK_INCDIRS.mysql-client?=	include/mysql
BUILDLINK_LIBDIRS.mysql-client?=	lib

.include "../../devel/libevent/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif # MYSQL_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-mysql-client
