# **Load usfootballR MLS play-by-play**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_mls_pbp(
  seasons = most_recent_mls_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given MLS seasons. (Min:
  2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database (used by
  [`update_mls_db()`](https://usfootballR.sportsdataverse.org/reference/update_mls_db.md)).

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the play by play data table within the database

## Value

A dataframe

## Examples

``` r
# \donttest{
  try(load_mls_pbp(2021))
#> Warning: cannot open URL 'https://raw.githubusercontent.com/saiemgilani/usfootballR-data/master/mls/pbp/rds/play_by_play_2021.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://raw.githubusercontent.com/saiemgilani/usfootballR-data/master/mls/pbp/rds/play_by_play_2021.rds>
#> # A tibble: 0 × 0
# }
```
