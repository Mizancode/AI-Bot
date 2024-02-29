class Message{
  String msg;
  final MessageType messageType;

  Message({required this.msg,required this.messageType});
}
enum MessageType{user,bot}