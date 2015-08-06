library(ggplot2)

attach(strategic_merged)
# merge data into one csv file

strategic <- read.csv("strategic-information-sample.csv", header=TRUE, stringsAsFactor=FALSE)
qualification <- read.csv("High.csv", header=TRUE, stringsAsFactor=FALSE)
GDP <- read.csv("GDP_SG.csv", header=TRUE, stringsAsFactor=FALSE)
skilled <- read.csv("skilled_data.csv", header=TRUE, stringsAsFactor=FALSE)
strategic_merged_qualification <- merge(x=strategic, y=qualification)
strategic_merged_gdp <- merge(x=strategic_merged_qualification, y=GDP)
strategic_merged <- merge(x=strategic_merged_gdp, y=skilled)

#change to numeric for thousand digits
strategic_merged$SG_GDP <- as.numeric(gsub(",", "", strategic_merged$SG_GDP))
strategic_merged$SG_TOTAL_PPL_SURVEYED <- as.numeric(gsub(",", "", strategic_merged$SG_TOTAL_PPL_SURVEYED))
strategic_merged$SG_WORKERS_CERTIFIED_COMPETENT <- as.numeric(gsub(",", "", strategic_merged$SG_WORKERS_CERTIFIED_COMPETENT))
strategic_merged$SG_RESKILLED_TRAINEES <- as.numeric(gsub(",", "", strategic_merged$SG_RESKILLED_TRAINEES))
strategic_merged$TTASSET <- as.numeric(gsub(",", "", strategic_merged$TTASSET))
strategic_merged$TTCRASSET <- as.numeric(gsub(",", "", strategic_merged$TTCRASSET))
strategic_merged$TTLIAB <- as.numeric(gsub(",", "", strategic_merged$TTLIAB))
strategic_merged$TTCRLIAB <- as.numeric(gsub(",", "", strategic_merged$TTCRLIAB))
strategic_merged$TTNCRLIAB <- as.numeric(gsub(",", "", strategic_merged$TTNCRLIAB))
strategic_merged$TTEQUITY <- as.numeric(gsub(",", "", strategic_merged$TTEQUITY))
strategic_merged$SHARECAP <- as.numeric(gsub(",", "", strategic_merged$SHARECAP))
strategic_merged$OTHERRESERVESTT <- as.numeric(gsub(",", "", strategic_merged$OTHERRESERVESTT))
strategic_merged$RETAINEARN <- as.numeric(gsub(",", "", strategic_merged$RETAINEARN))
strategic_merged$TTNCRASSET <- as.numeric(gsub(",", "", strategic_merged$TTNCRASSET))
write.csv(file="strategic_merged.csv", x=strategic_merged,  na="0")

# analyse data

#what is the trend of university students over the years?
totalUni <- ggplot(strategic_merged, aes(FYEAR,SG_TOTAL_UNI_SURVEYED)) + geom_line() + ylab("Frequency") +ggtitle("No. Of University Students over 2009-2011")
totalUni

#what is the trend of diploma students over the years?
totalDip <- ggplot(strategic_merged, aes(FYEAR,SG_TOTAL_DIPLOMA_PROFESSIONAL_SURVEYED)) + geom_line() + ylab("Frequency") +ggtitle("No. Of Diploma Students over 2009-2011")
totalDip

#regression in total assets and total equity

results = lm( TTASSET ~ TTEQUITY  , data=strategic_merged)
summary(results)
