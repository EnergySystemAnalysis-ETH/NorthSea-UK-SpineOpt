Copyright (C) 2023-2026 Chair of Energy Systems Analysis (ETH Zurich): Huang.JiangYi, Anna Peecock, Pietro Bianchi Marzoli, Josef Köll

# UK North Sea Transition Model (SpineOpt)

## 1. Usage

### 1.1 Clone the repository
```shell
git clone https://github.com/EnergySystemAnalysis-ETH/NorthSea-UK-SpineOpt.git
```

### 1.2 Access the model workflow via Spine-Toolbox

This project uses [Spine-Toolbox](https://github.com/Spine-tools/Spine-Toolbox) to manage the building workflow.
Currently, we use the version `v0.10.9`, for which the [Windows executable bundle](https://spine-tools.github.io/Downloads/) is the minimum hazzle-free option.

### 1.3 Julia project environment setup to use SpineOpt.jl optimisation modelling

- SpineOpt.jl version `v0.11.3`
- solver: `Gurobi v1.9.2` or `HiGHS v1.24.1`

```shell
cd NorthSea-UK-SpineOpt
julia --project=@.
julia> ]
(NorthSea-UK-SpineOpt) pkg> instantiate
```

## 2. Run SpineOpt simulation
