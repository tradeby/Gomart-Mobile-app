import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomart/data/model/Product/product_model.dart';
import 'package:gomart/data/repository/Product/IProductRepository.dart';
import 'package:injectable/injectable.dart';

part 'debug_state.dart';

@Injectable()
class DebugCubit extends Cubit<DebugState> {
  final IProductRepository _productRepository;

  DebugCubit(this._productRepository) : super(DebugInitial());

  seedSampleProducts() async {

    List<ProductModel> data = const
    [

      ProductModel(
        productName: 'Butter Cream Cake 6 Inches',
        price: 'N5,000',
        phoneNumber: '08078404049',
        address: 'Darmanawa, Kano',
        companyName: '3PLE F Bakers',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Wholesale & Retail of Computers & Printing',
        phoneNumber: '08067397760',
        address: 'Wuse Zone 3, Abuja',
        companyName: 'Foretec Investment ',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage6.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Auto Diagnosis',
        price: 'N6,000',
        phoneNumber: '07039113777',
        address: 'Life Camp, Abuja',
        companyName: 'Resure Auto Service ',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage1.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName:
        'Committed to bringing you fresh,  healthy and neat fruits & veggies',
        phoneNumber: '+234 802 212 4562',
        address: 'Asokoro, Abuja',
        companyName: 'Umar Fruit Market',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage2.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Butter Cream Cake 6 Inches',
        price: 'N5,000',
        phoneNumber: '08078404049',
        address: 'Darmanawa, Kano',
        companyName: '3PLE F Bakers',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Wholesale & Retail of Computers & Printing',
        phoneNumber: '08067397760',
        address: 'Wuse Zone 3, Abuja',
        companyName: 'Foretec Investment ',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage6.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Auto Diagnosis',
        price: 'N6,000',
        phoneNumber: '07039113777',
        address: 'Life Camp, Abuja',
        companyName: 'Resure Auto Service ',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage1.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName:
        'Committed to bringing you fresh,  healthy and neat fruits & veggies',
        phoneNumber: '+234 802 212 4562',
        address: 'Asokoro, Abuja',
        companyName: 'Umar Fruit Market',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage2.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Butter Cream Cake 6 Inches',
        price: 'N5,000',
        phoneNumber: '08078404049',
        address: 'Darmanawa, Kano',
        companyName: '3PLE F Bakers',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Wholesale & Retail of Computers & Printing',
        phoneNumber: '08067397760',
        address: 'Wuse Zone 3, Abuja',
        companyName: 'Foretec Investment ',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage6.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName: 'Auto Diagnosis',
        price: 'N6,000',
        phoneNumber: '07039113777',
        address: 'Life Camp, Abuja',
        companyName: 'Resure Auto Service ',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage1.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
      ProductModel(
        productName:
        'Committed to bringing you fresh,  healthy and neat fruits & veggies',
        phoneNumber: '+234 802 212 4562',
        address: 'Asokoro, Abuja',
        companyName: 'Umar Fruit Market',
        openingTime: '8am',
        closingTime: '10pm',
        productImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage2.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
      ),
    ];
    await _productRepository.seedSampleData(data);
  }
}
