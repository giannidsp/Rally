#!/bin/bash

# Variables sin valor (Te toca, Escala)

PAISES_IP=path/to/file/paisesip
RETO2=path/to/file/reto2.sh

# Introducción al primer reto

Intro() {
echo -e "Te recuerdo que una dirección IP es un identificador que necesita cualquier\ncomputadora para acceder a la red. Usualmente, los países tienen rangos de\ndirecciones IP que pueden utilizar. La direccion del atacante es 163.172.162.101.\nEs primordial identificar el país donde se encuentra el atacante. El archivo \"paises_ip\"\ntiene las direcciones IP de cada país. ¿Qué haces?" | pv -qL22
}

# Textos de opciones y respuestas
# O para opciones
# R para respuestas de las opciones elegidas

O:1() {
echo "(1) Buscar archivo"
}
O:1:1() {
echo "(1.1) Leer archivo"
}
O:1:2() {
echo "(1.2) Eliminar el archivo"
}
R:1:2() {
echo -e "¡El archivo de las IP se ha eliminado! ¡Ahora nunca sabremos de donde proviene el ataque!\n¿Estoy ante un usuario inteligente? Ahora solo nos queda intentar frenar el ataque, pero las esperanzas\nde lograrlo acaban de bajar significativamente...#$\"#%\"$\"$\"#$." | pv -qL22
}
O:2() {
echo "(2) ¿Asumimos que la IP proviene de China?"
}
O:3() {
echo "(3) ¿Asumimos que nos ataca el FBI?"
}
O:4() {
echo "(4) ¿Asumimos que nos atacan los rusos?"
}
O:5() {
echo "(5) Llamar a los técnicos"
}
R:5() {
echo -e "*Activando protocolo de comunicación con la oficina de los técnicos*\n... (RET) ... (RET) ... (RET)... no contestan." | pv -qL22
}

R:A() {
echo "Está bien. Asumiremos que el atacante es de $atacante" | pv -qL22 ; sleep 2
}
O:0() {
echo "(0) Volver al menú anterior"
}

# Instrucciones de input

ins() {
	echo "Por favor, Introduce el número de tu elección (sin paréntesis)" | pv -qL22
}

# Lista de opciones principales

options_list() {
sleep 1
O:1
sleep 0.5
O:2
sleep 0.5
O:3
sleep 0.5
O:4
sleep 0.5
O:5
sleep 0.5
ins
}

# Función de inicio (y reinicio)
# Gracias a ella es posible regresar en el script

begining() {
options_list
reto1
}

# Evaluación de casos para cada opción particular

reto1() {
while [[ $OPTION != 1 || $OPTION != 2 || $OPTION != 3 || $OPTION != 4 || $OPTION != 5 ]] ; do
        # Pseudo prompt
	read -p "option> " OPTION
	case $OPTION in
	1) clear
		O:1:1
		sleep 0.5
		O:1:2
		sleep 0.5
		O:0
		sleep 0.5
		ins
		while [[ $OPTION != "1.1" || $OPTION != "1.2" ]] ; do
                read -p "option> " OPTION
		case $OPTION in
			'1.1') clear
				cat $PAISES_IP;;
			'1.2') clear
				R:1:2
				sleep 1
				source $RETO2;;
			'0') clear
				begining;;
		esac ;
	done ;;
	2) clear

		atacante=CHINA
		R:A
		source $RETO2;;
	3) clear 
		atacante=FBI
		R:A
		source $RETO2;;
	4) clear
		atacante=FBI
		R:A
		source $RETO2;;
	5) clear
		R:5
		sleep 2.5
		clear
		options_list
		read -p "option> " OPTION;;
esac;
done
}

# Inicio del script y display de las opciones

clear
Intro
begining

