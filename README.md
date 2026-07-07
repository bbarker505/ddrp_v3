<img src="https://github.com/bbarker505/ddrp_v2/blob/master/images/DDRP_logo2.png" width="300"/>
<img src="https://github.com/bbarker505/ddrp_v2/blob/master/images/OSU_IPMC_horizontal_2C_O_over_B.png" width="300"/>

## 🗺 An introduction to DDRP

Invasive pests present a significant threat to agricultural production
in the United States, yet decision support tools that can accurately
predict where and when to expect pests have not yet been fully developed
and utilized. Our spatial modeling platform known as DDRP (Degree-Days,
Risk, and Phenological event mapping) was designed to provide regularly
updated forecasts of the potential distribution (risk of establishment)
and timing of seasonal activities (phenology) of pests [(Barker et
al. 2020,](https://doi.org/10.1371/journal.pone.0244005)
[2023, ](https://doi.org/10.3389/finsc.2023.1239173)
[2025)](https://doi.org/10.3390/insects16080790). An overview of the
DDRP modeling process is below (Fig. 1).

<figure>

<img src="https://github.com/bbarker505/ddrp_v2/blob/master/images/model_overview.png?raw=true" alt="Fig. 1. DDRP modeling overview"/>

<figcaption aria-hidden="true">

**Fig. 1.** DDRP modeling overview

</figcaption>

</figure>

## 🪲 Species models

Currently we are using DDRP to produce regularly updated (every 1-3
days) forecasts for 18 high-priority invasive insect species, available
at [USPest.org](http://uspest.org/CAPS) (Table 1). Forecasts for several
pests are also available as Pheno Forecasts at the [USA National
Phenology Network](https://www.usanpn.org/data/maps/forecasts). Parameter files 
for the 18 pest species with models (Table 1) are included in the repository.

**Table 1**. The 18 invasive insect species with DDRP models are shown
below. Five species are established in CONUS, 12 are on PPQ's [National
Priority Pest List](https://approvedmethods.ceris.purdue.edu/), six were
formerly included on the list, and two are Federal Program Pests.

| Species | Common name | Abbrev | Present in United States | National Priority Pest | Federal Program Pest |
|:-------------|:-------------|:--------------:|:------------:|:------------:|
| *Anoplophora glabripennis* | Asian longhorned beetle | ALB | Yes | Yes | Yes |
| *Chilo suppressalis* | Asiatic rice borer | ASRB | No | Yes | No |
| *Cryptoblabes gnidiella* | Christmas berry webworm | CGN | | No | Yes | No |
| *Spodoptera litura* | Common or cotton cutworm | SLI | No | Yes | No |
| *Agrilus planipennis* | Emerald ash borer | EAB | Yes | No | No |
| *Spodoptera littoralis* | Egyptian cottonworm | ECW | No | No | No |
| *Thaumatotibia leucotreta* | False codling moth | FCM | No | Yes | No |
| *Popillia japonica* | Japanese beetle | JPB | Yes | No | Yes |
| *Monochamus alternatus* | Japanese pine sawyer beetle | JPSB | No | No | No |
| *Epiphyas postvittana* | Light brown apple moth | LBAM | Yes | No | No |
| *Platypus quercivorus* | Oak ambrosia beetle | OAB | No | Yes | No |
| *Helicoverpa armigera* | Old world bollworm | OWBW | No | Yes | Yes |
| *Dendrolimus pini* | Pine-tree lappet moth | PTLM | No | Yes | No |
| *Autographa gamma* | Silver Y moth | SLYM | No | Yes | No |
| *Neoleucinodes elegantalis* | Small tomato borer | STB | No | Yes | No |
| *Lycorma delicatula* | Spotted lanternfly | SLF | Yes | Yes | Yes |
| *Eurygaster integriceps* | Sunn pest | SUNP | No | Yes | No |
| *Phthorimaea absoluta* | Tomato leaf miner | TABS | No | Yes | No |

## 📥 Inputs

DDRP uses a process-based (mechanistic) approach to model
temperature-dependent development, phenology, and climate suitability of
target species (Fig. 1). The platform requires gridded daily minimum and
maximum temperature data, and information on the temperature
requirements for development and survival of a species. We typically run DDRP 
using current and forecast climate data for the conterminous U.S.
to provide real-time decision support for a species; however, the
platform accepts data for any time frame or region, such as data for
past years or for other countries. DDRP forecasts at
[USPest.org](https://uspest.org/CAPS) are produced using estimates of
daily minimum and maximum temperature from the PRISM dataset and either
daily-downscaled NMME (North American Multi-Model Ensemble) 7-month
forecasts or recent 10-year average PRISM daily data. Newly developed
features for including dry and wet stress for climatic suitability
modeling may use daily soil moisture estimates from the [Soil Moisture
Active Passive](https://nsidc.org/data/smap/) Level-4 (SMAP L4) Surface
and Root-Zone Soil Moisture product/.

## 📤 Outputs

Model products include maps of the predicted potential distribution
(climate-based risk of establishment), number of generations, and dates
of phenological events. The potential distribution is represented by
areas where climate stress accumulations have not exceeded the
stress limits of a species. 

## 💻 Program features

Some of the major features of DDRP currently include: 
1) Degree-day parameters including durations and lower and upper
developmental thresholds for four separate life stages (these are the
egg, the larva or nymph, the pupa or pre-oviposition, and the adult),
plus a separately parameterized overwintering stage. 
2) The ability to spread the population using cohorts. Typically seven
cohorts are specified but any number can be used. While cohorts offer
the ability to spread the population in a Gaussian or other
distribution, there is currently no distributed-delay function, meaning
that the spread does not increase over multiple generations. 
3) Phenological event maps (PEMs, also known as pest event maps), which
depict estimated calendar dates of seasonal activities or population
events. PEM parameters are specified as degree-days within each of the
four (plus overwintering) stages. For example, DDRP can be parameterized
to make first egg-hatch PEMs by setting a degree-day value near the
completion of the egg stage, or at the beginning of the larval stage. If
the former is used, then a second PEM, say for mid-larval development,
could be parameterized using a value such as one-half of the degree-day
total for larval development. 
4) Climatic suitability maps, which show two levels of climatic
suitability (moderate and severe stress exclusions). These are intended
to indicate risk likelihood of short vs. long-term establishment but
could also indicate migration zones, and uncertainties such as in
species parameterization, model structure, and in the sources of climate
data. The platform now includes four climate stresses: cold stress, heat
stress, dry stress, and wet stress. To date, only the Japanese beetle
model (JPB2.params) includes the moisture-related stress parameters. 5)
Maps of attempted vs. realized voltinism in insect species with a
short-day diapause response (Grevstad et
al. 2022)](https://doi.org/10.1002/eap.2557). The difference between
the attempted and potential generations represents a quantitative
measure of phenological mismatch between diapause timing and the end of
the growing season.

## 🛠️ Setup and usage

DDRP is an R script (“DDRP_v3.R”) and must be within the same directory
an auxilliary R script that contains program functions
(“DDRP_v3_funcs.R”). DDRP has not yet been formatted into an R package
because we designed the code to be run from the command line on a Linux
server. The program can also be run on a Windows system but parallel
processing capabilities will be limited. The [user
manual](https://github.com/bbarker505/ddrp_v3/blob/main/manual/DDRP_user_guide_and_platform_requirements_V5.doc)
(Coop and Barker 2024)
“DDRP_user_guide_and_platform_requirements_V5.doc” is the only
instruction document that is currently available The instruction manual
provides information on program requirements, input data, input options,
examples of command line arguments, types of output files, and run
times.

##💡 Philosophy

Our development of DDRP has strived to achieve a parsimonious balance of
both model simplicity and accuracy, with a focus on four philosophies: 
1) Simplicity, in that existing data and results for well-studied, major
invasive threats can be readily adapted for use 
2) Universality, to accommodate a wide range of organisms 
3) Robustness, by having the emphasis on use of first-principles that
lend to process-driven rather than statistical correlation-driven
models 
4) Practicality, by focusing on models that can be used for decision
support rather than more complex research-only models

