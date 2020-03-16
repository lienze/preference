qemu-system-x86_64 -s \
	-kernel $HOME/kernel/5/arch/x86_64/boot/bzImage \
	-initrd initramfs.cpio.gz \
	-nographic \
	-append "console=ttyS0"
