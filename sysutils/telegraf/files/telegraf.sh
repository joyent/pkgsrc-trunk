#!@RCD_SCRIPTS_SHELL@

# PROVIDE: telegraf
# REQUIRE: DAEMON
# KEYWORD: shutdown

if [ -f /etc/rc.subr ]
then
        . /etc/rc.subr
fi

name="telegraf"
rcvar=$name
influxdb_user="@TELEGRAF_USER@"
influxdb_group="@TELEGRAF_GROUP@"
influxdb_chdir="@VARBASE@/lib/telegraf"
pidfile="@VARBASE@/lib/telegraf/data/telegraf.pid"
STDERR="@LOGDIR@/telegraf.log"
command="@PREFIX@/bin/telegraf"
command_args="--config @PREFIX@/etc/telegraf/telegraf.conf --pidfile ${pidfile} 1>/dev/null 2>> $STDERR &"

load_rc_config $name
run_rc_command "$1"
