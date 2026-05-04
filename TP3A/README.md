# TP3A

Este directorio contiene el material del Trabajo Práctico 3 de Sistemas de Computación. La organización de carpetas sigue la misma lógica desarrollada en el informe final [Informe_TP3A.pdf](/home/javier/Documents/University/Computer_Systems/TPs/TP3A/documentation/output/Informe_TP3A.pdf), donde el trabajo quedó dividido en tres bloques:

- exploración del entorno UEFI y la shell
- desarrollo, compilación y análisis de una aplicación EFI
- ejecución en hardware físico (`bare metal`)

## Estructura general

```text
TP3A/
├── documentation/
│   ├── Arquitectura.pdf
│   ├── Informe_TP3a.qd
│   └── output/
├── part1_uefi_exploration/
│   ├── img/
│   └── virtual_disk/
├── part2_development_compilation_security_analysis/
│   ├── img/
│   └── uefi_security_lab/
│       └── build/
├── part3_execution_on_physical_hardware/
│   ├── img/
│   └── usb/
└── README.md
```

## Relación entre carpetas e informe

El contenido del trabajo está distribuido para reflejar directamente las secciones del informe final:

### `documentation/`

Contiene la documentación principal del TP.

- `Arquitectura.pdf`: consigna base del trabajo práctico.
- `Informe_TP3a.qd`: fuente editable del informe en Quarkdown.
- `output/`: carpeta de salida del informe renderizado.

La documentación editable se encuentra en `documentation/`, mientras que el PDF final del informe se encuentra en `documentation/output/`.

Archivo principal generado:

- `documentation/output/Informe_TP3A.pdf`

### `part1_uefi_exploration/`

Reúne el material correspondiente a la primera parte del informe, donde se analiza el entorno UEFI desde la shell. Esta sección del trabajo cubre:

- arranque en entorno virtual con `QEMU` y `OVMF`
- exploración de dispositivos mediante `map`, `ls` y `dh -b`
- análisis de variables globales de arranque (`BootOrder`, `Boot####`)
- inspección de memoria y hardware con `memmap -b`, `pci -b` y `drivers -b`

Subcarpetas relevantes:

- `img/`: capturas usadas en el informe para documentar la shell UEFI, el mapa de memoria, los drivers y las variables.
- `virtual_disk/`: archivos auxiliares utilizados durante las pruebas del entorno virtual.

### `part2_development_compilation_security_analysis/`

Contiene el material de la segunda parte del informe, centrada en la construcción de una aplicación UEFI en C, su compilación al formato `PE/COFF` y su análisis con herramientas estáticas.

Subcarpetas relevantes:

- `uefi_security_lab/`: laboratorio principal donde se encuentra el código fuente y el proceso de build.
- `uefi_security_lab/aplicacion.c`: implementación de la aplicación EFI usada en el trabajo.
- `uefi_security_lab/build/`: artefactos generados durante compilación y enlazado, incluyendo el ejecutable `aplicacion.efi`.
- `img/`: capturas empleadas en el informe para mostrar verificación de formato, pseudocódigo y desensamblado en Ghidra.

Esta carpeta corresponde al bloque del informe donde se explica:

- el uso de `EFI_SYSTEM_TABLE` y `ConOut->OutputString`
- la compilación con `gnu-efi`
- la generación del binario EFI
- la inspección de `0xCC` y su interpretación en Ghidra

### `part3_execution_on_physical_hardware/`

Agrupa la evidencia y los archivos utilizados en la tercera parte del trabajo, dedicada a ejecutar el binario en hardware físico.

Subcarpetas relevantes:

- `usb/`: estructura del medio de arranque preparado para la prueba bare metal.
- `usb/aplicacion.efi`: copia del binario EFI trasladado al medio removible.
- `img/`: evidencia visual de la ejecución sobre hardware físico.

Esta parte del informe documenta:

- la preparación del pendrive en `FAT32`
- el uso de la ruta estándar `EFI/BOOT/BOOTX64.EFI`
- la necesidad de deshabilitar `Secure Boot`
- la ejecución manual de `aplicacion.efi` desde la shell UEFI

## Ubicación de documentación e informe final

- La documentación fuente del trabajo está en `documentation/`.
- El informe editable está en `documentation/Informe_TP3a.qd`.
- El PDF final del informe está en `documentation/output/Informe_TP3A.pdf`.

## Criterio de organización

La estructura del repositorio no está pensada solo para almacenar archivos, sino para separar claramente:

- la consigna y documentación editable
- la evidencia visual de cada etapa
- el código y artefactos generados en la parte de desarrollo
- los recursos específicos de la prueba en hardware real

Esto facilita que el directorio pueda leerse en paralelo con el informe final, entendiendo rápidamente qué carpeta respalda cada sección del trabajo práctico.
