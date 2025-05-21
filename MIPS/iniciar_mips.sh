
# Iniciar Interfaz de Red - Esta red utiliza la ruta de 192.168.10.1/24
sudo brctl addbr virbr0
sudo ifconfig virbr0 192.168.10.1/24 up
sudo tunctl -t tap0
sudo ifconfig tap0 192.168.10.10/24 up # Esta es la IP de la maquina principal
sudo brctl addif virbr0 tap0

# Iniciar QEMU - Virtualiza MIPS
qemu-system-mips -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda debian_wheezy_mips_standard.qcow2 -append "root=/dev/sda1" -netdev tap,id=tapnet,ifname=tap0,script=no -device rtl8139,netdev=tapnet -nographic
