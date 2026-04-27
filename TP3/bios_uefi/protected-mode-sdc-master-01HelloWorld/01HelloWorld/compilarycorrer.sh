as -g -o main.o main.S
ld --oformat binary -o main.img -T link.ld main.o
qemu-system-x86_64 -hda main.img

# qemu-system-i386 -fda main.img -boot a -s -S -monitor none >/tmp/qemu-tp3.log 2>&1 & sleep 1 && gdb main.o -ex "set architecture i8086" -ex "target remote localhost:1234" -ex "break *0x7c00" -ex "continue"
