# General information

<!-- help text is included in angle brackets, and can be deleted before saving  -->
<!-- leave everything that is not applicable blank -->
<!-- this text is not visible in the output -->

1. Title of Dataset: Waste in Bellevue <!-- Choose a generic title for your research study -->

2. Author Information

	A. Principal Investigator Contact Information  
		<br>
		Name:  Oda Vigen
		Institution:  ETH Zurich
		Address:  
		Email: ovigen@student@ethz.ch 

	B. Associate or Co-investigator Contact Information  
		<br>
		Name:  Saloni Vijay, Nicolas Y.C. Triebold
		Institution:  ETH Zurich
		Address:  
		Email:  svijay@ethz.ch
		
	C. Alternate Contact Information  
		<br>
		Name:  
		Institution:   
		Address:  
		Email:  

3. Date of data collection (single date, range, approximate date) <!-- format as YYYY-MM-DD -->: 2022-04-07

4. Geographic location of data collection <!--latitude, longiute, or city/region, State, Country, as appropriate -->: Bellvue in Zurich

5. Information about funding sources that supported the collection of the data: Funding from the Global Health Engineering department to buy instruments for waste characterisation.


# Sharing / access information 

1. Licenses/restrictions placed on the data: This work is licensed under the Creative Commons Attribution 4.0 International license (CC-BY-4.0)<!-- Suggested: This work is licensed under the Creative Commons Attribution 4.0 International license (CC-BY-4.0). -->

2. Links to publications that cite or use the data: 

3. Links to other publicly accessible locations of the data: 

4. Links/relationships to ancillary data sets: 

5. Was data derived from another source? yes/no

	A. If yes, list source(s): - https://www.stadt-zuerich.ch/geodaten/download/Abfallgefaesse (Stadt Zürich Open Data, in German)
	
	No

6. Recommended citation for this dataset: 
DisposaLiz

# Data & file overview

1. File List: 
  
  in project/data/raw_data:
      rtbl_fs22_waste_composition_bellvue.csv
      rbtl_fs22_cigarets_in_bin_bellevue.csv
      UserResponses.csv
 
  in project/data/tidy_data:
      survey-data-tidy.csv
      waste-characterisation-data-bellevue-Recyclingstations-sub-bins-tidy.csv
      waste-characterisation-data-bellevue-tidy.csv
      waste-characterisation-data-cigarettes-tidy.csv

<!--list all files (or folders, as appropriate for dataset organization) contained in the dataset, with a brief description -->

2. Relationship between files, if important: 
      
      rtbl_fs22_cigarets_in_bellvue.csv and rtbl_fs22_waste_composition_bellvue.csv are data from the same bins.
      
3. Additional related data collected that was not included in the current data package: 

4. Are there multiple versions of the dataset? no
	A. If yes, name of file(s) that was updated: 
		i. Why was the file updated? 
		ii. When was the file updated? 


# Methodological information

1. Description of methods used for collection/generation of data: 

Bins where collected in Bellvue from the ERZ. Then they where weighted with a bathroom scale, sorted and single waste categories where weighted with help of a kitchen or a bathroom scale. Cigarettes where sorted out and counted (see method section of the main report)

The survey questions were asked to random people passing trough Bellevue tram station. Every third person passing by the person standing at one end of the station and doing the survey was asked to participate. Random sampling was used. 

<!--Include links or references to publications or other documentation containing experimental design or protocols used in data collection -->

2. Methods for processing the data: 

The data has been cleaned using scripts in `~/research-project-template/src/`

<!--describe how the submitted data were generated from the raw or collected data -->

3. Instrument- or software-specific information needed to interpret the data: 

<!--include full name and version of software, and any necessary packages or libraries needed to run scripts -->

4. Standards and calibration information, if appropriate: 

5. Environmental/experimental conditions: 

6. Describe any quality-assurance procedures performed on the data: 

7. People involved with sample collection, processing, analysis and/or submission: 

- All the authors collected the data for waste characterization together.

- Saloni and Oda conducted the survey.

# Data-specific information for: [rtbl_fs22_cigarette_in_bin_bellevue.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 8

2. Number of cases/rows: 10

3. Variable List: see attributes_raw_data.csv<!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used: 


# Data-specific information for: [rtbl_fs22_waste_composition_bellevue.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 13

2. Number of cases/rows: 10

3. Variable List: see attributes_raw_data.csv<!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used: 


# Data-specific information for: [UserResponses.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 16

2. Number of cases/rows: 12

3. Variable List: see attributes_raw_data.csv<!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used: 


# Data-specific information for: [survey-data-tidy.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 18

2. Number of cases/rows: 12

3. Variable List: see attributes_tidy_data.csv <!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used: 


# Data-specific information for: [waste-characterisation-data-bellevue-Recyclingstations-sub-bins-tidy.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 9

2. Number of cases/rows: 22

3. Variable List: see attributes_tidy_data.csv <!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used: 


# Data-specific information for: [waste-characterisation-data-bellevue-tidy.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 9

2. Number of cases/rows: 46

3. Variable List: see attributes_tidy_data.csv <!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used:


# Data-specific information for: [waste-characterisation-data-cigarettes-tidy.csv]

<!--repeat this section for each dataset, folder or file, as appropriate -->

1. Number of variables: 8

2. Number of cases/rows: 10

3. Variable List: see attributes_tidy_data.csv <!-- suggested: see attributes.csv -->

4. Missing data codes: NA

<!--list code/symbol and definition -->

5. Specialized formats or other abbreviations used: