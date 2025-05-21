# Emulador_Firmware
RootedCon 2025 - Eduardo Chong & Irving Díaz

Repositorio para realizar emulación de arquitecturas MIPS y MIPSEL.

## ⚠️ Aviso Legal

Este proyecto tiene fines **educativos y de investigación** únicamente. No debe ser usado con fines ilícitos ni en entornos de producción sin autorización expresa.

Lee el aviso legal completo al final de este archivo.

## Requerimientos

1. Perseverancia y ser responsable con tus conocimientos.
2. Hacer todo estas pruebas en otra maquina (virtual) que no sea la principal.
3. Leer el aviso legal/disclaimer; Este proyecto debe usarse solo en entornos controlados y con fines legales. Consulta el aviso legal/disclaimer al final para más detalles.
4. Instalar lo siguiente, en esta guía se utiliza Ubuntu.
```
#Instalar QEMU
sudo apt-get install qemu
sudo apt-get install qemu-user
sudo apt-get install qemu-user-static
sudo apt-get install qemu-system

#Instalar otras dependencias
sudo apt-get install libglib2.0 libglib2.0-dev
sudo apt-get install autoconf automake libtool

#Instalar dependencias de red
sudo apt-get install uml-utilities bridge-utils
```
5. Descargar las respectivas imagenes para realizar la emulación. Estas imagenes nos permiten emular la arquitectura de MIPS y MIPSEL, correr el script o descargar manualmente.
```
# En la carpeta de MIPS
wget https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta

# En la carpeta de MIPSEL
wget https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta
```


## Guía

1. Realizar extracción del firmware, se puede utilizar cualquiera de las imagenes en el folder de firmware, con "binwalk -e".
2. Si la extracción se realiza con exito, se puede observar un folder llamado "squashfs-root" con todos los archivos de un Linux muy basico.
3. Se identifica que tipo de arquitectura utiliza el firmware extraido. (Tarea ((Pista: Se utiliza un comando de QEMU para correr un binario (Pista 2: qemu-<arch> -L <prefix> <binary>))))
4. De acorde a la arquitectura encontrada, se corre el respectivo comando de shell en SUDO para empezar la emulación, para ejecutar esto (Pista 3: Solo hay 2 arquitecturas listas para emulación en esta guía)
5. Pasos a seguir:
```
##### Copiar los binarios del firmware extraido hacia la maquina emulada

Las credenciales son root:root

# Cuando termine de cargar el QEMU, utilizar el siguiente comando para declarar una IP estatica
ifconfig eth0 192.168.10.20 up

# En la maquina principal realizando la emulación, correr este comando para copiar el folder de "squashfs-root"
scp -r squashfs-root/ root@192.168.10.20:/root/
```
6. Una vez copiada el folder de "squashfs-root", seguir los pasos:
```
##### Adentro del folder de "squashfs-root", montar los folderes hacia el mismo emulador

mount -o bind /proc proc/
mount -o bind /sys sys/
mount -o bind /dev dev/
chroot . /bin/sh         # /bin/bash o /bin/busybox se pueden utilizar si no funcionan los otros
```
7. El cielo es el limite; Ahora puedes realizar pruebas de penetración y bug bounty en firmwares.

# Créditos y licencias de imágenes

Las imágenes .qcow2 y vmlinux incluidas en MIPS/ y MIPSEL/ son distribuidas por Aurelien Jarno - Debian Developer.

Estas se proporcionan bajo las licencias libres utilizadas por Debian. Ver MIPS/README.md y MIPSEL/README.md para más detalles.

Los firmwares incluidos en la carpeta firmwares/ son versiones libres y oficiales de OpenWRT, distribuidos bajo la licencia GPLv2 (o la que corresponda según cada firmware).

Puedes consultar más información sobre las licencias específicas y el origen en el sitio oficial de OpenWRT: https://openwrt.org/.

# IMPORTANTE - Aviso Legal Completo

Este repositorio y las herramientas aquí descritas están diseñadas exclusivamente con fines educativos, de investigación y para pruebas legales en entornos controlados y autorizados.

No nos hacemos responsables de ningún uso indebido o ilegal que se haga de este material, incluyendo pero no limitado a:

- Acceso no autorizado a sistemas o dispositivos.
- Daños a equipos, datos o redes ajenas.
- Actividades que violen leyes nacionales o internacionales.
- El usuario es el único responsable de cumplir con todas las leyes y regulaciones aplicables en su jurisdicción.

Se recomienda enfáticamente realizar todas las pruebas en entornos seguros, aislados y controlados, tales como máquinas virtuales, y no en sistemas de producción o en redes públicas sin autorización expresa.

El uso inapropiado de esta guía puede tener consecuencias legales graves.

Al utilizar este repositorio, aceptas asumir toda responsabilidad derivada de su uso y liberar a los autores y colaboradores de cualquier reclamación, daño o perjuicio.
