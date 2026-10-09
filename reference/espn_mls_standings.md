# Get ESPN MLS Standings

Get ESPN MLS Standings

## Usage

``` r
espn_mls_standings(year)
```

## Arguments

- year:

  Either numeric or character (YYYY)

## Value

Returns a tibble

## Examples

``` r
# \donttest{
  try(espn_mls_standings(year = 2021))
#> 2026-10-09 05:29:14: Invalid arguments or no standings data available!
#> Error in espn_mls_standings(year = 2021) : object 'standings' not found
# }
```
