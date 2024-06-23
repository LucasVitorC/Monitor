#!/bin/bash


cpu_usage(){
	    echo "Uso da CPU: "
	    top -bn1 | grep "Cpu(s)" | \
   	    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
            awk '{print 100 - $1"%"}'
}

memory_usage(){
	echo "Uso da Memoria: "
	free -h | grep Mem | awk '{print $3"/"$2}'
}

disk_usage(){
	echo "Uso do Disco: "
	df -h / | grep / | awk '{print $3"/"$2 " (" $5 ")"}'
}

system_info(){
	echo "Informações de Sistema: "
	echo "-----------------------"
	cpu_usage
	echo "-----------------------"
	memory_usage
	echo "-----------------------"
	disk_usage
	echo "-----------------------"
}

case $1 in
	cpu)
		cpu_usage
		;;
	memory)
		memory_usage
		;;
	disk)
		disk_usage
		;;
	all)
		system_info
		;;
	*)
	echo "Uso $0 {cpu|memory|disk|all}"
	exit 1
	;;
esac
