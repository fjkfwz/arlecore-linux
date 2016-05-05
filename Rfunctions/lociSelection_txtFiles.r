################################################################################
# lociSelection function
#
# Author: Heidi Lischer
# Date: 8.2009
################################################################################

lociSelection <- function(pValList, FStatCiList, timeAttr, outfile, fStat){
    
    if(fStat == "FST"){
        fst <- 3
        fstP <- 4
    } else {
        fst <- 5
        fstP <- 6
    }
    
    MaxHet <- max(pValList[,2])
    MaxF <- max(pValList[,fst])
    if(max(FStatCiList[,8]) > MaxF){
      MaxF <- max(FStatCiList[,8])
    }
    
    MinHet <- 0
    MinF <- 0
    
    if(min(pValList[,2]) < 0){
      MinHet <- min(pValList[,2])
    }
    if(min(pValList[,fst]) < 0){
      MinF <- min(pValList[,fst])
      
      if(min(FStatCiList[,2]) < MinF){
        MinF <- min(FStatCiList[,2])
      }
    }            

    FST_h0.05 <- list()
    FST_0.05 <- list()
    FST_0.01 <- list()
    lociNames_0.01 <- list()
    lociNames_0.01_lowFst <- list()
    lociNames_0.01_highFst <- list()
    lociNames_0.05_lowFst <- list()
    lociNames_0.05_highFst <- list()
    
    a <- 1
    b <- 1
    c <- 1
    
    dh <- 1
    dl <- 1
    
    eh <- 1
    el <- 1
    for(i in 1:nrow(pValList)){
        if(pValList[i, fstP] > 0.05){
            FST_h0.05[[a]] <- pValList[i, c(2, fst)]            
            a <- a + 1   
        } else {
            #test for high/low FST
            index <- 1
            while(FStatCiList[index, 1] <= pValList[i, 2] & index < nrow(FStatCiList)){
                index <- index + 1
            }
            limit <- FStatCiList[index, 5]
           # if(nrow(FStatCiList) < index
            if(FStatCiList[index, 5] > pValList[i, fst]){
                lociNames_0.05_lowFst[[dl]] <- pValList[i, 1]
                dl <- dl + 1
            } else {
                lociNames_0.05_highFst[[dh]] <- pValList[i, 1]
                dh <- dh + 1
            }            
            
            
            if(pValList[i, fstP] > 0.01){
                FST_0.05[[b]] <- pValList[i, c(2, fst)]
                
                b <- b + 1
            } else{
                FST_0.01[[c]] <- pValList[i, c(2, fst)]
                lociNames_0.01[[c]] <- pValList[i, 1]
                c <- c + 1
                
                #test for high/low FST
                index <- 1
                while(FStatCiList[index, 1] <= pValList[i, 2] & index < nrow(FStatCiList)){
                    index <- index + 1
                }
                if(FStatCiList[index, 5] > pValList[i, fst]){
                    lociNames_0.01_lowFst[[el]] <- pValList[i, 1]
                    el <- el + 1
                } else {
                    lociNames_0.01_highFst[[eh]] <- pValList[i, 1]
                    eh <- eh + 1
                } 
            }
        }       
    }
     
    FST_h0.05 <- t(as.matrix(as.data.frame(FST_h0.05)))
    FST_0.05 <- t(as.matrix(as.data.frame(FST_0.05)))
    FST_0.01 <- t(as.matrix(as.data.frame(FST_0.01)))
    lociNames_0.01 <- as.vector(as.character(lociNames_0.01))
    
    lociNames_0.01_lowFst <- as.vector(as.character(lociNames_0.01_lowFst))
    lociNames_0.01_highFst <- as.vector(as.character(lociNames_0.01_highFst))
    lociNames_0.05_lowFst <- as.vector(as.character(lociNames_0.05_lowFst))  
    lociNames_0.05_highFst <- as.vector(as.character(lociNames_0.05_highFst)) 
    
    write.table(lociNames_0.01_lowFst, paste(outfile, "LociUnderSelection_low", fStat, "_0.01.txt", sep=""), quote=FALSE, row.names=FALSE, col.names=c("loci"))
    write.table(lociNames_0.05_lowFst, paste(outfile, "LociUnderSelection_low", fStat, "_0.05.txt", sep=""), quote=FALSE, row.names=FALSE, col.names=c("loci"))
    write.table(lociNames_0.01_highFst, paste(outfile, "LociUnderSelection_high", fStat, "_0.01.txt", sep=""), quote=FALSE, row.names=FALSE, col.names=c("loci"))
    write.table(lociNames_0.05_highFst, paste(outfile, "LociUnderSelection_high", fStat, "_0.05.txt", sep=""), quote=FALSE, row.names=FALSE, col.names=c("loci"))
     
    

  # graphic---------------------------------------------------------------------
  outfileGraphic <- paste(outfile, "lociSelection_", fStat," ", timeAttr,".png",
                           sep="") 
                             
  #save graphic
   png(outfileGraphic, width = 1300, height = 1300, res=144)

      plot(FST_h0.05, cex=0.8, xlab="Heterozygosity", ylab="", main="",
            xlim=c(MinHet, MaxHet), ylim=c(MinF, MaxF), cex.axis=0.9)

      if(fStat == "FST"){
        mtext(text=expression(bold(Detection~of~loci~under~selection~from~genome~scans~based~on~F[ST])),
                 side=3, line=1.5, cex=1.2)
        mtext(text=expression(F[ST]), side=2, line=2.5, cex=1.2)
      } else {
        mtext(text=expression(bold(Detection~of~loci~under~selection~from~genome~scans~based~on~F[CT])),
                 side=3, line=1.5, cex=1.2)
        mtext(text=expression(F[CT]), side=2, line=2.5, cex=1.2)
      }

      if(length(FST_0.05) != 0){
         points(FST_0.05, pch=16, cex=0.8, col="blue")
      }
      if(length(FST_0.01) != 0){
        points(FST_0.01, pch=16, cex=0.8, col="red3")
      }
      
      lines(FStatCiList[,1], FStatCiList[,5])
      
      lines(FStatCiList[,1], FStatCiList[,4], lty=5)
      lines(FStatCiList[,1], FStatCiList[,6], lty=5)
      
      lines(FStatCiList[,1], FStatCiList[,3], lty=2, col="blue")
      lines(FStatCiList[,1], FStatCiList[,7], lty=2, col="blue")
      
      lines(FStatCiList[,1], FStatCiList[,2], lty=3, col="red3")
      lines(FStatCiList[,1], FStatCiList[,8], lty=3, col="red3")
    
      legend("topleft",
             c("", "", "", "50% quantile", "10% quantile", "5% quantile", "1% quantile"),
             lty=c(1, 1, 1, 1, 5, 2, 3),
             col=c("white", "white", "white", "black", "black", "blue", "red3"),
             cex=0.8,  bty="n")
            
      legend("topleft", legend=c("p > 5%", "p <= 5%", "p <= 1%"),
             pch=c(1, 16, 16), col=c("black", "blue", "red3"), cex=0.8, bty="n")
 
  dev.off()
  
  
  
  
  
  # graphic---------------------------------------------------------------------
  outfileGraphic <- paste(outfile, "lociSelection_Names_", fStat," ", timeAttr,".png",
                           sep="")


  #save graphic
  png(outfileGraphic, width = 1300, height = 1300, res=144)


      plot(FST_h0.05, cex=0.8, xlab="Heterozygosity", ylab="", main="",
            xlim=c(MinHet, MaxHet), ylim=c(MinF, MaxF), cex.axis=0.9)

      if(fStat == "FST"){
        mtext(text=expression(bold(Detection~of~loci~under~selection~from~genome~scans~based~on~F[ST])),
                 side=3, line=1.5, cex=1.2)
        mtext(text=expression(F[ST]), side=2, line=2.5, cex=1.2)
      } else {
        mtext(text=expression(bold(Detection~of~loci~under~selection~from~genome~scans~based~on~F[CT])),
                 side=3, line=1.5, cex=1.2)
        mtext(text=expression(F[CT]), side=2, line=2.5, cex=1.2)
      }

      if(length(FST_0.05) != 0){
         points(FST_0.05, pch=16, cex=0.8, col="blue")
      }
      if(length(FST_0.01) != 0){
        points(FST_0.01, pch=16, cex=0.7, col="red3")
        text(FST_0.01, lociNames_0.01, adj = c(-0.3,0.3), cex=0.75, col="red3")
      }

      lines(FStatCiList[,1], FStatCiList[,5])

      lines(FStatCiList[,1], FStatCiList[,4], lty=5)
      lines(FStatCiList[,1], FStatCiList[,6], lty=5)

      lines(FStatCiList[,1], FStatCiList[,3], lty=2, col="blue")
      lines(FStatCiList[,1], FStatCiList[,7], lty=2, col="blue")

      lines(FStatCiList[,1], FStatCiList[,2], lty=3, col="red3")
      lines(FStatCiList[,1], FStatCiList[,8], lty=3, col="red3")

      legend("topleft",
             c("", "", "", "50% quantile", "10% quantile", "5% quantile", "1% quantile"),
             lty=c(1, 1, 1, 1, 5, 2, 3),
             col=c("white", "white", "white", "black", "black", "blue", "red3"),
             cex=0.8,  bty="n")

      legend("topleft", legend=c("p > 5%", "p <= 5%", "p <= 1%"),
             pch=c(1, 16, 16), col=c("black", "blue", "red3"), cex=0.8, bty="n")

  dev.off()
}