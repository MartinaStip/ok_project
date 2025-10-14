rm(list = ls())
source("uwb/set_uwb.R")
load("data/data.RData")

sizeadj = 0.8
w = 15 * sizeadj
h = 9 * sizeadj

# Texts for plots -------------------------------------------------------------
# Captions, subtitles etc. used in more than one plot

# Identify sets of vars -------------------------------------------------------
# Single vars
singlevars = c("sng1", "sng2")

# MC items
mcnames = c("name1", "name2")

mcvars = map(mcnames, ~ codebook) %>%
  set_names(mcnames)

# Bat items
batnames = c("bat1", "bat2")

batvars = map(batnames, ~ codebook %>% pull(name)) %>%
  set_names(batnames)

# Analysis --------------------------------------------------------------------

# Single vars
source("code/a_single.R", encoding = "UTF-8")

# MC
source("code/a_mc.R", encoding = "UTF-8")

# Batteries
source("code/a_bat.R", encoding = "UTF-8")





