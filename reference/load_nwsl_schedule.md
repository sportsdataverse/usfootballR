# **Load usfootballR NWSL schedules**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_nwsl_schedule(
  seasons = most_recent_nwsl_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given NWSL seasons. (Min:
  2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database (used by
  [`update_nwsl_db()`](https://usfootballR.sportsdataverse.org/reference/update_nwsl_db.md)).

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the schedule data table within the database

## Value

Returns a tibble

## Examples

``` r
# \donttest{
  try(load_nwsl_schedule(2021))
#> Warning: cannot open URL 'https://raw.githubusercontent.com/saiemgilani/usfootballR-data/master/nwsl/schedules/rds/nwsl_schedule_2021.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://raw.githubusercontent.com/saiemgilani/usfootballR-data/master/nwsl/schedules/rds/nwsl_schedule_2021.rds>
#> # A tibble: 0 × 0
# }
```
