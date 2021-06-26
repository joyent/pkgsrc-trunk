$NetBSD$

--- buildSrc/src/main/java/org/elasticsearch/gradle/VersionProperties.java.orig	2021-05-19 20:15:03.000000000 +0000
+++ buildSrc/src/main/java/org/elasticsearch/gradle/VersionProperties.java
@@ -39,6 +39,8 @@
                 return bundledJdkLinux;
             case "windows":
                 return bundledJdkWindows;
+            case "sunos":
+                return bundledJdkSunos;
             default:
                 throw new IllegalArgumentException("unknown platform [" + platform + "]");
         }
@@ -57,6 +59,7 @@
     private static final String bundledJdkDarwin;
     private static final String bundledJdkLinux;
     private static final String bundledJdkWindows;
+    private static final String bundledJdkSunos;
     private static final String bundledJdkVendor;
     private static final Map<String, String> versions = new HashMap<String, String>();
 
@@ -69,6 +72,7 @@
         bundledJdkDarwin = props.getProperty("bundled_jdk_darwin", bundledJdk);
         bundledJdkLinux = props.getProperty("bundled_jdk_linux", bundledJdk);
         bundledJdkWindows = props.getProperty("bundled_jdk_windows", bundledJdk);
+        bundledJdkSunos = props.getProperty("bundled_jdk_sunos", bundledJdk);
 
         for (String property : props.stringPropertyNames()) {
             versions.put(property, props.getProperty(property));
