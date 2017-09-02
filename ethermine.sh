#!/bin/bash
setx GPU_FORCE_64BIT_PTR        0
setx GPU_MAX_HEAP_SIZE          100
setx GPU_USE_SYNC_OBJECTS       1
setx GPU_MAX_ALLOC_PERCENT      100
setx GPU_SINGLE_ALLOC_PERCENT   100
ethminer --farm-recheck 200 -G -S us1.ethermine.org:4444 -FS eu1.ethermine.org:4444 -O 0xDd9d279854C8D614d37a492192A40f678f476BC1.$(hostname)
