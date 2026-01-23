using SpeedyWeather, GeoMakie, CairoMakie, Dates

# Fix issue with Makie
# https://discourse.julialang.org/t/makie-error-methoderror-no-method-matching-create-dim-conversion-type-union-missing-float64-the-function-create-dim-conversion-exists-but-no-method-is-defined-for-this-combination-of-argument-types/131156/5
import Makie: create_dim_conversion
create_dim_conversion(union_typ::Type{Union{Missing,T}}) where {T<:Real} =
           create_dim_conversion(union_typ.b)

# --- Getting configuration ---
include("config_loader.jl")
config_file_to_load = get_config_path()
println("Loading configuration from: $config_file_to_load")
include(config_file_to_load)

# --- Main Script ---

println("\nGenerating animations...")
input_path = joinpath(ANIM_INPUT_DIR, "output.nc");

emissivity_pct = round(Int, EMISSIVITY * 100)
filename = joinpath(ANIM_INPUT_DIR, "temp_em$(emissivity_pct)_$(ANIM_VAR)_l$(LEVEL_HIGH)_$(VARIANT).mp4")

println("  - Animating level $LEVEL_HIGH -> $filename")
animate(input_path, output_file=filename,
  projection=PROJECTION, 
  colorrange=COLOR_RANGE,
  colormap=COLORMAP, 
  variable=ANIM_VAR,
  level=LEVEL_HIGH, 
  framerate=FRAME_RATE,
  figure_size=FIGURE_SIZE)

println("\nAnimation finished. Output is in '$filename'.")
