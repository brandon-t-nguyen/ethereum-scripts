#!/bin/bash
ETHER_ADDR=0xDd9d279854C8D614d37a492192A40f678f476BC1
SERVER1=us1.ethermine.org:4444
SERVER2=us2.ethermine.org:4444

CUDA_BLOCK_SIZE_DEF=$((128))
CUDA_GRID_SIZE_DEF=$((8192))

CUDA_BLOCK_SIZE=$((CUDA_BLOCK_SIZE_DEF / 1))
CUDA_GRID_SIZE=$((CUDA_GRID_SIZE_DEF / 1))
ethminer    --farm-recheck 200 -RH -G -S $SERVER1 -FS $SERVER2 -O $ETHER_ADDR.$(hostname)\
            --cuda-block-size $CUDA_BLOCK_SIZE --cuda-grid-size $CUDA_GRID_SIZE
