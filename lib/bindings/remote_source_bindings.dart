// import 'package:get/get.dart';
//
// import '../data/remote/authentication_data_source.dart';
// import '../data/remote/delivery_bill_data_source.dart';
// import '../data/remote/orders_data_source.dart';
// import '../data/remote/tracking_data_source.dart';
// import '../data/remote/transaction_data_source.dart';
// import '../data/remote/warehouse_data_source.dart';
// import '../network/dio_provider.dart';
//
// class RemoteSourceBindings implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<AuthenticationDataSource>(() => AuthenticationDataSource(DioProvider.getDio()), fenix: true);
//     Get.lazyPut<OrderDataSource>(() => OrderDataSource(DioProvider.getDio()), fenix: true);
//     Get.lazyPut<DeliveryBillDataSource>(() => DeliveryBillDataSource(DioProvider.getDio()), fenix: true);
//     Get.lazyPut<TrackingsDataSource>(() => TrackingsDataSource(DioProvider.getDio()), fenix: true);
//     Get.lazyPut<WarehouseDataSource>(() => WarehouseDataSource(DioProvider.getDio()), fenix: true);
//     Get.lazyPut<TransactionDataSource>(() => TransactionDataSource(DioProvider.getDio()), fenix: true);
//   }
// }
