import 'package:http/http.dart' as http;
import 'package:task4/config/api_config.dart';
import 'package:task4/model/model_mahasiswa.dart';

class NetworkProvider{

  Future<List<ModelMahasiswa>?> getDataMahasiswa() async{
    final response = await http.get(Uri.parse(ApiConfig.url + "selectmahasiswa.php"));

    List<ModelMahasiswa> listModelMahasiswa = modelMahasiswaFromJson(response.body);
    return listModelMahasiswa;
  }

}