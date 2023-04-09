import 'package:flutter/material.dart';
import 'package:task4/config/api_config.dart';
import 'package:task4/model/model_mahasiswa.dart';
import 'package:task4/network/networkprovider.dart';
import 'package:http/http.dart' as http;

class MahasiswaProvider extends ChangeNotifier{

  bool isLoading = true;
  bool deleteLoading = false;

  List<ModelMahasiswa>? listMahasiswa;

  MahasiswaProvider(){
    init();
  }

  void init(){
    listDataMahasiswa();
  }

  Future<List<ModelMahasiswa>?> listDataMahasiswa() async{

    try{

      isLoading = true;
      notifyListeners();

      final response = await NetworkProvider().getDataMahasiswa();
      if(response != null){
        listMahasiswa = response;
        isLoading = false;
        notifyListeners();
      }else{
        Center(
          child: Text("No Data"),
        );
      }


    }catch(e){
      print(e);
    }

  }


  Future<List<ModelMahasiswa>?> deleteDataMahasiswa(String id) async{
    deleteLoading = true;
    notifyListeners();
    try{
      final response = await http.post(Uri.parse(ApiConfig.url + "deletemahasiswa.php"), body: {
        'id': id
      });
      deleteLoading = false;
      notifyListeners();
      List<ModelMahasiswa>? hapusMahasiswa = modelMahasiswaFromJson(response.body);
      return hapusMahasiswa;
    }catch(e){
      print(e);
    }
  }

}