import 'package:flutter/material.dart';

class HesaplamaEkrani extends StatelessWidget {
  const HesaplamaEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    final kgFiyat = TextEditingController();
    final kulGram = TextEditingController();
    final gucTuk = TextEditingController();
    final baskiSur = TextEditingController();
    final eFiyat = TextEditingController();
    final yaziciMaliyeti = TextEditingController();
    final yazOmru = TextEditingController();
    final karOrani = TextEditingController();

    double hesaplama(
        double kgFiyat,
        double kulGram,
        double gucTuk,
        double baskiSur,
        double eFiyat,
        double yaziciMaliyeti,
        double yazOmru,
        double karOrani) {
      var filamentMaliyeti = (kulGram / 1000) * kgFiyat;
      var enerjiMaliyeti = (gucTuk / 1000) * baskiSur * eFiyat;
      var amortismanMaliyeti = (yaziciMaliyeti / yazOmru) * baskiSur;
      var toplamMaliyet =
          filamentMaliyeti + enerjiMaliyeti + amortismanMaliyeti;
      var satisFiyati = toplamMaliyet * (1 + karOrani / 100);
      return satisFiyati;
    }

    void hesaplaVeGoster() {
      try {
        double sonuc = hesaplama(
          double.parse(kgFiyat.text),
          double.parse(kulGram.text),
          double.parse(gucTuk.text),
          double.parse(baskiSur.text),
          double.parse(eFiyat.text),
          double.parse(yaziciMaliyeti.text),
          double.parse(yazOmru.text),
          double.parse(karOrani.text),
        );

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Sonuç"),
              content: Text("Hesaplanan satış fiyatı: ${sonuc.toStringAsFixed(2)} TL"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Kapat"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Hata"),
              content: const Text("Lütfen tüm alanları doğru şekilde doldurun."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Tamam"),
                ),
              ],
            );
          },
        );
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("3D Yazıcı Maliyet Hesaplayıcı"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Filament Kilogram Fiyatını Girin",textAlign: TextAlign.center,),
                  ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: kgFiyat,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Fiyat Girin",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Baskıda Kullanılan Filament Miktarını Gram cinsinden Girin",textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: kulGram,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Kullanılan Gram",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Yazıcının güç tüketimi (örneğin 150 Watt)",textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: gucTuk,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Kullanılan Watt",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Baskının süresi (örneğin 2 saat)",textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: baskiSur,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Baskı Süresi",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Elektrik birim fiyatı (örneğin 2 TL/kWh)",textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: eFiyat,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Birim Fiyat",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Yazıcının toplam maliyeti (örneğin 6000 TL)",textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: yaziciMaliyeti,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Yazıcı Maliyeti",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Yazıcının toplam ömrü (örneğin 10,000 saat)",textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: yazOmru,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Yazıcı Ömrü ",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Kar oranı (örneğin %30)"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: karOrani,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "% Kar oranı",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    focusColor: Colors.blueAccent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Divider(),

///////////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: hesaplaVeGoster,
                      child: Text("Hesapla", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
