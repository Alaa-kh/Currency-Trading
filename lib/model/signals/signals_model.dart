// To parse this JSON data, do
//
//     final signalsModel = signalsModelFromJson(jsonString);

import 'dart:convert';

SignalsModel signalsModelFromJson(String str) =>
    SignalsModel.fromJson(json.decode(str));

String signalsModelToJson(SignalsModel data) => json.encode(data.toJson());

class SignalsModel {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  SignalsModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory SignalsModel.fromJson(Map<String, dynamic> json) => SignalsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  final int id;
  final String currencyType;
  final int open;
  final Account account;
  final DateTime createdAt;
  final double? percentage;
  final int? up;
  final String? type;
  final String? entry;
  final String? stop;
  final String? leverage;
  final double? currentPrice;
  final dynamic analysisLink;
  final DateTime? updatedAt;
  final int? doneTargets;
  final List<Target>? targets;

  Datum({
    required this.id,
    required this.currencyType,
    required this.open,
    required this.account,
    required this.createdAt,
    this.percentage,
    this.up,
    this.type,
    this.entry,
    this.stop,
    this.leverage,
    this.currentPrice,
    this.analysisLink,
    this.updatedAt,
    this.doneTargets,
    this.targets,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        currencyType: json["currency_type"],
        open: json["open"],
        account: accountValues.map[json["account"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        percentage: json["percentage"]?.toDouble(),
        up: json["up"],
        type: json["type"],
        entry: json["entry"],
        stop: json["stop"],
        leverage: json["leverage"],
        currentPrice: json["current_price"]?.toDouble(),
        analysisLink: json["analysis_link"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doneTargets: json["done_targets"],
        targets: json["targets"] == null
            ? []
            : List<Target>.from(
                json["targets"]!.map((x) => Target.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency_type": currencyType,
        "open": open,
        "account": accountValues.reverse[account],
        "created_at": createdAt.toIso8601String(),
        "percentage": percentage,
        "up": up,
        "type": type,
        "entry": entry,
        "stop": stop,
        "leverage": leverage,
        "current_price": currentPrice,
        "analysis_link": analysisLink,
        "updated_at": updatedAt?.toIso8601String(),
        "done_targets": doneTargets,
        "targets": targets == null
            ? []
            : List<dynamic>.from(targets!.map((x) => x.toJson())),
      };
}

enum Account { BASIC, ULTIMATE }

final accountValues =
    EnumValues({"basic": Account.BASIC, "ultimate": Account.ULTIMATE});

class Target {
  final int id;
  final String target;
  final String isDone;
  final String percentage;
  final int up;

  Target({
    required this.id,
    required this.target,
    required this.isDone,
    required this.percentage,
    required this.up,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        id: json["id"],
        target: json["target"],
        isDone: json["is_done"],
        percentage: json["percentage"],
        up: json["up"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "target": target,
        "is_done": isDone,
        "percentage": percentage,
        "up": up,
      };
}

class Links {
  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<Link> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
