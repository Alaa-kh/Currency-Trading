
import 'dart:convert';

SignalDetailsModel signalDetailsModelFromJson(String str) => SignalDetailsModel.fromJson(json.decode(str));

String signalDetailsModelToJson(SignalDetailsModel data) => json.encode(data.toJson());

class SignalDetailsModel {
    final int status;
    final String msg;
    final Data data;

    SignalDetailsModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory SignalDetailsModel.fromJson(Map<String, dynamic> json) => SignalDetailsModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    final int id;
    final String currencyType;
    final int open;
    final String account;
    final DateTime createdAt;

    Data({
        required this.id,
        required this.currencyType,
        required this.open,
        required this.account,
        required this.createdAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        currencyType: json["currency_type"],
        open: json["open"],
        account: json["account"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "currency_type": currencyType,
        "open": open,
        "account": account,
        "created_at": createdAt.toIso8601String(),
    };
}
