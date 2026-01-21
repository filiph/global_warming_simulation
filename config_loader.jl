using ArgParse

"""
Parses command-line arguments to find the specified configuration file.
Returns the path to the configuration file as a String.
"""
function get_config_path()
    s = ArgParseSettings(description="Run simulation with custom parameters.")

    @add_arg_table! s begin
        "--config"  # A more descriptive name for the argument
            help = "The .jl file from which to load configuration."
            arg_type = String
            default = "default_config.jl"
    end

    parsed_args = parse_args(ARGS, s) # Pass ARGS explicitly
    return parsed_args["config"]
end
