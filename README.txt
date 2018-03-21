This program is made of two stages.  

Species_Record.ipynb
The first part of the program is a python and unix code jupyter notebook file (Species_Record.ipynb), utilizing regular expressions.  
IDigBio "occurence" files for one or more species can be uploaded and cleaned into file(s) containing the species, institution code, catalog number, basis of record, individual count, country, state or province, locality, collection year, decimal latitude, and decimal longitude. It also can combine multiple species into a single file.
Purpose: While the IDigBio website is excellent for visualizing location information for a single species, the website is set up to look at one specimen record at a time.  This program allows comparisons with multiple species and specimens records.

Species_Record_Analyses.R
This second part of the program is R code, utilizing tidyverse.
The combined csv file or individual species file(s) can be input into the R script "Species_Record_Analyses.R" to determine the top institution with these specimens, as well as create lists of specimen details, including catalog numbers, based on institution.
Purpose: This will allow the user to determine which museums are best for studying species, as well as help them prepare a list of catalog numbers to make informed requests from institutions.

To help practice with this program, the directory Mussel_Project has been made with four raw occurence files downloaded from IDigBio.