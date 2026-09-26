# Get ESPN NWSL Standings

Get ESPN NWSL Standings

## Usage

``` r
espn_nwsl_standings(year)
```

## Arguments

- year:

  Either numeric or character (YYYY)

## Value

Returns a tibble

## Author

Geoff Hutchinson

## Examples

``` r
# \donttest{
  try(espn_nwsl_standings(year = 2021))
#>    team_id                   team gamesplayed losses pointdifferential points
#> 1    15362     Portland Thorns FC          24      6                16     44
#> 2    15363       Seattle Reign FC          24      8                13     42
#> 3    15365      Washington Spirit          24      7                 3     39
#> 4    15360       Chicago Stars FC          24      8                 0     38
#> 5    15364              Gotham FC          24      5                 8     35
#> 6    15366 North Carolina Courage          24      9                 5     33
#> 7    17346           Houston Dash          24     10                 0     32
#> 8    18206          Orlando Pride          24     10                -5     28
#> 9    20905   Racing Louisville FC          24     12               -19     22
#> 10   20907    Kansas City Current          24     14               -21     16
#>    pointsagainst pointsfor ties wins advanced deductions ppg rank rankchange
#> 1             17        33    5   13        0          0   0    1          0
#> 2             24        37    3   13        0          0   0    2          0
#> 3             26        29    6   11        0          0   0    3          0
#> 4             28        28    5   11        0          0   0    4          0
#> 5             21        29   11    8        0          0   0    5          0
#> 6             23        28    6    9        0          0   0    6          0
#> 7             31        31    5    9        0          0   0    7          0
#> 8             32        27    7    7        0          0   0    8          0
#> 9             40        21    7    5        0          0   0    9          0
#> 10            36        15    7    3        0          0   0   10          0
#>     total
#> 1  13-5-6
#> 2  13-3-8
#> 3  11-6-7
#> 4  11-5-8
#> 5  8-11-5
#> 6   9-6-9
#> 7  9-5-10
#> 8  7-7-10
#> 9  5-7-12
#> 10 3-7-14
# }
```
