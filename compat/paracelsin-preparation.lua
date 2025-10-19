local rr = require("__pf-functions__/rude-renaming")

if not mods["Paracelsin"] then return end

--note: do NOT rename things beyond what is strictly necessary to avoid ID collisions.
--the localised name can be changed later.

rr.Convert("item", "zinc-plate", "pcl-zinc-plate")
rr.Convert("item", "sphalerite", "pcl-sphalerite")
rr.Convert("item", "galvanized-steel-plate", "pcl-galvanized-steel-plate")
rr.Convert("recipe", "zinc-plate", "pcl-zinc-plate")

--now everything that references these
rr.Convert("recipe", "sphalerite-processing")
rr.Convert("recipe", "sphalerite-melting")
rr.Convert("recipe", "casting-galvanized-steel-plate")
rr.Convert("recipe", "zinc-pipe")
rr.Convert("recipe", "zinc-pipe-to-ground")
rr.Convert("recipe", "zinc-pump")
rr.Convert("recipe", "zinc-storage-tank")
rr.Convert("recipe", "zinc-rivets")
rr.Convert("recipe", "zinc-solder")
rr.Convert("recipe", "elevated-pipe")
rr.Convert("recipe", "solar-matrix")
rr.Convert("recipe", "accumulator-v2")
rr.Convert("technology", "zinc-extraction")

rr.Confirm()
rr.Clear()