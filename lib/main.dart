import 'package:camel_express_user/auth/presentation/screen/forget_password_email_screen.dart';
import 'package:camel_express_user/auth/presentation/screen/forget_password_screen.dart';
import 'package:camel_express_user/bottom_nav_screen.dart';
import 'package:camel_express_user/new_screen/help_and_support_screen.dart';
import 'package:camel_express_user/new_screen/my_order_screen.dart';
import 'package:camel_express_user/order/presintation/getx/binding/address/address_binding.dart';
import 'package:camel_express_user/order/presintation/getx/binding/order/cart_binding.dart';
import 'package:camel_express_user/order/presintation/screen/cart_screen.dart';
import 'package:camel_express_user/order/presintation/screen/order/operation_success_screen.dart';
import 'package:camel_express_user/new_screen/search_screen.dart';
import 'package:camel_express_user/user/presentation/getx/binding/change_password_binding.dart';
import 'package:camel_express_user/user/presentation/getx/binding/profile_binding.dart';
import 'package:camel_express_user/user/presentation/screen/edit_profile_screen.dart';
import 'package:camel_express_user/user/presentation/screen/notifications_screen.dart';
import 'package:camel_express_user/vendor/presentation/getx/binding/product_binding.dart';
import 'package:camel_express_user/vendor/presentation/getx/binding/vendor_binding.dart';
import 'package:camel_express_user/vendor/presentation/screen/categories_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/home_screen.dart';
import 'package:camel_express_user/user/presentation/screen/change_password_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/product/favorites_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'auth/presentation/getx/binding/login_binding.dart';
import 'auth/presentation/getx/binding/register_binding.dart';
import 'auth/presentation/getx/binding/service_locator_binding.dart';
import 'auth/presentation/screen/forget_password_phone_screen.dart';
import 'auth/presentation/screen/login_screen.dart';
import 'auth/presentation/screen/register_screen.dart';
import 'auth/presentation/screen/verification_screen.dart';
import 'core/helpers/app_colors.dart';
import 'core/helpers/text_style.dart';
import 'core/prefs/shared_pref_controller.dart';
import 'order/presintation/getx/binding/order/order_state_binding.dart';
import 'order/presintation/screen/address/address_screen.dart';
import 'order/presintation/screen/order/order_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // abood emad test
  await SharedPrefController().initPreferences();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              toolbarHeight: 40.h,
              iconTheme: const IconThemeData(
                color: AppColors.black,
              ),
              centerTitle: true,
              elevation: 0,
              color: AppColors.white,
              titleTextStyle: AppTextStyle.title,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialBinding: ServiceLocatorBinding(),
          initialRoute: '/login_screen',
          getPages: [
            GetPage(
              name: "/login_screen",
              page: () => const LoginScreen(),
              binding: LoginBinding(),
            ),
            GetPage(
                name: "/register_screen",
                page: () => const RegisterScreen(),
                binding: RegisterBinding()),
            GetPage(
              name: "/forget_password_screen",
              page: () => const ForgetPasswordScreen(),
            ),
            GetPage(
              name: "/forget_password_phone_screen",
              page: () => const ForgetPasswordPhoneScreen(),
            ),
            GetPage(
              name: "/forget_password_email_screen",
              page: () => const ForgetPasswordEmailScreen(),
            ),
            GetPage(
              name: "/verification_screen",
              page: () => const VerificationScreen(),
            ),
            GetPage(
              name: "/home_screen",
              page: () => const HomeScreen(),
              binding: VendorBinding(),
            ),
            GetPage(
              name: "/favorite_screen",
              page: () => FavoritesScreen(),
              binding: ProductBinding(),
            ),
            GetPage(
              name: "/bottom_nav_screen",
              page: () => const BottomNavScreen(),
              binding: VendorBinding(),
            ),
            GetPage(
              name: "/change_password_screen",
              page: () => const ChangePasswordScreen(),
              binding: ChangePasswordBinding(),
            ),
            GetPage(
              name: "/edit_profile_screen",
              page: () => EditProfileScreen(),
              binding: EditProfileBinding(),
            ),
            GetPage(
              name: "/notifications_screen",
              page: () => const NotificationScreen(),
            ),
            GetPage(
              name: "/categories_screen",
              page: () => const CategoriesScreen(),
            ),
            GetPage(
                name: "/cart_screen",
                page: () => const CartScreen(),
                binding: CartBinding()),
            GetPage(
                name: "/address_screen",
                page: () => const AddressScreen(),
                binding: AddressBinding()),
            GetPage(
              name: "/operation_success_screen",
              page: () => const OperationSuccessScreen(),
            ),
            GetPage(
              name: "/order_details_screen",
              page: () => const OrderDetailsScreen(),
              binding: OrderStateBinding(),
            ),
            GetPage(
              name: '/search_screen',
              page: () => const SearchScreen(),
            ),
            GetPage(
              name: '/my_order_screen',
              page: () => const MyOrderScreen(),
            ),
            GetPage(
              name: '/help_and_support_screen',
              page: () => const HelpAndSupportScreen(),
            ),
          ],
        );
      },
    );
  }
}
