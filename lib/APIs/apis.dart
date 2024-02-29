import 'dart:convert';
import 'dart:io';
import 'package:ai_bot/Helper/global.dart';
import 'package:http/http.dart';

class APIs{
  static Future<String> getAnswer(String question) async {
    try {
      //
      final res =
      await post(Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $apiKey'
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "max_tokens": 2000,
            "temperature": 0,
            "messages": [
              {"role": "user", "content": question},
            ]
          }));
      print('Hi');
      final data = jsonDecode(res.body);
      print(data);
      return data['choices'][0]['message']['content'];
    } catch (e) {
      print(e);
      return 'Something went wrong (Try again in sometime)';
    }
  }
  static Future<List<String>> searchAiImages(String prompt)async{
    try{
      final res=await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));
      final data=jsonDecode(res.body);
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    }catch(e){
      return [];
    }
  }
}