# Get ESPN's MLS team names and ids

Get ESPN's MLS team names and ids

## Usage

``` r
espn_mls_teams()
```

## Value

Returns a tibble

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_mls_teams())
#> # A tibble: 30 × 10
#>    team_id team              mascot   display_name short_name abbreviation color
#>    <chr>   <chr>             <chr>    <chr>        <chr>      <chr>        <chr>
#>  1 18418   Atlanta United FC Atlanta… Atlanta Uni… Atlanta    ATL          9d22…
#>  2 20906   Austin FC         Austin … Austin FC    Austin     ATX          00b1…
#>  3 9720    CF Montréal       CF Mont… CF Montréal  CF Montré… MTL          003d…
#>  4 21300   Charlotte FC      Charlot… Charlotte FC Charlotte  CLT          0085…
#>  5 182     Chicago Fire FC   Chicago… Chicago Fir… Chicago    CHI          7ccd…
#>  6 184     Colorado Rapids   Colorad… Colorado Ra… Colorado   COL          8a24…
#>  7 183     Columbus Crew     Columbu… Columbus Cr… Columbus   CLB          0000…
#>  8 193     D.C. United       D.C. Un… D.C. United  D.C. Unit… DC           0000…
#>  9 18267   FC Cincinnati     FC Cinc… FC Cincinna… Cincinnati CIN          0030…
#> 10 185     FC Dallas         FC Dall… FC Dallas    Dallas     DAL          c609…
#> # ℹ 20 more rows
#> # ℹ 3 more variables: alternate_color <chr>, logo <chr>, logo_dark <chr>
# }
```
