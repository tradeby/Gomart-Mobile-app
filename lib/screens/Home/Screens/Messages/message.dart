import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import '../../../Empty-state/empty_state_screen.dart';

class MessageFragment extends StatelessWidget {
  const MessageFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      appBar: AppBar(
        backgroundColor: Styles.colorWhite,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Styles.colorBlack, fontSize: 16),
        ),
      ),
      body: Column(
        children: const [
          Padding(padding: EdgeInsets.all(18)),
          SingleChildScrollView(
            child: EmptyStateScreen(
              assetImageUrl: 'assets/images/empty_state_no_messages.png',
              title: 'No Messages',
              subTitle:
                  'You\'ll see messages between you and sellers here. There isn\'t any message at the moment',
            ),
          ),
        ],
      ),
    );
  }
}
