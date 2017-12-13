# $NetBSD$
BUILDLINK_TREE+=	php-json

.if !defined(PHP_JSON_BUILDLINK3_MK)
PHP_JSON_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.php-json+=	${PHP_PKG_PREFIX}-json-${PKG_PHP_MAJOR_VERS}.*
BUILDLINK_ABI_DEPENDS.php-json+=	${PHP_PKG_PREFIX}-json>=5.5
BUILDLINK_PKGSRCDIR.php-json?=		../../textproc/php-json
BUILDLINK_DEPMETHOD.php-json?=		build
BUILDLINK_INCDIRS.php-json?=		include/php/ext/json
.endif  # PHP_JSON_BUILDLINK3_MK

BUILDLINK_TREE+=	-php-json
