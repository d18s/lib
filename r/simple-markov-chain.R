# A simple Markov chain in R

rm(list=ls())

runMarkovChain <- function(transitionMatrix, startState, n) {
  makeTransition <- function(state, transitionMatrix) {
    sample(colnames(transitionMatrix), 1, prob=transitionMatrix[state,])
  }
  
  chain <- character(n)
  chain[1] <- startState
  for (i in 2:n) {
    chain[i] <- makeTransition(chain[i-1], transitionMatrix)
  }
  
  chain
}

# Example usage:
transitionMatrix <- matrix(c(a=0.6, 0.4, 0.3, 0.7), ncol=2, byrow=TRUE)
colnames(transitionMatrix) <- c('a','b')
row.names(transitionMatrix) <- c('a','b')
transitionMatrix # p(a->a) = 0.6, p(a->b) = 0.4, p(b->a) = 0.3, p(b->b) = 0.7
chain <- runMarkovChain(transitionMatrix, 'a', 100) # simulate a chain 100 states long, starting in state 'a'


