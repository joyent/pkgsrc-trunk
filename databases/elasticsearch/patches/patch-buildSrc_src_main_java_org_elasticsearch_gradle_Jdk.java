$NetBSD$

--- buildSrc/src/main/java/org/elasticsearch/gradle/Jdk.java.orig	2021-05-19 20:15:03.000000000 +0000
+++ buildSrc/src/main/java/org/elasticsearch/gradle/Jdk.java
@@ -26,7 +26,7 @@
 
     private static final List<String> ALLOWED_ARCHITECTURES = Collections.unmodifiableList(Arrays.asList("aarch64", "x64"));
     private static final List<String> ALLOWED_VENDORS = Collections.unmodifiableList(Arrays.asList("adoptopenjdk", "openjdk", "azul"));
-    private static final List<String> ALLOWED_PLATFORMS = Collections.unmodifiableList(Arrays.asList("darwin", "linux", "windows", "mac"));
+    private static final List<String> ALLOWED_PLATFORMS = Collections.unmodifiableList(Arrays.asList("darwin", "linux", "windows", "mac", "sunos"));
     private static final Pattern VERSION_PATTERN = Pattern.compile("(\\d+)(\\.\\d+\\.\\d+)?\\+(\\d+(?:\\.\\d+)?)(@([a-f0-9]{32}))?");
     private static final Pattern LEGACY_VERSION_PATTERN = Pattern.compile("(\\d)(u\\d+)\\+(b\\d+?)(@([a-f0-9]{32}))?");
 
