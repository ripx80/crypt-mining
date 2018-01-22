#!/bin/bash
#
# Dev by Ripx80
# Supported cryptonight algo
# https://easyhash.io/
# POOLS:
#   Monero (42ATuGxCfG2eNvEG1WsSq83kptkcGQdDYerSDTg5pA8W5Fu4vyjzpfXFSojgZpoCQkeiFn87jDWS1WbgnPS25fVmR6sZ6CX)
#   stratum+tcp://pool.supportxmr.com:5555
#   stratum+tcp://pool.minexmr.com
#
#   IntenseCoin (iz5cPhcvqFVazGf9ctBBFdQ963BE2FQLzUfAW776qaGtafphiWDCvheWm3AiyU15dditqGh16XmEoNzy9q7wNYge3BqmFwQk4)
#   stratum+tcp://itns.easyhash.io:3730
#   stratum+tcp://pool.intense.hashvault.pro:80
#
#   Electroneum (etnkB19FztN5jjeYsjASMeYTRQtDz5UefbcH3rpJ6EoeRMn19rwbAo83kMUznTJSrA8myJKCBKTTb1QkCmfPEhSC3V7ds5WWf9)
#   stratum+tcp://etn.easyhash.ko:3630
#
#   Sumokoin
#   stratum+tcp://sumo.easyhash.io:3330
#
#   Leviarcoin (LpoFqNn7xCKXj2oavYajrh3xF1cNpMzBmSWFgwABuGTTh1uxHYU6ZUKcrUaWA8fF6MirD3p1XkHuP4Z1C1cfcyp546fdaA2)
#   stratum+tcp://pool.leviarcoin.hashvault.pro:5555

POOL="stratum+tcp://pool.leviarcoin.hashvault.pro"
# PORTS: 3333, 4444, 5555, 7777
PORT=5555
ADDR="LpoFqNn7xCKXj2oavYajrh3xF1cNpMzBmSWFgwABuGTTh1uxHYU6ZUKcrUaWA8fF6MirD3p1XkHuP4Z1C1cfcyp546fdaA2"
#WORKER="$(hostname)"
WORKER="$(hostname):8569826187d"
THREADS="$(nproc)"
HUGEPAGES=1
TYPE="linux/cpu"
# MINER: xmrig minerd
MINER="minerd"
DIFF="5000"
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
    ${PP}/miners/${TYPE}/${MINER}/${MINER} -o ${POOL}:${PORT} -u ${ADDR} -p ${WORKER} -t${THREADS}
#   ${PP}/miners/${TYPE}/${MINER}/${MINER} -o ${POOL}:${PORT} -u ${ADDR}.${WORKER} -p ${WORKER} -t${THREADS}
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
