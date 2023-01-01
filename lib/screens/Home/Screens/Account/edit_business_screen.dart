import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';
import 'business_profile_screen.dart';

class EditBusinessScreen extends StatelessWidget {
  const EditBusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const Text('Edit Business Profile Screen works'),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Styles.colorSecondary,
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BusinessProfileScreen()),
                  );
                },
                child: const Text(
                  'Preview Business',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Styles.colorBlack),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
