import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> listmobil = [
    {
      "Merk": "Honda Brio",
      "Tahun": "2017",
      "Warna": "Kuning",
      "Harga": "Rp. 70,000,000"
    }
  ];

  TextEditingController merk = TextEditingController();
  TextEditingController thn = TextEditingController();
  TextEditingController warna = TextEditingController();
  TextEditingController harga = TextEditingController();

  void _showadd() {
    merk.text = "";
    thn.text = "";
    warna.text = "";
    harga.text = "";
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cars.png',
                      height: 100, fit: BoxFit.scaleDown),
                  TextFormField(
                    controller: merk,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Merk Kendaraan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: thn,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Tahun Pembuatan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: warna,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Warna Kendaraan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: harga,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'en',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      )
                    ],
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Harga Unit',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {
                              String merkadd = merk.text;
                              String tahunadd = thn.text;
                              String warnaadd = warna.text;
                              String hargaadd = harga.text;

                              listmobil.add({
                                "Merk": merkadd,
                                "Tahun": tahunadd,
                                "Warna": warnaadd,
                                "Harga": hargaadd
                              });

                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            icon: new Icon(
                              Icons.add_circle,
                            ),
                            label: new Text("Simpan"),
                            style: ElevatedButton.styleFrom(
                                // side: BorderSide(width: 2.0),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                minimumSize: Size(320.0, 50.0))),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showedit(int index, Map<String, dynamic> listmobil) {
    merk = TextEditingController(text: listmobil["Merk"]);
    thn = TextEditingController(text: listmobil["Tahun"]);
    warna = TextEditingController(text: listmobil["Warna"]);
    harga = TextEditingController(text: listmobil["Harga"]);
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cars.png',
                      height: 100, fit: BoxFit.scaleDown),
                  TextFormField(
                    controller: merk,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Merk Kendaraan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: thn,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Tahun Pembuatan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: warna,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Warna Kendaraan',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: harga,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'en',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      )
                    ],
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Color(0xFFA9BCCF).withOpacity(0.2),
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Harga Unit',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {
                              listmobil["Merk"] = merk.text;
                              listmobil["Tahun"] = thn.text;
                              listmobil["Warna"] = warna.text;
                              listmobil["Harga"] = harga.text;
                              merk.text = "";
                              thn.text = "";
                              warna.text = "";
                              harga.text = "";
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            icon: new Icon(
                              Icons.change_circle,
                            ),
                            label: new Text("Edit"),
                            style: ElevatedButton.styleFrom(
                                // side: BorderSide(width: 2.0),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                minimumSize: Size(320.0, 50.0))),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Data Penjualan Mokas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showadd,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: listmobil.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Container(
                  width: 20,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          _showedit(index, listmobil[index]);
                        },
                        child: Icon(Icons.edit),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            listmobil.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      listmobil[index]["Merk"],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tahun Pembuatan",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          listmobil[index]["Tahun"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Warna",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          listmobil[index]["Warna"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Harga Unit",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Rp. " +
                              CurrencyTextInputFormatter(
                                      locale: 'en',
                                      symbol: '',
                                      decimalDigits: 0)
                                  .format(listmobil[index]["Harga"]),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
