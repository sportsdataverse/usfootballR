# Get NWSL schedule for a specific year/date from ESPN's API

Get NWSL schedule for a specific year/date from ESPN's API

## Usage

``` r
espn_nwsl_scoreboard(season)
```

## Arguments

- season:

  Either numeric or character

## Value

Returns a tibble

## Author

Saiem Gilani.

## Examples

``` r
# Get schedule from date 2020-08-29
# \donttest{
  try(espn_nwsl_scoreboard (season = "20200829"))
#> 2026-09-26 07:14:07: Invalid arguments or no scoreboard data available!
# }
```
