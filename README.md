
# usfootballR <a href='https://saiemgilani.github.io/usfootballR/'><img src="man/figures/logo.png" align="right" height="139"/></a>

<!-- badges: start -->

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/usfootballR?label=usfootballR&logo=R&style=for-the-badge)](https://github.com/saiemgilani/usfootballR)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/usfootballR/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=blue&style=for-the-badge)](https://github.com/saiemgilani/usfootballR/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg?style=for-the-badge&logo=github)](https://github.com/saiemgilani/usfootballR)
[![Twitter
Follow](https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge)](https://twitter.com/saiemgilani)
[![Twitter
Follow](https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge)](https://twitter.com/hutchngo)
[![Twitter
Follow](https://img.shields.io/twitter/follow/SportsDataverse?color=blue&label=%40SportsDataverse&logo=twitter&style=for-the-badge)](https://twitter.com/SportsDataverse)

<!-- badges: end -->

`usfootballR` is an R package for working with American soccer data. The
package has functions to access **live play-by-play and box score** data
from ESPN with shot locations when available.

A scraping and aggregating interface for ESPN’s MLS and NWSL statistics.
It provides users with the capability to access the API’s game
play-by-plays, box scores, standings and results to analyze the data for
themselves.

## Installation

You can install the released version of
[**`usfootballR`**](https://github.com/saiemgilani/usfootballR) from
[GitHub](https://github.com/saiemgilani/usfootballR) with:

``` r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/usfootballR", dependencies = TRUE, update = TRUE)
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
stars](https://img.shields.io/github/stars/saiemgilani/usfootballR.svg?color=eee&logo=github&style=for-the-badge&label=Star%20usfootballR&maxAge=2592000)](https://github.com/saiemgilani/usfootballR/stargazers/)

# **Our Authors**

-   [Saiem Gilani](https://twitter.com/saiemgilani)  
    <a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a>
    <a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

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
