# Shared configuration

# Lower resolution for faster test runs (e.g., 85, 127, 170, 255, 341 .. 1365).
# https://speedyweather.github.io/SpeedyWeatherDocumentation/dev/spectral_transform/#Available-horizontal-resolutions
const TRUNC = 85
const NLAYERS = 8

# How warm the sun is. This is normally 1365.0.
const SOLAR_CONSTANT = 1365.0

# The greenhouse effect. Turn this down for a hotter planet. Default is 1.0.
const EMISSIVITY = 1.0


# Simulation settings
const RUN_PERIOD = Day(10)
const OUTPUT_TIMESTEP = Hour(1)
const OUTPUT_DIR = "my_simulation"    # A directory to store the results.
const RUN_ID = "initial"
const START_DATE = DateTime(2026, 5, 1)

# Whether or not this simulation should start from the end of a previous run.
const CONTINUATION = false

# The location of the previous run. That run must be compatible with this one
# (i.e. TRUNC and NLAYERS must be the same).
const CONTINUATION_DIR = "test1"
const CONTINUATION_ID = "a"
const CONTINUATION_RUN_NUMBER = 1


# Animation settings
const ANIM_INPUT_DIR = joinpath(OUTPUT_DIR, "run_$(RUN_ID)_0001")  # or replace with something like "year3_T85/run_a_0001"
const VARIANT = "contrast"
const ANIM_VAR = "humid"  # temp, humid, cloud_top
const LEVEL_LOW = 1
const LEVEL_HIGH = NLAYERS - 1
const FRAME_RATE = 15
# See https://proj.org/en/stable/operations/projections/all_images.html
const PROJECTION = "+proj=ortho +lon_0=0 +lat_0=30"
const COLOR_RANGE = (-15, 15)  # Celsius.
const COLORMAP = :coolwarm  # :thermal, :coolwarm, :viridis, :plasma, :inferno, :magma, :cividis, :greens, :blues, :reds
const FIGURE_SIZE = (1920, 1080)
