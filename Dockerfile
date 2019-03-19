FROM discoenv/jupyter-lab:beta



USER root

WORKDIR /home/jovyan/work
ADD sandbox.ipynb /home/jovyan/work
RUN git clone https://github.com/ut-astria/orbdetpy


RUN apt-get update
RUN sudo apt-get -y install openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64




USER jovyan

RUN python3 -m pip install pyjnius

USER root


CMD ["lab", "--allow-root"]