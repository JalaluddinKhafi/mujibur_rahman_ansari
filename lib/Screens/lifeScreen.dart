import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';

class Biography extends StatefulWidget {
  @override
  State<Biography> createState() => _BiographyState();
}

class _BiographyState extends State<Biography> {
  List<String> biographyText=[
    "مولانا  مجیب الرحمن انصاری فرزند خواجه محمد رفیق انصاری ولدیت خواجه محمد صدیق انصاری، در سال ۱۳۶۲ در یك خانواده متدین در گازرگاه شریف هرات دیده به جهان گشود",
    " ",
    "مولانا مجیب الرحمن انصاری از لحاظ نسب به خواجه عبدالله انصاری هروی و سرانجام به ابو ایوب انصاری می رسد.",
    " ",
    "مولانا انصاری در سن ۱۳ سالگی مشغول حفظ كلام الله و در سن ۱۵  سالگی، حفظ كلام خدا را به اتمام رسانیده است. او با هوش و ذكاوت خدا دادی كه داشت در مدت دو سال حفظ كلام پاك الله را به اتمام رسانید. بعد به فراگرفتن علوم دیگر دینی و اجتماعی پرداخت  و در سن ۱۹ سالگی بصفت خطیب مسجد جامع گازرگاه شریف از جانب مردم و جامعه‌ی روحانیت برگزیده شد.",
    "",
    "مولانا انصاری در سال ۱۳۸۴ از فرا گیری علوم دینی و اجتماعی فارغ شد و در همان سال عازم خانه خداوند (جل‌جلاله) گردید و بعد از برگشت این سفر مبارك در دارالعلوم عالی انصار مشغول خواندن علم حدیث شد. كه این روند تا سال ۱۳۸۹ دوام نمود",
    "",
    "الحاج مولانا  مجیب الرحمان انصاری  مصروف تدریس در دارالعلوم عالی انصار واقع در گازرگاه شریف بوده و تبلیغ مسایل و احكام دینی از طرف وی برای شهروندان كشور به‌گونه جدی به جریان بود  هم‌چنان بكار تبلیغ دین اسلام پرداخته بود",
    "",
    "مولوی مجیب الرحمن انصاری در روز جمعه  (۱۱ سنبله ۱۴۰۱ش) پیش از رسیدن به مسجد جامع گازرگاه شریف توسط یکی از نیروهای گروه داعش که به منظور احوال‌پرسی نزد ایشان آمده و خود را منفجر کردند به شهادت رسانیدند.",
    "",
    "إنا لله وإنا اليه راجعون",
      ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios)),
          title: const Text(
            'زندگینامه مولانا انصاری (رح)',),
          actions: const [
            Icon(CupertinoIcons.chat_bubble_text),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Expanded(

                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 20,right:20),
                  itemCount: biographyText.length,
                  itemBuilder: (context, index){

                   //final item=biographyText[index];
                  return Text(biographyText[index],textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,color: Colors.indigo,
                    ),
                  );
                },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
