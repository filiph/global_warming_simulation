using SpeedyWeather, GeoMakie, CairoMakie, Dates

# --- Configuration ---
include("definitions.jl");

const RUN_PERIOD = Day(365)
const OUTPUT_TIMESTEP = Hour(12)
const RUN_ID = "a"
const OUTPUT_DIR = "test1"    # A directory to store the results.
const START_DATE = DateTime(2026, 5, 1)

const CONTINUATION = true
const CONTINUATION_DIR = "initial_cond"
const CONTINUATION_ID = "run_a"
const CONTINUATION_RUN_NUMBER = 1

# --- Main Script ---

# 1. Setup
println("Starting simulation setup...")
println("  - Truncation: T$TRUNC")
println("  - Layers: $NLAYERS")
println("  - Solar Constant: $SOLAR_CONSTANT W/m²")

spectral_grid = SpectralGrid(trunc=TRUNC, nlayers=NLAYERS)
planet = Earth(spectral_grid, solar_constant=SOLAR_CONSTANT)

mkpath(OUTPUT_DIR)
output = NetCDFOutput(spectral_grid, 
  path=OUTPUT_DIR,
  id=RUN_ID,
  write_restart=true,
  output_dt=OUTPUT_TIMESTEP)

if CONTINUATION
  initial_conditions = StartFromFile(path=CONTINUATION_DIR, id=CONTINUATION_ID, run_number=CONTINUATION_RUN_NUMBER)
  model = PrimitiveWetModel(spectral_grid, planet=planet, output=output, initial_conditions=initial_conditions)
else
  model = PrimitiveWetModel(spectral_grid, planet=planet, output=output)
end

add!(model, ProgressTxt(every_n_percent=1)) # For continuous output.

# Add the variables we want to save to the output
add!(model, SpeedyWeather.TemperatureOutput())
# add!(model, SpeedyWeather.HumidityOutput()) # You can uncomment this if needed

simulation = initialize!(model, time=START_DATE)
println("Setup complete.")

# 2. Run
println("\nRunning simulation for a period of $RUN_PERIOD...")
run!(simulation, period=RUN_PERIOD, output=true)
println("Simulation finished.")

println("\nAll tasks complete. Output is in the '$OUTPUT_DIR' directory.")
