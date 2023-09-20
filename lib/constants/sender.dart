enum Sender { person, bot }

extension SenderExtension on Sender {
  String get title {
    switch (this) {
      case Sender.person:
        return 'You';
      case Sender.bot:
        return 'CHATLoad';
    }
  }
}
