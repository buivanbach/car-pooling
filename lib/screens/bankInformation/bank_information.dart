import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class BankInformationScreen extends StatefulWidget {
  const BankInformationScreen({super.key});

  @override
  State<BankInformationScreen> createState() => _BankInformationScreenState();
}

class _BankInformationScreenState extends State<BankInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Thông tin ví",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          accountHolderName(),
          heightSpace,
          heightSpace,
          banknameField(),
          heightSpace,
          heightSpace,


          accountNumberField(),
        ],
      ),
      bottomNavigationBar: sendToBankButton(context),
    );
  }

  sendToBankButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/paymentSuccess', arguments: {"id": 1});
        },
        child: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.all(fixPadding * 2.0),
          padding: const EdgeInsets.symmetric(
              vertical: fixPadding * 1.4, horizontal: fixPadding * 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: secondaryColor,
            boxShadow: [
              BoxShadow(
                color: secondaryColor.withOpacity(0.1),
                blurRadius: 12.0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Text(
            "Rút về tài khoản 100.000đ",
            style: bold18White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  accountNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Số tài khoản",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 6.0,
              )
            ],
          ),
          child: const TextField(
            style: semibold15Black33,
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding * 1.5,
              ),
              hintText: "Số tài khoản",
              hintStyle: medium15Grey,
            ),
          ),
        )
      ],
    );
  }



  banknameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ngân hàng",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 6.0,
              )
            ],
          ),
          child: const TextField(
            style: semibold15Black33,
            keyboardType: TextInputType.name,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding * 1.5,
              ),
              hintText: "Nhập tên ngân hàng",
              hintStyle: medium15Grey,
            ),
          ),
        )
      ],
    );
  }

  accountHolderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tên người nhận",
          style: semibold15Black33,
        ),
        heightSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 6.0,
              )
            ],
          ),
          child: const TextField(
            style: semibold15Black33,
            keyboardType: TextInputType.name,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding * 1.5,
              ),
              hintText: "Tên người nhận",
              hintStyle: medium15Grey,
            ),
          ),
        )
      ],
    );
  }
}
