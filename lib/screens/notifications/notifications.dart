import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../Empty-state/empty_state_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      appBar: AppBar(
        backgroundColor: Styles.colorWhite,
        elevation: 0,
        leading: const BackButton(color: Styles.colorBlack),
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Styles.colorBlack, fontSize: 16),
        ),
      ),
      body: Column(
        children: const [
          Padding(padding: EdgeInsets.all(18)),
           SingleChildScrollView(
            child: EmptyStateScreen(
              assetImageUrl: 'assets/images/empty_state_no_notifications.png',
              title: 'Notifications',
              subTitle:
              'You\'ll see notifications and updates here in the future.',
            ),
          ),
        ],
      ),
    );
  }
}
