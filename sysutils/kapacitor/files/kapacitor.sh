#!@RCD_SCRIPTS_SHELL@

# PROVIDE: kapacitor
# REQUIRE: DAEMON
# KEYWORD: shutdown

if [ -f /etc/rc.subr ]
then
        . /etc/rc.subr
fi

name="kapacitor"
rcvar=$name
kapacitor_user="@KAPACITOR_USER@"
kapacitor_group="@KAPACITOR_GROUP@"
kapacitor_chdir="@VARBASE@/lib/kapacitor"
pidfile="@VARBASE@/lib/kapacitor/data/kapacitord.pid"
STDERR="@LOGDIR@/kapacitor.log"
command="@PREFIX@/bin/kapacitord"
command_args="-config @PREFIX@/etc/kapacitor/kapacitor.conf -pidfile ${pidfile} 1>/dev/null 2>> $STDERR &"

load_rc_config $name
run_rc_command "$1"
