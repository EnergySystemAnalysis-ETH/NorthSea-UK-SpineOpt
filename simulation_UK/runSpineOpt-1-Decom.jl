# Copyright (C) 2026 Huang.JiangYi
# Author: Huang.JiangYi (Chair of Energy Systems Analysis, ETH Zurich)

import Pkg
proj = Base.current_project(@__DIR__) === nothing ? 
    Base.current_project(pwd()) : 
    Base.current_project(@__DIR__)
if proj === nothing
    @error "No Project.toml found in $(@__DIR__) or\n
            the currect working directory $(pwd()) or\n
            any of their parent directories."
    @info "Please ensure that a Julia project environment contains either\n
            (1) this script $(@__FILE__) or (2) the working directory."
    exit(1)
end
Pkg.activate(dirname(proj))

using SpineOpt, Gurobi 

include("./simulation_scenario_config.jl")

input_db_core = "DB"
scenarios = ["BAU", "DECARBO", "DECOMMI"]

for scenario in scenarios
    simulation_run(input_db_core, scenario)
end
