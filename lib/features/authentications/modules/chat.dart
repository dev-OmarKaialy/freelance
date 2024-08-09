class Chat {
  final String name;
  late final String message;
  late final String time;
  int unreadMessages;
  String imageUrl;

  Chat({
    required this.name,
    required this.message,
    required this.time,
     this.unreadMessages=0,
    required this.imageUrl,
  });
}