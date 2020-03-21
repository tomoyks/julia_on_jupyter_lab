FROM ubuntu:18.04
ENV LANG C.UTF-8

##### Install basic libraries #####
RUN apt-get -y update --fix-missing \
 && apt-get -y dist-upgrade \
 && apt-get install -y --no-install-recommends \
      wget curl git vim ca-certificates

##### ADD library installer #####
ADD ./setup.sh /tmp/
ADD ./julia_package_installs.jl /tmp/

WORKDIR /tmp
RUN chmod +x setup.sh; sh ./setup.sh

WORKDIR /work
CMD ["jupyter", "lab", "--allow-root"]


