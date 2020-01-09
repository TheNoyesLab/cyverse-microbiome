FROM rocker/rstudio:3.5.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    wget \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages(c('glmnet', 'latticeExtra'))"
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite(c("dada2", "decontam", "metagenomeSeq", "phyloseq"))'
