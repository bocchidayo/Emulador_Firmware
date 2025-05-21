#!/bin/bash

# Crear carpeta MIPS y descargar archivos
cd MIPS
wget https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta
cd ..

# Crear carpeta MIPSEL y descargar archivos
cd MIPSEL
wget https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta
cd ..
