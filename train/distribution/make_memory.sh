#!/bin/bash

# Function to terminate all child processes
terminate_all() {
    echo "Terminating all child processes..."
    pkill -P $$
    wait
    echo "All child processes terminated"
}

# Trap SIGINT and SIGTERM and call terminate_all
trap terminate_all SIGINT SIGTERM

source ~/anaconda3/bin/activate xxxx
num_processes=12

for i in $(seq 0 $(($num_processes - 1))); do
    python make_memory.py 0 "$i" &
done

wait


echo "所有进程已完成"