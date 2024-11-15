#!/bin/bash
# Script creado por wr3nch

clear


function banner() {
    clear
    cat << "EOF"
       .---.
      /     \
      \.@-@./
      /`\_/`\
     //  _  \\
    | \     )|_
   /`\_`>  <_/ \
   \__/'---'\__/

¡¡¡BIENVENIDO AL YT.SH!!!

Presiona "ENTER" para continuar...
EOF
    read -p ""
echo ""   
}

banner

confirm_install() {
    echo "************************************"
    echo "*  Componentes necesarios no       *"
    echo "*  instalados. Desea instalarlos?  *"
    echo "************************************"
    read -p "Escriba 'si' para instalar: " confirm
    if [[ "$confirm" == "si" ]]; then
        
        sudo pacman -S mpv --noconfirm
        sudo pacman -S yt-dlp --noconfirm
        sudo pacman -S python --noconfirm
        sudo pacman -S python-pip --noconfirm  

    else
        echo "La instalación fue cancelada."
        exit 1
    fi
}

if ! command -v yt-dlp &> /dev/null || ! command -v mpv &> /dev/null; then
    confirm_install
fi

clear

echo "Seleccione la opción:"
echo "1) Escuchar música (1)"
echo "2) Descargar música (2)"
echo "3) Descargar playlist (3)"
echo "4) Descargar video (4)"

read -p "Ingrese el número (1-4): " option

case $option in
    1)
        echo "Ejecutando Script 1..."
        sh Scripts/ytplay.sh
        ;;
    2)
        echo "Ejecutando Script 2..."
        sh Scripts/yt-mp3-download.sh
        ;;
    3)
        echo "Ejecutando Script 3..."
        sh Scripts/yt-playlist.sh
        ;;
    4)
        echo "Ejecutando Script 4..."
        sh Scripts/ytvideod.sh
        ;;
    *)
        echo "Opción no válida. Por favor, ingrese un número entre 1 y 4."
        ;;
esac

