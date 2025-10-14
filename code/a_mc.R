# Remove R with all misssings in a MC question
allmissing = map(mcvars, ~ data |> 
  select(Id.respondenta, all_of(.x)) |> 
  rowwise() |>
  mutate(nr_missing = sum(is.na(across(everything())))) |> 
  select(-.x) |> 
  filter(nr_missing < length(.x)) |> 
  pull(Id.respondenta)
)

walk(allmissing, ~ data |> 
  filter(Id.respondenta %in% .x) |> 
  nrow() |> 
  print()
)

# Data
mcdata = map2(allmissing, mcvars, ~ 
  prep_mc(data %>% filter(Id.respondenta %in% .x), 
  vars = .y, chosen = 1)               
) |> 
  set_names(mcnames)

# Plots
mcplots = map2(mcdata, mcnames, ~ plot_lolli(.x)) 

# Plots
walk2(mcplots, mcnames, ~ ggsave(.x, file = paste0("figs/", .y, ".png"),
  width = w, height = h ))
