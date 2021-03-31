# Script to read the complete tree and change the tip names


## read in the tree

tree <- ape::read.tree(file = "mgharvey-tyranni-f73aa7f/species_trees/final_timetrees/T400F_complete.tre")

## look at the tips
ls(tree)

tree$tip.label[1:10]

## read in the matrix


spp <- readr::read_csv("mgharvey-tyranni-f73aa7f/Species_name_map_uids.csv")
head(spp)

# Make sure that we get the correct columns in
spp$tipnamecodes[1:10]

head(spp$matrix.species)

## Matching the tipnamecodes column to the tip.label of the tree

ii <- match(tree$tip.label, spp$tipnamecodes)

spp$tipnamecodes[3847]

tree$tip.label[1]
tree$tip.label[997]
spp$tipnamecodes[2618]

## replace original tip labels that had tip name codes with full species names from the csv file

tree$tip.label2 <- spp$matrix.species[ii]
tree$tip.label[1:10]
tree$tip.label2[1:10]

ina <- which(is.na(tree$tip.label2))

tree$tip.label[ina]
