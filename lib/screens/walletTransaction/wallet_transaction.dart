import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class WalletTransactionScreen extends StatefulWidget {
  const WalletTransactionScreen({super.key});

  @override
  State<WalletTransactionScreen> createState() =>
      _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen> {
  final transactionList = [
    {
      "title": "Trả cho tài xế",
      "name": "Tạ Bảo",
      "date": "24/04/2024",
      "amount": "200.000đ",
      "expense": true
    },
    {
      "title": "Trả cho tài xế",
      "name": "Tạ Bảo",
      "date": "10/05/2024",
      "amount": "500.000đ",
      "expense": true
    },
  ];

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
          "Transaction",
          style: semibold18White,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionList[index]['title'].toString(),
                            style: semibold15Black33,
                            overflow: TextOverflow.ellipsis,
                          ),
                          height5Space,
                          Text(
                            "${transactionList[index]['name']} | ${transactionList[index]['date']}",
                            style: semibold13Grey,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "\$${transactionList[index]['amount']}",
                      style: transactionList[index]['expense'] == true
                          ? semibold16Red
                          : semibold16Green,
                    )
                  ],
                ),
              ),
              transactionList.length == index + 1
                  ? const SizedBox()
                  : Container(
                      height: 1,
                      width: double.maxFinite,
                      color: greyD4Color,
                    )
            ],
          );
        },
      ),
    );
  }
}
