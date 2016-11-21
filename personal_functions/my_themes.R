#https://color.adobe.com/Moodboard-persona-color-theme-8899261/edit/?copy=true&base=3&rule=Custom&selected=3&name=Copy%20of%20Moodboard%20persona&mode=rgb&rgbvalues=0.6980392156862745,0.5725490196078431,0.6352941176470588,1,1,1,1,0.9176470588235294,0.9568627450980393,0.5607843137254902,0.7803921568627451,0.8,0.3607843137254902,0.6784313725490196,0.6980392156862745&swatchOrder=0,1,2,3,4

my_theme <-   {theme(
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
)}

# snow grey #fcf7f8
josi_theme <- function (base_size = 11, base_family = "") 
{
  half_line <- base_size/2
  theme(line = element_line(colour = "black", size = 0.5, linetype = 1, lineend = "butt"), 
        rect = element_rect(fill = "#fcf7f8", colour = "black", size = 0.5, linetype = 1), 
        text = element_text(family = base_family, face = "plain", colour = "#6D466B", 
                            size = base_size, lineheight = 0.9, hjust = 0.5, vjust = 0.5, angle = 0, 
                            margin = margin(), debug= FALSE), 
        # AXES
        axis.line = element_line(), 
        axis.line.x = element_blank(), 
        axis.line.y = element_blank(), 
        axis.text = element_text(size = rel(0.8), colour = "#6D466B"), #92466b 
        axis.text.x = element_text(margin = margin(t = 0.8 * half_line/2), vjust = 1), 
        axis.text.y = element_text(margin = margin(r = 0.8 * half_line/2), hjust = 1), 
        axis.ticks = element_line(colour = "#f1cdd8"),
        axis.ticks.length = unit(half_line/2, "pt"), 
        axis.title = element_text(face = "bold", colour = "#92466b"),
        axis.title.x = element_text(margin = margin(t = 0.8 * half_line, b = 0.8 * half_line/2)), 
        axis.title.y = element_text(angle = 90, margin = margin(r = 0.8 * half_line, l = 0.8 * half_line/2)),
        # LEGEND
        legend.background = element_rect(colour = NA), 
        legend.margin = unit(0.2, "cm"), 
        legend.key = element_rect(fill = "grey95", colour = "white"), 
        legend.key.size = unit(1.2, "lines"), 
        legend.key.height = NULL, 
        legend.key.width = NULL, 
        legend.text = element_text(size = rel(0.8)), 
        legend.text.align = NULL, 
        legend.title = element_text(hjust = 0), 
        legend.title.align = NULL, legend.position = "right", 
        legend.direction = NULL, legend.justification = "center", 
        legend.box = NULL, 
        # PANEL 
        panel.background = element_rect(fill = "#F1E4E8", colour = NA),  #peach ffc9b5 #baby blue d6ddee
        panel.border = element_blank(), 
        panel.grid.major = element_line(colour = "#f1d8e0", size = 0.2), 
        panel.grid.minor = element_line(colour = "#f1d8e0", size = 0.15), 
        panel.margin = unit(half_line, "pt"), 
        panel.margin.x = NULL, 
        panel.margin.y = NULL, 
        panel.ontop = FALSE, 
        # FACETS
        strip.background = element_rect(fill = "#ecddee", colour = NA), 
        strip.text = element_text(size = rel(0.8)), 
        strip.text.x = element_text(margin = margin(t = half_line,  b = half_line)), 
        strip.text.y = element_text(angle = -90, margin = margin(l = half_line, r = half_line)), 
        strip.switch.pad.grid = unit(0.1, "cm"), 
        strip.switch.pad.wrap = unit(0.1, "cm"), 
        # OVERALL PLOT
        plot.background = element_rect(colour = "white"), 
        plot.title = element_text(size = rel(1.3), margin = margin(b = half_line * 1.2), face = "bold.italic", vjust = 1),
        plot.margin = margin(half_line, half_line, half_line, half_line), complete = TRUE)
}