$NetBSD$

Include alloca(3) definition for SmartOS.

--- src/libdnssec/shared/keyid_gnutls.c.orig	2019-01-23 09:57:41.000000000 +0000
+++ src/libdnssec/shared/keyid_gnutls.c
@@ -14,6 +14,9 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
+#ifdef __sun
+#include <alloca.h>
+#endif
 #include <assert.h>
 #include <gnutls/abstract.h>
 #include <gnutls/gnutls.h>
