class ChatModel {
  final String? name;
  final String? message;
  final bool? thereIsMessage;
  final String? time;
  final bool? isOnline;

  ChatModel(
      {this.name, this.message, this.thereIsMessage, this.time, this.isOnline});

  static List<ChatModel> getChatsList() {
    List<ChatModel> _contacts = [];
    ChatModel _contactModel = ChatModel(
        name: 'Ash Stokes',
        message: 'Please can you check the images',
        thereIsMessage: true,
        isOnline: true,
        time: '10:21');
    _contacts.add(_contactModel);

    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);

    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);
    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);

    _contactModel = ChatModel(
        name: 'Gover Ward',
        message:
            'Let’s redesign that landing page, i’m thinking of some ......',
        thereIsMessage: false,
        isOnline: false,
        time: '06:21');
    _contacts.add(_contactModel);

    return _contacts;
  }
}
