# Get ESPN's NWSL game data (play-by-play, team)

Get ESPN's NWSL game data (play-by-play, team)

## Usage

``` r
espn_nwsl_game_all(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

A named list of dataframes: Plays, Team

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_nwsl_game_all(game_id = 601833))
#> Error : lexical error: invalid char in json text.
#>                                        <!doctype html>         <html l
#>                      (right here) ------^
#> 
# }
```
