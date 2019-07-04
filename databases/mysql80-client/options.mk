# $NetBSD: options.mk,v 1.3 2019/02/05 20:19:55 adam Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.mysql80

PKG_SUPPORTED_OPTIONS+=	dtrace memcached

.include "../../mk/bsd.options.mk"

# Enable DTrace support
.if !empty(PKG_OPTIONS:Mdtrace)
CMAKE_ARGS+=		-DENABLE_DTRACE=ON
.else
CMAKE_ARGS+=		-DENABLE_DTRACE=OFF
.endif

# Enable InnoDB Memcached support
PLIST_VARS+=		memcached
.if !empty(PKG_OPTIONS:Mmemcached)
PLIST.memcached=	yes
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=ON
CMAKE_ARGS+=		-DWITH_BUNDLED_MEMCACHED=ON
.else
CMAKE_ARGS+=		-DWITH_INNODB_MEMCACHED=OFF
.endif
