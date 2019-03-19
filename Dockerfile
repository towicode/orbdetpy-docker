FROM discoenv/jupyter-lab:beta

LABEL MANTAINER TODD WICKIZER (TOWICODE)

USER root

RUN apt-get update
RUN sudo apt-get -y install openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

WORKDIR /home/jovyan/work
ADD sandbox.ipynb /home/jovyan/work
RUN git clone https://github.com/ut-astria/orbdetpy

USER jovyan
RUN python3 -m pip install pyjnius

USER root
COPY entry.sh /usr/bin
RUN mkdir /home/jovyan/.irods
ENTRYPOINT ["bash", "/usr/bin/entry.sh"]