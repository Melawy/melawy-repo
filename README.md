# melawy-repo
Linux repo of my arch linux packages

```bash
sudo pacman-key --recv-keys 95F48000540A4DB146583A47C49B5E77FD80302D --keyserver hkps://keys.openpgp.org
sudo pacman-key --lsign-key 95F48000540A4DB146583A47C49B5E77FD80302D
```

или

```bash
sudo pacman-key --lsign-key 95F48000540A4DB146583A47C49B5E77FD80302D --keyserver http://keyserver2.pgp.com
sudo pacman-key --lsign-key 95F48000540A4DB146583A47C49B5E77FD80302D
```

```bash
sudo pacman -S melawy-linux-mirrorlist
```

Добавить в /etc/pacman.conf

```
[melawy]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/melawy-linux-mirrorlist
```

Для UEFI системы с мультизагрузкой (Linux + Windows 11) я использую загрузчик rEFInd (выглядит красиво и поддерживается максимальное разрешение для EFI Framebuffer, в отличии от GRUB, то есть после начала зугрузки ядра Plymouth и сама консоль имеет максимальное разрешение) - посмотреть как это выглядит можно тут https://www.youtube.com/watch?v=gV-4n7IcDdc

Пакеты из AUR или других репозиториев для создания initramfs и efi создают файлы с длинными идентификаторами.

Пакеты, предложенные ниже генерируют файлы, удобные для восприятия человеком.

```
ls -1 /efi/EFI/Linux
```
```
amd-ucode.img
cmdline.txt
initramfs-linux-xanmod-anbox-fallback.img
initramfs-linux-xanmod-anbox.img
intel-ucode.img
linux-xanmod-anbox.efi
linux-xanmod-anbox-fallback.efi
refind_linux.conf
vmlinuz-linux-xanmod-anbox
```

**melawy-dracut-initramfs**:

копирует ядро в /efi/EFI/Linux/vmlinuz-ИМЯ-ЯДРА

копирует initramfs в /efi/EFI/Linux/initramfs-ИМЯ-ЯДРА.img и /efi/EFI/Linux/initramfs-ИМЯ-ЯДРА-fallback.img


**melawy-dracut-ukify**:

копирует efi-файл в /efi/EFI/Linux/linux-ИМЯ-ЯДРА.efi и /efi/EFI/Linux/linux-ИМЯ-ЯДРА-fallback.efi


**melawy-refind-menu-generator**:


```
cat /efi/EFI/refind/manual.conf
```
```
menuentry "EFI Arch Linux (linux-xanmod-anbox)" {
    icon     /EFI/refind/themes/lera-sugar/icons/os_arch.png
    ostype   Linux
    graphics on

    loader   /EFI/Linux/linux-xanmod-anbox.efi

    submenuentry "EFI Arch Linux (linux-xanmod-anbox) fallback" {
        loader   /EFI/Linux/linux-xanmod-anbox-fallback.efi
    }

    submenuentry "Terminal" {
        add_options "systemd.unit=multi-user.target"
    }

    submenuentry "Arch Linux (linux-xanmod-anbox)" {
        loader   /EFI/Linux/vmlinuz-linux-xanmod-anbox
        initrd   /EFI/Linux/initramfs-linux-xanmod-anbox.img
        options  "root=UUID=24f2a700-319b-41f2-853f-c5711cd4081d rw rootflags=subvol=@ quiet splash bgrt_disable nvidia-drm.modeset=1 nvme_load=YES apparmor=1 security=apparmor loglevel=3 systemd.unified_cgroup_hierarchy=0 fsck.mode=force fsck.repair=yes add_efi_memmap initrd=EFI\Linux\intel-ucode.img initrd=EFI\Linux\amd-ucode.img"
    }

    submenuentry "Arch Linux (linux-xanmod-anbox) fallback" {
        loader   /EFI/Linux/vmlinuz-linux-xanmod-anbox
        initrd   /EFI/Linux/initramfs-linux-xanmod-anbox-fallback.img
        options  "root=UUID=24f2a700-319b-41f2-853f-c5711cd4081d rw rootflags=subvol=@ quiet splash bgrt_disable nvidia-drm.modeset=1 nvme_load=YES apparmor=1 security=apparmor loglevel=3 systemd.unified_cgroup_hierarchy=0 fsck.mode=force fsck.repair=yes add_efi_memmap initrd=EFI\Linux\intel-ucode.img initrd=EFI\Linux\amd-ucode.img"
    }
}

menuentry "rEFInd HARD" {
    icon     /EFI/refind/themes/lera-sugar/icons/os_systemd-boot.png
    ostype   Linux
    graphics on
    loader /EFI/refind_hard/refind_x64.efi
}

menuentry "Windows 11" {
    icon      /EFI/refind/themes/lera-sugar/icons/os_win11.png
    ostype    Windows
    loader    /EFI/ms11/Boot/bootmgfw.efi
}

menuentry "Memtest86+ from EFI" {
    icon     /EFI/refind/themes/lera-sugar/icons/tool_memtest.png
    loader   /EFI/memtest/bootx64.efi
}

menuentry "GRUB" {
    icon     /EFI/refind/themes/lera-sugar/icons/os_systemd-boot.png
    ostype   Linux
    graphics on
    loader /EFI/boot/grubx64.efi

    disabled
}

menuentry "Systemd Boot" {
    icon     /EFI/refind/themes/lera-sugar/icons/os_systemd-boot.png
    ostype   Linux
    graphics on
    loader /EFI/systemd/systemd-bootx64.efi

    disabled
}

default_selection "linux"
```

**powersave-tweaks**:

пакет из Garuda Linux, этот пакет помог снизить нагрузку и температуру на моем HP Probook 455 G1, без него система сильно греется при любой нагрузке.

### Donate
[Tinkoff](https://www.tinkoff.ru/rm/fadeeva.valeriya96/9bLRi79066)

[YooMoney](https://yoomoney.ru/to/4100115921160758)

[Qiwi](https://qiwi.com/n/VALERIAFADEEVA)

Etherium 0x981FBf878fe451BDB83BEaF68078394d4B13213f
