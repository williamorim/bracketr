create_tournament <- function(tab) {
  rounds <- unique(tab$round)
  htmltools::div(
    class = "bracket",
    purrr::map(
      rounds,
      ~ tab %>%
        dplyr::filter(round == .x) %>%
        create_round()
    )
  )
}

create_round <- function(results, round) {
  htmltools::tags$section(
    class = glue::glue("round {round}"),
    htmltools::div(
      class = "winners",
      htmltools::div(
        class = "matchups",
        purrr::map(
          1:nrow(results),
          ~create_bracket(results[.x,])
        )
      )
    )
  )
}

create_bracket <- function(tab) {
  htmltools::div(
    class = "matchup",
    htmltools::div(
      class = "participants",
      htmltools::div(
        htmltools::span(
          class = "score",
          tab$score1
        ),
        if (!is.na(tab$badge1)) {
          htmltools::img(
            class = "badge",
            src = tab$badge1
          )
        } else {
          NULL
        },
        htmltools::span(
          class = "participant",
          tab$participant1
        )
      ),
      htmltools::div(
        htmltools::span(
          class = "score",
          tab$score2
        ),
        if (!is.na(tab$badge2)) {
          htmltools::img(
            class = "badge",
            src = tab$badge2
          )
        } else {
          NULL
        },
        htmltools::span(
          class = "participant",
          tab$participant2
        )
      ),
    )
  )
}


