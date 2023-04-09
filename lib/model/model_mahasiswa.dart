// To parse this JSON data, do
//
//     final modelMahasiswa = modelMahasiswaFromJson(jsonString);

import 'dart:convert';

List<ModelMahasiswa> modelMahasiswaFromJson(String str) => List<ModelMahasiswa>.from(json.decode(str).map((x) => ModelMahasiswa.fromJson(x)));

String modelMahasiswaToJson(List<ModelMahasiswa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelMahasiswa {
  ModelMahasiswa({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.the5,
    required this.the6,
    required this.id,
    required this.nama,
    required this.nohp,
    required this.alamat,
    required this.pendidikan,
    required this.pekerjaan,
    required this.tahun,
  });

  String the0;
  String the1;
  String the2;
  String the3;
  String the4;
  String the5;
  String the6;
  String id;
  String nama;
  String nohp;
  String alamat;
  String pendidikan;
  String pekerjaan;
  String tahun;

  factory ModelMahasiswa.fromJson(Map<String, dynamic> json) => ModelMahasiswa(
    the0: json["0"],
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    the4: json["4"],
    the5: json["5"],
    the6: json["6"],
    id: json["id"],
    nama: json["nama"],
    nohp: json["nohp"],
    alamat: json["alamat"],
    pendidikan: json["pendidikan"],
    pekerjaan: json["pekerjaan"],
    tahun: json["tahun"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1,
    "2": the2,
    "3": the3,
    "4": the4,
    "5": the5,
    "6": the6,
    "id": id,
    "nama": nama,
    "nohp": nohp,
    "alamat": alamat,
    "pendidikan": pendidikan,
    "pekerjaan": pekerjaan,
    "tahun": tahun,
  };
}
