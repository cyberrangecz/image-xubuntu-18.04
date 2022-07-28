echo "vncconfig -nowin &" > /usr/bin/vnccopypaste.sh
chmod +x /usr/bin/vnccopypaste.sh
echo "[Desktop Entry]" > /etc/xdg/autostart/vnccopypaste.desktop
echo "Type=Application" >> /etc/xdg/autostart/vnccopypaste.desktop
echo "Name=VNC Copy Paste" >> /etc/xdg/autostart/vnccopypaste.desktop
echo "Exec=/usr/bin/vnccopypaste.sh" >> /etc/xdg/autostart/vnccopypaste.desktop
echo "Icon=system-run" >> /etc/xdg/autostart/vnccopypaste.desktop
echo "X-GNOME-Autostart-enabled=true" >> /etc/xdg/autostart/vnccopypaste.desktop
