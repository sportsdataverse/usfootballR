#' Get ESPN's NWSL game data (play-by-play, team)
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return A named list of dataframes: Plays, Team
#' @keywords NWSL Game
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#' \donttest{
#'   try(espn_nwsl_game_all(game_id = 601833))
#' }

espn_nwsl_game_all <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  play_base_url <- "http://cdn.espn.com/soccer/commentary?render=false&userab=1&xhr=1&"

  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "gameId=", game_id)
  res <- httr::RETRY(
    "GET", full_url
  )

  # Check the result
  check_status(res)
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8")
  raw_play_df <- jsonlite::fromJSON(resp)[["gamepackageJSON"]]
  raw_play_df <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df),flatten=TRUE)

  #---- Play-by-Play ------
  tryCatch(
    expr = {
      raw_play_df <- jsonlite::fromJSON(resp)[["gamepackageJSON"]]
      raw_play_df <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df),flatten=TRUE)


      plays <- raw_play_df[["commentary"]] %>%
        tidyr::unnest_wider(.data$play.participants, names_sep = "_")
      suppressWarnings(
        aths <- plays %>%
          dplyr::group_by(.data$play.id) %>%
          dplyr::select(.data$play.id, .data$athlete.displayName) %>%
          tidyr::unnest_wider(.data$athlete.displayName, names_sep = "_")
      )
      names(aths)<-c("id","athlete.1","athlete.2")
      plays_df <- dplyr::bind_cols(plays, aths) %>%
        select(-.data$athlete.displayName)
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no play-by-play data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  #---- Team Box ------
  tryCatch(
    expr = {
      raw_play_df <- jsonlite::fromJSON(resp)[["gamepackageJSON"]]
      season <- raw_play_df[['header']][['season']][['year']]
      season_type <- raw_play_df[['header']][['season']][['type']]
      homeAwayTeam1 = toupper(raw_play_df[['header']][['competitions']][['competitors']][[1]][['homeAway']][1])
      homeAwayTeam2 = toupper(raw_play_df[['header']][['competitions']][['competitors']][[1]][['homeAway']][2])
      homeTeamId = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][1]
      awayTeamId = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][2]
      homeTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][1]
      awayTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][2]
      homeTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][1]
      awayTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][2]

      homeTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][1]
      awayTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][2]
      game_date = as.Date(substr(raw_play_df[['header']][['competitions']][['date']],0,10))

      team_box_score <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df[["boxscore"]][["teams"]]),flatten=TRUE)


    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no team box score data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  pbp <- c(list(plays_df), list(team_box_score))
  names(pbp) <- c("Plays","Team")
  return(pbp)
}

#' Get ESPN's NWSL play by play data
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a play-by-play data frame
#' @keywords NWSL PBP
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#'
#' \donttest{
#'   try(espn_nwsl_pbp(game_id = 601833))
#' }
espn_nwsl_pbp <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  play_base_url <- "http://cdn.espn.com/soccer/commentary?render=false&userab=1&xhr=1&"

  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "gameId=", game_id)
  res <- httr::RETRY(
    "GET", full_url
  )

  # Check the result
  check_status(res)
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8")
  raw_play_df <- jsonlite::fromJSON(resp)[["gamepackageJSON"]]
  raw_play_df <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df),flatten=TRUE)


  plays <- raw_play_df[["commentary"]] %>%
    tidyr::unnest_wider(.data$play.participants)
  suppressWarnings(
    aths <- plays %>%
      dplyr::group_by(.data$play.id) %>%
      dplyr::select(.data$play.id, .data$athlete.displayName) %>%
      tidyr::unnest_wider(.data$athlete.displayName, names_sep = "_")
  )
  names(aths)<-c("id","athlete.1","athlete.2")
  plays_df <- dplyr::bind_cols(plays, aths) %>%
    select(-.data$athlete.displayName)

  plays_df <- plays_df %>%
    janitor::clean_names()
  return(plays_df)
}
#' Get ESPN's NWSL team box data
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a team boxscore data frame
#' @keywords NWSL Team Box
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#'
#' \donttest{
#'   try(espn_nwsl_team_box(game_id = 601833))
#' }
espn_nwsl_team_box <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  play_base_url <- "http://cdn.espn.com/soccer/commentary?render=false&userab=1&xhr=1&"

  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "gameId=", game_id)
  res <- httr::RETRY(
    "GET", full_url
  )

  # Check the result
  check_status(res)
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8")
  #---- Team Box ------
  tryCatch(
    expr = {
      raw_play_df <- jsonlite::fromJSON(resp)[["gamepackageJSON"]]
      season <- raw_play_df[['header']][['season']][['year']]
      season_type <- raw_play_df[['header']][['season']][['type']]
      homeAwayTeam1 = toupper(raw_play_df[['header']][['competitions']][['competitors']][[1]][['homeAway']][1])
      homeAwayTeam2 = toupper(raw_play_df[['header']][['competitions']][['competitors']][[1]][['homeAway']][2])
      homeTeamId = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][1]
      awayTeamId = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][2]
      homeTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][1]
      awayTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][2]
      homeTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][1]
      awayTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][2]

      homeTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][1]
      awayTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][2]
      game_date = as.Date(substr(raw_play_df[['header']][['competitions']][['date']],0,10))

      team_box_score <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df[["boxscore"]][["teams"]]),flatten=TRUE)

    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no team box score data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(team_box_score)
}

