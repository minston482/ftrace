#! /bin/bash
if [ $# -lt 2 ];then
	echo "[ERROR!] Usage: $0 [workloads] [function_type]"
	echo "[NOTICE!] [workloads] : varmail, oltp, webserver, etc..   show workloads floders."
	echo "[NOTICE!] [function_type] : blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop"
	exit
fi

CURRENT_DIR_PATH=$PWD

cd ~/debug/tracing/

FTRACE_FUNCTION_TYPE=$2
WORKLOAD_NAME=$1

sudo echo nop > current_tracer
sudo echo $FTRACE_FUNCTION_TYPE > current_tracer
sudo echo 1 > tracing_on
echo " [SHELL] tracing on !"

cd $CURRENT_DIR_PATH
sudo ../filebench -f $WORKLOAD_NAME.f

mkdir -p $CURRENT_DIR_PATH/tracingresult
RESULT_PATH=$CURRENT_DIR_PATH/tracingresult

cd ~/debug/tracing/

echo " [SHELL] loging the trace result..."
sudo cat trace > $RESULT_PATH/bdbm_ftrace_${WORKLOAD_NAME}_${FTRACE_FUNCTION_TYPE}
sleep 1
sudo echo 0 > tracing_on
sudo echo nop > current_tracer
echo " [SHELL] tracing off !"
