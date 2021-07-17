$NetBSD$

--- buildSrc/src/main/java/org/elasticsearch/gradle/OS.java.orig	2021-05-19 20:15:03.000000000 +0000
+++ buildSrc/src/main/java/org/elasticsearch/gradle/OS.java
@@ -16,6 +16,7 @@
 public enum OS {
     WINDOWS,
     MAC,
+    SUNOS,
     LINUX;
 
     public static OS current() {
@@ -29,6 +30,9 @@
         if (os.startsWith("Mac")) {
             return OS.MAC;
         }
+        if (os.startsWith("SunOS")) {
+            return OS.SUNOS;
+        }
         throw new IllegalStateException("Can't determine OS from: " + os);
     }
 
@@ -51,9 +55,15 @@
             return this;
         }
 
+        public Conditional<T> onSunOS(Supplier<T> supplier) {
+            conditions.put(SUNOS, supplier);
+            return this;
+        }
+
         public Conditional<T> onUnix(Supplier<T> supplier) {
             conditions.put(MAC, supplier);
             conditions.put(LINUX, supplier);
+            conditions.put(SUNOS, supplier);
             return this;
         }
 
