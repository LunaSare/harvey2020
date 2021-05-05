# Harvey et al. 2020 chronograms for OpenTree curation

### `R` folder

R code to change tip names from Harvey et al. trees

### `data-raw` folder

Original data downloaded on March 31, 2021.

Downloaded from https://zenodo.org/record/3976115#.YFWaWp1KhhE

### `data` folder
Renamed trees in newick format.

For example:

Chronogram in `mgharvey-tyranni-f73aa7f/species_trees/final_timetrees/T400F_complete.tre`

goes from original tip labels:

```
[1] "Syna_azara_L8177"       
[2] "Syna_cours_L58452"     
[3] "Syna_azara_L31671"      
[4] "Syna_azara_LSU1232"    
[5] "Syna_azara_WGAV730"     
[6] "Syna_front_L52049"     
[7] "Syna_azara_LSUMZ49623"  
[8] "Syna_albes_MPEGMT50"   
[9] "Syna_albes_K3064"       
[10] "Syna_alblar_L44453"
```

To full species name labels + original study unique identifier

```
[1] "Synallaxis_azarae_L8177"      
[2] "Synallaxis_courseni_L58452"   
[3] "Synallaxis_azarae_L31671"     
[4] "Synallaxis_azarae_LSU1232"    
[5] "Synallaxis_azarae_WGAV730"    
[6] "Synallaxis_frontalis_L52049"  
[7] "Synallaxis_azarae_LSUMZ49623" 
[8] "Synallaxis_albescens_MPEGMT50"
[9] "Synallaxis_albescens_K3064"   
[10] "Synallaxis_albigularis_L44453"
```