## Example outputs

The movie below shows DDRP outputs of the emergence of overwintered
adults of emerald ash borer over the course of 2021 (Fig. 2). Areas
where heat or cold stress has exceeded the stress limits for the species
are predicted to be excluded from the potential distribution.

<figure>

<img src="https://github.com/bbarker505/ddrp_v2/blob/master/images/EAB_2021.gif?raw=true" alt="Fig. 2. DDRP forecasts for emerald ash borer for 2021."/>

<figcaption aria-hidden="true">

**Fig. 2**. DDRP forecasts for emerald ash borer for 2021.

</figcaption>

</figure>

Another way to look at this (mostly) same information is with a
phenological event map, below (Fig. 3).

<figure>

<img src="https://github.com/bbarker505/ddrp_v2/blob/master/images/EAB_Avg_PEMp0Excl2_20211231.png?raw=TRUE" alt="Fig. 3. A phenological event map for emerald ash borer for 2021."/>

<figcaption aria-hidden="true">

**Fig. 3**. A phenological event map for emerald ash borer for 2021.

</figcaption>

</figure>

## 📚 Required R packages

### Mapping and Spatial Analysis

-   `sf`
-   `terra`

### Data Manipulation and Utilities

-   `dplyr`
-   `stringr`
-   `lubridate` 
-   `readr`
-   `purrr`
-   `tidyr`
-   `toOrdinal`

