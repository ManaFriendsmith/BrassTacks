local rm = require("__pf-functions__/recipe-manipulation")
local tm = require("__pf-functions__/technology-manipulation")
local misc = require("__pf-functions__/misc")

--mods that just use vanilla-like ore generation will not get special design effort
if mods["tenebris"] then
    data.raw.planet["tenebris"].map_gen_settings.autoplace_controls["zinc-ore"] = {}
    data.raw.planet["tenebris"].map_gen_settings.autoplace_settings.entity.settings["zinc-ore"] = {}    
end

if mods["terrapalus"] then
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_controls["zinc-ore"] = {}
    data.raw.planet["terrapalus"].map_gen_settings.autoplace_settings.entity.settings["zinc-ore"] = {}    
end

if mods["maraxsis"] then
    rm.AddProduct("maraxsis-geothermal-sulfur", "sphalerite", 8)

    if misc.difficulty == 3 then
        if not mods["IfNickel"] then
            rm.ReplaceIngredientProportional("maraxsis-hydro-plant", "pipe", "galvanized-tubing")
        end
    end

    rm.ReplaceIngredientProportional("maraxsis-pressure-dome", "pipe", "pump", 0.2)
    if misc.difficulty > 1 and not mods["BrimStuff"] then
        rm.AddIngredient("maraxsis-wyrm-confinement-cell", "pipe-flange", 1)
    end
end

--cerys: I'm really not sure if you can obtain all ores in decent ratios from recycling stuff.
--as I understand it cerys is a meticulously designed puzzle, adding explicit compat would almost be like adding compat with ultracube

--arrakis, shattered planet: incomplete

if mods["Paracelsin"] then
    data.raw.item["zinc"].localised_name = {"item-name.glacite"}
    data.raw.item["pcl-zinc-plate"].localised_name = {"item-name.glacite-plate"}
    data.raw.item["pcl-sphalerite"].localised_name = {"item-name.glacial-sphalerite"}
    data.raw.item["tetrahedrite"].localised_name = {"item-name.glacial-tetrahedrite"}
    data.raw.item["pcl-galvanized-steel-plate"].localised_name = {"item-name.plasteel-plate"}
    data.raw.item["zinc-solder"].localised_name = {"item-name.self-sealing-solder"}
    data.raw.item["zinc-rivets"].localised_name = {"item-name.extremely-high-tensile-riveting"}
    data.raw.tool["galvanization-science-pack"].localised_name = {"item-name.insulation-science-pack"}
    data.raw.fluid["zinc-solution"].localised_name = {"fluid-name.glacite-solution"}

    data.raw.item["zinc-pipe"].localised_name = {"item-name.insulated-pipe"}
    data.raw.pipe["zinc-pipe"].localised_name = {"item-name.insulated-pipe"}
    data.raw.item["zinc-pipe-to-ground"].localised_name = {"item-name.insulated-pipe-to-ground"}
    data.raw["pipe-to-ground"]["zinc-pipe-to-ground"].localised_name = {"item-name.insulated-pipe-to-ground"}
    data.raw.item["zinc-pump"].localised_name = {"item-name.insulated-pump"}
    data.raw.pump["zinc-pump"].localised_name = {"item-name.insulated-pump"}
    data.raw.item["zinc-storage-tank"].localised_name = {"item-name.insulated-storage-tank"}
    data.raw["storage-tank"]["zinc-storage-tank"].localised_name = {"item-name.insulated-storage-tank"}

    data.raw.resource["sphalerite"].localised_name = {"entity-name.glacial-sphalerite"}
    data.raw.resource["tetrahedrite"].localised_name = {"entity-name.glacial-tetrahedrite"}
    data.raw.resource["sphalerite"].minable.result="pcl-sphalerite"

    data.raw.technology["galvanized-steel"].localised_name = {"technology-name.plasteel"}
    data.raw.technology["galvanized-steel"].localised_description = {"technology-description.plasteel"}
    data.raw.technology["zinc-piping"].localised_name = {"technology-name.plasteel-piping"}
    data.raw.technology["zinc-piping"].localised_description = {"technology-description.plasteel-piping"}
    data.raw.technology["galvanization-science-pack"].localised_name = {"technology-name.insulation-science-pack"}
    data.raw.technology["galvanization-science-pack"].localised_description = {"technology-description.insulation-science-pack"}

    data.raw.recipe["casting-galvanized-steel-plate"].localised_name = {"recipe-name.casting-plasteel"}

    rm.RemoveProduct("zinc-purification", "stone", 5)
    rm.AddProduct("zinc-purification", "zinc-ore", 5)
    rm.AddProduct("sphalerite-processing", "zinc-ore", 1)
    rm.AddProduct("tetrahedrite-processing", "zinc-ore", 1)
    rm.AddProduct("sphalerite-melting", "molten-zinc", 50)
    rm.AddProduct("tetrahedrite-melting", "molten-zinc", 25)

    rm.AddRecipeCategory("bearing", "mechanics")
    rm.AddRecipeCategory("linkages", "mechanics")
    rm.AddRecipeCategory("complex-joint", "mechanics")
    rm.AddRecipeCategory("fast-gearbox", "mechanics")
    rm.AddRecipeCategory("gyro", "mechanics")
    rm.AddRecipeCategory("pipe-flange", "mechanics")
    rm.AddRecipeCategory("express-gearbox", "mechanics")
    rm.AddRecipeCategory("loadbearing-lattice", "mechanics")

    table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="brass-plate", amount_min=2, amount_max=15})
    table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="bearing", amount_min=1, amount_max=6}) -- needed to craft turbines
    table.insert(data.raw["simple-entity"]["big-metallic-rock"].minable.results, {type="item", name="zinc-ore", amount_min=5, amount_max=11})

    if misc.difficulty > 1 then
        rm.ReplaceIngredientProportional("mechanical-plant", "iron-gear-wheel", "complex-joint", 0.5)
    end

    if misc.difficulty == 3 then
        table.insert(data.raw["simple-entity"]["crashed-fulgoran-pod"].minable.results, {type="item", name="galvanized-tubing", amount_min=2, amount_max=15}) -- needed to craft turbines, engine units

        rm.ReplaceIngredientProportional("elevated-pipe", "iron-stick", "loadbearing-lattice", 0.2)
        rm.ReplaceIngredientProportional("elevated-pipe", "pipe", "galvanized-tubing")
        if not mods["IfNickel"] then
            rm.AddIngredient("electrochemical-plant", "galvanized-tubing", 20)
        end

        rm.AddIngredient("nitric-acid-rocket-fuel", "galvanized-panel")
        if not mods["BrimStuff"] then
            rm.AddIngredient("nitric-acid-rocket-fuel", "pipe-flange")
        end
    end
end