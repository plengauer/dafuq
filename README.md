# TheFuck-AI

This project adds the command "fuck" to your environment. Whenever a command in an interactive bash fails, the user can simply run "fuck". This will both release their frustration, and trigger this package to try to fix the failed command!

```
ubuntu@hostname:~$ apt-gt install java
Command 'apt-gt' not found, did you mean:
  command 'apt-get' from deb apt (2.7.3)
Try: sudo apt install <deb name>
ubuntu@hostname:~$ fuck
Retrying command to see what the fuck is going on ...
Analyzing and fixing the fuckery ...
apt-get install java
ubuntu@hostname:~$ apt-get install java
E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
ubuntu@hostname:~$ fuck
Retrying command to see what the fuck is going on ...
Analyzing and fixing the fuckery ...
sudo apt-get install java
ubuntu@hostname:~$ sudo apt-get install java
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package java
ubuntu@hostname:~$ fuck
Retrying command to see what the fuck is going on ...
Analyzing and fixing the fuckery ...
sudo apt-get install default-jdk
ubuntu@hostname:~$ sudo apt-get install default-jdk
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  adwaita-icon-theme at-spi2-common at-spi2-core ca-certificates-java dconf-gsettings-backend dconf-service default-jdk-headless default-jre default-jre-headless fonts-dejavu-extra
  gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme java-common libatk-bridge2.0-0 libatk-wrapper-java libatk-wrapper-java-jni libatk1.0-0 libatspi2.0-0
  libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libdconf1 libfontenc1 libgail-common libgail18 libgif7 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libice-dev libpcsclite1
  libpthread-stubs0-dev libsm-dev libx11-dev libxau-dev libxcb1-dev libxcomposite1 libxdamage1 libxdmcp-dev libxft2 libxinerama1 libxkbfile1 libxt-dev libxtst6 libxxf86dga1 openjdk-17-jdk
  openjdk-17-jdk-headless openjdk-17-jre openjdk-17-jre-headless session-migration ubuntu-mono x11-utils x11proto-dev xorg-sgml-doctools xtrans-dev
Suggested packages:
  cups-common gvfs libice-doc pcscd libsm-doc libx11-doc libxcb-doc libxt-doc openjdk-17-demo openjdk-17-source visualvm libnss-mdns fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei
  | fonts-wqy-zenhei fonts-indic mesa-utils
The following NEW packages will be installed:
  adwaita-icon-theme at-spi2-common at-spi2-core ca-certificates-java dconf-gsettings-backend dconf-service default-jdk default-jdk-headless default-jre default-jre-headless fonts-dejavu-extra
  gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme java-common libatk-bridge2.0-0 libatk-wrapper-java libatk-wrapper-java-jni libatk1.0-0 libatspi2.0-0
  libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libdconf1 libfontenc1 libgail-common libgail18 libgif7 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libice-dev libpcsclite1
  libpthread-stubs0-dev libsm-dev libx11-dev libxau-dev libxcb1-dev libxcomposite1 libxdamage1 libxdmcp-dev libxft2 libxinerama1 libxkbfile1 libxt-dev libxtst6 libxxf86dga1 openjdk-17-jdk
  openjdk-17-jdk-headless openjdk-17-jre openjdk-17-jre-headless session-migration ubuntu-mono x11-utils x11proto-dev xorg-sgml-doctools xtrans-dev
0 upgraded, 59 newly installed, 0 to remove and 0 not upgraded.
Need to get 135 MB of archives.
After this operation, 333 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```

Install via `wget -O - https://raw.githubusercontent.com/plengauer/thefuck-ai/main/INSTALL.sh | sh -E`
