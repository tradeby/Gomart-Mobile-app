import 'package:flutter/material.dart';
import 'package:gomart/shared_components/imageAddPreview/image_add_preview.dart';

import '../../../../../shared_components/supportedOpeningClosingTimes/_supported_times.dart';
import '../../../../../styles/custom_home_icons.dart';
import '../../../../../styles/styles.dart';
import '../BusinessProfile/business_profile_screen.dart';
import '../EditBusiness/_text_field.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                child: SizedBox(
                  height: 25,
                  width: 80,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Styles.colorGray,
                          style: BorderStyle.solid,
                          width: 1,
                        )),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Styles.colorTextBlack.withOpacity(0.8),
                          fontSize: 11),
                    ),
                  ),
                ),
              ),
              const StoreGallerySection(),
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
                padding: const EdgeInsets.all(8),
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
                padding: EdgeInsets.all(6.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Specifications',
                      style: TextStyle(
                          color: Styles.colorTextBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(padding: EdgeInsets.all(4)),
                              SizedBox(
                                height: 32,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 6),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    items: List.generate(
                                        supportedTimeConverted.length,
                                            (index) => DropdownMenuItem(
                                          value:
                                          supportedTimeConverted[index],
                                          child: Text(
                                              supportedTimeConverted[
                                              index]),
                                        )),
                                    onChanged: (_) => {}),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(padding: EdgeInsets.all(4)),
                              GomTextField(),
                            ],
                          ),
                        ),
                        IconButton(
                          color: Styles.colorWhite,
                          icon: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 4),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 4),

                              child: Icon(Icons.remove_circle, color: Colors.redAccent)),
                          onPressed: () {

                          },
                        )

                      ],
                    ),     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(padding: EdgeInsets.all(4)),
                              SizedBox(
                                height: 32,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 6),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    items: List.generate(
                                        supportedTimeConverted.length,
                                            (index) => DropdownMenuItem(
                                          value:
                                          supportedTimeConverted[index],
                                          child: Text(
                                              supportedTimeConverted[
                                              index]),
                                        )),
                                    onChanged: (_) => {}),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(padding: EdgeInsets.all(4)),
                              GomTextField(),
                            ],
                          ),
                        ),
                        IconButton(
                          color: Styles.colorWhite,
                          icon: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 4),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 4),

                              child: Icon(Icons.remove_circle, color: Colors.redAccent)),
                          onPressed: () {

                          },
                        )

                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Title',
                                style: TextStyle(color: Styles.colorTextBlack),
                              ),
                              const Padding(padding: EdgeInsets.all(2)),
                              SizedBox(
                                height: 32,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 6),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    items: List.generate(
                                        supportedTimeConverted.length,
                                        (index) => DropdownMenuItem(
                                              value:
                                                  supportedTimeConverted[index],
                                              child: Text(
                                                  supportedTimeConverted[
                                                      index]),
                                            )),
                                    onChanged: (_) => {}),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Value',
                                style: TextStyle(color: Styles.colorTextBlack),
                              ),
                              const Padding(padding: EdgeInsets.all(2)),
                              SizedBox(
                                height: 32,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 6),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    items: List.generate(
                                        supportedTimeConverted.length,
                                        (index) => DropdownMenuItem(
                                              value:
                                                  supportedTimeConverted[index],
                                              child: Text(
                                                  supportedTimeConverted[
                                                      index]),
                                            )),

                                    /* const [
                                DropdownMenuItem(
                                  value: '11:00 pm',
                                  child: Text('11:00 pm'),
                                ),
                                DropdownMenuItem(
                                  value: '13:00 pm',
                                  child: Text('11:30 pm'),
                                ),
                              ],*/
                                    onChanged: (_) => {}),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          color: Styles.colorWhite,
                          icon: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 4),
                              padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 4),

                            child: Icon(Icons.add_circle_sharp, color: Styles.colorPrimary)),
                          onPressed: () {

                          },
                        )

                      ],
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(6)),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Promote your Ad',
                      style: TextStyle(
                        color: Styles.colorGray,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styles.colorTextFieldBorder,
                          width: 0.8,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle_outlined,
                            color: Styles.colorPrimary,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Styles.colorGray.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text('Standard'),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          const Text(
                            'Free',
                            style: TextStyle(
                                color: Styles.colorPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styles.colorTextFieldBorder,
                          width: 0.8,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.circle_outlined,
                            color: Styles.colorPrimary,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: const BoxDecoration(
                                  color: Styles.colorSecondary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: const Text('Featured'),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              const Text(
                                'N9,000',
                                style: TextStyle(color: Styles.colorPrimary),
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Text(
                                  'Let your ad be on top of the listings',
                                  style: TextStyle(
                                      color: Styles.colorGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: const BoxDecoration(
                                      color: Styles.colorButtonPay,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: const Text(
                                      '7 days',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Styles.colorPrimary,
                                        width: 0.8,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: const Text(
                                      '14 days',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Styles.colorPrimary,
                                        width: 0.8,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: const Text(
                                      '30 days',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styles.colorTextFieldBorder,
                          width: 0.8,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.circle_outlined,
                            color: Styles.colorPrimary,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: const BoxDecoration(
                                  color: Styles.colorPromoteAdsPremium,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: const Text('Premium'),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              const Text(
                                'N2,999',
                                style: TextStyle(color: Styles.colorPrimary),
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Text(
                                  'Have your Ad on home and suggested on similar post',
                                  style: TextStyle(
                                      color: Styles.colorGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: const BoxDecoration(
                                      color: Styles.colorButtonPay,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: const Text(
                                      '1 month',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Styles.colorPrimary,
                                        width: 0.8,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: const Text(
                                      '3 months',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Styles.colorSecondary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 80),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BusinessProfileScreen()),
                            );
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Styles.colorBlack),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(12))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
