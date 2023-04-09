import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task4/config/api_config.dart';

class FormProvider extends ChangeNotifier {
  TextEditingController isNamaCont = TextEditingController();
  TextEditingController isNohpCont = TextEditingController();
  TextEditingController isAlamatCont = TextEditingController();
  TextEditingController isPendidikanCont = TextEditingController();
  TextEditingController isPekerjaanCont = TextEditingController();
  TextEditingController isTahunCont = TextEditingController();


  FormProvider(String nama, String nohp, String alamat, String pendidikan, String pekerjaan, String tahun){
    init(
        nama,
        nohp,
        alamat,
        pendidikan,
        pekerjaan,
        tahun
    );
  }

  init(String nama, String nohp, String alamat, String pendidikan, String pekerjaan, String tahun) {
    if(
        nama != null ||
        nohp != null ||
        alamat != null ||
        pendidikan != null ||
        pekerjaan != null ||
        tahun != null ){
      isNamaCont.text = nama;
      isNohpCont.text = nohp;
      isAlamatCont.text = alamat;
      isPendidikanCont.text = pendidikan;
      isPekerjaanCont.text = pekerjaan;
      isTahunCont.text = tahun;
    }
  }



  Future<void> addDataMahasiswa(BuildContext context) async {
    try {
      final response =
          await http.post(Uri.parse(ApiConfig.url + "addmahasiswa.php"), body: {
        'nama': isNamaCont.text,
        'nohp': isNohpCont.text,
        'alamat': isAlamatCont.text,
        'pendidikan': isPendidikanCont.text,
        'pekerjaan': isPekerjaanCont.text,
        'tahun': isTahunCont.text,
      });

      var addMahasiswa = jsonDecode(response.body);
      if (addMahasiswa != null) {
        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text("Add Data Mahasiswa Successfully!", style: TextStyle(color: Colors.white),))
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.red,
                content: Text("Add Data Mahasiswa Failed!", style: TextStyle(color: Colors.white),))
        );
      }

      notifyListeners();

    } catch (e) {
      print(e);
    }
  }

  
  Future<void> updateDataMahasiswa(BuildContext context, String id) async{
    
    try{
      final response = await http.post(Uri.parse(ApiConfig.url + "editmahasiswa.php"), body: {
        'id': id,
        'nama': isNamaCont.text,
        'nohp': isNohpCont.text,
        'alamat': isAlamatCont.text,
        'pendidikan': isPendidikanCont.text,
        'pekerjaan': isPekerjaanCont.text,
        'tahun': isTahunCont.text,
      });
      var updateMahasiswa = jsonDecode(response.body);
      if(updateMahasiswa != null){
        Navigator.pop(context);
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text("Update Data Mahasiswa Successfully!", style: TextStyle(color: Colors.white),))
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.red,
                content: Text("Update Data Mahasiswa Failed!", style: TextStyle(color: Colors.white),))
        );
      }

      notifyListeners();
    }catch(e){
      print(e);
    }
    
  }


}
