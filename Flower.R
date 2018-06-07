

flower <-  read.csv("flowers.csv",header = FALSE)
dim(flower)
str(flower)

flowerMatrix <- as.matrix(flower)
dim(flowerMatrix)
flowerMatrix

flowerVector <- as.vector(flowerMatrix)
dim(flowerVector)
str(flowerVector)


distance <- dist(flowerVector,method = "euclidean")

ClusterIntensity <- hclust(distance,method = "ward")
plot(ClusterIntensity)
rect.hclust(ClusterIntensity,k=3,border = "red")

flowerCluster <- cutree(ClusterIntensity,k=3)
flowerCluster

tapply(flowerVector, flowerCluster, mean)

dim(flowerCluster)  = c(50,50)

image(flowerCluster,axes = FALSE)
image(flowerMatrix,axes = FALSE)
