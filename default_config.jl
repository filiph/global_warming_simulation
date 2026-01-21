# Shared configuration
const TRUNC = 85    # Lower resolution for faster test runs (e.g., 85, 340).
const SOLAR_CONSTANT = 1365.0 
const NLAYERS = 8


# Simulation settings
const RUN_PERIOD = Day(365)
const OUTPUT_TIMESTEP = Hour(1)
const OUTPUT_DIR = "year3_T85"    # A directory to store the results.
const RUN_ID = "a"
const START_DATE = DateTime(2026, 5, 1)

const CONTINUATION = true
const CONTINUATION_DIR = "test1"
const CONTINUATION_ID = "a"
const CONTINUATION_RUN_NUMBER = 1


# Animation settings
const VARIANT = "contrast"
const ANIM_INPUT_DIR = "test1/run_a_0001"
const LEVEL_LOW = 1
const LEVEL_HIGH = NLAYERS - 1
const FRAME_RATE = 15
const PROJECTION = "+proj=ortho +lon_0=0 +lat_0=30"
const COLOR_RANGE = (-20, 20)  # Celsius.
const COLORMAP = :coolwarm  # :thermal, :coolwarm, :viridis, :plasma, :inferno, :magma, :cividis, :greens, :blues, :reds
const FIGURE_SIZE = (1920, 1080)