#' Get ESPN's NWSL team names and ids
#' @author Saiem Gilani
#' @keywords NWSL Teams
#' @return Returns a tibble
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows row_number group_by mutate as_tibble ungroup
#' @importFrom tidyr unnest unnest_wider everything pivot_wider
#' @import rvest
#' @export
#' @examples
#' \donttest{
#'   try(espn_nwsl_teams())
#' }

espn_nwsl_teams <- function(){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  play_base_url <- "http://site.api.espn.com/apis/site/v2/sports/soccer/usa.nwsl/teams?limit=1000"
  res <- httr::RETRY(
    "GET", play_base_url
  )

  # Check the result
  check_status(res)
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8")

  ## Inputs
  ## game_id
  leagues <- jsonlite::fromJSON(resp)[["sports"]][["leagues"]][[1]][['teams']][[1]][['team']] %>%
    dplyr::group_by(.data$id) %>%
    tidyr::unnest_wider(.data$logos,names_sep = "_") %>%
    tidyr::unnest_wider(.data$logos_href,names_sep = "_") %>%
    dplyr::select(-.data$logos_width,-.data$logos_height,
                  -.data$logos_alt, -.data$logos_rel) %>%
    dplyr::ungroup()

  nwsl_teams <- leagues %>%
    dplyr::select(.data$id,
                  .data$location,
                  .data$name,
                  .data$displayName,
                  .data$shortDisplayName,
                  .data$abbreviation,
                  .data$color,
                  .data$alternateColor,
                  .data$logos_href_1,
                  .data$logos_href_2) %>%
    dplyr::rename(
      logo = .data$logos_href_1,
      logo_dark = .data$logos_href_2,
      mascot = .data$name,
      team = .data$location,
      team_id = .data$id,
      alternate_color = .data$alternateColor,
      short_name = .data$shortDisplayName,
      display_name = .data$displayName
    )

  return(nwsl_teams)
}


#' Get NWSL schedule for a specific year/date from ESPN's API
#'
#' @param season Either numeric or character
#' @author Saiem Gilani.
#' @return Returns a tibble
#' @import utils
#' @import rvest
#' @importFrom dplyr select rename any_of mutate
#' @importFrom jsonlite fromJSON
#' @importFrom tidyr unnest_wider unchop hoist
#' @importFrom glue glue
#' @import rvest
#' @export
#' @examples
#' # Get schedule from date 2020-08-29
#' \donttest{
#'   try(espn_nwsl_scoreboard (season = "20200829"))
#' }

