$NetBSD$

Use pre-generated headers on SmartOS.

--- plugin/group_replication/libmysqlgcs/rpcgen.cmake.orig	2019-04-13 11:46:31.000000000 +0000
+++ plugin/group_replication/libmysqlgcs/rpcgen.cmake
@@ -71,7 +71,7 @@ FOREACH(X xcom_vp)
   SET (x_vanilla_h      ${XCOM_BASEDIR}/${X}.h.gen)
   SET (x_vanilla_c      ${XCOM_BASEDIR}/${X}_xdr.c.gen)
 
-  IF(WIN32)
+  IF(WIN32 OR USE_PREGEN_RPC)
     # on windows system's there is no rpcgen, thence copy
     # the files in the source directory
     ADD_CUSTOM_COMMAND(OUTPUT ${x_gen_h} ${x_gen_c} ${x_tmp_plat_h}
