filename = "exdata_plotting1.zip"
if (!file.exists(filename)) {
  reveal <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename,
                         method = "curl")
}
df.power <- read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))


df.power$Date <- as.Date(df.power$Date, format="%d/%m/%Y")
startDate <- as.Date("01/02/2007", format="%d/%m/%Y")
endDate <- as.Date("02/02/2007", format="%d/%m/%Y")
df.power <- df.power[df.power$Date >= startDate & df.power$Date <= endDate, ]

png(filename="plot1.png", width=480, height=480)
hist(df.power$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()