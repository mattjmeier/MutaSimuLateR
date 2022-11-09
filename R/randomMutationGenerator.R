randomMutationGenerator <- function(numMutations=1000, groupName="Random") {
Group <- rep(groupName, numMutations)
Position <- sample(2:3096, numMutations, replace=T)
Ref <- vector()
Alt <- vector()

for(i in 1:length(Position)) {
	Ref <- c(Ref, substr(lacZ, Position[i], Position[i]))
	mutation <- sample(c("A", "C", "G", "T"), 1)
	while (mutation == Ref[i]) {
		mutation <- sample(c("A", "C", "G", "T"), 1)
	}
	Alt <- c(Alt, mutation)
}
return(data.frame(cbind(Group, Position, Ref, Alt)))
}
