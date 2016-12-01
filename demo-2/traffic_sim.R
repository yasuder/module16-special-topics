SimulateGroups <- function(mean, sd, num_cars) {
  # Simulate 100 cars w/mean speed 50
  cars <- rnorm(n = num_cars, mean = mean, sd = sd)
  
  # A function to determine if a car is slower than all of the cars
  # in front of it (which createa a new group of cars **behind** it)
  SlowerThan <- function(index) {
    return(cars[index] < min(cars[1:index - 1]))
  }
  
  # Apply the slower_than function to all of the cars
  new.groups <- lapply(2:length(cars), SlowerThan)
  
  # Determine number of groups created
  groups <- length(new.groups[new.groups == TRUE]) + 1
  return(groups)
}

RepeatSimulation <- function(num.sims = 10, mean = 50, sd = 5, num.cars = 100) {
  # Create an empty vector to store your results
  results <- vector()
  
  # Run your simulation 100 times, and track your results
  for(i in 1:num.sims) {  
    results <- c(results, SimulateGroups(mean, sd, num.cars))
  }
  # Work with your results
  return(hist(results))
}

