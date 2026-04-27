# TP3 - Estructura del proyecto

## Descripción general

Esta carpeta contiene el desarrollo del **Trabajo Práctico 3** de Sistemas de
Computación. El contenido está organizado en subcarpetas según cada experiencia
realizada: pruebas de arranque mínimo, ejercicios sobre BIOS/UEFI, transición
a modo protegido y documentación del informe.

## Estructura de cada carpeta

### `bios_uefi/`

Contiene material vinculado a las pruebas y explicaciones sobre BIOS, UEFI y
el ejemplo de impresión inicial.

- `img/`: capturas usadas en el informe, como salidas de QEMU, `objdump`,
  `hd` y GDB Dashboard.
- `protected-mode-sdc-master-01HelloWorld/`: ejemplo base utilizado como
  referencia para algunas pruebas del trabajo.

### `documentation/`

Contiene la documentación escrita del TP.

- `informe_TP3.qd`: archivo fuente del informe en Quarkdown.
- `output/`: carpeta de salida generada al compilar el informe.
- `output/informe_TP3.pdf`: versión PDF del informe.

### `minimalMBR/`

Incluye la experiencia de construcción de un **MBR mínimo**.

- `a.S`: código Assembly mínimo usado para el sector de arranque.
- `a.o`: archivo objeto generado a partir de `a.S`.
- `main.img`: imagen booteable resultante.
- `img/`: capturas y evidencias de compilación, volcado hexadecimal, ejecución
  en QEMU y copia a pendrive.

### `protectedMode/`

Contiene la experiencia principal de paso a **modo protegido**.

- `main.S`: código Assembly que define la GDT, habilita protected mode y
  escribe directamente en memoria VGA.
- `link.ld`: linker script que ubica el programa en `0x7c00` y agrega la firma
  booteable.
- `compilarycorrer.sh`: script que ensambla, linkea y ejecuta la imagen en
  QEMU.
- `main.o`: archivo objeto generado desde `main.S`.
- `main.img`: imagen booteable final usada para la prueba.
- `img/`: captura del resultado en pantalla.
- `.gdb_history`: historial local de comandos usados en GDB.