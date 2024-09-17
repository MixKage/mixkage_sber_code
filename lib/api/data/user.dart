// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  int id;
  String name;
  NotificationSettings notificationSettings;

  // Конструктор с параметрами
  User({
    required this.id,
    required this.name,
    required this.notificationSettings,
  });

  // Конструктор по умолчанию
  User.defaultConstructor()
      : id = 1,
        name = "John Doe",
        notificationSettings = NotificationSettings.defaultConstructor();

  // Конвертация объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'notificationSettings': notificationSettings.toJson(),
    };
  }

  // Создание объекта из JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      name: json['name'],
      notificationSettings:
          NotificationSettings.fromJson(json['notificationSettings']),
    );
  }

  User copyWith({
    int? id,
    String? name,
    NotificationSettings? notificationSettings,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      notificationSettings: notificationSettings ?? this.notificationSettings,
    );
  }
}

class NotificationSettings {
  SmsSettings sms;
  PushSettings push;
  EmailSettings email;

  // Конструктор с параметрами
  NotificationSettings({
    required this.sms,
    required this.push,
    required this.email,
  });

  // Конструктор по умолчанию
  NotificationSettings.defaultConstructor()
      : sms = SmsSettings.defaultConstructor(),
        push = PushSettings.defaultConstructor(),
        email = EmailSettings.defaultConstructor();

  // Конвертация объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'sms': sms.toJson(),
      'push': push.toJson(),
      'email': email.toJson(),
    };
  }

  // Создание объекта из JSON
  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      sms: SmsSettings.fromJson(json['sms']),
      push: PushSettings.fromJson(json['push']),
      email: EmailSettings.fromJson(json['email']),
    );
  }

  NotificationSettings copyWith({
    SmsSettings? sms,
    PushSettings? push,
    EmailSettings? email,
  }) {
    return NotificationSettings(
      sms: sms ?? this.sms,
      push: push ?? this.push,
      email: email ?? this.email,
    );
  }
}

class SmsSettings {
  bool enabled;
  String? number;

  // Конструктор с параметрами
  SmsSettings({
    required this.enabled,
    this.number,
  });

  // Конструктор по умолчанию
  SmsSettings.defaultConstructor()
      : enabled = true,
        number = "+123456789";

  // Конвертация объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'number': number,
    };
  }

  // Создание объекта из JSON
  factory SmsSettings.fromJson(Map<String, dynamic> json) {
    return SmsSettings(
      enabled: json['enabled'],
      number: json['number'],
    );
  }

  SmsSettings copyWith({
    bool? enabled,
    String? number,
  }) {
    return SmsSettings(
      enabled: enabled ?? this.enabled,
      number: number ?? this.number,
    );
  }
}

class PushSettings {
  bool enabled;

  // Конструктор с параметрами
  PushSettings({
    required this.enabled,
  });

  // Конструктор по умолчанию
  PushSettings.defaultConstructor() : enabled = true;

  // Конвертация объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
    };
  }

  // Создание объекта из JSON
  factory PushSettings.fromJson(Map<String, dynamic> json) {
    return PushSettings(
      enabled: json['enabled'],
    );
  }

  PushSettings copyWith({
    bool? enabled,
  }) {
    return PushSettings(
      enabled: enabled ?? this.enabled,
    );
  }
}

class EmailSettings {
  bool enabled;
  String? address;

  // Конструктор с параметрами
  EmailSettings({
    required this.enabled,
    this.address,
  });

  // Конструктор по умолчанию
  EmailSettings.defaultConstructor()
      : enabled = false,
        address = "john.doe@example.com";

  // Конвертация объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'address': address,
    };
  }

  // Создание объекта из JSON
  factory EmailSettings.fromJson(Map<String, dynamic> json) {
    return EmailSettings(
      enabled: json['enabled'],
      address: json['address'],
    );
  }

  EmailSettings copyWith({
    bool? enabled,
    String? address,
  }) {
    return EmailSettings(
      enabled: enabled ?? this.enabled,
      address: address ?? this.address,
    );
  }
}
