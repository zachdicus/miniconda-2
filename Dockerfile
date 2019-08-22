from centos:centos7
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/miniconda/bin

RUN yum install -y tar bzip2 tix-8.4.3-12.el7.x86_64 texlive-latex* texlive-cm-super* \
	  texlive-pdfpage* texlive-pdftex* texlive-rotating* texlive-kpathsea* texlive-texconfig* texlive-ec \
	  texlive-was texlive-cm texlive-titlesec* texlive-fancyhdr* texlive-xstring* zip && \
    curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /Miniconda3-latest-Linux-x86_64.sh && \
    bash /Miniconda3-latest-Linux-x86_64.sh -p /opt/miniconda -b && \
    conda install env update -n root --file requirements.yml && \
    yum clean all && \
	  rm -rf /var/cache/yum && \
	  conda clean --all --yes && \
	  rm /Miniconda3-latest-Linux-x86_64.sh
