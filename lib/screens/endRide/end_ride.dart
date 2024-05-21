import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class EndRideScreen extends StatefulWidget {
  const EndRideScreen({super.key});

  @override
  State<EndRideScreen> createState() => _EndRideScreenState();
}

class _EndRideScreenState extends State<EndRideScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool key) {
        onWillpop();
      },
      child: Scaffold(
        body: Column(
          children: [
            rideEndContent(size),
            backToHomeButton(context),
          ],
        ),
      ),
    );
  }

  rideEndContent(Size size) {
    return Expanded(
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          shrinkWrap: true,
          children: [
            Image.asset(
              "assets/endRide/end-ride.png",
              height: size.height * 0.2,
            ),
            heightSpace,
            heightSpace,
            const Text(
              "Kết thúc chuyến đi!",
              style: semibold18Black33,
              textAlign: TextAlign.center,
            ),
            heightSpace,
            const Text(
              "Đã thành chuyến đi!",
              style: semibold14Grey,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  backToHomeButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/bottomBar');
      },
      child: const Text(
        "Trở lại",
        style: semibold16Primary,
      ),
    );
  }

  onWillpop() {
    Navigator.pushNamed(context, '/bottomBar');
  }
}
