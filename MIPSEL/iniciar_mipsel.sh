
# Iniciar Interfaz de Red - Esta red utiliza la ruta de 192.168.100.1/24
sudo brctl addbr virbr20
sudo ifconfig virbr20 192.168.100.1/24 up
sudo tunctl -t tap20
sudo ifconfig tap20 192.168.100.10/24 up # Esta es la IP de la maquina principal
sudo brctl addif virbr20 tap20

# Iniciar QEMU - Virtualiza MIPSEL
qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1" -netdev tap,id=tapnet,ifname=tap20,script=no -device rtl8139,netdev=tapnet -nographic
