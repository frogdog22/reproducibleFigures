## cleaning data ##

#This function takes raw data and cleans it so it can be used for data analysis

cleaning <- function(data_raw){
  data_raw %>%
    clean_names() %>% #changes all names to snake case
    remove_empty(c("rows", "cols")) %>% #removes empty columns and rows
    select(-starts_with("delta")) %>% #removes the columns starting with delta
    select(-comments) %>% #removes the comments column
    mutate(species = case_when( #shortens species names
      species == "Adelie Penguin (Pygoscelis adeliae)" ~ "Adelie",
      species == "Chinstrap penguin (Pygoscelis antarctica)" ~ "Chinstrap",
      species == "Gentoo penguin (Pygoscelis papua)" ~ "Gentoo"))
  
}

## subset columns ##

#This function selects certain columns of interest, can be used too simplify the dataset

subset_columns <- function(penguins_data, column_names) {
  penguins_data %>%
    select(all_of(column_names))
}

## Remove NA ##

#This function removes rows that contain 'NA' in any cells

remove_NA <- function(penguins_data) {
  penguins_data %>%
    na.omit()
}  

