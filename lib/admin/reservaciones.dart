import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;

class Reservaciones extends StatefulWidget {
  final List<Map<String, dynamic>> hotelRows;

  const Reservaciones({required this.hotelRows, Key? key}) : super(key: key);

  @override
  State<Reservaciones> createState() => _ReservacionesState();
}

class _ReservacionesState extends State<Reservaciones> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.1,
            color: cons.blanco,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Nombre_APP',
                    style: TextStyle(
                        color: cons.gris,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image(
                  image: AssetImage('imagenes/logo.png'),
                  height: 60,
                ),
              ],
            ),
          ),
          Container(
            color: cons.colorPrincipal,
            height: 5,
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: Text("Elimina las reservaciones que han terminado",
                style: TextStyle(
                  color: Color(0xFF1E1F22),
                  fontSize: 20,
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.hotelRows.length,
              itemBuilder: (context, index) {
                final hotel = widget.hotelRows[index];
                return ListTile(
                  title: Text('ID: ${hotel['_id']}\nUsuario: ${hotel['name']}'),
                  subtitle: Text('Fecha de inicio: ${hotel['_id']}\nFecha de término: ${hotel['_id']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('¿Desea borrarlo?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          /*hotelDBHelper.delete(hotel['_id']);
                                          final hotelRows = await hotelDBHelper
                                              .queryAllRows();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => Gestor(
                                                      hotelRows: hotelRows)));*/
                                        },
                                        child: const Text('Aceptar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                    ],
                                  );
                                });
                          }),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
