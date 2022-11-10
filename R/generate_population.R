#' Generate a seed population of cells with mutations
#'
#' Create a digital "tissue", and return all the mutations
#' that have arisen within that "tissue". The purpose is to create a mock cell
#' population, over `n_div` rounds of cell division, starting with `n_start`
#' cells, using a mutation frequency, `mut_freq` and mutation process,
#' `mut_process`, across a reference DNA sequence, `ref`. At the end, you will
#' end up with a starting population of cells that "grew" using these specific
#' parameters. Then, this tissue can be mock "exposed" (or "expanded") to
#' simulate a cellular exposure to a mutagen (or control samples).
#'
#' @param n_div The number of cell divisions to simulate.
#' @param n_start The number of starting cells in the population.
#' @param ref Reference genome; hg38, mm10, or a path to a FASTA file
#' @param mut_freq The frequency of mutation to use in simulations.
#' @param mut_process The overall mutation spectrum to simulate, provided as...?
#' @export
generate_population <- function(
  n_div = 3,
  n_start = 1,
  ref = "hg38",
  mut_freq = 0.1,
  mut_process = "" # matrix?
) {
  message("
  Growing your cells. Please be patient - remember, in the lab this takes
  months, and often doesn't even work!
  ")
  # Make an empty data frame around which to structure simulations
  seed_table <- data.frame(
    chr = character(),
    start = numeric(),
    end = numeric(),
    cell = character(),
    originating_generation = numeric(),
    mutation_timing = character()
  )
  # Make a list of cells the size of the starting generation...
  seed_cells <- replicate(n = n_start, expr = seed_table, simplify = F)
  # Make a list where each element represents a generation...
  cells <- replicate(n = n_div, expr = list(), simplify = F)
  names(cells) <- paste0("Generation_",paste0(1:n_div))
  # Perform exponential doubling of seed population of cells...
  # Quasi-poisson distribution to get # mutations to include per cell:
    # Must be based on frequency
    # Frequency is used to calculate mean
    # How to best determine variability?
}
