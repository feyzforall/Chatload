import 'package:chatload/model/generic_error.dart';
import 'package:chatload/model/message_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';

class RemoteChatRepository {
  final Dio dio = Dio();

  static const String _uri = 'https://api.openai.com/v1/chat/completions';

  RemoteChatRepository();

  Future<Either<GenericError, MessageResponse>> askQuestion(String content) async {
    final Response response = await dio.post(
      _uri,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${Env.key}',
        },
      ),
      data: {
        "model": "gpt-3.5-turbo",
        "temperature": 1.2,
        "max_tokens": 200,
        "messages": [
          {
            "role": "user",
            "content": content,
          },
        ]
      },
    );

    if (response.statusCode == 200) {
      final messageResponse = MessageResponse.fromJson(response.data);
      return Right(messageResponse);
    } else {
      return Left(
        GenericError(
          errorMessage: response.statusMessage.toString(),
          statusCode: response.statusCode!,
        ),
      );
    }
  }
}
