# Get ESPN's NWSL team box data

Get ESPN's NWSL team box data

## Usage

``` r
espn_nwsl_team_box(game_id)
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
  try(espn_nwsl_team_box(game_id = 601833))
#> 2026-10-09 05:29:17: Invalid arguments or no team box score data for 601833 available!
#> Error in espn_nwsl_team_box(game_id = 601833) : 
#>   object 'team_box_score' not found
# }
```
