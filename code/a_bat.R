# Data 
batdata = map(batvars, ~ prep_bat(data, vars = .x, x_nsize = TRUE)) |> 
  set_names(batnames)

# Plots
batscales = list(
  bat1 = c(uwb_palettes(name = "bi", type = 'continuous', n = 5, add_na = T)),
  bat2 = c(uwb_palettes(name = "bi", type = 'continuous', n = 5, add_na = T))
)

batplots = map2(batdata, batnames, ~ plot_stack(.x) + 
  scale_fill_manual(values = batscales[[.y]]) +
  theme(legend.margin = margin(l = -.3, unit = "npc"))
) 

walk2(batplots, batnames, ~ ggsave(.x, file = paste0("figs/", .y, ".png"),
  width = w, height = h))

