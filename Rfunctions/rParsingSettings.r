infile <- "/home/lyn/arlecore_linux/cohen.res/cohen.xml"
outfiles <- "/home/lyn/arlecore_linux/amovadis.res/Graphics/"
sourcePath <- "/home/lyn/arlecore_linux/Rfunctions/"

source(paste(sourcePath, "parseArlequin.r", sep="") )
parseArlequin(infile, outfiles, sourcePath)