### Visualization

-   `ggplot2`
-   `ggthemes`
-   `maps`
-   `viridis`
-   `RColorBrewer`

### Parallel Processing

-   `doParallel`
-   `parallel`
-   `foreach`

### Other

-   `optparse` 
-   `tictoc`
-   `tools`

## 🖺 Citation

If you use DDRP, please cite:

Barker, B. S., L. Coop, T. Wepprich, F. Grevstad, and G. Cook. 2020. 
DDRP: real-time phenology and climatic suitability modeling of invasive insects. 
PLoS ONE 15:e0244005.

## 💵 Funding

Funding and support for DDRP and associated models were provided by:  

- USDA National Institute of Food and Agriculture (NIFA) Agriculture and Food Research Initiative  
- USDA NIFA Crop Protection and Pest Management Program 
- USDA APHIS PPQ Plant Protection Act 7721 Program  
- USDA APHIS PPQ CAPS and Center for Plant Health Science and Technology Programs 
- Oregon State University Agricultural Research Fund  
- Department of Defense Strategic Environmental Research and Development Program 

## 👥 Contact

***Questions?*** 📧 Contact Brittany Barker at [bbarker505\@gmail.com](mailto:bbarker505@gmail.com) or [brittany.barker\@oregonstate.edu](mailto:brittany.barker@oregonstate.edu)


## 📄 References

Barker, B. S., L. Coop, T. Wepprich, F. Grevstad, and G. Cook. 2020.
DDRP: real-time phenology and climatic suitability modeling of invasive
insects. PLoS ONE 15:e0244005.
<https://doi.org/10.1371/journal.pone.0244005>.

Barker, B. S., L. Coop, J. J. Duan, and T. R. Petrice. 2023. An
integrative phenology and climatic suitability model for emerald ash
borer. Frontiers in Insect Science 3:1239173.
<https://doi.org/10.3389/finsc.2023.1239173>

Barker, B. S., J. Beyer, and L. Coop. 2025.Real-time integrative mapping
of the phenology and climatic suitability for the spotted lanternfly,
<i>Lycorma delicatula</i>. Insects 16:790.
<https://doi.org/10.3390/insects16080790>

Coop, L., and B. S. Barker. 2024. Computing infrastructure requirements
and user guide for hosting DDRP models. Prepared for APHIS PPQ and other
collaborators. Available
[here](https://github.com/bbarker505/ddrp_v3/blob/main/manual/DDRP_user_guide_and_platform_requirements_V5.doc).

Grevstad, F. G., T. Wepprich, B. S. Barker, L. B. Coop, R. Shaw, and R.
S. Bourchier. 2022. Combining photoperiod and thermal responses to
predict phenological mismatch for introduced insects. Ecological
Applications. 32:e2557. <https://doi.org/10.1002/eap.2557>

*Last updated: July 2026*
