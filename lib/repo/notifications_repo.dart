import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/network/crud.dart';
import 'package:currency_trading/model/notifications_model.dart';
import 'package:currency_trading/utils/constants/app_api.dart';
import 'package:dio/dio.dart';

abstract class NotificationsRepository {
  Future fetchNotifications();
}

class NotificationsRepositoryImpl extends NotificationsRepository {
  @override
  Future fetchNotifications() async {
    print(AppApi.notifis);
    return _fetchData(
      url: AppApi.notifis,
      fromJson: (json) => NotificationsModel.fromJson(json),
    );
  }

  Future _fetchData(
      {required String url,
      required Function fromJson,
      CancelToken? cancelToken}) async {
    try {
      final result = await Crud().get(url: url, cancelToken: cancelToken);
      return result.fold(
        (failure) => failure,
        (data) => fromJson(data),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred');
    }
  }
}