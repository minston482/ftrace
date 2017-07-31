#! /bin/bash
if [ $# -lt 1 ];then
	 echo "[ERROR!] Usage: $0 [function_type]"
	 echo "[NOTICE!] [function_type] : blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop"
	 exit
fi

cd ~/debug/tracing/

export FTRACE_FUNCTION_TYPE=$1

sudo echo nop > current_tracer
sudo echo $FTRACE_FUNCTION_TYPE > current_tracer
sudo echo 1 > tracing_on
