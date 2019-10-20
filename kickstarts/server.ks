auth --enableshadow --passalgo=sha512
text
reboot
firstboot --disable
firewall --disable
selinux --disabled
ignoredisk --only-use=nvme0n1
keyboard --vckeymap=gb --xlayouts='gb'
lang en_GB.UTF-8

# Network information
network  --bootproto=static --device=enp3s0 --gateway=192.168.0.1 --ip=192.168.0.15 --nameserver=8.8.8.8 --netmask=255.255.255.0 --ipv6=auto --activate
network  --hostname=server

url --url=http://mirror.mhd.uk.as44574.net/mirror.centos.org/7.7.1908/os/x86_64/
rootpw --lock
services --enabled="chronyd"
timezone Europe/London
user --groups=wheel --name=tom --password=$6$Yg06k3O9uyRINrIz$bMHMkTRpb60zuO6pm6K6WuAG5o.MV1YjQJ7pK5xy5oM7IRcPnd7Wi0gzh4xUxhQ3PYcx0oy5qCaryKXGng9IH. --iscrypted --gecos="tom"
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=nvme0n1
autopart --type=lvm
clearpart --all --initlabel --drives=nvme0n1

%packages
@^minimal
@core
chrony
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
