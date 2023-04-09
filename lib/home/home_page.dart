import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/form_mahasiswa/form_add_page.dart';
import 'package:task4/home/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MahasiswaProvider(),
      child: Consumer<MahasiswaProvider>(
        builder: (context, mahasiswaProvider, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Provider State Management"),
              ),
              body: mahasiswaProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: mahasiswaProvider.listMahasiswa?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                onTap: () async {
                                  await Navigator.push(context, MaterialPageRoute(builder: (context) => FormAddPage(
                                    isUpdate: true,
                                    data: mahasiswaProvider.listMahasiswa?[index],
                                  )));
                                  mahasiswaProvider.listDataMahasiswa();
                                },
                                title: Text(
                                  mahasiswaProvider
                                          .listMahasiswa?[index].nama ??
                                      '',
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(mahasiswaProvider
                                            .listMahasiswa?[index].pendidikan ??
                                        ''),
                                    Text(mahasiswaProvider
                                            .listMahasiswa?[index].pekerjaan ??
                                        ''),
                                    Text(mahasiswaProvider
                                            .listMahasiswa?[index].nohp ??
                                        ''),
                                    Text(mahasiswaProvider
                                            .listMahasiswa?[index].tahun ??
                                        ''),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      mahasiswaProvider.deleteDataMahasiswa(
                                          mahasiswaProvider
                                                  .listMahasiswa?[index].id
                                                  .toString() ??
                                              '');
                                      mahasiswaProvider.listDataMahasiswa();
                                    },
                                    icon: Icon(CupertinoIcons.trash)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormAddPage()));
                mahasiswaProvider.listDataMahasiswa();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
