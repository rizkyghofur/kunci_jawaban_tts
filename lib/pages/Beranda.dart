import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kunci_jawaban_tts/bloc/CariDataBloc.dart';
import 'package:kunci_jawaban_tts/models/responses/JawabanDetailResponse.dart';

class Beranda extends StatefulWidget {
  Beranda({Key key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  TextEditingController editingController = TextEditingController();
  List<JawabanDetailResponse> dataJawaban;
  String title = "";
  int total = 0;
  bool isLoaded = true;
  final CariDataBloc cariDataBloc = CariDataBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kunci Jawaban TTS'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (kata) => getJawaban(kata),
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Cari Kata",
                    hintText: "Cari kata...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: !isLoaded
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : editingController.text.length == 0
                      ? Center(child: Text('Ketik petunjuk di kolom pencarian'))
                      : dataJawaban.length == 0
                          ? Center(child: Text('Jawaban tidak ditemukan'))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: dataJawaban.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBarIndicator(
                                        rating: double.parse(dataJawaban[index]
                                            .stars
                                            .toString()),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 25.0,
                                        direction: Axis.horizontal,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Kata: ' + dataJawaban[index].word,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          'Petunjuk: ' +
                                              dataJawaban[index].clue,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                      Divider()
                                    ],
                                  ),
                                );
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }

  void getJawaban(String kata) async {
    setState(() {
      isLoaded = false;
    });
    await cariDataBloc.ambilData(kata).then((value) {
      setState(() {
        title = value.title;
        total = value.total;
        dataJawaban = value.answers;
        isLoaded = true;
      });
    });
  }
}

Future<bool> cekInternet() async {
  bool adaInternet;
  int timeout = 5;
  try {
    http.Response response = await http
        .get(Uri.parse("https://kunci-tts-api.vercel.app/api"))
        .timeout(Duration(seconds: timeout));
    if (response.statusCode == 200) {
      adaInternet = true;
    } else {
      adaInternet = false;
    }
  } on TimeoutException catch (e) {
    print('Timeout Error: $e');
    adaInternet = false;
  } on SocketException catch (e) {
    print('Socket Error: $e');
    adaInternet = false;
  } on Error catch (e) {
    print('General Error: $e');
    adaInternet = false;
  }
  return adaInternet;
}
