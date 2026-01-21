using SpeedyWeather, GeoMakie, CairoMakie, Dates

# Fix issue with Makie
import Makie: create_dim_conversion
create_dim_conversion(union_typ::Type{Union{Missing,T}}) where {T<:Real} =
           create_dim_conversion(union_typ.b)

include("definitions.jl");

# Animation settings
const INPUT_DIR = "initial_cond/run_run_a_0001"
const LEVEL_LOW = 1
const LEVEL_HIGH = NLAYERS - 1
const FRAME_RATE = 15
const PROJECTION = "+proj=ortho +lon_0=0 +lat_0=30"
const COLOR_RANGE = (-40, 40)  # Celsius.
const COLORMAP = :coolwarm  # :thermal, :coolwarm, :viridis, :plasma, :inferno, :magma, :cividis, :greens, :blues, :reds
const FIGURE_SIZE = (1920, 1080)

# --- Main Script ---

println("\nGenerating animations...")
input_path = joinpath(INPUT_DIR, "output.nc");

# Generate informative filenames automatically
filename_low = joinpath(INPUT_DIR, "temp_sc$(SOLAR_CONSTANT)_l$(LEVEL_LOW).mp4")
filename_high = joinpath(INPUT_DIR, "temp_sc$(SOLAR_CONSTANT)_l$(LEVEL_HIGH).mp4")

# println("  - Animating level $LEVEL_LOW -> $filename_low")
# animate(input_path, output_file=filename_low, 
#   projection=PROJECTION, 
#   colorrange=COLOR_RANGE,
#   colormap=COLORMAP, 
#   variable="temp", 
#   level=LEVEL_LOW, 
#   framerate=FRAME_RATE,
#   figure_size=FIGURE_SIZE)

println("  - Animating level $LEVEL_HIGH -> $filename_high")
animate(input_path, output_file=filename_high, 
  projection=PROJECTION, 
  colorrange=COLOR_RANGE,
  colormap=COLORMAP, 
  variable="temp", 
  level=LEVEL_HIGH, 
  framerate=FRAME_RATE,
  figure_size=FIGURE_SIZE)

println("\nAll tasks complete. Output is in the '$INPUT_DIR' directory.")
