import 'package:flutter/material.dart';
import 'package:gomart/screens/Home/Screens/WalletFragment/add_funds.dart';
import 'package:gomart/screens/Home/Screens/WalletFragment/scan_qr_screen.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:gomart/styles/styles.dart';

import 'my_qr_screen.dart';

class WalletFragment extends StatelessWidget {
  const WalletFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      appBar: AppBar(
        backgroundColor: Styles.colorWhite,
        elevation: 0.3,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyQrScreen(),
                  ),
                );
              },
              icon: const Icon(
                Gomart.qrcodeScan,
                color: Styles.colorPrimary,
                size: 20,
              ))
        ],
        title: const Text(
          'Wallet',
          style: TextStyle(color: Styles.colorBlack, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    color: Styles.colorWhite,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(8)),
                    const Text(
                      'Your wallet balance is',
                      style:
                          TextStyle(fontSize: 15, color: Styles.colorPrimary),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    const Text(
                      'N11,050',
                      style: TextStyle(color: Styles.colorBlack, fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddFunds(),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add_circle_sharp,
                                size: 20,
                                color: Styles.colorPrimary,
                              ),
                              Padding(padding: EdgeInsets.all(4)),
                              Text(
                                'Add Credit',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Styles.colorPrimary),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Styles.colorButtonPay,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 40),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScanQrScreen(),
                              ),
                            );
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Today',
                        style:
                            TextStyle(color: Styles.colorPrimary, fontSize: 12),
                      ),
                    ),
                    TransactionItem(
                      icon: Gomart.transactionFood,
                      vendorName: 'Gamji Restaurant',
                      transactionAmount: '-N800',
                      transactionTime: '17:31',
                    ),
                    Divider(height: 1),
                    TransactionItem(
                      icon: Gomart.transactionAutoRepair,
                      vendorName: 'Eze Car Part Shop',
                      transactionAmount: '-N23,000',
                      transactionTime: '14:09',
                    ),
                    Divider(height: 1),
                    TransactionItem(
                      icon: Gomart.transactionShop,
                      vendorName: 'Maitama Stores',
                      transactionAmount: '-N15,350',
                      transactionTime: '11:25',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Yesterday',
                        style:
                            TextStyle(color: Styles.colorPrimary, fontSize: 12),
                      ),
                    ),
                    TransactionItem(
                      icon: Icons.credit_card,
                      vendorName: 'Credit Added via 8852',
                      transactionAmount: '+N50,000',
                      transactionTime: '23:05',
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Friday 5 August',
                        style:
                            TextStyle(color: Styles.colorPrimary, fontSize: 12),
                      ),
                    ),
                    TransactionItem(
                      icon: Gomart.transactionFood,
                      vendorName: '3ple F Bakers',
                      transactionAmount: '-N7,500',
                      transactionTime: '09:15',
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Load more...',
                  style: TextStyle(
                    fontSize: 12,
                    color: Styles.colorPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String vendorName;
  final String transactionTime;
  final String transactionAmount;

  const TransactionItem({
    Key? key,
    required this.vendorName,
    required this.transactionTime,
    required this.transactionAmount, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        color: Styles.colorWhite,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Styles.colorTransactionItemLogoBg,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Icon(
                  icon,
                  color: Styles.colorWhite,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendorName,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        transactionTime,
                        style: const TextStyle(
                            fontSize: 12, color: Styles.colorTextLightGrey),
                      ),
                    ],
                  ),
                  Text(
                    transactionAmount,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
