# Script to read the tree and change the tip names


## read in the tree

tree <- ape::read.tree(file = "mgharvey-tyranni-f73aa7f/species_trees/final_timetrees/T400F_complete.tre")

## look at the tips

tree$tip.label[1:10]

## read in the matrix

names <- readr::read_csv("mgharvey-tyranni-f73aa7f/Species_name_map_uids.csv")

names <- read.csv(file = "mgharvey-tyranni-f73aa7f/Species_name_map_uids.csv")
head(names)
str(names)
names <- names[, -(1:2)]

# Make sure that we get the correct columns in
names$tipnamecodes[1:10]

head(names$matrix.species)

## Match tipnamecodes column to tip.label vector of the tree

ii <- match(tree$tip.label, names$tipnamecodes)
head(ii)

## Test that they actually matched the correct label
names$tipnamecodes[3847]
tree$tip.label[1]
tree$tip.label[997]
spp$tipnamecodes[2618]

## replace original tip labels that had tip name codes with full species names from the csv file

tree$tip.label2 <- names$matrix.species[ii]
tree$tip.label[1:10]
tree$tip.label2[1:10]

matrix(c(tail(tree$tip.label), tail(tree$tip.label2)), ncol = 2)

# Test if there are some tip labels with no species names

names$tipnamecodes[which(is.na(names$matrix.species))]

ina <- which(is.na(tree$tip.label2))

tree$tip.label[ina]

# "Rhegma_berxh_LSU81109"   "Rhegma_berxh_MZUSP76895"
