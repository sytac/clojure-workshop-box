# Get Eclipse Luna
wget -P /tmp  http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz

# unpack and cleanup
cd /opt
tar xvzf /tmp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz
rm /tmp/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz

# create a shortcut icon
cat <<EOF > /usr/share/applications/eclipse.desktop
[Desktop Entry]
Name=Eclipse 4
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse
EOF

# install counterclockwise
cd /opt/eclipse
./eclipse -nosplash -application org.eclipse.equinox.p2.director \
          -repository http://download.eclipse.org/releases/luna/,http://updatesite.ccw-ide.org/stable/ \
          -installIU ccw.feature.feature.group
