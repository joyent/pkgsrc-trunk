$NetBSD$

--- buildSrc/src/main/java/org/elasticsearch/gradle/ElasticsearchDistribution.java.orig	2021-05-19 20:15:03.000000000 +0000
+++ buildSrc/src/main/java/org/elasticsearch/gradle/ElasticsearchDistribution.java
@@ -27,6 +27,7 @@
     public enum Platform {
         LINUX,
         WINDOWS,
+        SUNOS,
         DARWIN;
 
         @Override
@@ -83,6 +84,7 @@
         .onLinux(() -> Platform.LINUX)
         .onWindows(() -> Platform.WINDOWS)
         .onMac(() -> Platform.DARWIN)
+        .onSunOS(() -> Platform.SUNOS)
         .supply();
 
     private final String name;
