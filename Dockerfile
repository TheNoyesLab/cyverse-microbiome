FROM rocker/rstudio:3.5.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    wget \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("phyloseq")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("decontam")'
RUN Rscript -e "install.packages('glmnet')"
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("metagenomeSeq")'
RUN Rscript -e "install.packages('latticeExtra')"
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("dada2")'
