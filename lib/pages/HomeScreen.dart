import 'package:app_flutter_hp/controller/getDataController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_flutter_hp/pages/DetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: !getDataController.isLoading.value
            ? Stack(
                children: [
                  _ImagenFondo(),
                  _TextoTitulo(),
                  Positioned(
                    top: 150,
                    bottom: 0,
                    width: width,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.4),
                            itemCount: 160,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: InkWell(
                                  child: SafeArea(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: Colors.amber),
                                      child: Stack(
                                        children: [
                                          _ImagenSombrero(),
                                          _ImagenPersonaje(index),
                                          _NombrePersonaje(),
                                          _CasaPersonaje(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                          herotag: index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _ImagenFondo() {
    return Positioned(
      top: -50,
      right: -50,
      child: Image.asset('images/barita.png', fit: BoxFit.fitWidth, width: 200),
    );
  }

  Widget _TextoTitulo() {
    return Positioned(
      top: 100,
      left: 20,
      child: Text(
        'Personajes',
        style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 30),
      ),
    );
  }

  Widget _ImagenSombrero() {
    return Positioned(
      bottom: 2,
      right: 1,
      child: Image.asset(
        'images/barita.png',
        fit: BoxFit.fitHeight,
        height: 80,
      ),
    );
  }

  Widget _ImagenPersonaje(index) {
    return Positioned(
      bottom: 55,
      left: 5,
      child: Hero(
        tag: index,
        child: CachedNetworkImage(
          imageUrl: 'https://ik.imagekit.io/hpapi/harry.jpg',
          height: 60,
          fit: BoxFit.fitHeight,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _NombrePersonaje() {
    return Positioned(
      top: 8,
      right: 15,
      child: Text(
        'Gender',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
    );
  }

  Widget _CasaPersonaje() {
    return Positioned(
      top: 55,
      right: 10,
      child: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 5, left: 20, top: 20, bottom: 15),
          child: Text(
            'Grfindor',
            style: TextStyle(color: Colors.white, shadows: [
              BoxShadow(
                color: Colors.orange,
                offset: Offset(0, 0),
              ),
            ]),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
