import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

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
          "Điều khoản sử dụng",
          style: semibold18White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: const [
          Text(
            "Điều khoản sử dụng",
            style: medium14Grey,
          ),
          heightSpace,
          // Text(
          //   "Lorem ipsum dolor sit amet consecv tetsuspendisse orci cras amet. Viverra massa xamet et diam a nisiac aliquet felis. Duis sagittis ne que hendreritmaecenas suspendisse scelerisque. Exaucest bibendum ornare lacinia in. Turpis rutrum conguxe sollicitudin viverra. Suscipit sagittis cursus arcuxgfh kest mattis. Blandit quam vitae id nunc ornare nec morbi. Sapien massa sed lectus a erat in cras dui ut. Id ut bibendum eget ultrices in nunc. Pretium amet adipiscing mattis ",
          //   style: medium14Grey,
          // ),
          // heightSpace,
          // Text(
          //   "Lorem ipsum dolor sit amet consec textsuspendisse orci cras amet. Vivxerra massa amet et diam a nisiac aliquet felis. Duis sagittis neque hendreritmaecenas suspendisse scelerisque. Eu est bibxendums ornare lacinia in. Turpis rutrum congue sollic citudin viverra. Suscipit sagittis cursus arcugfh kest mattis. Blaxndit quam vitae id nunc ornare nec morbi. Sapien massa sed lectus a erat in cras dui ut. Id ut  bibendum eget ultrices in nunc. Pretium amet adipis cinsadg mattis Lorem ipsum dolor sit amet consectets uspendisse orci cras amet. Viverra massa amet etx diam a nisiac aliquet felis. Duis sagittis neque hendrerit maecenas suspendisse scelerisque. Eu est biaxbendum ornare lacinia in. Turpis rutrum conxgue sollicitudin viverra. Suscipit sagittis cursus arcuxgfh kest mattis. Blandit quam vitae id nunc ornare nec morbi. Sapien massa sed lectus a erat in cras dui ut. Id ut bibendum eget ultrices in nunc. Pretium amet adipiscing mattis ",
          //   style: medium14Grey,
          // ),
          // heightSpace,
          // Text(
          //   "Lorem ipsum dolor sit amet consectetdsuspendisse orci cras amet. Viverra massa amet etd diam a nisiac aliquet felis. Duis sagittis neque hen dreritmaecenas suspendisse scelerisque. Eu exst bibendum ornare ",
          //   style: medium14Grey,
          // ),
          // heightSpace,
          // Text(
          //   "Lorem ipsum dolor sit amet consecv tetsuspendisse orci cras amet. Viverra massa xamet et diam a nisiac aliquet felis. Duis sagittis ne que hendreritmaecenas suspendisse scelerisque. Exaucest bibendum ornare lacinia in. Turpis rutrum conguxe sollicitudin viverra. Suscipit sagittis cursus arcuxgfh kest mattis. Blandit quam vitae id nunc ornare nec morbi. Sapien massa sed lectus a erat in cras dui ut. Id ut bibendum eget ultrices in nunc. Pretium amet adipiscing mattis ",
          //   style: medium14Grey,
          // ),
          // heightSpace,
          // Text(
          //   "Lorem ipsum dolor sit amet consec textsuspendisse orci cras amet. Vivxerra massa amet et diam a nisiac aliquet felis. Duis sagittis neque hendreritmaecenas suspendisse scelerisque. Eu est bibxendums ornare lacinia in. Turpis rutrum congue sollic citudin viverra. Suscipit sagittis cursus arcugfh kest mattis. Blaxndit quam vitae id nunc ornare nec morbi. Sapien massa sed lectus a erat in cras dui ut. Id ut  bibendum eget ultrices in nunc. Pretium amet adipis cinsadg mattis Lorem ipsum dolor sit amet consectets uspendisse orci cras amet. Viverra massa amet etx diam a nisiac aliquet felis. Duis sagittis neque hendrerit maecenas suspendisse scelerisque. Eu est biaxbendum ornare lacinia in. Turpis rutrum conxgue sollicitudin viverra. Suscipit sagittis cursus arcuxgfh kest mattis. Blandit quam vitae id nunc ornare nec morbi. Sapien massa sed lectus a erat in cras dui ut. Id ut bibendum eget ultrices in nunc. Pretium amet adipiscing mattis ",
          //   style: medium14Grey,
          // ),
        ],
      ),
    );
  }
}
