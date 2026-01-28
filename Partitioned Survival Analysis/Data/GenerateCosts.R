# Generation of cost data.

## First we estimate data from Figure 1 in the paper: Winter, Y., Stamelou, M., Cabanel, N., Sixel-Döring, F., Eggert, K., Höglinger, G. U., Her􀆟ng, B., Klockgether, T., Reichmann, H., Oertel, W. H., Dodel, R. and Spotke, A. E.(2011b) 'Cost-of-illness in mul􀆟ple system atrophy and progressive supranuclear palsy', J Neurol, 258(10), pp. 1827-34.

## Show image
Figure1 <- readPNG("Data/Figure 1 Winter et al 2011.png")
grid::grid.raster(Figure1)

## From this image we estimate the costs

RawCosts <- data.frame(
  UMSARS = c("UMSARS_IV 1 + 2", "UMSARS_IV 3", "UMSARS_IV 4", "UMSARS_IV 5"),
  `Inpatient care` = c(1200, 3000, 4000, 4000),
  `Drugs (BSC)` = c(800, 1200, 1300, 1300),
  `Special equipment` = c(800, 1200, 4200, 4200),
  `Home care` = c(0, 200, 1600, 1600),
  `Other direct costs` = c(1200, 2500, 3800, 3800)
)

## Adjust for inflation, convert to pounds sterling, and convert to annual costs

InflateConvert <- 
  function(costs) {
    conversion_rate <- 0.8872 # Exchange Rates United Kingdom: https://www.exchangerates.org.uk/EUR-GBP-spot-exchange-rates-history-2010.html
    inflation_adjustment <- 1.67 # Source: Office for National Statistics, United Kingdom: https://www.ons.gov.uk/economy/inflationandpriceindices/timeseries/czbh/mm23
    semi_annual_to_annual <- 12/6 # Convert semi-annual costs to annual costs
    
    factor <- conversion_rate * inflation_adjustment * semi_annual_to_annual
    
    adjusted_costs <- costs
    adjusted_costs[, 2:6] <- adjusted_costs[, 2:6] * factor
    
    return(adjusted_costs)
  }

AnnualAdjustedCosts <- InflateConvert(RawCosts)
AnnualAdjustedCosts$Total <- rowSums(AnnualAdjustedCosts[, 2:6])

## Estimating standard errors for PSA 

n <- 46 # Number of MSA patients in Winter et al 2011
AnnualAdjustedCosts$StandardError <- AnnualAdjustedCosts$Total / sqrt(n)


AnnualAdjustedCosts <- write.csv(AnnualAdjustedCosts, "Data/AnnualAdjustedCosts.csv", row.names = FALSE)

