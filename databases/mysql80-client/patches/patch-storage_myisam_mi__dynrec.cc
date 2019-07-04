$NetBSD$

Fix build on SunOS.

--- storage/myisam/mi_dynrec.cc.orig	2019-01-25 22:33:03.000000000 +0000
+++ storage/myisam/mi_dynrec.cc
@@ -100,7 +100,11 @@ bool mi_dynmap_file(MI_INFO *info, my_of
     DBUG_RETURN(1);
   }
 #if defined(HAVE_MADVISE)
+# ifdef __sun
+  posix_madvise((char *)info->s->file_map, size, MADV_RANDOM);
+# else
   madvise((char *)info->s->file_map, size, MADV_RANDOM);
+# endif
 #endif
   info->s->mmaped_length = size;
   info->s->file_read = mi_mmap_pread;
