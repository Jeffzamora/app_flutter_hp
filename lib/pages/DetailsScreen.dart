import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final herotag;
  const DetailsScreen({super.key, this.herotag});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FlechaAtras(),
          _NombreHp(),
          _TipoCasa(),
          _ImagenFondo(),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "TEST",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              "ALTURA",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Prueba",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              "565656",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.2),
            child: Hero(
              tag: widget.herotag,
              child: CachedNetworkImage(
                imageUrl: 'https://ik.imagekit.io/hpapi/harry.jpg',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _FlechaAtras() {
    return Positioned(
      top: 35,
      left: 5,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _NombreHp() {
    return Positioned(
      top: 80,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Nombre",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Coquito",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _TipoCasa() {
    return Positioned(
      top: 130,
      left: 25,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(0.8),
          child: Text(
            "Grifindor",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _ImagenFondo() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
      top: height * 0.18,
      right: -30,
      child: Image.asset(
        'images/barita.png',
        height: 200,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
