$NetBSD$

Fix build on SunOS.

--- storage/myisam/mi_extra.cc.orig	2019-01-25 22:33:03.000000000 +0000
+++ storage/myisam/mi_extra.cc
@@ -251,7 +251,11 @@ int mi_reset(MI_INFO *info) {
   if (share->base.blobs) mi_alloc_rec_buff(info, -1, &info->rec_buff);
 #if defined(HAVE_MADVISE)
   if (info->opt_flag & MEMMAP_USED)
+# ifdef __sun
+    posix_madvise((char *)share->file_map, share->state.state.data_file_length,
+# else
     madvise((char *)share->file_map, share->state.state.data_file_length,
+# endif
             MADV_RANDOM);
 #endif
   info->opt_flag &= ~(KEY_READ_USED | REMEMBER_OLD_POS);
