import 'package:flutter/material.dart';
import '../shared/app_color.dart';
import '../shared/images_path.dart';
import '../shared/utility.dart';
import '../widgets/next_page_routing.dart';
import 'home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Utility.waitFor(2).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          NextPageRoute(const HomeScreen(), isMaintainState: true),
          (route) => false);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.WHITE,
      body: Center(
        child: Image.asset(
          ImagePath.SPLASH_LOGO,
          height: 120,
          width: 125,
        ),
      ),
    );
  }
}
