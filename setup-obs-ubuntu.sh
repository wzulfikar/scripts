#!/bin/sh

# Download and run the script (tested on Ubuntu 20):
# curl -s https://raw.githubusercontent.com/wzulfikar/lab/master/bash/setup-obs-ubuntu.sh | sh
#
# Read notes about the script:
# https://www.notion.so/Setup-OBS-in-Ubuntu-for-24-7-YouTube-Live-Streaming-5949000d598b480aa422657d54ca7da4

echo "installing OBS for ubuntu.."

apt update -y &&
    apt install libxkbcommon0 libxrandr2 libqt5core5a -y &&
    apt-get install software-properties-common -y &&
    add-apt-repository ppa:obsproject/obs-studio -y &&
    apt update -y &&
    apt install screen sed -y &&
    apt install obs-studio -y &&
    apt install ffmpeg vlc -y &&
    apt install tasksel -y &&
    tasksel install ubuntu-desktop &&
    wget -O virtualgl_2.6.3_amd64.deb https://sourceforge.net/projects/virtualgl/files/2.6.3/virtualgl_2.6.3_amd64.deb/download &&
    dpkg -i virtualgl_*.deb &&
    /opt/VirtualGL/bin/vglserver_config -config -s -f -t &&
    wget -O turbovnc_2.2.5_amd64.deb https://sourceforge.net/projects/turbovnc/files/2.2.5/turbovnc_2.2.5_amd64.deb/download &&
    dpkg -i turbovnc_*.deb &&
    sed -i 's/$vncPort = 5900 + $displayNumber;/$vncPort = 5900 + $displayNumber;\nif(defined $ENV{'BASE_PORT'}) {\n  $vncPort = $ENV{'BASE_PORT'} + $displayNumber;\n}/' /opt/TurboVNC/bin/vncserver &&
    BASE_PORT=6700 /opt/TurboVNC/bin/vncserver &&
    /usr/bin/screen -dmS obs /usr/bin/sh -c "DISPLAY=:1 /usr/bin/obs --studio-mode" &&
    echo '@reboot BASE_PORT=6700 /opt/TurboVNC/bin/vncserver' >/tmp/crontab-obs &&
    echo '@reboot /usr/bin/screen -dmS obs /usr/bin/sh -c "DISPLAY=:1 /usr/bin/obs --studio-mode"' >>/tmp/crontab-obs &&
    (crontab -l ; cat /tmp/crontab-obs )| crontab -
