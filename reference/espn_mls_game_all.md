# Get ESPN's MLS game data (play-by-play, team)

Get ESPN's MLS game data (play-by-play, team)

## Usage

``` r
espn_mls_game_all(game_id)
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
  try(espn_mls_game_all(game_id = 598135))
#> 2026-09-26 06:42:10: Invalid arguments or no play-by-play data for 598135 available!
#> 2026-09-26 06:42:10: Invalid arguments or no team box score data for 598135 available!
#> Error in espn_mls_game_all(game_id = 598135) : 
#>   object 'plays_df' not found
# }
```
