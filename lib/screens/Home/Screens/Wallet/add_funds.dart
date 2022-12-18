import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';

class AddFunds extends StatefulWidget {
  const AddFunds({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateAddFunds();
}

enum PaymentTypes { unselected, debitCreditCard, transferFromBankAccount }

class StateAddFunds extends State<AddFunds> {
  PaymentTypes selectedPaymentType = PaymentTypes.unselected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      appBar: AppBar(
        backgroundColor: Styles.colorWhite,
        elevation: 0.3,
        centerTitle: true,
        title: const Text(
          'Add funds',
          style: TextStyle(color: Styles.colorBlack, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(4)),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPaymentType = PaymentTypes.debitCreditCard;
              });
            },
            child: Container(
              color: Styles.colorWhite,
              child: ListTile(
                leading: Checkbox(
                  value: selectedPaymentType == PaymentTypes.debitCreditCard,
                  onChanged: (bool? value) {},
                  checkColor: Styles.colorWhite,
                  fillColor: MaterialStateProperty.all(Styles.colorPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                title: const Text('Debit/Credit card'),
                subtitle: const Text('Amount will reflect instantly in wallet'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(1)),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPaymentType = PaymentTypes.transferFromBankAccount;
              });
            },
            child: Container(
              color: Styles.colorWhite,
              child: ListTile(
                leading: Checkbox(
                  value: selectedPaymentType ==
                      PaymentTypes.transferFromBankAccount,
                  onChanged: (bool? value) {},
                  checkColor: Styles.colorWhite,
                  fillColor: MaterialStateProperty.all(Styles.colorPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                title: const Text('Transfer from bank account'),
                subtitle:
                    const Text('Takes a few minutes to reflect in wallet'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Styles.colorSecondary.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              shape: const StadiumBorder(),
            ),
            onPressed:null,
            child: const Text(
              'Next',
              style: TextStyle(
                  fontWeight: FontWeight.normal, color: Styles.colorBlack),
            ),
          )
        ],
      ),
    );
  }
}
