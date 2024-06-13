a = theme(panel.background = element_rect(fill = "white"),
          plot.title = element_text(face = "bold", size = 20, hjust = 0.5),
          plot.subtitle = element_text(face = "italic", size = 14, hjust = 0.5),
          plot.caption = element_text(size = 14, hjust = 0.5))

#------- inicio dos Graficos ------
# Assuming your dataset is named 'event_data'
event_data <- data.frame(
  Event = c("Pass", "Pass", "Pass", "Shot"),
  X = c(26, 7, 54, 49),
  Y = c(84, 46, 30, 6)
)
event_data
ggplot() +
  annotate_pitch(fill = "white",
                 colour = "black",
                 goals = goals_line,
                 dimensions = pitch_statsbomb, limits = FALSE) +
  theme_pitch() +
  coord_flip(xlim = c(60, 120), ylim = c(0,80)) +
  geom_point(data = event_data, 
             aes(x = X,
                 y = Y,
                 size = 5,  # Adjust size as needed
                 fill = Event),
             shape = 21,
             fill = "red",
             stroke = 0.6,
             colour = "black") +
  labs(title = "San Lorenzo vs Defense y Justice.",
       subtitle = "Copa de La Liga Profesional 2024 // xG e Chances",
       caption = "Data: FotMob | @aldreiperalta",
       size = "xG",
       fill = "Chances") +
  scale_x_continuous(limits = c(0, 120)) +
  # set the limits for the y-axis
  scale_y_continuous(limits = c(0, 80)) +
  theme(legend.title = element_text(face = "bold")) +
  b
#============================
# create pitch and theme
p1 <- create_Pitch(grass_colour = "gray15", background_colour = "gray15", line_colour = "gray40") +
  # plot a point for each shot by x and y location ()
  geom_point(event_data, mapping = aes(x = X, y = Y, fill = goal, size = ), 
             color = "gray60", pch=21) +
  # set the scale for the size and labels of the expected goal for each shot
  scale_size_continuous(limits=c(0,1), breaks = c(.25,.5,.75, 1), labels=c(".25", ".5", ".75", "1")) + 
  # set the color and legend label manually for the fill value (goal or no goal)
  scale_fill_manual(breaks=c("True", "False"), values = c("green3", "gray15"), labels=c("Goal", "No Goal")) +
  # set the limits for the x-axis
  scale_x_continuous(limits = c(0, 120)) +
  # set the limits for the y-axis
  scale_y_continuous(limits = c(0, 80)) +
  # theme elements for the plot
   +
  # create the plot's title, subtitle, and legend titles
  labs(title = "Chelsea FC - 2012 CL Final Shot Map",
       subtitle = "Includes all open-play and set pice shots // Data via: StatsBombR // @DSamangy",
       fill = "Outcome",
       size = "xG") +
  # flip the horizontal pitch to a vertical layout
  coord_flip(xlim = c(60, 120), ylim = c(0,80)) +
  # order the legends, setting fill 1st and size 2nd
  guides(fill = guide_legend(order = 1))

#=======================
b = theme(
  plot.background = element_rect(colour = "gray15", fill = "gray15"),
  plot.title = element_text(color = "white", hjust = .5, size = 20, family = "Comic Sans MS", face = "bold", vjust = -1),
  plot.subtitle = element_text(color = "lightgrey", hjust = .5, size = 8, family = "Comic Sans MS", face = "bold", vjust = -2),
  plot.caption = element_text(color = "white", hjust = .5, size = 6, family = "Comic Sans MS", face = "bold", vjust = 4),
  legend.position = c(.5,.2),
  legend.key = element_rect(fill = "transparent", colour = "transparent"),
  legend.background = element_rect(fill = "gray20", colour = "transparent"),
  legend.title = element_text(hjust = .4, vjust = .5, size = 10, family = "Comic Sans MS", face = "bold", colour = "white"),
  legend.text = element_text(hjust = .4, vjust = .5, size = 8, family = "Comic Sans MS", face = "bold", colour = "white"),
  legend.direction = "horizontal",
  legend.box = "vertical",
  legend.box.just = "center",
  legend.margin = margin(t = .1, b=.1, r=.1, l=.1, unit='cm')
)

