--- src/input/path_input.cc
+++ src/input/path_input.cc
@@ -75,8 +75,10 @@ PathInput::pressed(int key) {

 struct _transform_filename {
   void operator () (utils::directory_entry& entry) {
-    if (entry.d_type == DT_DIR)
-      entry.d_name += '/';
+    struct stat s;
+    if (stat(entry.d_name.c_str(), &s) == 0)
+      if (S_ISDIR(s.st_mode))
+        entry.d_name += '/';
   }
 };
