#!/bin/bash

CURRENT_DIR=$(pwd)
export GRAPH_DIR=# /Path to store graphs/ #
export GRAPH_GEN=$CURRENT_DIR/sega-utils/GraphGen/generator
export GRAPH_READER=$CURRENT_DIR/sega-utils/GraphReader/loader
export GRAPH_SORTER=$CURRENT_DIR/sega-utils/helpers/sorter.py

nums_gpts=(8)
scales=(23 24 25)
degs=(16)

for num_gpts in "${nums_gpts[@]}"
    do for scale in "${scales[@]}"
        do for deg in "${degs[@]}"
            do
            python sega-utils/helpers/synth-graph-gen.py $scale $deg $num_gpts &
        done
    done
done
