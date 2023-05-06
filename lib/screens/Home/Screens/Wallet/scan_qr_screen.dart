import 'package:flutter/material.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:gomart/styles/styles.dart';
/*import 'package:mobile_scanner/mobile_scanner.dart';*/

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateScanQrScreen();
}

class StateScanQrScreen extends State<ScanQrScreen> {
/*  MobileScannerController cameraController = MobileScannerController();*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Scan to Pay',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Stack(
          children: [
           /* MobileScanner(
                //allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode');
                  } else {
                    final String code = barcode.rawValue!;
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: 'barrier text',
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (bc, ania, anis) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(padding: EdgeInsets.all(8)),
                                  const Text(
                                    'Are you sure you want to pay',
                                    style: TextStyle(
                                        fontSize: 15, color: Styles.colorPrimary),
                                  ),
                                  Text(
                                    code,
                                    style: const TextStyle(
                                        fontSize: 15, color: Styles.colorPrimary),
                                  ),
                                  const Text(
                                    'a sum of',
                                    style: TextStyle(
                                        fontSize: 15, color: Styles.colorPrimary),
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  const Text(
                                    'N2,300',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Padding(padding: EdgeInsets.all(16)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Styles.colorBackground,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30),
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Styles.colorBlack),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Styles.colorSecondary,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30),
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Gomart.qrcodeScan,
                                              size: 20,
                                              color: Styles.colorPrimary,
                                            ),
                                            Padding(padding: EdgeInsets.all(4)),
                                            Text(
                                              'Pay',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: Styles.colorPrimary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),*/
            _getOverlay(),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width *0.78,
                width: MediaQuery.of(context).size.width *0.78,
                child: CustomPaint(
                  foregroundPainter: LinePainter(),
                ),
              ),
            ),
          ],
        ));
  }
}
Widget _getOverlay() {
  return ClipPath(
    clipper: InvertedClipper(),
    child: Container(
      color: Colors.black54,
    ),
  );
}

class InvertedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromCenter(center: Offset(size.width *0.5, size.height*0.5),height:size.width *0.7, width: size.width *0.7))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color=Styles.colorWhite
      ..strokeWidth = 8;
    const unit =4.0;
    const length = 50.0;
    canvas.drawLine(  const Offset(unit, length),const Offset(unit,0), paint);
    canvas.drawLine(  const Offset(length,unit),  const Offset(0,unit), paint);
    canvas.drawLine( Offset(length, size.height-unit),  Offset(0, size.height-unit), paint);
    canvas.drawLine(Offset(size.width-unit, 0),  Offset(size.width-unit, length), paint);
    canvas.drawLine( Offset(size.width-length, size.height-unit),  Offset(size.width, size.height-unit), paint);
    canvas.drawLine( Offset(size.width-unit, size.height),  Offset(size.width-unit, size.height-length), paint);
    canvas.drawLine( Offset(size.width, unit),  Offset(size.width-length, unit), paint);
    canvas.drawLine(Offset(unit,size.height), Offset(unit,size.height-length),paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}
