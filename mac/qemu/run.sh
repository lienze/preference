qemu-system-x86_64 -no-user-config -nodefaults -show-cursor \
    -M pc-q35-3.1,accel=hvf,usb=off,vmport=off \
    -cpu host -smp 4,sockets=1,cores=2,threads=2 -m 1024 \
    -overcommit mem-lock=off -rtc base=utc,driftfix=slew \
    -drive file=./debian10_x86.img,if=none,format=qcow2,id=disk0 \
    -device virtio-blk-pci,bus=pcie.0,addr=0x1,drive=disk0 \
    -netdev user,id=net0,hostfwd=tcp::3800-:22 \
    -device virtio-net-pci,netdev=net0,bus=pcie.0,addr=0x2 \
    -device virtio-keyboard-pci,bus=pcie.0,addr=0x3 \
    -device virtio-tablet-pci,bus=pcie.0,addr=0x4 \
    -device virtio-vga,bus=pcie.0,addr=0x5 \
    #-cdrom ./debian-10.1.0-i386-netinst.iso -boot d
