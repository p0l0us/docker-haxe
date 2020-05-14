FROM debian:buster

# upgrade and install packages
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install --no-install-recommends -y \
		sudo \
		wget \
        pciutils \
        zip \
        unzip \
		ant
# setup path	
ENV PATH="/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin:/home/massive/tizen-studio/tools/ide/bin:/home/massive/tizen-studio/tools"

# add "massive" user with uid and gid 1000
RUN adduser --home /home/massive --shell /bin/bash --uid 1000 --quiet massive && \
	echo "massive:massive" | chpasswd && \
	adduser massive sudo && \
	echo "%sudo ALL = NOPASSWD: ALL" > /etc/sudoers.d/sudo_without_password

# use "massive" user
USER massive

# Tizen Studio
RUN wget -O /home/massive/tizen-cli.bin http://download.tizen.org/sdk/Installer/tizen-studio_3.7/web-cli_Tizen_Studio_3.7_ubuntu-64.bin && \
	chmod +x /home/massive/tizen-cli.bin && \
	/home/massive/tizen-cli.bin --accept-license --no-java-check /home/massive/tizen-studio && \
	rm /home/massive/tizen-cli.bin && \
	(while [ 1 ]; do sleep 5; echo y; done) | /home/massive/tizen-studio/package-manager/package-manager-cli.bin install NativeCLI WebCLI

USER root