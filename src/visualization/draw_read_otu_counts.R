
library(tidyverse)


bact <-
  read_tsv(snakemake@input[[1]]) %>%
  select(-BC) %>%
  group_by(Sample, Taxonomy) %>%
  summarise(Count = sum(Count)) %>%
  mutate(Times_OTU_sampled = case_when(Count == 1 ~ "Single",
                              Count == 2 ~ "Double",
                              Count == 3 ~ "Triple",
                              Count > 3 ~ "Multiple"),
         Times_OTU_sampled = fct_relevel(Times_OTU_sampled,
                                         c("Single",
                                           "Double",
                                           "Triple",
                                           "Multiple"))) %>%
  separate(Sample, "Sample", sep="_") %>%
  mutate(Type = "Bacteria",
         Sample = str_replace(Sample, "16S", ""))


euk <-
  read_tsv(snakemake@input[[2]]) %>%
  select(-BC) %>%
  group_by(Sample, Taxonomy) %>%
  summarise(Count = sum(Count)) %>%
  mutate(Times_OTU_sampled = case_when(Count == 1 ~ "Single",
                              Count == 2 ~ "Double",
                              Count == 3 ~ "Triple",
                              Count > 3 ~ "Multiple"),
         Times_OTU_sampled = fct_relevel(Times_OTU_sampled,
                                         c("Single",
                                           "Double",
                                           "Triple",
                                           "Multiple"))) %>%
  separate(Sample, "Sample", sep="_") %>%
  mutate(Type = "Eukaryotes",
         Sample = str_replace(Sample, "18S", ""))


bind_rows(bact, euk) %>%
  ggplot(aes(x=Sample, y=Count, fill=Times_OTU_sampled)) +
  geom_bar(stat="identity", position="stack") +
  facet_grid(.~Type) +
  coord_flip()
ggsave(snakemake@output[[1]])
