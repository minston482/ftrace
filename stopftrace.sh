#! /bin/bash
if [ $# -lt 1 ];then
	echo "[ERROR!] Usage: $0 [function_type]"
	echo "[NOTICE!] [function_type] : blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop"
	exit
fi

CURRENT_DIR_PATH=$PWD
RESULT_PATH=$CURRENT_DIR_PATH/tracingresult

cd ~/debug/tracing/

FUNCTION_TYPE=$1

sudo cat trace > $RESULT_PATH/bdbm_ftrace_$FUNCTION_TYPE
sleep 1
sudo echo 0 > tracing_on
sudo echo nop > current_tracer

