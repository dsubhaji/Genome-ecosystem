strategic_merged_v1 <- read.csv("af.csv", header=TRUE, stringsAsFactor=FALSE)
total_asset <- read.csv("Total Assets By Main Industrial Sectors.csv", header=TRUE, stringsAsFactor=FALSE)

strategic_merged<-merge(x= strategic, y=total_asset)

strategic_merged$TTASSET_MAIN_SECTOR <- as.numeric(gsub(",", "", strategic_merged$TTASSET_MAIN_SECTOR))

write.csv(file="AnotherStrategic_merged.csv", x=strategic_merged, na="0")
