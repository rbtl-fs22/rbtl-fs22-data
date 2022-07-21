---
editor_options: 
  markdown: 
    wrap: 72
---

# General information

1.  Title of Dataset:  
    Recyclables in common trash bins

    -   Analysis of the effects of the distance to and visibility of the
        closest recycling station.

2.  Author Information

    A. Co-investigator Contact Information  
    <br> Name: Ali Ben Aleya  
    Institution: ETH Zürich  
    Address: Rämistrasse 101, 8092 Zürich  
    Email: [beali\@student.ethz.ch](mailto:beali@student.ethz.ch)

    B. Co-investigator Contact Information  
    <br> Name: Milena Marie Overhoff  
    Institution: ETH Zürich  
    Address: Rämistrasse 101, 8092 Zürich  
    Email: [moverhoff\@ethz.ch](mailto:moverhoff@ethz.ch)

    C. Co-investigator Contact Information  
    <br> Name: Sebastian Camilo Loos  
    Institution: ETH Zürich  
    Address: Rämistrasse 101, 8092 Zürich  
    Email: [sloos\@student.ethz.ch](mailto:sloos@student.ethz.ch)

3.  Date of data collection (single date, range, approximate date):

    Survey: 2022-04-19  
    Waste Data: 2022-04-07

4.  Geographic location of data collection:

    Survey Data:

    -   Tramstation Lochergut, Zürich

    -   Tramstation Fellenbergstrasse, Zürich

    Waste Data:

    -   see bin-list-long.csv

5.  Information about funding sources that supported the collection of
    the data: -

# Sharing / access information

1.  Licenses/restrictions placed on the data:  
    This work is licensed under the Creative Commons Attribution 4.0
    International license (CC-BY-4.0).

2.  Links to publications that cite or use the data: -

3.  Links to other publicly accessible locations of the data: -

4.  Links/relationships to ancillary data sets: -

