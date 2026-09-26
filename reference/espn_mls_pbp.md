# Get ESPN's MLS play by play data

Get ESPN's MLS play by play data

## Usage

``` r
espn_mls_pbp(game_id)
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
  try(espn_mls_pbp(game_id = 598135))
#> Error : lexical error: invalid char in json text.
#>                                        <!doctype html>         <html l
#>                      (right here) ------^
#> 
# }
```
