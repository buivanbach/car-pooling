import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: f8Color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 20.0,
        title: const Text(
          "Ví",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0, fixPadding, fixPadding * 2.0, fixPadding * 2.0),
        children: [
          topImage(size),
          balanceBox(),
        ],
      ),
    );
  }

  topImage(Size size) {
    return Image.asset(
      "assets/wallet/credit card.png",
      height: size.height * 0.23,
    );
  }

  balanceBox() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 1.4, vertical: fixPadding * 3.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            "0 VNĐ",
            style: medium30Primary,
          ),
          heightSpace,
          height5Space,
          const Text(
            "Số dư ví",
            style: medium18Grey,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          height5Space,
          optionWidget(
              Mdi.swap_vertical, "Lịch sử giao dịch", "Xem tất cả giao dịch của bạn",
              () {
            Navigator.pushNamed(context, '/walletTransaction');
          }),
          heightSpace,
          heightSpace,
          optionWidget(
              Mdi.wallet_add_outline, "Nạp tiền vào ví", "Dễ dàng sử dụng",
              () {
            Navigator.pushNamed(context, '/addAndSendMoney',
                arguments: {"id": 0});
          }),
          heightSpace,
          heightSpace,
          optionWidget(Mdi.credit_card_outline, "Rút về ngân hàng",
              "Tiện lợi và nhanh chóng", () {
            Navigator.pushNamed(context, '/addAndSendMoney',
                arguments: {"id": 1});
          }),
        ],
      ),
    );
  }

  optionWidget(String icon, String title, String subTitle, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding, vertical: fixPadding * 1.6),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.15),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.15),
                    blurRadius: 6.0,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Iconify(
                icon,
                size: 22.0,
                color: secondaryColor,
              ),
            ),
            widthSpace,
            width5Space,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: semibold16Black33,
                  ),
                  height5Space,
                  Text(
                    subTitle,
                    style: medium14Grey,
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: blackColor,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
