# `drivers_modules`

Este directorio contiene un script en Bash llamado `drivers_modules` cuyo objetivo es relevar, en la PC donde se lo ejecute, los módulos del kernel cargados y los drivers detectados por el sistema a través de `sysfs`.

## Requisitos

- Sistema GNU/Linux.
- Acceso de lectura a `/proc/modules` y `/sys/bus`.
- `bash`, `find`, `awk`, `sed`, `sort`, `uname` y `hostname`.

## Ejecución

Desde esta misma carpeta, dar permisos de ejecución una única vez:

```bash
chmod +x drivers_modules
```

Luego ejecutar:

```bash
./drivers_modules <nombre_archivo>
```

Ejemplo:

```bash
./drivers_modules javier
```

## Salida

El script genera un archivo de texto en la misma carpeta donde se encuentra el propio script. Si el nombre se pasa sin extensión, el script agrega `.txt` automáticamente.

Por ejemplo, al ejecutar:

```bash
./drivers_modules javier
```

se genera:

```text
javier.txt
```

## Contenido del archivo generado

El `.txt` incluye dos bloques principales:

1. `=== MODULOS CARGADOS ===`

Muestra la salida equivalente a `lsmod` (o, en su defecto, una reconstrucción a partir de `/proc/modules`), con el nombre de cada módulo cargado, su tamaño y su contador de uso.

2. `=== DRIVERS DETECTADOS EN /sys/bus ===`

Muestra una tabla con:

- `BUS`: el bus del sistema donde se registró el driver, por ejemplo `pci`, `usb`, `platform`, etc.
- `DRIVER`: nombre del driver detectado.
- `MODULO ASOCIADO`: nombre del módulo del kernel asociado al driver, cuando dicha relación es visible en `sysfs`.
- `DISPOSITIVOS`: cantidad de dispositivos enlazados a ese driver y su identificador.

## Observaciones

- El apartado de drivers se construye a partir de `/sys/bus`, por lo que refleja lo que el kernel expone en tiempo de ejecución.
- Algunos drivers pueden aparecer como `builtin/no-visible`, lo que indica que están integrados en el kernel o que no exponen un vínculo visible hacia un módulo cargable.
- El contenido del archivo depende de la máquina y del estado del sistema al momento de la ejecución.
