import 'package:ace_farmer/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:ace_farmer/screens/auth/login.dart';
import 'package:ace_farmer/screens/auth/signup.dart';
import 'package:ace_farmer/screens/auth/forget_password.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      // case '/Debug':
      //   return MaterialPageRoute(builder: (_) => DebugWidget(routeArgument: args as RouteArgument));
      // case '/Splash':
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/MobileVerification':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      // case '/MobileVerification2':
      //   return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginWidget());
      // case '/Profile':
      //   return MaterialPageRoute(builder: (_) => ProfileWidget());
      // case '/About':
      //   return MaterialPageRoute(builder: (_) => AboutWidget());
      case '/ForgetPassword':
        return MaterialPageRoute(builder: (_) => ForgetPasswordWidget());
      case '/Dashboard':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      // case '/Pages':
      //   return MaterialPageRoute(builder: (_) => PagesWidget(currentTab: args));
      // case '/Details':
      //   return MaterialPageRoute(builder: (_) => DetailsWidget(routeArgument: args as RouteArgument));
      // case '/Menu':
      //   return MaterialPageRoute(builder: (_) => MenuWidget(routeArgument: args as RouteArgument));
      // case '/ResMenu':
      //   return MaterialPageRoute(builder: (_) => ResMenuWidget(routeArgument: args as RouteArgument));
      // case '/Food':
      //   return MaterialPageRoute(builder: (_) => FoodWidget(routeArgument: args as RouteArgument));
      // case '/Category':
      //   return MaterialPageRoute(builder: (_) => CategoryWidget(routeArgument: args as RouteArgument));
      // case '/Cart':
      //   return MaterialPageRoute(builder: (_) => CartWidget(routeArgument: args as RouteArgument));
      // case '/Tracking':
      //   return MaterialPageRoute(builder: (_) => TrackingWidget(routeArgument: args as RouteArgument));
      // case '/Reviews':
      //   return MaterialPageRoute(builder: (_) => ReviewsWidget(routeArgument: args as RouteArgument));
      // case '/PaymentMethod':
      //   return MaterialPageRoute(builder: (_) => PaymentMethodsWidget());
      // case '/DeliveryAddresses':
      //   return MaterialPageRoute(builder: (_) => DeliveryAddressesWidget());
      // case '/DeliveryPickup':
      //   return MaterialPageRoute(builder: (_) => DeliveryPickupWidget(routeArgument: args as RouteArgument));
      // case '/Checkout':
      //   return MaterialPageRoute(builder: (_) => CheckoutWidget());
      // case '/CashOnDelivery':
      //   return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: RouteArgument(param: 'Cash on Delivery')));
      // case '/PayOnPickup':
      //   return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: RouteArgument(param: 'Pay on Pickup')));
      // case '/PayPal':
      //   return MaterialPageRoute(builder: (_) => PayPalPaymentWidget(routeArgument: args as RouteArgument));
      // case '/RazorPay':
      //   return MaterialPageRoute(builder: (_) => RazorPayPaymentWidget(routeArgument: args as RouteArgument));
      // case '/OrderSuccess':
      //   return MaterialPageRoute(builder: (_) => OrderSuccessWidget(routeArgument: args as RouteArgument));
      // case '/Languages':
      //   return MaterialPageRoute(builder: (_) => LanguagesWidget());
      // case '/Help':
      //   return MaterialPageRoute(builder: (_) => HelpWidget());
      // case '/Settings':
      //   return MaterialPageRoute(builder: (_) => SettingsWidget());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
