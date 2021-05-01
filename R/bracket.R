#' Create tournament
#'
#' @param tab
#'
#' @return
#' @export
#'
#' @examples
#' library(bracketr)
#' create_tournament(worldcup)
#'
create_tournament <- function(tab) {
  rounds <- sort(unique(tab$round))
  round_classes <- get_round_class(rounds)
  htmltools::div(
    class = "bracket",
    purrr::map2(
      rounds,
      round_classes,
      ~ tab %>%
        dplyr::filter(round == .x) %>%
        create_round(.x, .y)
    )
  )
}

get_round_class <- function(n) {
  rounds <- c(
    "finals",
    "semifinals",
    "quarterfinals",
    "round16"
  )
  return(rev(rounds[1:length(n)]))
}

create_round <- function(results, round, round_class) {
  tab <- results %>%
    dplyr::mutate(
      group = 1:dplyr::n(),
      group = ifelse(group %% 2 == 0, group - 1, group)
    )
  htmltools::tags$section(
    class = glue::glue("round {round_class}"),
    purrr::map(
      unique(tab$group),
      ~ tab %>%
        dplyr::filter(group == .x) %>%
        create_section(round_class)
    )
  )
}

create_section <- function(tab, round) {
  htmltools::div(
    class = "winners",
    htmltools::div(
      class = "matchups",
      purrr::map(
        1:nrow(tab),
        ~create_bracket(tab[.x,])
      )
    ),
    if (round != "finals") {
      htmltools::div(
        class = "connector",
        htmltools::div(
          class = "merger"
        ),
        htmltools::div(
          class = "line"
        )
      )
    } else {
      NULL
    }
  )
}

create_bracket <- function(tab) {
  htmltools::div(
    class = "matchup",
    htmltools::div(
      class = "participants",
      htmltools::div(
        class = "participant",
        htmltools::span(
          class = "tournament-score",
          tab$score1
        ),
        if (!is.na(tab$badge1)) {
          htmltools::img(
            class = "tournament-badge",
            src = tab$badge1
          )
        } else {
          NULL
        },
        htmltools::span(
          class = "tournament-team",
          tab$participant1
        )
      ),
      htmltools::div(
        class = "participant",
        htmltools::span(
          class = "tournament-score",
          tab$score2
        ),
        if (!is.na(tab$badge2)) {
          htmltools::img(
            class = "tournament-badge",
            src = tab$badge2
          )
        } else {
          NULL
        },
        htmltools::span(
          class = "tournament-team",
          tab$participant2
        )
      )
    )
  )
}


