# Get ESPN's MLS team box data

Get ESPN's MLS team box data

## Usage

``` r
espn_mls_team_box(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

Returns a team boxscore data frame

## Author

Saiem Gilani

## Examples

``` r

# \donttest{
  try(espn_mls_team_box(game_id = 598135))
#> 2026-10-09 03:22:00: Invalid arguments or no team box score data for 598135 available!
#> Error in espn_mls_team_box(game_id = 598135) : 
#>   object 'team_box_score' not found
# }
```
