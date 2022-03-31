// ignore_for_file: deprecated_member_use
import 'package:praktikum6/helpers/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// 2031710159 Dikhi Achmad Dani
import 'package:praktikum6/models/Item.dart';
import 'package:praktikum6/pages/entryform.dart';

// 2031710159 Dikhi Achmad Dani
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

//2031710159 Dikhi Achmad Dani
class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item>? itemList;
  @override
  Widget build(BuildContext context) {
    updateListView();
// 2031710159 Dikhi Achmad Dani
    if (itemList == null) {
      itemList = <Item>[];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item\n2031710159 Dikhi Achmad Dani'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Item"),
              onPressed: () async {
                var item = await navigateToEntryForm(context, null);
                if (item != null) {
                  //TODO 2 Panggil Fungsi untuk Insert ke DB Dikhi Achmad Dani 2031710159
                  int result = await dbHelper.insert(item);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Item?> navigateToEntryForm(BuildContext context, Item? item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    })); // 2031710159 DikhiAchmadDani
    return result;
  }

  ListView createListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            isThreeLine: true,
            leading: const CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Icon(Icons.ad_units),
            ), //DikhiAchmadDani2031710159
            title: Text(
              itemList![index].name,
              style: textStyle,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price : " + itemList![index].price.toString()),
                const SizedBox(
                  height: 5.0,
                ),
                Text("Stock : " + itemList![index].stock.toString()),
                Text("Kode Barang : " + itemList![index].kodeBarang.toString()),
              ],
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan ItemDikhiAchmadDani2031710159
                dbHelper.delete(itemList![index].id);
                updateListView();
              },
            ),
            onTap: () async {
              var item = await navigateToEntryForm(context, itemList![index]);
              //TODO 4 Panggil Fungsi untuk Edit data2031710159DikhiAchmadDani
              dbHelper.update(item!);
              updateListView();
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //DikhiAchmad Dani2031710159
      //TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
