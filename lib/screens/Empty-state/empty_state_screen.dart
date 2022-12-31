import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class EmptyStateScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? assetImageUrl;
  final Widget? actionButton;

  const EmptyStateScreen(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.assetImageUrl,
      this.actionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(5)),
          (assetImageUrl != null)
              ? Opacity(
                  opacity: 0.8,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(assetImageUrl!),
                      )),
                      width: 350,
                      height: 220),
                )
              : SizedBox(
                  width: 350,
                  height: 220,
                  child: Placeholder(
                    color: Styles.colorGray.withOpacity(0.5),
                  )),
          const Padding(padding: EdgeInsets.all(20)),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          ),
          const Padding(padding: EdgeInsets.all(6)),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Styles.colorTextBlack),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          (actionButton != null) ? actionButton! : Container(),
        ],
      ),
    );
  }
}
