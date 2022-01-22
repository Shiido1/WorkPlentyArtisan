class Chats {
  final String? time;
  final bool? isMe;
  final String? message;

  Chats({this.time, this.isMe, this.message});

  static List<Chats> getMessage() {
    List<Chats> _chats = [];
    Chats _c = Chats(
        time: '12:36',
        isMe: false,
        message:
            'Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.');
    _chats.add(_c);
    _c = Chats(time: '12:36', isMe: false, message: 'Can I send yor files?');
    _chats.add(_c);
    _c = Chats(time: '14:03', isMe: true, message: 'Hey! Okay, send out.');
    _chats.add(_c);
    _c = Chats(
        time: '12:36',
        isMe: false,
        message:
            'Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.');
    _chats.add(_c);
    _c = Chats(time: '12:36', isMe: false, message: 'Can I send yor files?');
    _chats.add(_c);
    _c = Chats(time: '14:03', isMe: true, message: 'Hey! Okay, send out.');
    _chats.add(_c);
    _c = Chats(
        time: '12:36',
        isMe: false,
        message:
            'Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.');
    _chats.add(_c);
    _c = Chats(time: '12:36', isMe: false, message: 'Can I send yor files?');
    _chats.add(_c);
    _c = Chats(time: '14:03', isMe: true, message: 'Hey! Okay, send out.');
    _chats.add(_c);
    return _chats;
  }
}
