## Compare the mass of female and male human star wars characters
## null hypothesis: average mass of male and female star wars characters is the same
## alternative hypothesis: average mass of male and female star wars characters is different

swHumans <- starwars |>
  filter(species == "Human", mass > 0)
males <- swHumans |> filter(sex == "male")
females <- swHumans |> filter(sex == "female")

t.test(males$mass, females$mass, paired = F, alternative = "two.sided")
## only include an alternative if comparing for greater OR less than, if both then there is no alternative
## default is paired = F and does not need to be included, is included here just for reference

## p-value is 0.6 
## not significant, failed to reject null hypothesis 