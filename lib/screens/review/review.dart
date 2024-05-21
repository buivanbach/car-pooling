import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final reviewList = [
    {
      "image": "assets/review/review-1.png",
      "name": "Quang Hùng",
      "date": "25/04/2024",
      "rate": "5.0",
      "detail":
          "Phục vụ tốt, tận tình"
    },
    {
      "image": "assets/review/review-2.png",
      "name": "Hải Biên",
      "date": "02/04/2024",
      "rate": "4.0",
      "detail":
      "Phục vụ tốt, tận tình"
    },
    {
      "image": "assets/review/review-3.png",
      "name": "Trần Thịnh",
      "date": "02/05/2024",
      "rate": "5.0",
      "detail":
      "Xe êm, đi như xe nhà, tài xế thân thiện"
    },
    {
      "image": "assets/review/review-4.png",
      "name": "Tạ Phương",
      "date": "05/05/2024",
      "rate": "4.0",
      "detail":
      "Phục vụ tốt, tận tình"
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
          "Review",
          style: semibold18White,
        ),
      ),
      body: reviewListContent(),
    );
  }

  reviewListContent() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(fixPadding * 2.0),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                        image: DecorationImage(
                          image: AssetImage(
                            reviewList[index]['image'].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewList[index]['name'].toString(),
                            style: semibold16Black33,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            reviewList[index]['date'].toString(),
                            style: medium14Grey,
                          )
                        ],
                      ),
                    ),
                    widthSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewList[index]['rate'].toString(),
                          style: semibold16Grey,
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: secondaryColor,
                          size: 17.0,
                        )
                      ],
                    )
                  ],
                ),
                heightSpace,
                Text(
                  reviewList[index]['detail'].toString(),
                  style: medium14Grey,
                )
              ],
            ),
            reviewList.length == index + 1
                ? const SizedBox()
                : Container(
                    height: 1,
                    width: double.maxFinite,
                    color: greyD4Color,
                    margin:
                        const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
                  )
          ],
        );
      },
      itemCount: reviewList.length,
    );
  }
}
