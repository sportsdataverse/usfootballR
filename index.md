# usfootballR

`usfootballR` is an R package for working with American soccer data. The
package has functions to access **live play-by-play and box score** data
from ESPN with shot locations when available.

A scraping and aggregating interface for ESPN’s MLS and NWSL statistics.
It provides users with the capability to access the API’s game
play-by-plays, box scores, standings and results to analyze the data for
themselves.

Data freshness and pipeline status for every SportsDataverse dataset:
[sportsdataverse.org/status](https://sportsdataverse.org/status).

## Installation

You can install the released version of
[**`usfootballR`**](https://github.com/sportsdataverse/usfootballR) from
[GitHub](https://github.com/sportsdataverse/usfootballR) with:

``` r

# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("sportsdataverse/usfootballR", dependencies = TRUE, update = TRUE)
```

## Documentation

For more information on the package and function reference, please see
the [**`usfootballR`** documentation
website](https://usfootballR.sportsdataverse.org).

## **Breaking Changes**

[**Full News on
Releases**](https://usfootballR.sportsdataverse.org/CHANGELOG)

## Follow the [SportsDataverse](https://twitter.com/SportsDataverse) on Twitter and star this repo

[![Twitter
Follow](https://img.shields.io/twitter/follow/SportsDataverse?color=blue&label=%40SportsDataverse&logo=twitter&style=for-the-badge)](https://twitter.com/SportsDataverse)

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/usfootballR.svg?color=eee&logo=github&style=for-the-badge&label=Star%20usfootballR&maxAge=2592000)](https://github.com/sportsdataverse/usfootballR/stargazers/)

# **Our Authors**

- [Saiem Gilani](https://twitter.com/saiemgilani)  
  [![@saiemgilani](https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge)](https://twitter.com/saiemgilani)
  [![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

## **Citations**

To cite the [**`usfootballR`**](https://usfootballR.sportsdataverse.org)
R package in publications, use:

BibTex Citation

``` bibtex
@misc{gilani_2021_usfootballR,
  author = {Saiem Gilani},
  title = {usfootballR: The SportsDataverse's R Package for MLS and NWSL Data.},
  url = {https://usfootballR.sportsdataverse.org},
  year = {2021}
}
```
