import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/shared_components/imageAddPreview/image_type_model.dart';
import 'package:gomart/styles/styles.dart';
import 'package:image_picker/image_picker.dart';

class AddNewGallaryItemBox extends StatefulWidget {
  final Function(ImageTypeModel imagePath) onImagePicked;

  const AddNewGallaryItemBox({
    Key? key,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddNewGallaryItemBoxState();
}

class AddNewGallaryItemBoxState extends State<AddNewGallaryItemBox> {
  late ImagePicker _picker;

  @override
  void initState() {
    _picker = ImagePicker();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          if (!mounted) return;

          // context.read<BusinessCubit>().setGalleryImage(image.path);

          ImageTypeModel imagePicked =
              ImageTypeModel(isFile: true, url: image.path);
          widget.onImagePicked(imagePicked);
        } else {}
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
        height: 46,
        width: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Styles.colorGray.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: const Icon(Icons.add_circle_sharp, color: Styles.colorPrimary),
      ),
    );
  }
}
