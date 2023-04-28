import 'dart:convert';

GetDataModel getDataModelFromJson(String str) =>
    GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  GetDataModel({
    required this.results,
  });

  List<Result> results;

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.hpName,
    required this.hpApodo,
    required this.hpApodoSecond,
    required this.hpEscpecie,
    required this.hpGenero,
    required this.hpCasa,
    required this.hpBord,
    required this.hpSangre,
    required this.hpBarita,
    required this.hpAltura,
    required this.hpPatronus,
    required this.hpActor,
    required this.hpImage,
  });

  String id;
  String hpName;
  String hpApodo;
  String hpApodoSecond;
  String hpEscpecie;
  String hpGenero;
  String hpCasa;
  String hpBord;
  String hpSangre;
  String hpBarita;
  String hpAltura;
  String hpPatronus;
  String hpActor;
  String hpImage;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        hpName: json["hp_name"],
        hpApodo: json["hp_apodo"],
        hpApodoSecond: json["hp_apodo_second"],
        hpEscpecie: json["hp_escpecie"],
        hpGenero: json["hp_genero"],
        hpCasa: json["hp_casa"],
        hpBord: json["hp_bord"],
        hpSangre: json["hp_sangre"],
        hpBarita: json["hp_barita"],
        hpAltura: json["hp_altura"],
        hpPatronus: json["hp_patronus"],
        hpActor: json["hp_actor"],
        hpImage: json["hp_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hp_name": hpName,
        "hp_apodo": hpApodo,
        "hp_apodo_second": hpApodoSecond,
        "hp_escpecie": hpEscpecie,
        "hp_genero": hpGenero,
        "hp_casa": hpCasa,
        "hp_bord": hpBord,
        "hp_sangre": hpSangre,
        "hp_barita": hpBarita,
        "hp_altura": hpAltura,
        "hp_patronus": hpPatronus,
        "hp_actor": hpActor,
        "hp_image": hpImage,
      };
}
