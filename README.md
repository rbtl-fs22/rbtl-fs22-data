# README

This directory contains analysis-ready data that has been cleaned using scripts in `~/data/src/`. It will be published in open formats (CSV). 

## `data/raw_data/metadata`

This directory contains metadata for the tidy datasets. 

**README.md**

General metadata is stored in a `README.md` file that is contained in the `/metadata` folder. It is a template adapted from a [guide shared by Cornell University](https://data.research.cornell.edu/content/readme) and recommended for use by ETH Library under [Guidance and instructions for the ETH Zurich DMP template - Section 1: Data collection and documentation - 1.3 What documentation and metadata will you provide with the data? - Supporting resources](https://documentation.library.ethz.ch/display/DD/Data+Management+Plan+Instructions+for+ETH+Zurich+Researchers).

**`attributes.csv`**  

In addition to the human readable README with a description of the data, a codebook will be generated that describes the variables and values, following general metadata standards (e.g. schema.org metadata standards). 

A template CSV file for attributes of datasets is contained in the `/metadata` folder. The template has the following columns: 

| variableName | description                                             |
|--------------|---------------------------------------------------------|
| fileName     | the name of the input data file(s)                      |
| variableName | the name of the measured variable                       |
| description  | a written description of what that measured variable is |
| unitText     | the units the variable was measured in                  |


