# SEGA
## Graph Generators
The synthetic graph generator is located ```sega-utils/helpers/synth-graph-gen.py```. It uses power-law distribution.
You can use ```synthetic_graph_gen.sh``` as a run script that uses the graph scale and average degree.

To create the graph binaries, you can use ```binary_gen.sh``` for both synthetic and real-world graphs.
It sorts the graph and interleaves the vertices with two vertex granularity between processing elements (PEs). The number of PEs is described by the num_gpts  variable. Make sure to add the path to the graphs in the graph_names variable.

## Compile and run
You can use the command below in the gem5 repository to compile:

```
scons build/NULL/gem5.opt
```
```runScript.sh``` lists all the run commands we used to run our tests (strong/weak scaling and sensitivity analysis).
To use runScript you need to add the path to the input graph binaries (described in the Graph Generators section) and a path to outdir path.
