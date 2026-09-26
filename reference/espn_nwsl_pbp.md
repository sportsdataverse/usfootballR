# Get ESPN's NWSL play by play data

Get ESPN's NWSL play by play data

## Usage

``` r
espn_nwsl_pbp(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

Returns a play-by-play data frame

## Author

Saiem Gilani

## Examples

``` r

# \donttest{
  try(espn_nwsl_pbp(game_id = 601833))
#> Error : lexical error: invalid char in json text.
#>                                        <!doctype html>         <html l
#>                      (right here) ------^
#> 
# }
```
