#!/bin/bash
POOL="stratum+tcp://pool.supportxmr.com"
#POOL="stratum+tcp://pool.minexmr.com"
# PORTS: 3333, 4444, 5555, 7777
PORT=5555
ADDR="42ATuGxCfG2eNvEG1WsSq83kptkcGQdDYerSDTg5pA8W5Fu4vyjzpfXFSojgZpoCQkeiFn87jDWS1WbgnPS25fVmR6sZ6CX"
WORKER="$(hostname)"
THREADS="$(nproc)"
HUGEPAGES=1
TYPE="linux/cpu"
# MINER: xmrig minerd
MINER="xmrig"
PP=$(dirname `realpath $0`)

if [ $HUGEPAGES -eq 1 ]
  then
	echo 128 > /proc/sys/vm/nr_hugepages
fi
sysctl -w vm.nr_hugepages=128

if [ "${TYPE}" == "linux/cpu" ]
then
   if [ "${MINER}" == "minerd" ] || [ "${MINER}" == "xmrig" ]
    then
	#echo "POOL:  $POOL"
	#echo "MINER: $MINER"
	${PP}/miners/${TYPE}/${MINER}/${MINER} -o ${POOL}:${PORT} -u ${ADDR}.${WORKER} -p ${WORKER} -t${THREADS}
    else
	echo "Miner not implemented"
    fi
else
  echo "GPU not implemented"
fi

if [ $HUGEPAGES -eq 1 ]
  then
	sysctl -w vm.nr_hugepages=0
	echo 0 > /proc/sys/vm/nr_hugepages
fi
exit 0
