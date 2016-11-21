my_theme <-   theme(
  #Chart region
  panel.background = element_rect(fill = "#FFFFFF"),
  plot.background = element_rect(fill = "#FFEAF4"),
  panel.border = element_rect(color = "#B292A2"),
  #Grid
  panel.grid.major = element_line(color = "#FFEAF4", size = .25),
  #axes // text
  axis.text.x = element_text(size = 10, color = "#B292A2", face = "bold"), #face = plain, italic, bold, bold.italic
  axis.text.y = element_text(size = 10, color = "#B292A2", face = "bold"),
  #axes // title
  axis.title.x = element_text(size = 12, color = "#B292A2", face = "bold.italic", vjust = -.5),
  axis.title.y = element_text(size = 12, color = "#B292A2", face = "bold.italic", vjust = 1),
  #plot title
  plot.title = element_text(face = "bold", hjust = +.25, vjust = 2, color = "#B292A2", size = 24)
)