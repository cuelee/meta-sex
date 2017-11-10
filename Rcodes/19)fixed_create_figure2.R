  reml_full<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/reml.rst",header=T)
  SSTm<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/male/male_reml.rst",header=T)
  SSTf<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/female/female_reml.rst",header=T)
  traits <-as.character(as.matrix(read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/traits.list")))
  Titles <- c("BMI", "C-reactive protein", "Diastolic blood pressure", "Glucose", "HDL", "Height", "Insulin", "LDL", "Systolic blood pressure", "Triglyceride") 
  
  rownames(reml_full)=traits
  rownames(SSTf)=traits
  rownames(SSTm)=traits
  dir_sf <- rep(1,10);dir_sf[c(1,2,4,5)]=0 
  dir_sm <- rep(1,10);dir_sm[c(4,6,7,8,9,10)]=0 
  
  full_i1_F <- as.matrix(reml_full$V_g)+as.matrix(reml_full$V_f)
  full_i1_M <- as.matrix(reml_full$V_g)+as.matrix(reml_full$V_m)
  full_i2_F <- (as.matrix(reml_full$V_se) * dir_sf )+ as.matrix(reml_full$V_e) 
  full_i2_M <- (as.matrix(reml_full$V_se) * dir_sm )+ as.matrix(reml_full$V_e) 
  full_i3_F <-  full_i1_F/(full_i1_F+full_i2_F)
  full_i3_M <-  full_i1_M/(full_i1_M+full_i2_M)
  SST_i1_F <- as.matrix(SSTf$V_g)
  SST_i1_M <- as.matrix(SSTm$V_g)
  SST_i2_F <- as.matrix(SSTf$V_e)
  SST_i2_M <- as.matrix(SSTm$V_e)
  SST_i3_F <- SST_i1_F/(SST_i1_F+SST_i2_F)
  SST_i3_M <- SST_i1_M/(SST_i1_M+SST_i2_M)
  
  data_list <- list( 
    cbind(log(full_i1_F),log(SST_i1_F))
    ,cbind(log(full_i2_F),log(SST_i2_F))
    ,cbind(full_i3_F,SST_i3_F)
    ,cbind(log(full_i1_M),log(SST_i1_M))
    ,cbind(log(full_i2_M),log(SST_i2_M)) 
    ,cbind(full_i3_M,SST_i3_M) 
    )
  
  Label_list <- list(
     c( expression('log('~sigma^2~''['Full Model']~')'),expression('log('~sigma^2~''['Sex-Specific Model']~')') )
    ,c( expression('log('~sigma^2~''['Full Model']~')'),expression('log('~sigma^2~''['Sex-Specific Model']~')') )
    ,c( expression(h^2~''['Full Model']),expression(h^2~''['Sex-Specific Model']) )
    ,c( expression('log('~sigma^2~''['Full Model']~')'),expression('log('~sigma^2~''['Sex-Specific Model']~')'))
    ,c( expression('log('~sigma^2~''['Full Model']~')'),expression('log('~sigma^2~''['Sex-Specific Model']~')'))
    ,c( expression(h^2~''['Full Model']),expression(h^2~''['Sex-Specific Model']) )
  )
  title_vec <- c(
    "Log-Log Scale Genetic Variance"
    ,"Log-Log Scale Random Error Variance"
    ,"Sex-specific Genetic Heritability"
    ,"Log-Log Scale Genetic Variance"
    ,"Log-Log Scale Random Error Variance"
    ,"Sex-specific Genetic Heritability"
  )
  
  
  if(TRUE){
    pdf(file = "/Users/cuelee/Dropbox/Cue_meta_sex/Figure2/Figure2_R_new.pdf",width=8,height=6)
    par(bg= "white")
    par(mfrow = c(2,2))
    
    #### F
    ####################################
    ####################################
  
    
    par(mar=c(4.5,5.5,3,1))
    
    for ( i in c(1,2,4,5)){  
      
      ## set inpur variables
      cur.x <- data_list[[i]][,1]
      cur.y <- data_list[[i]][,2]
      cur.xlabel <- Label_list[[i]][1]
      cur.ylabel <- Label_list[[i]][2]
      cur.title <- title_vec[i]
      pch.f = 25; if ( i ==1|i ==2|i ==3) cur.pch = pch.f
      pch.m = 24; if ( i ==4|i ==5|i ==6) cur.pch = pch.m
      
      if ( i ==1|i ==2|i ==4|i ==5) {cur.axes = TRUE; cur.xlim = NULL; cur.ylim = NULL ;cur.xaxs = NULL; cur.yaxs = NULL}
      if ( i ==3|i ==6) {cur.axes = FALSE; cur.xlim = NULL; cur.ylim = NULL;cur.xaxs = NULL; cur.yaxs = NULL}
      
      cur.rsquare = format(round(cor(cur.y,cur.x)^2,3),nsmall=3)
      
      ## run plot
      plot (
          x= cur.x
        , y= cur.y
        
        , pch= cur.pch
        , cex = 1.2
        , col = "#888888"
        , bg = "#666666"
        
        , xlab = ""
        , ylab = ""
        
        , xlim = cur.xlim
        , ylim = cur.ylim
        , axes = cur.axes
        
        , xaxs = cur.xaxs
        , yaxs = cur.yaxs
        
        ,frame.plot = TRUE
        )
      legend("topleft", legend = bquote(r^2 : ~.(cur.rsquare)), bty="n", cex=1.2)
      
      abline(a = 0, b = 1,lty = 5)
      
      title(
        main = cur.title
        , ylab = cur.ylabel
        , cex.lab = 1.4
        , family = "sans"
        , cex.main = 1.2
      )      
      
      title(
        xlab = cur.xlabel
        , cex.lab = 1.4
        , family = "sans"
        , line = 3
        
        
      )
      
      ### create manual axes for i = 3, 6
      if ( i ==3|i ==6) {
        axis ( 
          side = 1
          , at = seq(0,1,0.1)
          
        )
        axis ( 
          side = 2
          , at = seq(0.1,0.9,0.2)
        )
      }
      
      
      # ### label the outliers (i = 3, 4)
      # if ( i == 3 ){
      #   
      #   inst.x <- data_list[[i]][10,1]
      #   inst.y <- data_list[[i]][10,2]
      # 
      #   text(x=inst.x-0.260,y=inst.y+0.01,labels = Titles[10],cex = 1.2)
      # }
    
      if ( i == 4 ){
        inst.x <- data_list[[i]][3,1]
        inst.y <- data_list[[i]][3,2]
        text(x=inst.x-3.6,y=inst.y+0.2,labels = Titles[3],cex = 1.2)
      }
      
    }
    dev.off()
  }
  
  
  pdf("/Users/cuelee/Dropbox/Cue_meta_sex/Figure2/Male_new.pdf",width=3,height=0.5)
  par(bg = 'white')
  par(mar=c(0,0,0,0))
  plot(c(1,3),c(0,0)
       ,xlim=c(0.1,2.9)
       ,ylim=c(-1.4,0.4)
       ,lwd=0.01
       ,col="white"
       ,bty="n"
       ,bg = 'white' 
       ,type='l'
       ,xaxt='n'
       ,yaxt='n'
       ,family = "sans"
  )
  text(1.75,-0.5,expression(paste("Male")), cex = 1.8)
  dev.off()
  
  
  pdf("/Users/cuelee/Dropbox/Cue_meta_sex/Figure2/Female_new.pdf",width=3,height=0.5)
  par(bg = 'white')
  par(mar=c(0,0,0,0))
  plot(c(1,3),c(0,0)
       ,xlim=c(0.1,2.9)
       ,ylim=c(-1.4,0.4)
       ,lwd=0.01
       ,col="white"
       ,bty="n"
       ,bg = 'white' 
       ,type='l'
       ,xaxt='n'
       ,yaxt='n'
       ,family = "sans"
  )
  text(1.75,-0.5,expression(paste("Female")), cex = 1.8
       
  )
  dev.off()