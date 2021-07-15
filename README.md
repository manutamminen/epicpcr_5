# epicPCR experiment May 28 2021

The aim of this experiment was to find an optimal concentration gradient for synthetic and biological standards and to optimize the barcode concentration

The following samples are included:

| Sample name | Sample description: sample, emulsion, number of mock oligos, target  |
| :--- | :--- |
|BiolstdM10XDilBC10e416Sfluo|Biol standard	Fluorinated oil, 3e4 to 3e6	16S|
|BiolstdM100XDilBC10e416Sfluo|Biol standard	Fluorinated oil, 3e3 to 3e5	16S|
|BiolstdM10XDilBC10e416Smine|Biol standard	Mineral oil, 3e4 to 3e6	16S|
|BiolstdM100XDilBC10e416Smine|Biol standard	Mineral oil, 3e3 to 3e5	16S	|
|BiolstdM10XDilBC10e418Sfluo|Biol standard	Fluorinated oil, 3e4 to 3e6	18S|
|BiolstdM100XDilBC10e418Sfluo|Biol standard	Fluorinated oil, 3e3 to 3e5 18S|
|BiolstdM10XDilBC10e418Smine|Biol standard	Mineral oil, 3e4 to 3e6	18S|
|BiolstdM100XDilBC10e418Smine|Biol standard	Mineral oil, 3e3 to 3e5	18S|
|WWBiolstdM10XDilBC10e416Sfluo|WW + Biol standard	Fluorinated oil, 3e4 to 3e6	16S	|
|WWBiolstdM100XDilBC10e416Sfluo|WW + Biol standard	Fluorinated oil, 3e3 to 3e5	16S|
|WWBiolstdM10XDilBC10e416Smine|WW + Biol standard	Mineral oil, 3e4 to 3e6	16S|
|WWBiolstdM100XDilBC10e416Smine|WW + Biol standard	Mineral oil, 3e3 to 3e5	16S	|
|WWBiolstdM10XDilBC10e418Sfluo|WW + Biol standard	Fluorinated oil, 3e4 to 3e6	18S|
|WWBiolstdM100XDilBC10e418Sfluo|WW + Biol standard	Fluorinated oil, 3e3 to 3e5	18S|
|WWBiolstdM10XDilBC10e418Smine|WW + Biol standard	Mineral oil, 3e4 to 3e6	18S|
|WWBiolstdM100XDilBC10e418Smine|WW + Biol standard	Mineral oil, 3e3 to 3e5	18S|
|WWM10XDilBC10e416Sfluo|WW	Fluorinated oil, 3e4 to 3e6	16S|
|WWM100XDilBC10e416Sfluo|WW	Fluorinated oil, 3e3 to 3e5	16S|
|WWM10XDilBC10e416Smine|WW	Mineral oil, 3e4 to 3e6	16S	|
|WWM100XDilBC10e416Smine|WW	Mineral oil, 3e3 to 3e5	16S|
|WWM10XDilBC10e418Sfluo|WW	Fluorinated oil, 3e4 to 3e6	18S|
|WWM100XDilBC10e418Sfluo|WW	Fluorinated oil, 3e3 to 3e5	18S|
|WWM10XDilBC10e418Smine|WW	Mineral oil, 3e4 to 3e6	18S|
|WWM100XDilBC10e418Smine|WW	Mineral oil, 3e3 to 3e5	18S|


Raw data available at https://zenodo.org/record/4877925

Lab protocols available at https://github.com/manutamminen/epicpcr_5/blob/main/docs/protocols.md

Summary of the results available at https://github.com/manutamminen/epicpcr_5/blob/main/docs/index.md


# Building

## Dependencies

- Snakemake
- VSEARCH
- SINA
- FastTree
- Tidyverse

Download the raw data into data/raw.

Start the processing pipeline by invoking `snakemake --cores all report`.


