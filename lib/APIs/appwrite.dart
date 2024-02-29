import 'package:ai_bot/Helper/global.dart';
import 'package:appwrite/appwrite.dart';
class AppWrite{
  static final _client = Client();
  static final _database=Databases(_client);
  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65c8b6ed58d8aea8e699')
        .setSelfSigned(status: true);
    getApiKey();
  }
  static Future<String> getApiKey()async{
     try{
      final d=await _database.getDocument(
          databaseId: 'MyDatabase',
          collectionId: 'ApiKey',
          documentId: 'chatGptKey'
      );
      apiKey=d.data['apiKey'];
      return apiKey;
     }catch(e){
        return '';
     }
  }
}