espn_nwsl_scoreboard <- function(season){

  # message(glue::glue("Returning data for {season}!"))

  max_year <- substr(Sys.Date(), 1,4)

  if(!(as.integer(substr(season, 1, 4)) %in% c(2001:max_year))){
    message(paste("Error: Season must be between 2001 and", max_year))
  }

  # year > 2000
  season <- as.character(season)

  season_dates <- season

  schedule_api <- glue::glue("http://site.api.espn.com/apis/site/v2/sports/soccer/usa.nwsl/scoreboard?limit=1000&dates={season_dates}")
  res <- httr::RETRY(
    "GET", schedule_api
  )

  # Check the result
  check_status(res)

  tryCatch(
    expr = {
      raw_sched <- res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE)

      nwsl_data <- raw_sched[["events"]] %>%
        tibble::tibble(data = .data$.) %>%
        tidyr::unnest_wider(.data$data) %>%
        tidyr::unchop(.data$competitions) %>%
        dplyr::select(-.data$id, -.data$uid, -.data$date, -.data$status) %>%
        tidyr::unnest_wider(.data$competitions) %>%
        dplyr::rename(matchup = .data$name, matchup_short = .data$shortName, game_id = .data$id, game_uid = .data$uid, game_date = .data$date) %>%
        tidyr::hoist(.data$status,
                     status_name = list("type", "name")) %>%
        dplyr::select(!dplyr::any_of(c("timeValid", "neutralSite", "conferenceCompetition","recent", "venue", "type"))) %>%
        tidyr::unnest_wider(.data$season) %>%
        dplyr::rename(season = .data$year) %>%
        dplyr::select(-dplyr::any_of("status")) %>%
        tidyr::hoist(
          .data$competitors,
          home_team_name = list(1, "team", "name"),
          home_team_logo = list(1, "team", "logo"),
          home_team_abbreviation = list(1, "team", "abbreviation"),
          home_team_id = list(1, "team", "id"),
          home_team_location = list(1, "team", "location"),
          home_team_full_name = list(1, "team", "displayName"),
          home_team_color = list(1, "team", "color"),
          home_score = list(1, "score"),
          home_win = list(1, "winner"),
          home_record = list(1, "records", 1, "summary"),
          # away team
          away_team_name = list(2, "team", "name"),
          away_team_logo = list(2, "team", "logo"),
          away_team_abbreviation = list(2, "team", "abbreviation"),
          away_team_id = list(2, "team", "id"),
          away_team_location = list(2, "team", "location"),
          away_team_full_name = list(2, "team", "displayName"),
          away_team_color = list(2, "team", "color"),
          away_score = list(2, "score"),
          away_win = list(2, "winner"),
          away_record = list(2, "records", 1, "summary")) %>%
        dplyr::mutate(
          home_win = as.integer(.data$home_win),
          away_win = as.integer(.data$away_win),
          home_score = as.integer(.data$home_score),
          away_score = as.integer(.data$away_score))



      if("broadcasts" %in% names(nwsl_data)) {
        nwsl_data %>%
          tidyr::hoist(
            .data$broadcasts,
            broadcast_market = list(1, "market"),
            broadcast_name = list(1, "names", 1)) %>%
          dplyr::select(!where(is.list)) %>%
          janitor::clean_names()
      } else {
        nwsl_data %>%
          dplyr::select(!where(is.list)) %>%
          janitor::clean_names()
      }
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no scoreboard data available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
}
#' Get ESPN NWSL Standings
#'
#' @author Geoff Hutchinson
#' @param year Either numeric or character (YYYY)
#' @return Returns a tibble
#' @keywords NWSL Standings
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr select rename
#' @importFrom tidyr pivot_wider
#' @importFrom data.table rbindlist
#' @export
#' @examples
#' \donttest{
#'   try(espn_nwsl_standings(year = 2021))
#' }
espn_nwsl_standings <- function(year){

  standings_url <- "https://site.web.api.espn.com/apis/v2/sports/soccer/usa.nwsl/standings?region=us&lang=en&contentorigin=espn&sort=rank%3Aasc&"

  ## Inputs
  ## year
  full_url <- paste0(standings_url,
                     "season=", year)

  res <- httr::RETRY("GET", full_url)

  # Check the result
  check_status(res)
  tryCatch(
    expr = {
      resp <- res %>%
        httr::content(as = "text", encoding = "UTF-8")

      raw_standings <- jsonlite::fromJSON(resp)[["children"]][["standings"]]

      #Create a dataframe of all NBA teams by extracting from the raw_standings file

      teams <- raw_standings[["entries"]][[1]][["team"]]

      teams <- teams %>%
        dplyr::select(.data$id, .data$displayName) %>%
        dplyr::rename(team_id = .data$id,
                      team = .data$displayName)

      #creating a dataframe of the NWSL raw standings table from ESPN

      standings_df <- raw_standings[["entries"]][[1]][["stats"]]

      standings_data <- data.table::rbindlist(standings_df, fill = TRUE, idcol = T)

      #Use the following code to replace NA's in the dataframe with the correct corresponding values and removing all unnecessary columns

      standings_data$value <- ifelse(is.na(standings_data$value) & !is.na(standings_data$summary), standings_data$summary, standings_data$value)

      standings_data <- standings_data %>%
        dplyr::select(.data$.id, .data$type, .data$value)

      #Use pivot_wider to transpose the dataframe so that we now have a standings row for each team

      standings_data <- standings_data %>%
        tidyr::pivot_wider(names_from = .data$type, values_from = .data$value)

      standings_data <- standings_data %>%
        dplyr::select(-.data$.id)

      #joining the 2 dataframes together to create a standings table

      standings <- cbind(teams, standings_data)
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no standings data available!"))
    },
    warning = function(w) {
    },
    finally = {
    }

  )
  return(standings)
}

#' @import utils
utils::globalVariables(c("where"))
