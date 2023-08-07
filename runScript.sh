#!/bin/bash

# Sensitivity to cache
for graph in # path to graph binaries
do
    for pe in 8
    do
        for  cache in 64KiB 512KiB 1MiB 2MiB
        do
            # gem5_executable -re --outdir=/output path/ gem5_config num_PEs buffer_entries cache_size /*path to graph binary/ /*workload specific params*/ --simple
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/cache_results/bfs/${graph}/${pe}/${cache}  gem5/configs/accl/bfs.py ${pe} 128 ${cache} /*path to graph binary*/${graph}/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/cache_results/sssp/${graph}/${pe}/${cache}  gem5/configs/accl/sssp.py ${pe} 128 ${cache} /*path to graph binary*/${graph}/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/cache_results/bc/${graph}/${pe}/${cache}  gem5/configs/accl/bc.py ${pe} 128 ${cache} /*path to graph binary*/${graph}/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/cache_results/pr${graph}/${pe}/${cache}  gem5/configs/accl/pr.py ${pe} 128 ${cache} /*path to graph binary*/${graph}/binaries/gpts_${pe} 1 0.85 --simple&
        done
    done
done

# ====================================================================================================

# strong scaling

for graph in # path to graph binaries
do
    for pe in 8 16 32 64
    do
        for  cache in 64KiB
        do
            # gem5_executable -re --outdir=/output path/ gem5_config num_PEs buffer_entries cache_size /*path to graph binary/ /*workload specific params*/ --simple
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/strong_scaling_results/bfs/${graph}/${pe}/${cache}  gem5/configs/accl/bfs.py ${pe} 128 ${cache} /*path to graph binary*/graph/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/strong_scaling_results/sssp/${graph}/${pe}/${cache}  gem5/configs/accl/sssp.py ${pe} 128 ${cache} /*path to graph binary*${graph}/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/strong_scaling_results/bc/${graph}/${pe}/${cache}  gem5/configs/accl/bc.py ${pe} 128 ${cache} /*path to graph binary*${graph}/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/strong_scaling_results/pr${graph}/${pe}/${cache}  gem5/configs/accl/pr.py ${pe} 128 ${cache} /*path to graph binary*${graph}/binaries/gpts_${pe} 1 0.85 --simple&
        done
    done
done

# ====================================================================================================


for scale in  22 23 24 25 
do
    for pe in 8 16 32 64
    do
        for  cache in 64KiB
        do
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/weak_scaling/SEGA/bfs/${scale}/${pe}/${cache}  gem5/configs/accl/bfs.py ${pe} 128 ${cache} /*path to graph binary*/graph_${scale}_16/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/weak_scaling/SEGA/sssp/${scale}/${pe}/${cache}  gem5/configs/accl/sssp.py ${pe} 128 ${cache} /*path to graph binary*/graph_${scale}_16/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/weak_scaling/SEGA/bc/${scale}/${pe}/${cache}  gem5/configs/accl/bc.py ${pe} 128 ${cache} /*path to graph binary*/graph_${scale}_16/binaries/gpts_${pe} 0 0 --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/weak_scaling/SEGA/cc/${scale}/${pe}/${cache}  gem5/configs/accl/cc.py ${pe} 128 ${cache} /*path to graph binary*/graph_${scale}_16/binaries/gpts_${pe} --simple&
            gem5/build/NULL/gem5.opt -re --outdir=~/SEGA/weak_scaling/SEGA/pr/${scale}/${pe}/${cache}  gem5/configs/accl/pr.py ${pe} 128 ${cache} /*path to graph binary*/graph_${scale}_16/binaries/gpts_${pe} 1 0.85 --simple&
        done
    done
done
