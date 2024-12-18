import 'package:food_delivery_app/routes/app_routes.dart';
import 'package:food_delivery_app/views/email_verification_view.dart';
import 'package:food_delivery_app/views/forgot_password_view.dart';
import 'package:food_delivery_app/views/reset_password_view.dart';
import 'package:food_delivery_app/views/signup_view.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/views/login_view.dart';
import 'package:food_delivery_app/views/splash_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(name: AppRoutes.forgPasword, page: () => const ForgotPasswordView()),
    GetPage(name: AppRoutes.emailVerification, page: () => const EmailVerificationView()),
    GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordView()),
  ];
}
