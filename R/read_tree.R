# Script to read Harvey et al 2020 tree and change the tip labels


## read in the tree

tree <- ape::read.tree(file = "data-raw/mgharvey-tyranni-f73aa7f/species_trees/final_timetrees/T400F_complete.tre")

## look at the tips

tree$tip.label[1:10]

## read in the matrix


names <- read.csv(file = "data-raw/mgharvey-tyranni-f73aa7f/Species_name_map_uids.csv")
head(names)
str(names)

# removing the forst two columns without any information

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
names$tipnamecodes[2618]

## Create a vector with the original tip labels

tree$tip.label_original <- tree$tip.label

## replace original tip labels that had tip name codes with full species names from the csv file

tree$tip.label <- names$matrix.species[ii]

## Replace spaces by underscores

tree$tip.label <- gsub(" ", "_", tree$tip.label)

## Make sure replacement was correct

tree$tip.label_original[1:10]
tree$tip.label[1:10]

tail(tree$tip.label_original)
tail(tree$tip.label)


## Test if there are any new tip labels with no species names

names$tipnamecodes[which(is.na(names$matrix.species))]

# There are a couple:
# "Rhegma_berxh_LSU81109"   "Rhegma_berxh_MZUSP76895"

## Use original tip name for those tips:

ina <- which(is.na(tree$tip.label))

tree$tip.label[ina] <- names$tipnamecodes[which(is.na(names$matrix.species))]

tree$tip.label[ina]

## verify that we have no NAs as tip labels

which(is.na(tree$tip.label))

## write down the tree with new tips

ape::write.tree(tree, "data/T400F_complete-renamed.tre")



