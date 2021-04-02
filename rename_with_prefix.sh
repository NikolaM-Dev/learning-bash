#!/bin/bash

# prefix, path

error() {
    echo $1
    exit 1
}

# Comprobar que el numero de parametros es correcto
if [ $# -ne 2 ]; then
    error "Uso: $0 prefijo directorio"
fi

# comprobar que el directorio existe
if [ ! -d $2 ]; then
    error "Error: el directorio "$2" no existe"
fi

# Recorrer cada fichero del directorio
for i in `ls $2`; do
    if [ ! -d $i ]; then
        echo $i
        # Guardar en una variable el nombre actual con la ruta completa
        name="$2/$i"
        # Guardar en una variable el nuevo nombre
        new_name="$2/$1$i"
        # Cambiar el nombre del archivo
        mv $name $new_name
        # Imprimir lo que esta haciendo el script
        echo "$name -> $new_name" | tr -s /
    fi
done