## [grapes](https://github.com/BioPP/grapes) and [sample](https://gitlab.gwdg.de/molsysevol/saccharomycespopgen/-/tree/main?ref_type=heads)

#### Generate commands to estimate transition/transversion ratio (kappa) across lineages:

```
python3 PopStatsKappaEstCommands.py -p AfricanBeer
```

#### Run kappa estimation commands:

```
./PopStatsKappaEstCommandsAfricanBeer.sh

command = "bpppopstats param=PopStatsEstimateKappa.bpp DIR=../OutgroupMatching/{}/BlastOutSeqs/Aligned/ OUT=./{}/KappaEstimates/ DATA=".format(population, population) + gene

```

#### Analyse kappa estimate results:

African Beer
```
Rscript KappaEstimation.R --args AfricanBeer
```
#### Kappa estimates are all ~4.5 (mean 4.52, SD = 0.02)


#### Generate PopStats commands to calculate codon-level statistics:

African Beer
```
python3 PopStatsCommands.py -p AfricanBeer
```

#### Run PopStats commands:

African Beer
```
./PopStatsCommandsAfricanBeer.sh
```

#### Popstats output files are stored as gzipped tar archives. To access these use: CodonStats.tar.gz


### RSA categories

#### Create bootstrapped SFSs from RSA categories:
```
./SFSMakerCommandsRSACategories.sh
```
```
# Read all outputs from bpppopstats and reconstruct SFS
# Generate input files for Grapes

sfs <- get.sfs.grapes.unfolded(tbl$Name, 
                               nbChr = pop.size,
                               prefix = paste("../PopStats/", population, "/CodonStats/", sep = ""))

input file:
1. ".codons.csv"
2. lines <- readLines(paste(prefix, f, ".popstats.txt", sep = ""));
output file: paste("RSACategories/", population, "/", rsagroup, "/SFSs/", prefix, "_rep", i, ".sfs", sep = "")
```

#### Run grapes on bootstrapped SFSs from RSA categories:
```
./GrapesCommandsBootstrapRSACategories.sh
```
```
grapes -in RSACategories/AfricanBeer/1/SFSs/AfricanBeer_rep1.sfs -out RSACategories/AfricanBeer/1/Output/AfricanBeer_rep1_no_div_param.csv -no_div_param -model GammaExpo -nb_rand_start 5
```

But I also find that [Script](https://github.com/DaniloASP/RatesOfAdaptation/blob/main/Methodology_schematic2.jpg)
[paper](https://www.biorxiv.org/content/10.1101/2023.08.28.555124v1.full.pdf)
