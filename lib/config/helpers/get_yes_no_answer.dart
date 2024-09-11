import 'package:dio/dio.dart';
import 'package:hello_world_app/domain/entities/message.dart';
import 'package:hello_world_app/infraestructure/models/yes_no_model.dart';

enum Respuesta { answer, image }

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    // esto facilita a realizar cambios que se presenten en la respuesta response.
    final yesnoModel = YesNoModel.fromJsonMap(response.data);
    return yesnoModel.toMessageEntity();
  }
}
