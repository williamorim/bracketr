## code to prepare `worldcup` dataset goes here

worldcup <- tibble::tribble(
  ~round, participant1, ~score1, ~participant2, ~score2, ~badge1, ~badge2,
  1, "Brazil", "1 (3)", "Chile", "1 (2)", NA, NA,
  1, "Colombia", "2", "Uruguay", "0", NA, NA,
  1, "France", "1 (3)", "Nigeria", "0", NA, NA,
  1, "Germany", "2", "Algeria", "1", NA, NA,
  1, "Netherlands", "2", "Mexico", "1", NA, NA,
  1, "Costa Rica", "1 (5)", "Greece", "1 (5)", NA, NA,
  1, "Argentina", "1", "Switzerland", "0", NA, NA,
  1, "Belgium", "2", "United States", "1", NA, NA,
  2, "Brazil", "2", "Colombia", "1", NA, NA,
  2, "France", "0", "Germany", "1", NA, NA,
  2, "Netherlands", "0 (4)", "Costa Rica", "0 (3)", NA, NA,
  2, "Argentina", "1", "Belgium", "0", NA, NA,
  2, "Brazil", "7", "Germany", "1", NA, NA,
  2, "Netherlands", "0 (2)", "Argentina", "0 (4)", NA, NA,
  3, "Germany", "1", "Argentina", "0", NA, NA,
  99, "Brazil", "0", "Netherlands", "3", NA, NA,
)

usethis::use_data(worldcup, overwrite = TRUE)
