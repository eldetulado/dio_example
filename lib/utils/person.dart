// void main() async {
//   final p = Persona();
//   p.caminar();
  
//   print('Esperando camara...');
//   final camStatus = await p.alistarCamara();
//   if (camStatus) {
//     print('Todos digan whiskyyy');
//     final img = await p.tomarFoto();
//     print('Imagen $img');
//   }

//   p.darCharla();
// }

// class Persona {
//   var move = true;

//   Future<bool> lanzarPelota() {
//     return Future.delayed(const Duration(seconds: 3), () => true);
//   }

//   Future<bool> alistarCamara() {
//     return Future.delayed(const Duration(seconds: 2), () => true);
//   }

//   Future<String> tomarFoto() {
//     return Future.delayed(const Duration(seconds: 3), () => 'IMG-001.jpg');
//   }

//   void caminar() {
//     print('Mover pierna ${move ? 'derecha' : 'izquierda'}');
//     move = !move;
//   }

//   void darCharla() {
//     print('Hola :)');
//   }
// }

