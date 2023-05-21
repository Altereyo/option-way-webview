import 'package:flutter/material.dart';
import 'package:flutter_firebase_config/data/models/news.dart';
import 'package:flutter_firebase_config/screens/webview.dart';
import 'package:flutter_firebase_config/styles/app_colors.dart';

class OpenedNewsScreen extends StatelessWidget {
  const OpenedNewsScreen(this.newsObj, {Key? key}) : super(key: key);
  final News newsObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsObj.title!),
        leading: GestureDetector(
          child: Center(
              child: Icon(Icons.arrow_back_ios, color: AppColors.textColor)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Placeholder(
                color: AppColors.accentColor,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              newsObj.description!,
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WebViewScreen(url: 'https://google.com', allowExit: true)));
              },
              child: RichText(
                text: TextSpan(
                  text: 'Read more about ${newsObj.title} on ',
                  style: const TextStyle(fontSize: 12),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'example-url.com',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
