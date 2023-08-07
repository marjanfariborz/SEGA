#!/bin/bash

CURRENT_DIR=$(pwd)
export GRAPH_SORTER=$CURRENT_DIR/sega-utils/helpers/graph_sorter.py
export GRAPH_READER=$CURRENT_DIR/sega-utils/GraphReader/loader


graph_names=# /List the path to the graph files/ #
nums_gpts=(8 16 32 64)

for num_gpts in "${nums_gpts[@]}"
    do for graph_name in "${graph_names[@]}"
        do
        python  $CURRENT_DIR/sega-utils/helpers/real-graph-gen.py /data/graph_cache/real/${graph_name} $num_gpts
    done
done


