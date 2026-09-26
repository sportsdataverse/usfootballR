# Get MLS schedule for a specific year/date from ESPN's API

Get MLS schedule for a specific year/date from ESPN's API

## Usage

``` r
espn_mls_scoreboard(season)
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
  try(espn_mls_scoreboard (season = "20200829"))
#> 2026-09-26 07:22:41: Invalid arguments or no scoreboard data available!
# }
```
