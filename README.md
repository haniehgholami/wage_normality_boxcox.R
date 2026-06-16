# Wage Data Analysis: Normality Testing and Box-Cox Transformation

## Overview

In this project, I work on exploratory data analysis and distributional checks using the Current Population Survey dataset (`CPSch3.csv`) in R. The focus is on average hourly earnings (`ahe`) and how different transformations can improve its distribution for econometric analysis.

## Dataset

The dataset includes individual-level information on wages, gender, and year. The full sample size is 11,130 observations.

## Methodology

### Descriptive Analysis

* Computed frequency tables for `sex` and `year`
* Built joint distributions using `addmargins()` to examine the sample structure across groups
* Sample is balanced across gender and time dimensions

### Subsample Analysis (1992)

* Filtered the data for year 1992 (n = 2,962)
* Plotted histograms and Q-Q plots (`qqnorm`, `qqline`) for `ahe`
* Performed Jarque-Bera and Shapiro-Wilk tests to check normality

The raw wage distribution shows strong right skewness and clearly deviates from normality.

### Transformations

* Applied log transformation: `log(ahe)`
* Estimated and applied Box-Cox transformation using the `car` package
* Optimal lambda was estimated using `powerTransform()`, and transformation applied with `bcPower()`

## Results

* Wage distribution is not normally distributed in its raw form
* Both Jarque-Bera and Shapiro-Wilk tests reject normality
* Log transformation reduces skewness but does not fully solve the problem
* Box-Cox transformation gives a distribution that is much closer to normal

## Key Findings

* The dataset consists of 46.49% female and 53.51% male observations
* Wage data is heavily skewed, so using it directly in linear models can lead to biased inference
* Box-Cox performs better than log transformation for normalizing this dataset

## Packages Used

* tidyverse
* tseries
* car

## Repository Structure

```text id="p9x2kd"
├── CPSch3.csv
├── wage_analysis.R
└── README.md
```

## Author

Hanieh Gholami Ghalhari
MSc in Quantitative Finance and Insurance
University of Bergamo
