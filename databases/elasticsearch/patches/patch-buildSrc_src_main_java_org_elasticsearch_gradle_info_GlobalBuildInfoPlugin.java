$NetBSD$

--- buildSrc/src/main/java/org/elasticsearch/gradle/info/GlobalBuildInfoPlugin.java.orig	2021-05-19 20:15:03.000000000 +0000
+++ buildSrc/src/main/java/org/elasticsearch/gradle/info/GlobalBuildInfoPlugin.java
@@ -99,7 +99,10 @@
             params.reset();
             params.setRuntimeJavaHome(runtimeJavaHome);
             params.setRuntimeJavaVersion(determineJavaVersion("runtime java.home", runtimeJavaHome, minimumRuntimeVersion));
-            params.setIsRuntimeJavaHomeSet(Jvm.current().getJavaHome().equals(runtimeJavaHome) == false);
+            if (OS.current() == OS.SUNOS)
+                params.setIsRuntimeJavaHomeSet(true);
+            else
+                params.setIsRuntimeJavaHomeSet(Jvm.current().getJavaHome().equals(runtimeJavaHome) == false);
             JvmInstallationMetadata runtimeJdkMetaData = metadataDetector.getMetadata(getJavaInstallation(runtimeJavaHome).getLocation());
             params.setRuntimeJavaDetails(formatJavaVendorDetails(runtimeJdkMetaData));
             params.setJavaVersions(getAvailableJavaVersions());
