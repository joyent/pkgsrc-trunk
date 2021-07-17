$NetBSD$

--- buildSrc/src/main/java/org/elasticsearch/gradle/internal/InternalDistributionBwcSetupPlugin.java.orig	2021-05-19 20:15:03.000000000 +0000
+++ buildSrc/src/main/java/org/elasticsearch/gradle/internal/InternalDistributionBwcSetupPlugin.java
@@ -169,7 +169,7 @@
         projects.addAll(asList("deb", "rpm", "oss-deb", "oss-rpm"));
 
         if (bwcVersion.onOrAfter("7.0.0")) { // starting with 7.0 we bundle a jdk which means we have platform-specific archives
-            projects.addAll(asList("oss-windows-zip", "windows-zip", "oss-darwin-tar", "darwin-tar", "oss-linux-tar", "linux-tar"));
+            projects.addAll(asList("oss-windows-zip", "windows-zip", "oss-darwin-tar", "darwin-tar", "oss-linux-tar", "linux-tar", "oss-sunos-tar", "sunos-tar"));
 
             // We support aarch64 for linux and mac starting from 7.12
             if (bwcVersion.onOrAfter("7.12.0")) {
