# epicPCR experiment May 28 2021

The aim of this experiment was to find an optimal concentration gradient for synthetic and biological standards and to optimize the barcode concentration

The following samples are included:

| Sample name | Sample description |
| :--- | :--- |
| BiolstdM100XDilBC10e4fluo | Biological standard-Fluorinated oil, 30 000 standard copies |
| BiolstdM100XDilBC10e3fluo | Biological standard-Fluorinated oil, 3000 standard copies |
| BiolstdM100XDilBC10e4mine | Biological standard-Mineral oil, 30 000 standard copies |
| BiolstdM100XDilBC10e3mine | Biological standard-Mineral oil, 3000 standard copies |
| WWBiolstdM100XDilBC10e4fluo | Wastewater + Biological standard-Fluorinated oil, 30 000 standard copies |
| WWBiolstdM100XDilBC10e3fluo | Wastewater + Biological standard-Fluorinated oil, 3000 standard copies |
| WWBiolstdM100XDilBC10e4mine | Wastewater + Biological standard-Mineral oil, 30 000 standard copies |
| WWBiolstdM100XDilBC10e3mine | Wastewater + Biological standard-Mineral oil, 3000 standard copies |
| WWM100XDilBC10e4fluo | Wastewater-Fluorinated oil, 30 000 standard copies |
| WWM100XDilBC10e3fluo | Wastewater-Fluorinated oil, 3000 standard copies |
| WWM100XDilBC10e4mine | Wastewater-Mineral oil, 30 000 standard copies |
| WWM100XDilBC10e3mine | Wastewater-Mineral oil, 3000 standard copies |


Raw data available at https://zenodo.org/record/4877925

Lab protocols available at 

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


