import 'package:flutter/material.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/_text_field.dart';
import 'package:gomart/styles/styles.dart';

class ProductFormSection extends StatelessWidget {
  const ProductFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ad title',
                style: TextStyle(
                  color: Styles.colorGray,
                  fontSize: 15,
                ),
              ),
              Padding(padding: EdgeInsets.all(2)),
              GomTextField()
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Description',
                style: TextStyle(
                  color: Styles.colorGray,
                  fontSize: 15,
                ),
              ),
              Padding(padding: EdgeInsets.all(2)),
              GomTextField(isTextArea: true)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'Call for price',
                  style: TextStyle(
                    color: Styles.colorGray,
                    fontSize: 15,
                  ),
                ),
              ),
             Switch(value: true, onChanged:(val)=>{})
              /* Stack(
                          children: [
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Styles.colorTextFieldBorder,
                                  width: 0.8,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            Positioned(
                              top: 1.3,
                              left: 1.2,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Styles.colorButtonPay,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                height: 30,
                                width: 37,
                                child: const Center(
                                  child: Text(
                                    '₦',
                                    style: TextStyle(
                                        color: Styles.colorTextBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )*/
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  color: Styles.colorGray,
                  fontSize: 15,
                ),
              ),
              const Padding(padding: EdgeInsets.all(2)),
              GomTextField(
                  leadingIcon: Container(
                    margin: const EdgeInsets.fromLTRB(1, 1, 6, 1),
                    decoration: const BoxDecoration(
                      color: Styles.colorButtonPay,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    width: 0,
                    child: const Center(
                      child: Text(
                        '₦',
                        style: TextStyle(
                            color: Styles.colorTextBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  isMoney: true)
              /* Stack(
                          children: [
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Styles.colorTextFieldBorder,
                                  width: 0.8,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            Positioned(
                              top: 1.3,
                              left: 1.2,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Styles.colorButtonPay,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                height: 30,
                                width: 37,
                                child: const Center(
                                  child: Text(
                                    '₦',
                                    style: TextStyle(
                                        color: Styles.colorTextBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )*/
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(8, 16, 0,0),
          child: Text(
            'Condition',
            style: TextStyle(
              color: Styles.colorGray,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'New',
                  style: TextStyle(
                    color: Styles.colorGray,
                    fontSize: 15,
                  ),
                ),
              ),
              Switch(value: true, onChanged:(val)=>{}),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Text(
                  'Used',
                  style: TextStyle(
                    color: Styles.colorGray,
                    fontSize: 15,
                  ),
                ),
              ),
              Switch(value: false, onChanged:(val)=>{})
              /* Stack(
                          children: [
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Styles.colorTextFieldBorder,
                                  width: 0.8,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            Positioned(
                              top: 1.3,
                              left: 1.2,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Styles.colorButtonPay,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                height: 30,
                                width: 37,
                                child: const Center(
                                  child: Text(
                                    '₦',
                                    style: TextStyle(
                                        color: Styles.colorTextBlack,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )*/
            ],
          ),
        ),
      ],
    );
  }
}


