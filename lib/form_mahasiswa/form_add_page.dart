import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/form_mahasiswa/form_provider.dart';
import 'package:task4/model/model_mahasiswa.dart';

class FormAddPage extends StatelessWidget {

  final bool isUpdate;
  final ModelMahasiswa? data;

  FormAddPage({Key? key, this.isUpdate = false, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FormProvider(
            data?.nama ?? '',
            data?.nohp ?? '',
            data?.alamat ?? '',
            data?.pendidikan ?? '',
            data?.pekerjaan ?? '',
            data?.tahun ?? '',
        ),
        child: Consumer<FormProvider>(
          builder: (context, formProvider, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Add Mahasiswa"),
              ),
              body: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    TextFormField(
                      controller: formProvider.isNamaCont,
                      decoration: InputDecoration(
                          hintText: "Enter your name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: formProvider.isNohpCont,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter your telp",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: formProvider.isAlamatCont,
                      decoration: InputDecoration(
                          hintText: "Enter your address",
                          prefixIcon: Icon(Icons.location_on),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: formProvider.isPendidikanCont,
                      decoration: InputDecoration(
                          hintText: "Enter your study",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: formProvider.isPekerjaanCont,
                      decoration: InputDecoration(
                          hintText: "Enter your work",
                          prefixIcon: Icon(Icons.work),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: formProvider.isTahunCont,
                      decoration: InputDecoration(
                          hintText: "Enter your years",
                          prefixIcon: Icon(Icons.calendar_month),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          )
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(20),
                child: MaterialButton(
                  onPressed: (){
                    if(data != null){
                      formProvider.updateDataMahasiswa(context, data?.id.toString() ?? '' );
                    }else{
                      formProvider.addDataMahasiswa(context);
                    }
                  },
                  color: Colors.blue,
                  height: 70,
                  child: Text(data != null ? "Update Data" : "Save Data", style: TextStyle(color: Colors.white),),
                ),
              ),
            );
          },
        ),
    );
  }
}
