FROM ubuntu:trusty

MAINTAINER Leandro Di Tommaso <leandro.ditommaso@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -qy gnuplot \
                        luatex \
                        make \
                        python-pygments \
                        texlive-binaries \
                        texlive-fonts-recommended \
                        texlive-lang-spanish \
                        texlive-latex-base \
                        texlive-latex-extra \
                        texlive-luatex \
                        texlive-xetex \
                        xindy 

RUN ln -s /usr/share/xindy/lang/spanish/modern-utf8-lang.xdy /usr/share/xindy/lang/spanish/utf8-lang.xdy
RUN ln -s /usr/share/xindy/lang/spanish/modern-utf8-test.xdy  /usr/share/xindy/lang/spanish/utf8-test.xdy 
RUN ln -s /usr/share/xindy/lang/spanish/modern-utf8.xdy  /usr/share/xindy/lang/spanish/utf8.xdy      

# Container cleanup.
RUN apt-get remove -y texlive-latex-base-doc \
                      texlive-latex-recommended-doc \
                      texlive-latex-extra-doc \
                      texlive-fonts-recommended-doc \
                      texlive-latex-base-doc \
                      texlive-latex-extra-doc \
                      texlive-latex-recommended-doc \
                      texlive-pictures-doc \
                      texlive-pstricks-doc
RUN apt-get clean
RUN apt-get -y autoremove
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data
VOLUME ["/data"]

COPY ./entrypoint.sh /bin
ENTRYPOINT ["/bin/entrypoint.sh"]
