import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gomart/injection.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_upload_photo.dart';
import 'package:gomart/styles/styles.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrScreen extends StatelessWidget {
  const MyQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Styles.colorBlack),
        title: const Text(
          'My Qr code',
          style: TextStyle(
            color: Styles.colorBlack,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        elevation: 1,
        backgroundColor: Styles.colorWhite,
      ),
      backgroundColor: Styles.colorBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    (locator<FirebaseAuth>().currentUser?.photoURL != null)
                        ? CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                                child: Image.network(
                              locator<FirebaseAuth>().currentUser?.photoURL
                                  as String,
                            )),
                          )
                        : CharacterAvatar(
                            ch: locator<FirebaseAuth>()
                                    .currentUser
                                    ?.displayName ??
                                'Null',
                          ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${locator<FirebaseAuth>().currentUser?.displayName}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        Text(
                          '${locator<FirebaseAuth>().currentUser?.phoneNumber}',
                          style: const TextStyle(
                              fontSize: 11, color: Styles.colorTextDark),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
    /*          Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Styles.colorWhite,
                    borderRadius: BorderRadius.circular(4)),
                child: QrImage(
                  data:
                      "https://gomart-apps.appspot.com/User/${locator<FirebaseAuth>().currentUser?.phoneNumber}",
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.width * 0.76,
                ),
*/
                /*Container(
                width: MediaQuery.of(context).size.width * 0.76,
                height: MediaQuery.of(context).size.width * 0.76,
                decoration: const BoxDecoration(
                    color: Styles.colorWhite,
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fqrcodesample.png?alt=media&token=1af2b9bc-5465-4be6-8441-936971336217'))),
              )*/
            //  ),
              const Padding(padding: EdgeInsets.all(24)),
              const Text('Scan me')
            ],
          ),
        ),
      ),
    );
  }
}
