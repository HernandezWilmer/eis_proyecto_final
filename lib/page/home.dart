import 'package:flutter/material.dart';
import 'package:vacunas/models/resvacuna.models.dart';
import 'package:vacunas/models/vacuna.models.dart';
import 'package:vacunas/providers/vacunas.provider.dart';
import 'package:vacunas/widget/card.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VacunaProvider vacunaProvider = VacunaProvider();
  Future<List<Vacuna>> listVacunas;

  @override
  void initState() {
    listVacunas = vacunaProvider.getVacunas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vacuna COVID"),
      ),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
        //initialData: [],
        future: listVacunas,
        builder: (BuildContext context, AsyncSnapshot<List<Vacuna>> snapshot) {
          if (snapshot.hasData) {
            final datos = snapshot.data;
            List<String> listaTemporal = [];
            List<CardWidget> departamentos = [];

            datos.forEach((element) {
              if (!listaTemporal.contains(element.nomTerritorio))
                listaTemporal.add(element.nomTerritorio);
            });

            var aux = 0;
            for (var e in listaTemporal) {
              datos.forEach((element) {
                if (element.nomTerritorio == e) {
                  aux += int.parse(element.cantidad);
                }
              });

              departamentos.add(CardWidget(
                  resumen:
                      ResVacuna(nomTerritorio: e, cantidad: aux.toString()),
                  datos: datos));
              aux = 0;
            }
            return ListView(children: departamentos);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
