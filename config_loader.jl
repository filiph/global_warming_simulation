using ArgParse

"""
Parses command-line arguments to find the specified configuration file.
Returns the path to the configuration file as a String.
"""
function get_config_path()
    s = ArgParseSettings(description="Run simulation with custom parameters.")

    @add_arg_table! s begin
        "--config"
            help = "The .jl file from which to load configuration. Use default_config.jl if unsure."
            arg_type = String
            required = true
            metavar = "path/to/config.jl"
    end

    parsed_args = parse_args(ARGS, s)
    return parsed_args["config"]
end
