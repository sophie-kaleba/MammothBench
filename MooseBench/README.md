# MooseBench

Moose Benchs are specific benchs built with the Moose framework, a framework to analyse software. The benchmarks mimics the real-world application by basically importing the source code of a software in the form of a model, performing analysis on it and releasing it. The benchmarks are using between 2 and 20Gb heaps, make sure to have enough RAM available to run these benchmarks.

Four main benchmarks are available:
- load: imports the software into a model from a mse file
- exp: computes interesting properties
- expWithCache: computes interesting properties with some properties already cached (less computation, higher workload)
- release: releases the model

## WorkLoads

Four Java project mse files are available right now in the WorkLoads folder for benchmarking. Three of the projects are fairly small, leading to 2-6 Gb heaps. The netbeans project is larger, leading to ~20Gb heap during the benchmark.

Note: due to the file size, the WorkLoads folder is versionned using git lfs. Do not forget to install git lfs to clone the repository (Homebrew: brew install git-lfs). More detail here: https://git-lfs.github.com/.

## Reproducing the benchmark

TODO.
