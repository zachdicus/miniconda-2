from centos:centos7
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/miniconda/bin

COPY requirements.yml /etc/requirements.yml
RUN yum install -y tar bzip2 tix-8.4.3-12.el7.x86_64 texlive-latex* texlive-cm-super* \
	  texlive-pdfpage* texlive-pdftex* texlive-rotating* texlive-kpathsea* texlive-texconfig* texlive-ec \
	  texlive-was texlive-cm texlive-titlesec* texlive-fancyhdr* texlive-xstring* zip
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /Miniconda3-latest-Linux-x86_64.sh
RUN bash /Miniconda3-latest-Linux-x86_64.sh -p /opt/miniconda -b
RUN conda install affine==2.2.1 attrs=18.2.0 asn1crypto=0.24.0 blas=1.0 \
    boto3=1.7.62 botocore=1.10.62 bzip2=1.0.6 ca-certificates=2018.03.07 \
    cairo=1.14.12 cartopy=0.16.0 certifi=2018.8.13 cffi=1.11.5 \
    cftime=1.0.0b1 chardet=3.0.4 click=7.0 click-plugins=1.0.4 cligj=0.5.0 \
    cycler=0.10.0 cytoolz=0.9.0.1 dbus=1.13.2 descartes=1.1.0 docutils=0.14 \
    expat=2.2.6 fontconfig=2.13.0 freetype=2.9.1 freexl=1.0.5 \
    gdal=2.3.0 geos=3.6.2 giflib=5.1.4 glib=2.56.2 \
    gst-plugins-base=1.14.0 gstreamer=1.14.0 icu=58.2 imageio=2.3.0 \
    idna=2.7 intel-openmp=2018.0.3 jmespath=0.9.3 jpeg=9b json-c=0.13.1 \
    jsonschema kiwisolver=1.0.1 libboost=1.67.0 libdap4=3.19.1 \
    libedit=3.1.20170329 libffi=3.2.1 libgcc-ng=8.2.0 libgdal==2.3.0 \
    libgfortran-ng=7.3.0 libkml=1.3.0 libpng=1.6.36 libstdcxx-ng=8.2.0 \
    libtiff=4.0.9 libuuid=1.0.3 libxcb=1.13 libxml2=2.9.8 \
    libxslt=1.1.32 lxml=4.2.4 matplotlib=3.0.2 mkl=2018.0.3 mkl_fft=1.0.4 \
    mkl_random=1.0.1 mistune ncurses=6.1 numpy=1.15.0 numpy-base=1.15.0 \
    olefile=0.45.1 openjpeg=2.3.0 owslib=0.16.0 pcre=8.42 pillow=5.2.0 \
    pip=10.0.1 pixman=0.34.0 poppler=0.65.0 poppler-data=0.4.9=0 postgresql psycopg2 pyyaml \
    proj4=5.0.1 pycparser=2.18 pyepsg=0.3.2 pyopenssl=18.0.0 pyparsing=2.2.0 \
    pyshp=1.2.12 pysocks=1.6.8 pytest=4.2.0 pytest-cov=2.6.1 python=3.7.0 \
    python-dateutil=2.7.3 pytz=2018.5 readline=7.0 requests=2.19.1 s3transfer=0.1.13 \
    scipy=1.1.0 scikit-image=0.14.1 setuptools=40.0.0 sip=4.19.8 \
    six=1.11.0 sqlalchemy=1.2.10 sqlite=3.26.0 tk=8.6.8 tornado=5.1 \
    urllib3=1.23 wheel=0.31.1 xerces-c=3.2.2 xz=5.2.4_4 zlib=1.2.11
RUN pip install attrs==18.2.0 cython==0.28.5 mkl-fft==1.0.4 mkl-random==1.0.1 flask-dance sqlalchemy_utils flask_login rasterio fiona
RUN yum clean all && \
	  rm -rf /var/cache/yum && \
	  conda clean --all --yes && \
	  rm /Miniconda3-latest-Linux-x86_64.sh
