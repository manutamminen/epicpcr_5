
library(tidyverse)

bact <-
  read_tsv(snakemake@input[[1]])

euk <-
  read_tsv(snakemake@input[[2]])


bact_bc_percs <-
  bact %>%
  separate(Taxonomy, "Mock", sep="_", remove=FALSE) %>%
  separate(Mock, c(NA, "Mock"), sep=":") %>%
  mutate(Mock = ifelse(str_detect(Mock, "Mock"), Mock, "Biol")) %>%
  select(-Taxonomy) %>%
  pivot_wider(id_cols=c("Sample", "BC"),
              names_from="Mock",
              values_from="Count",
              values_fn=sum,
              values_fill=0) %>%
  mutate(across(3:9, ~ .x > 0)) %>%
  pivot_longer(cols=-c("Sample", "BC"),
               names_to="Mock",
               values_to="Val") %>%
  group_by(Sample, Mock, Val) %>%
  summarise(Count = n()) %>%
  mutate(Tot = sum(Count), Prop = Count/Tot*100) %>%
  filter(Val) %>%
  select(-Tot, -Val) %>%
  separate(Sample, "Sample", sep="_") %>%
  mutate(Sample = str_replace(Sample, "16S", ""),
         Type = "Bacteria")



euk_bc_percs <-
  euk %>%
  separate(Taxonomy, "Mock", sep="_", remove=FALSE) %>%
  separate(Mock, c(NA, "Mock"), sep=":") %>%
  mutate(Mock = ifelse(str_detect(Mock, "Mock"), Mock, "Biol")) %>%
  select(-Taxonomy) %>%
  pivot_wider(id_cols=c("Sample", "BC"),
              names_from="Mock",
              values_from="Count",
              values_fn=sum,
              values_fill=0) %>%
  mutate(across(3:9, ~ .x > 0)) %>%
  pivot_longer(cols=-c("Sample", "BC"),
               names_to="Mock",
               values_to="Val") %>%
  group_by(Sample, Mock, Val) %>%
  summarise(Count = n()) %>%
  mutate(Tot = sum(Count), Prop = Count/Tot*100) %>%
  filter(Val) %>%
  select(-Tot, -Val) %>%
  separate(Sample, "Sample", sep="_") %>%
  mutate(Sample = str_replace(Sample, "18S", ""),
         Type = "Eukaryota")


bind_rows(bact_bc_percs, euk_bc_percs) %>%
  mutate(Oil = ifelse(str_detect(Sample, "fluo"),
                      "Fluorinated",
                      "Mineral"),
         Sample = str_replace(Sample,
                              "fluo", ""),
         Sample = str_replace(Sample,
                              "mine", "")) %>%
  ggplot(aes(x=Sample, y=Count, fill=Mock)) +
  geom_bar(stat="identity", position="dodge") +
  facet_grid(Oil ~ Type) +
  coord_flip()
ggsave(snakemake@output[[1]])


bind_rows(bact_bc_percs, euk_bc_percs) %>%
  mutate(Oil = ifelse(str_detect(Sample, "fluo"),
                      "Fluorinated",
                      "Mineral"),
         Sample = str_replace(Sample,
                              "fluo", ""),
         Sample = str_replace(Sample,
                              "mine", "")) %>%
  ggplot(aes(x=Sample, y=Prop, fill=Mock)) +
  geom_bar(stat="identity", position="dodge") +
  facet_grid(Oil ~ Type) +
  coord_flip()
ggsave(snakemake@output[[2]])

