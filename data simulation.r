# Projet KID_AI

# Simulation des données
# Maxime Desmarets
# 11 novembre 2023

library(tidyverse)

# Listes de variables ####
# Variables à sélectionner
var <- c(
  "age",
  "sexe",
  "nephro_ini",
  "mDialyse",
  "dDialyse",
  "trans_rein",
  "trans_rein_nbre",
  "trans_autre",
  "trans_organe",
  "hepatiteB",
  "hepatiteB_active",
  "hepatiteB_chronique",
  "hepatiteC",
  "hepatiteC_active",
  "hepatiteC_chronique",
  "VIH",
  "cancer",
  "eve_cardio_acfa",
  "eve_cardio_hta",
  "eve_cardio_ic",
  "eve_cardio_nd",
  "patho_coro_idm",
  "patho_coro_rc",
  "patho_coro_angor",
  "patho_coro_ms",
  "patho_coro_nd",
  "mal_cv_avc",
  "mal_cv_ec",
  "mal_cv_tc",
  "mal_cv_nd",
  "aomi_ampu",
  "aomi_ci",
  "aomi_revascu",
  "aomi_nd",
  "patho_aort",
  "eve_pul_bpco",
  "eve_pul_emph",
  "eve_pul_ac",
  "eve_pul_ir",
  "diabete",
  "diabete_type",
  "dyslipidemie",
  "hta",
  "IMC",
  "sCMV",
  "ac_antiHLA",
  "dTransplantation",
  "tii_induction",
  "ent_aziathioprine",
  "ent_ciclosporine",
  "ent_corticoides",
  "ent_everolimus",
  "ent_mpa",
  "ent_mmf",
  "ent_sirolimus",
  "ent_tacrolimus",
  "ent_nulojix",
  "ent_nd",
  "tii_p_antiCMV",
  "tii_p_antiCMV_ttt",
  "v0_tcd3_p",
  "v0_tcd3",
  "v0_tcd3_cd4_p",
  "v0_tcd3_cd4",
  "v0_tcd4_cd45ra_p",
  "v0_tcd4_cd45ra_cd31_p",
  "v0_tcd4_cd45ro_p",
  "v0_tcd3_cd8_p",
  "v0_tcd3_cd8",
  "v0_tcd3_cd8_cd16_p",
  "v0_tcd3_cd8_cd16",
  "v0_tcd3_cd8m_cd16_p",
  "v0_tcd3_cd8m_cd16",
  "v0_r_cd4_cd8",
  "v0_bcd19_p",
  "v0_bcd19",
  "v0_nk_cd56_cd3_p",
  "v0_nk_cd56_cd3",
  "v0_monocytestotaux_p",
  "v0_monocytestotaux",
  "v0_monocytesInflam_p",
  "v0_monocytesInflam",
  "v1_dVisite",
  "v1_Raigu",
  "v1_dRAigu",
  "v1_tcd3_p",
  "v1_tcd3",
  "v1_tcd3_cd4_p",
  "v1_tcd3_cd4",
  "v1_tcd4_cd45ra_p",
  "v1_tcd4_cd45ra_cd31_p",
  "v1_tcd4_cd45ro_p",
  "v1_tcd3_cd8_p",
  "v1_tcd3_cd8",
  "v1_tcd3_cd8_cd16_p",
  "v1_tcd3_cd8_cd16",
  "v1_tcd3_cd8m_cd16_p",
  "v1_tcd3_cd8m_cd16",
  "v1_r_cd4_cd8",
  "v1_bcd19_p",
  "v1_bcd19",
  "v1_nk_cd56_cd3_p",
  "v1_nk_cd56_cd3",
  "v1_monocytestotaux_p",
  "v1_monocytestotaux",
  "v1_monocytesInflam_p",
  "v1_monocytesInflam",
  "v3_dVisite",
  "v3_Raigu",
  "v3_dRAigu",
  "dSortie",
  "raison"
)

# Binary variables
bin_var <- c(
  "trans_rein",
  "trans_autre",
  "hepatiteB",
  "hepatiteB_active",
  "hepatiteB_chronique",
  "hepatiteC",
  "hepatiteC_active",
  "hepatiteC_chronique",
  "VIH",
  "cancer",
  "eve_cardio_acfa",
  "eve_cardio_hta",
  "eve_cardio_ic",
  "eve_cardio_nd",
  "patho_coro_idm",
  "patho_coro_rc",
  "patho_coro_angor",
  "patho_coro_ms",
  "patho_coro_nd",
  "mal_cv_avc",
  "mal_cv_ec",
  "mal_cv_tc",
  "mal_cv_nd",
  "aomi_ampu",
  "aomi_ci",
  "aomi_revascu",
  "aomi_nd",
  "patho_aort",
  "eve_pul_bpco",
  "eve_pul_emph",
  "eve_pul_ac",
  "eve_pul_ir",
  "diabete",
  "dyslipidemie",
  "hta",
  "ac_antiHLA",
  "ent_aziathioprine",
  "ent_ciclosporine",
  "ent_corticoides",
  "ent_everolimus",
  "ent_mpa",
  "ent_mmf",
  "ent_sirolimus",
  "ent_tacrolimus",
  "ent_nulojix",
  "ent_nd",
  "tii_p_antiCMV",
  "v1_Raigu",
  "v3_Raigu"
)

