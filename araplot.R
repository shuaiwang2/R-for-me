library(ggplot2)
#设置一个坐标函数
changetoM <- function ( position ){
  position=position/1000000;
  paste(position, "M", sep="")
}
#读取数据
data =read.table("bur_0.anchors", header=TRUE)
#筛选染色体并设置为因子
data = data[which(data$refChr %in% c("Chr1", "Chr2", "Chr3", "Chr4", "Chr5")),]
data = data[which(data$queryChr %in% c("Chr1", "Chr2", "Chr3","Chr4","Chr5")),]
data$refChr = factor(data$refChr, levels=c("Chr1", "Chr2", "Chr3", "Chr4", "Chr5"))
data$queryCh = factor(data$queryChr, levels=c("Chr1", "Chr2", "Chr3", "Chr4", "Chr5" ))
#使用ggplot2包画图并美化它.
ggplot(data=data, aes(x=queryStart, y=referenceStart))+
  geom_point(size=0.5, aes(color=strand)) +
  facet_grid(refChr~queryChr, scales="free", space="free") +
  labs(x="Query_bur_0", y="Reference_tair10")+scale_x_continuous(labels=changetoM) +
  scale_y_continuous(labels=changetoM) +
  theme(axis.line = element_blank(),
        panel.background = element_blank(),
        panel.border = element_rect(fill =NA,color="black", size=0.5, linetype="solid"),
        axis.text.y = element_text( colour = "black"),
        legend.position='none',
        axis.text.x = element_text(angle=300,hjust=0, vjust=0.5, colour = "black") )

