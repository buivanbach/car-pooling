// import 'package:get/get.dart';
// import '../data/repository/authentication_repository.dart';
// import '../data/repository/delivery_bill_repository.dart';
// import '../data/repository/order_repository.dart';
// import '../data/repository/repository_impl/authentication_repo_impl.dart';
// import '../data/repository/repository_impl/delivery_bill_repo_impl.dart';
// import '../data/repository/repository_impl/order_repo_impl.dart';
// import '../data/repository/repository_impl/tracking_repo_impl.dart';
// import '../data/repository/repository_impl/transaction_repo_impl.dart';
// import '../data/repository/repository_impl/warehouse_repo_impl.dart';
// import '../data/repository/tracking_repository.dart';
// import '../data/repository/transaction_reposioty.dart';
// import '../data/repository/ware_house_repository.dart';
//
// class RepositoryBindings implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepoImpl(), fenix: true);
//     Get.lazyPut<OrderRepository>(() => OrderRepoImpl(), fenix: true);
//     Get.lazyPut<DeliveryBillRepository>(() => DeliveryBillRepoImpl(), fenix: true);
//     Get.lazyPut<TrackingsRepository>(() => TrackingRepoImpl(), fenix: true);
//     Get.lazyPut<WareHouseRepository>(() => WarehouseRepoImpl(), fenix: true);
//     Get.lazyPut<TransactionRepository>(() => TransactionRepoImpl(), fenix: true);
//   }
// }
