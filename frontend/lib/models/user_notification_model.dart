class NotificationItem {
  final String title;
  final String description;
  final String iconPath;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.description,
    required this.iconPath,
    this.isRead = false,
  });
}
