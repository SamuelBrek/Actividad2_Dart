import 'dart:io';
import 'dart:core';

/*
Nombre de la escuela: Universidad Tecnologica Metropolitana
Asignatura: Desarrollo Móvil Multiplataforma
Nombre del Maestro: Chuc Uc Joel Ivan
Nombre de la actividad: Actividad 2 (Trabajo individual)
Alumno: 
  Brek Mejia Samuel Alexander
Cuatrimestre: 5
Grupo: B
Parcial: 1
*/

void main() {
  int menu;
  do {
    print("----------------------");
    print("");
    print("MENÚ PRINCIPAL BY SAM BREK");
    print("");
    print("Presiona el número correspondiente");
    print("1 Ejercicio Salario");
    print("2 Ejercicio de número Binario");
    print("3 Ejercicio de Calculo IMC");
    print("4 Ejercicio de Palindromos");
    print("5 Salir del programa");
    print("");
    print("-----------------------");
    print("Número: ");
    menu = int.parse(stdin.readLineSync()!);
    while (menu <= 0 && menu > 5) {
      print("Porfavor ingresa alguno de los valores descritos en el menú");
      menu = int.parse(stdin.readLineSync()!);
    }
    print("");
    if (menu == 1) {
      salario();
    } else if (menu == 2) {
      binario();
    } else if (menu == 3) {
      imc();
    } else if (menu == 4) {
      palindromos();
    } 
  } while (menu != 5);
}

void salario() {
  int actas = 0;
  int count = 1;
  int hworking = 0;
  int extrah = 0;
  int monto = 0;
  int extramonto = 0;
  int montoTotal = 0;
  String desicion = "S";
  while (actas < 2 && desicion.toUpperCase() == "S") {
    print("Escribe tus horas trabajadas en la semana $count");
    hworking = int.parse(stdin.readLineSync()!);
    while (hworking <= 0) {
      print("No ingreses valores iguales a 0 o negativos. Intenta de nuevo");
      hworking = int.parse(stdin.readLineSync()!);
    }
    if (hworking < 27) {
      actas = actas + 1;
      monto = hworking * 120;
      print(
          "Las horas trabajadas no son suficientes (27 hrs mínimo). Tienes $actas reporte(s)");
      print("A pesar de ello, tus horas normales son pagadas: $monto");
      print("");
    } else if (hworking <= 40) {
      monto = hworking * 120;
      print(
          "En la semana $count trabajaste $hworking horas, por lo que tu salario es de $monto pesos");
      print("");
    } else {
      extrah = hworking - 40;
      extramonto = extrah * 175;
      monto = hworking * 120;
      print(
          "En la semana $count trabajaste $hworking horas, es decir, $extrah horas extra, por lo que tu salario es de ${monto + extramonto} pesos");
      print("");
    }
    count = count + 1;
    montoTotal = montoTotal + monto + extramonto;
    extramonto = 0;
    if (actas < 2) {
      print(
          "¿Deseas registrar otra semana? Presiona S si lo deseas, de lo contrario  pulsa cualquier otra tecla");
      desicion = stdin.readLineSync()!;
    }
  }
  if (actas == 2) {
    print("Has sido despedido por tener 2 actas.");
    print("Tu monto total, sin embargo, ha sido de $montoTotal pesos");
  } else {
    print("Monto total acumulado entre las ${count - 1} semanas: $montoTotal");
  }
}

