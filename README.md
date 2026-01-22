# global warming simulation

This project uses https://github.com/SpeedyWeather/SpeedyWeather.jl
([docs](https://speedyweather.github.io/SpeedyWeatherDocumentation/dev/))
to illustrate how global warming changes the planet's climate.

It addresses the classic issue people raise that goes something like:

> If the planet is warming,
> how come it's so cold outside right now?

The classic response to that is to dismiss it with something like
"weather is not climate" but that's an unsatisfying answer.
I think it's better to show what's going on on a model.

This is obviously **not** meant as a serious simulation of global warming.
For that, there's "CMIP6 Simulations With the CMCC Earth System Model (CMCC‐ESM2)"
and other research projects.
What this project attempts to bring is something that can be easily played with
on personal computers. You want to show how the planet's weather might look differently
if it was "only" 10 °C hotter? Go ahead. The simulation will not be perfect
by any means but it will be reasonably realistic and easy to visualize.


## Installation

First, [install Julia](https://julialang.org/downloads/).

Then, [install SpeedyWeather](https://speedyweather.github.io/SpeedyWeatherDocumentation/dev/installation/) and ArgParse, GeoMakie and CairoMakie (`add ArgParse, GeoMakie, CairoMakie`).

## Running

Create a new config file by copying one of the existing ones (such as `default_config.jl`).

Then:

1. Run the simulation with something like `julia --threads 8 run.jl --config your_config.jl`.
2. Generate an MP4 animation by running `julia animate.jl --config your_config.jl`.

These commands can take hours to complete if you insist on high resolutions. You've been warned.
