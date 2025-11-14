* Load the CSV file
import delimited "NCCTG_Lung_Cancer_Data.csv", clear

* Display a 2x2 table of sex and status with chi-squared test
tabulate sex status, chi2


* Compare means and standard deviations by sex
foreach var in age meal.cal wt.loss {
    display "Variable: `var'"
    mean `var', over(sex)
    ttest `var', by(sex)
    display "---------------------------------------------"
}




* Declare survival data
stset time, failure(status)

* Plot Kaplan-Meier survival curves by sex
sts graph, by(sex) title("Kaplan-Meier Survival Curves by Sex")

* Compute log-rank test
sts test sex