void binario() {
  String desicion = "S";
  while (desicion.toUpperCase() == "S") {
    print("Ingresa el número que deseas convertir a binario");
    int decNum = int.parse(stdin.readLineSync()!); //Número a convertir
    while (decNum <= 0) {
      print("No ingreses valores iguales a 0 o negativos. Intenta de nuevo");
      decNum = int.parse(stdin.readLineSync()!);
    }
    int back = decNum; //Guarda el valor de decNum para imprimirlo
    int binNum = 0; // Numero dónde se almacena la conversión
    int i = 1; //Apoyo para ir acumulando la conversión
    while (decNum > 0) //Mientras las divisiones no queden en 0...
    {
      binNum = binNum + (decNum % 2) * i;
      /*el residuo (1/0) multiplicado por la posición del número
      Es decir, el primer número es de una unidad, el segundo
      ocupa pocisión de una décima, luego centésima....*/
      decNum = (decNum / 2).floor();
      /*Cambie el valor del número inical al dividirlo en 2
      y con el .floor, redondeamos el valor resultante, asi pues,
      si es 2.9, se redondea a 2*/
      i = i * 10;
      //Aqui es donde se cambia la posición (décimo, centésimo...)
    }
    print("El valor en binario de $back es: $binNum");

    print("");
    print(
        "¿Deseas probar con otro número? Presiona S si lo deseas, de lo contrario  pulsa cualquier otra tecla");
    desicion = stdin.readLineSync()!;
  }

}

void imc() {
  String desicion = "S";
  while (desicion.toUpperCase() == "S"){
    print("Ingresa tu altura en centímetros");
    double preheight = double.parse(stdin.readLineSync()!);
    while (preheight <= 0) {
      print("No ingreses valores iguales a 0 o negativos. Intenta de nuevo");
      preheight = double.parse(stdin.readLineSync()!);
    }
    print("Ingresa tu peso en kilogramos");
    double weight = double.parse(stdin.readLineSync()!);
    while (weight <= 0) {
      print("No ingreses valores iguales a 0 o negativos. Intenta de nuevo");
      weight = double.parse(stdin.readLineSync()!);
    }
    double height = preheight / 100;
    double imc = weight / (height * height);
    double imcRound = double.parse(imc.toStringAsFixed(2));
    print("");

    if (imcRound < 18.5) {
      print(
          "Con un IMC de $imcRound, tu composición corporal suscita que tienes un peso inferior al normal.");
    } else if (imcRound < 25) {
      print(
          "Con un IMC de $imcRound, tu composición corporal suscita que tienes un peso normal.");
    } else if (imcRound < 30) {
      print(
          "Con un IMC de $imcRound, tu composición corporal suscita que tienes un peso superior al normal.");
    } else {
      print(
          "Con un IMC de $imcRound, tu composición corporal suscita que tienes obesidad.");
    }
    print(
        "¿Deseas probar con otros datos? Presiona S si lo deseas, de lo contrario  pulsa cualquier otra tecla");
    desicion = stdin.readLineSync()!;

  }

}

void palindromos() {
  String palabra;
  String blanks;
  String lower;
  String reverse;
  String desicion = "S";
  int numpalabras;

  while (desicion.toUpperCase() == "S") {
    print('Introduce la frase a evaluar:');
    palabra = stdin.readLineSync()!;
    while (palabra.isEmpty) {
      print("No dejes vacío el campo. Intenta de nuevo");
      palabra = stdin.readLineSync()!;
    }

    print("");
    numpalabras = palabra.split(" ").length;
    lower = palabra.toLowerCase();
    blanks = lower
        .trim()
        .replaceAll(" ", "")
        .replaceAll("_", "")
        .replaceAll(".", "")
        .replaceAll("/", "")
        .replaceAll("-", "")
        .replaceAll(",", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
    reverse = blanks.split('').reversed.join('');
    print("Resultado");
    if (blanks == reverse) {
      print(
          'La palabra $palabra es un palindromo. Número de palabras: $numpalabras');
    } else {
      print("La palabra $palabra NO es un palindromo. Número de palabras: 0");
      /*Puse 0 palabras, debido al ejemplo que se muestra en la tabla, cuando no es palíndromo,
      el número de palabras es 0, sin embargo, si quisieramos saber el número real, pondriamos contador
      como en el primer caso*/
    }
    print("");
    print(
        "¿Deseas probar con otra palabra? Presiona S si lo deseas, de lo contrario  pulsa cualquier otra tecla");
    desicion = stdin.readLineSync()!;
  }
}
