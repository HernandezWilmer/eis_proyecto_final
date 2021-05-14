import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:vacunas/models/vacuna.models.dart';

class VacunaProvider {
  Future<List<Vacuna>> getVacunas() async {
    List<Vacuna> listVacunas = [];

    Map<String, String> queryParameters = {
      'fecha_corte': '2021-04-29T00:00:00.000'
    };

    var url = Uri.https(
        'www.datos.gov.co', '/resource/sdvb-4x4j.json', queryParameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      jsonResponse.forEach((item) => {listVacunas.add(Vacuna.fromJson(item))});
    }
    return listVacunas;
  }
}
