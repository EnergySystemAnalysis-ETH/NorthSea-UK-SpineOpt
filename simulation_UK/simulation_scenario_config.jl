# Copyright (C) 2026 Huang.JiangYi
# Author: Huang.JiangYi (Chair of Energy Systems Analysis, ETH Zurich)

using JuMP, SpineOpt, Gurobi

function simulation_run(input_db_decor::String, scenario_name::String)

    # "sqlite:///./path/to/DB.sqlite" is relative to the working directory (`pwd()`) when running this script, 
    # not relative to the script location (`@__DIR__`).
    input_db_url = "sqlite:///$(@__DIR__)/Input$(input_db_decor).sqlite"
    output_db_url = "sqlite:///$(@__DIR__)/Output_$(ENV["SLURM_ARRAY_TASK_ID"]).sqlite"

    m = run_spineopt(
        input_db_url, output_db_url; upgrade=true, 
        lp_solver=optimizer_with_attributes(Gurobi.Optimizer),
        mip_solver=optimizer_with_attributes(Gurobi.Optimizer, 
            "Method" => 2, "NodeMethod" => 2, "MIPFocus" => 0,
            # "Threads" => 0, "Crossover" => -1,             
            # "MIPGap" => 0.001, "TimeLimit" => 1200000,
        ),
        log_file_path="log-julia/runSpineOpt-$(ENV["SLURM_ARRAY_TASK_ID"]).txt",
        filters=Dict("scenario" => scenario_name),
        # filters=Dict("tool" => "object_activity_control", "scenario" => scenario_name),
        alternative=scenario_name
    )
    return m
end