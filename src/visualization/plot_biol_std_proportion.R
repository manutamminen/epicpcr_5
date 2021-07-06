
library(tidyverse)
library(forcats)

# read_tsv("../../data/final/18S_bc_tax.txt") %>%
read_tsv(snakemake@input[[1]]) %>%
  select(-BC, -Count) %>%
  filter(!str_detect(Taxonomy, "Mock")) %>%
  mutate(Taxonomy = case_when(str_detect(Taxonomy, "Rhodomonas") ~ "Rhodomonas",
                              str_detect(Taxonomy, "Cryptomonas") ~ "Chilomonas",
                              str_detect(Taxonomy, "Ochromonas") ~ "Ochromonas",
                              TRUE ~ "Other" ),
         Taxonomy = fct_relevel(Taxonomy,
                                c("Rhodomonas",
                                  "Chilomonas",
                                  "Ochromonas",
                                  "Other"))) %>%
  ggplot(aes(x=Sample, fill=Taxonomy)) +
         geom_bar(position="dodge") +
         coord_flip()
ggsave(snakemake@output[[1]])
