// // ignore_for_file: unnecessary_getters_setters

// class MessageData {
//   String _message;
//   bool _isSender;

//   MessageData(this._message, this._isSender);

//   String get message => _message;

//   set message(String value) {
//     _message = value;
//   }

//   bool get isSender => _isSender;

//   set isSender(bool value) {
//     _isSender = value;
//   }
// }

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}