#!@SMF_METHOD_SHELL@
#
<<<<<<< HEAD
# $NetBSD: mysqld.sh,v 1.1 2016/09/16 06:49:12 adam Exp $
=======
# $NetBSD: mysqld.sh,v 1.1 2021/05/13 15:25:20 jdolecek Exp $
>>>>>>> netbsd/trunk
#
# Init script for mysqld.
#

. /lib/svc/share/smf_include.sh

PIDFILE="@MYSQL_DATADIR@/mysql.pid"

ulimit -n 10240

case "$1" in
start)
	@LOCALBASE@/sbin/mysqld --user=mysql \
		--basedir=@LOCALBASE@ \
		--datadir=@MYSQL_DATADIR@ \
		--pid-file=${PIDFILE} \
		--log-error=@VARBASE@/log/mysql/error.log &
	;;
stop)
	[ -f ${PIDFILE} ] && kill `@HEAD@ -1 ${PIDFILE}`
	;;
*)
	echo "Usage: $0 {start|stop}" >&2
	exit 1
	;;
esac

exit $SMF_EXIT_OK
