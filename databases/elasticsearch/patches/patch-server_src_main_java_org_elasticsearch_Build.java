$NetBSD$

--- server/src/main/java/org/elasticsearch/Build.java.orig	2021-06-10 18:41:11.000000000 +0000
+++ server/src/main/java/org/elasticsearch/Build.java
@@ -131,7 +131,7 @@ public class Build {
         )) {
             try (JarInputStream jar = new JarInputStream(FileSystemUtils.openFileURLStream(url))) {
                 Manifest manifest = jar.getManifest();
-                hash = manifest.getMainAttributes().getValue("Change");
+                hash = "5ca8591c6fcdb1260ce95b08a8e023559635c6f3";
                 date = manifest.getMainAttributes().getValue("Build-Date");
                 isSnapshot = "true".equals(manifest.getMainAttributes().getValue("X-Compile-Elasticsearch-Snapshot"));
                 version = manifest.getMainAttributes().getValue("X-Compile-Elasticsearch-Version");
