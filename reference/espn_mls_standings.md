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
#> 2026-09-26 07:22:42: Invalid arguments or no standings data available!
#> Error in espn_mls_standings(year = 2021) : object 'standings' not found
# }
```
