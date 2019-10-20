# mkksiso

Nasty script to create Centos/RHEL bootable EFI images with built in kickstart

    wget http://mirror.mhd.uk.as44574.net/mirror.centos.org/7.7.1908/isos/x86_64/CentOS-7-x86_64-NetInstall-1908.iso


    docker build -t mkksiso:latest .

    docker run -v $PWD:/data --privileged --rm -it mkksiso /mkksiso /data/CentOS-7-x86_64-NetInstall-1908.iso /data/kickstarts/server.ks /data/server.iso

    dd if=server.iso of=/dev/sdX bs=512k
