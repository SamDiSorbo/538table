#converts data frame to tibble
df <- 
  tibble(
    Rank = qbs$rank,
    Team = qbs$team_wordmark,
    Player = qbs$player_name,
    FDPercent = qbs$fd_per
  ) %>%
  arrange((Rank))
  
#adds images 
df %>%
  gt() %>%
  text_transform(
    locations = cells_body(columns = Team),
    fn = function(x) {
      web_image(
        url = rubs$Team,
        height = 20
      )
    }
  ) %>% 
  #formats table
  gt_theme_538() %>% 
  tab_source_note(
    source_note = "Source: nflfastR, By: Sam DiSorbo @analytacist "
  ) %>% 
  tab_header("QB First Down Passing Percentage Weeks 1:3") %>% 
  data_color(
    columns = c(FDPercent),
    colors = scales::col_numeric(
      # custom defined values - notice that order matters!
      palette = c("white", "#93d3ab", "#35b0ab"),
      domain = NULL
    )
  ) %>% 
  cols_width(
    Player ~ px(145),
    FDPercent ~ px(100)
  ) 