#Absent / Present variables
bin_var_abs <- c(
  "trans_rein",
  "trans_autre",
  "hepatiteB",
  "hepatiteB_active",
  "hepatiteB_chronique",
  "hepatiteC",
  "hepatiteC_active",
  "hepatiteC_chronique",
  "VIH",
  "cancer",
  "eve_cardio_acfa",
  "eve_cardio_hta",
  "eve_cardio_ic",
  "eve_cardio_nd",
  "patho_coro_idm",
  "patho_coro_rc",
  "patho_coro_angor",
  "patho_coro_ms",
  "patho_coro_nd",
  "mal_cv_avc",
  "mal_cv_ec",
  "mal_cv_tc",
  "mal_cv_nd",
  "aomi_ampu",
  "aomi_ci",
  "aomi_revascu",
  "aomi_nd",
  "patho_aort",
  "eve_pul_bpco",
  "eve_pul_emph",
  "eve_pul_ac",
  "eve_pul_ir",
  "ent_aziathioprine",
  "ent_ciclosporine",
  "ent_corticoides",
  "ent_everolimus",
  "ent_mpa",
  "ent_mmf",
  "ent_sirolimus",
  "ent_tacrolimus",
  "ent_nulojix",
  "ent_nd"
)

# Oui / Non variables
bin_var_yn <- c(
  "diabete",
  "dyslipidemie",
  "hta",
  "ac_antiHLA",
  "tii_p_antiCMV",
  "v1_Raigu",
  "v3_Raigu"
)

# Categorical variables
cat_var <- c(
  "nephro_ini",
  "mDialyse",
  "trans_organe",
  "diabete_type",
  "sCMV",
  "tii_induction",
  "tii_p_antiCMV_ttt",
  "raison"
)

# Dates
dat_var <- c(
  "dTransplantation",
  "v1_dVisite",
  "v1_dRAigu",
  "v3_dVisite",
  "v3_dRAigu",
  "dSortie"
)

# Import des données ####
orly <- read_csv2("sources/ORLY Est_20190308 acp.csv", col_select = var, na = c("", "NA", "DM", "ND", "NC","NP","."))

head(orly)
tail(orly)

# Recodage ####
orly <- orly |>
  filter(!is.na(dTransplantation)) |> # Suppression des patients sans date de transplantation (impossible de calculer les délais)
  mutate(across(all_of(bin_var_abs), ~ case_match(.x ,
                                                  "Absent" ~ 0,
                                                  "Présent" ~ 1))) |>
  mutate(across(all_of(bin_var_abs), ordered)) |>
  mutate(across(all_of(bin_var_yn), ~ case_match(.x ,
                                                  "Non" ~ 0,
                                                  "Oui" ~ 1))) |>
  mutate(across(all_of(bin_var_yn), ordered)) |>
  mutate(across(all_of(cat_var), ordered)) |>
  mutate(sexe = case_match(sexe, "Masculin" ~ 1, "Feminin" ~ 2)) |>
  mutate(sexe = ordered(sexe, levels = 1:2, labels = c("Male","Female"))) |>
  mutate(across(all_of(dat_var), ~ as.Date(.x, format = "%d/%m/%Y"))) |>
  mutate(across(c(v0_r_cd4_cd8, v0_monocytesInflam_p, v1_r_cd4_cd8, v1_monocytesInflam_p), as.numeric)) |>
  mutate(delai_v1 = as.numeric(v1_dVisite - dTransplantation)) |>
  mutate(delai_v1_RAigu = as.numeric(v1_dRAigu - dTransplantation)) |>
  mutate(delai_v3 = as.numeric(v3_dVisite - dTransplantation)) |>
  mutate(delai_v3_RAigu = as.numeric(v3_dRAigu - dTransplantation)) |>
  mutate(delai_sortie = as.numeric(dSortie - dTransplantation)) |>
  select(!all_of(dat_var)) |> # suppression des dates exactes
  as.data.frame()
  
glimpse(orly)

write_csv(head(orly), "sorties/extrait_orly.csv") # Export d'un extrait de données

# Génération des données simulées ####
if (!require("umx")) install.packages("umx")
library(umx)

# orly_fake <- umx_make_fake_data(orly) # Ne fonctionne pas. Pas assez de lignes pour faire tourner les modèles.

# Contournement du probleme en faisant une simulation partielle des données sur un nombre limité de variables
var_sim <- c("age","sexe", "sCMV", "diabete", "hta", "IMC", "dDialyse") # Liste des variables de base à simuler

orly_fake_v0 <- orly |> select(all_of(var_sim), v0_tcd3_p:v0_monocytesInflam, delai_v1:delai_sortie) |> umx_make_fake_data() |>
  select(all_of(var_sim), v0_tcd3_p:v0_monocytesInflam, delai_v1:delai_sortie) # Selection des variables bio à V0 plus les variables de base

orly_fake_v1 <- orly |> select(all_of(var_sim), v1_tcd3_p:v1_monocytesInflam, delai_v1:delai_sortie) |> umx_make_fake_data() |>
  select(v1_tcd3_p:v1_monocytesInflam) # Selection des variables bio à V1
# Le résultat n'est pas parfait, il y a des valeurs négatives impossibles dans la vraie vie...

# Assemblage final des données ####
orly_fake <- bind_cols(orly_fake_v0, orly_fake_v1)
orly_fake_var <- names(orly_fake)
orly_base <- orly |> select(-all_of(orly_fake_var)) # Sélection de toutes les variables restantes
orly_fake <- bind_cols(orly_base, orly_fake) |> relocate(names(orly)) # Assemblage et remise en ordre original des variables

# Export des données simulées
write_csv(orly_fake, "sorties/orly_fake.csv") 

