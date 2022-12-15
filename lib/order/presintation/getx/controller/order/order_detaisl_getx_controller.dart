import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/usecase/order/get_order_state_usecase.dart';
import 'package:get/get.dart';

class OrderStateGetXController extends GetxController
    with StateMixin<OrderState> {
  final OrderStateUseCase _useCase;

  OrderStateGetXController(this._useCase);

  @override
  void onInit() {
    _execute();
    super.onInit();
  }

  void _execute() async {
    change(null, status: RxStatus.loading());
    var res = await _useCase.execute();
    res.fold(
      (error){
        change(null,status: RxStatus.error(error.message));
        Get.snackbar("Error", error.message, backgroundColor: AppColors.red);
      },
      (data) => change(
        data,
        status: RxStatus.success(),
      ),
    );
  }
}