5.  Was data derived from another source? Yes

    A. If yes, list source(s):

    -   [Stadt
        Zürich](https://www.stadt-zuerich.ch/geodaten/download/Abfallgefaesse)

    -   [Bundesbehörden der Schweizerischen
        Eidgenossenschaft](https://map.geo.admin.ch)

6.  Recommended citation for this dataset: see citation-file in
    repository

# Data & file overview

1.  File List:

| file                                      | Description                                                                                                                                                                                                                                                                                                                    |
|-------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| survey-data-behaviour-tidy.csv            | Survey participants answers to the part of the survey where the recycling behaviour for different situations was investigated. For more information about specific questions in this part, see the attributes.csv file in the metadata folder.                                                                                 |
| survey-data-general-tidy.csv              | Survey participants answers to the part of the survey where the general demographic information about the participants and their awareness of the recycling possibilities in there hometown were investigated. For more information about specific questions in this part, see the attributes.csv file in the metadata folder. |
| abbreviations-answers.csv                 | Shows the connection between the abbreviation and the answer options for each question.                                                                                                                                                                                                                                        |
| abbreviations-questions.csv               | Shows the connection between the abbreviation and the question asked to the participant.                                                                                                                                                                                                                                       |
| waste-characterisation-data-cans-tidy.csv | Data collected at the waste characterisation about the number of cans found in each bag of garbage.                                                                                                                                                                                                                            |
| waste-characterisation-data-tidy.csv      | Data collected at the waste characterisation about the weight of glass, metal and other materials found for each bag of garbage.                                                                                                                                                                                               |
| bin-list-long.csv                         | Information about the trash bins from which the bags were collected.                                                                                                                                                                                                                                                           |
| metadata                                  | Folder with metadata for the tidy data. Contains the attributes.csv file and this README.md file.                                                                                                                                                                                                                              |

1.  Relationship between files, if important: -

2.  Additional related data collected that was not included in the
    current data package: -

3.  Are there multiple versions of the dataset? No

    A. If yes, name of file(s) that was updated: i. Why was the file
    updated? ii. When was the file updated? -

# Methodological information

1.  Description of methods used for collection/generation of data:

    Survey: The survey was designed using the ETHZ Survey-Tool "Select
    Survey". The creation of the Questionnaire was guided by the slides
    about survey design of Prof. Dr. Elizabeth Tilley in the ETH Zürich
    lecture "Research beyond the Lab" during Spring semester of 2022.
    The survey itself was done on one afternoon in two different
    locations next to the two investigated recycling collection points
    (lochergut and Fellenbergstrasse). The questioner determined an area
    of about 40 square meters where frequent pedestrian flow could be
    observed. In order to have a randomized sample set every fifth
    person walking through this defined area was asked to participate in
    the survey. Because of the high rejection rate the frequency had to
    be adopted to every third person passing through the area in order
    to increase the sample size. In total the survey was done for 3.5
    hours 2 hours at the Lochergut and 1.5 hours at the
    Fellenbergstrasse tramstations.  
    In order to generate more sample data a QR-Code linking to the
    online questionnaire was offered to scan if time was the reason for
    not taking the survey in that moment.

    Waste characterisation:

    On a map provided by the ERZ silver bins were selected depending on
    their distance from recycling stations and wether the station could
    be seen or not from the bin. The ERZ then went out and collected the
    rubbish bags and brought them back to their facility at
    Bienenstrasse 45. There we joined. The bags were first weighed for
    their total weight. Then they were opened and glass and metal were
    systematically collected and weighed for each bag. For the metal the
    amount of cans was counted too.

    Bin info:

    The information about the bins from which the bags were collected
    from the ERZ was gathered using data from the city of Zurich
    (Entsorgung & Recycling Zurich) data set. The distances between the
    bins and the recycling stations have been measured using the Mapping
    Tool from the Swiss government where the shortest way without going
    through buildings was drawn and the distance of the total path
    length was obtained.

    References:

    -   This is the link to the [Select Survey
        Tool](https://www.selectsurvey.ethz.ch/)

    -   This is the link to the [RBTL course
        website](https://rbtl-fs22.github.io/website/)

    -   This is the link to the
        [ERZ-data](https://www.stadt-zuerich.ch/geodaten/download/Abfallgefaesse)

    -   This is the link the the
        [Map-Geo-Admin-Tool](https://map.geo.admin.ch)

2.  Methods for processing the data:

    Survey:  
    The raw survey data was generated with the export function of the
    "Select Survey" tool. The Data was exported to a csv-file with UTF-8
    encoding, semicolon defined as multi-answer delimiter and the data
    format "User Response" chosen.

    Waste characterisation:  
    The data collected from the waste characterisation was collected at
    the collection day put into a csv-file and imported into the
    `raw_data` folder directly.

    Tidy data:  
    The tidy data was generated using the R packages `tidyverse` and
    `lubridate`. The code for the data tidying can be seen in the
    `01-tidy-raw-data.R` file located in the source directory
    (project/src).

3.  Instrument- or software-specific information needed to interpret the
    data: -

4.  Standards and calibration information, if appropriate: -

5.  Environmental/experimental conditions: -

6.  Describe any quality-assurance procedures performed on the data: -

7.  People involved with sample collection, processing, analysis and/or
    submission:

    Survey: Survey was designed by the three authors of this paper with
    help from our lecturers Prof. Dr. Elizabeth Tilley and Lars
    Schöbitz. The Survey was organized and executed by Sebstian Loos.

    Waste characterisation: the waste characterisation was organized and
    executed by Ali Ben Milena Marie Overhoff.

# Data-specific information for: survey-data-behaviour-tidy.csv

1.  Number of variables: 5

2.  Number of cases/rows: 124

3.  Variable List: see attributes.csv

4.  Missing data codes: NA

5.  Specialized formats or other abbreviations used:  
    Abbreviations for the questions and answers can be found in the
    corresponding `abbreviations-*.csv` files.

# Data-specific information for: survey-data-general-tidy.csv

1.  Number of variables: 9

2.  Number of cases/rows: 11

3.  Variable List: see attributes.csv

4.  Missing data codes: NA

5.  Specialized formats or other abbreviations used: -

# Data-specific information for: abbreviations-answers.csv

1.  Number of variables: 8

2.  Number of cases/rows: 6

3.  Variable List: see attributes.csv

4.  Missing data codes: NA

5.  Specialized formats or other abbreviations used: -

# Data-specific information for: abbreviations-questions.csv

1.  Number of variables: 2

2.  Number of cases/rows: 6

3.  Variable List: see attributes.csv

4.  Missing data codes: NA

5.  Specialized formats or other abbreviations used: -

# Data-specific information for: waste-characterisation-data-cans-tidy.csv

1.  Number of variables: 2

2.  Number of cases/rows: 15

3.  Variable List: see attributes.csv

4.  Missing data codes: NA

5.  Specialized formats or other abbreviations used: -

# Data-specific information for: waste-characterisation-data-tidy.csv

1.  Number of variables: 3

2.  Number of cases/rows: 45

3.  Variable List: see attributes.csv

4.  Missing data codes. NA

5.  Specialized formats or other abbreviations used: -

# Data-specific information for: bin-list-long.csv

1.  Number of variables: 8

2.  Number of cases/rows: 15

3.  Variable List: see attributes.csv

4.  Missing data codes. NA

5.  Specialized formats or other abbreviations used: -
