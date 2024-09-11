// mapers para recibir la respueta de la peticion
// con la siguiente estructura
import 'package:hello_world_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
  // para crear un constructor con nombre que devuelva un objeto, se declara como factory
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], image: json['image']);
  // los map son similares o casi iguales a los objetos en javascript o json

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromwho: FromWho.hers,
      imageUrl: image);
}
