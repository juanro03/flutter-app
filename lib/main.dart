import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carpool App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Variable para almacenar la cantidad seleccionada de pasajeros
    int _selectedPassengers = 1;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40, // Ajusta el tamaño según tu necesidad
            ),
            SizedBox(width: 8), // Espacio entre la imagen y el texto
            Text('CarpoolApp'),
          ],
        ),
        actions: [
          // Botón para buscar viaje
          TextButton.icon(
            icon: Icon(Icons.search, color: Colors.black),
            label: Text(
              'Buscar viaje',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              // Acción para buscar viaje
            },
          ),
          // Botón para publicar viaje
          TextButton.icon(
            icon: Icon(Icons.add_circle_outline, color: Colors.black),
            label: Text(
              'Publicar viaje',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              // Acción para publicar viaje
            },
          ),
          // Menú desplegable de usuario
          PopupMenuButton<String>(
            icon: Icon(Icons.account_circle),
            onSelected: (String value) {
              // Acción dependiendo de la opción seleccionada
              if (value == 'Iniciar sesión') {
                // Navegar a la pantalla de inicio de sesión
              } else if (value == 'Registrarse') {
                // Navegar a la pantalla de registro
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Iniciar sesión', 'Registrarse'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Formulario de búsqueda horizontal
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'De',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'A',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Selector de fecha
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.date_range),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        // manejar la fecha seleccionada
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  // Menú desplegable para seleccionar la cantidad de pasajeros
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        labelText: 'Pasajeros',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      value: _selectedPassengers,
                      items: List<DropdownMenuItem<int>>.generate(
                        8,
                        (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1} pasajero${index == 0 ? '' : 's'}'),
                        ),
                      ),
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          _selectedPassengers = newValue;
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  // Botón de búsqueda
                  ElevatedButton(
                    onPressed: () {
                      // Acción de búsqueda
                    },
                    child: Text('Buscar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
