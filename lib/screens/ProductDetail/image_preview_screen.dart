import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gomart/styles/styles.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class ImagePreview extends StatefulWidget {
  final String imageUrl;
  final String heroTag;
  final String productName;
  final String productUrl;
 final bool isFile;
 final bool enableSharing;

  const ImagePreview({Key? key, required this.imageUrl, required this.heroTag, required this.productName, required this.productUrl, this.isFile = false, this.enableSharing = true}) : super(key: key);


  @override
  State<StatefulWidget> createState() => ImagePreviewState();
}

class ImagePreviewState extends State<ImagePreview> {
  Color colorBackground = Styles.colorWhite;
  Color colorBackgroundInverse = Styles.colorBlack;
  Brightness statusBarBrightness = Brightness.dark; //Brightness.light;
  bool showAppBar = true;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print(
          '${scrollController.offset} ${MediaQuery.of(context).size.height * 0.2}');
      if (scrollController.offset > MediaQuery.of(context).size.height * 0.2) {
        //Navigator.of(context).pop();
      }
    });

    getPaletteColor(this.widget.imageUrl).then((value) {
      setState(() {
        this.colorBackground = value;
        double luminousValue = value.computeLuminance();
        colorBackgroundInverse =
        (luminousValue > 0.5) ? Styles.colorBlack : Styles.colorWhite;
        statusBarBrightness =
        (luminousValue > 0.5) ? Brightness.dark : Brightness.light;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _heightPercentage =
    (MediaQuery.of(context).orientation == Orientation.portrait) ? 0.8 : 1;
    final _widthPercentage =
    (MediaQuery.of(context).orientation == Orientation.portrait) ? 1 : 0.8;
    final _imageHeight = MediaQuery.of(context).size.height * _heightPercentage;
    final _imageWidth = MediaQuery.of(context).size.width * _widthPercentage;

    final String imageUrl = this.widget.imageUrl;
    final String heroTag = this.widget.heroTag;
    final String productName = this.widget.productName;
    final String productUrl = this.widget.productUrl;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (Platform.isIOS )
          ? statusBarBrightness == Brightness.dark
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light
          : SystemUiOverlayStyle(
        systemNavigationBarColor: colorBackground, // navigation bar color
        statusBarColor: colorBackground, // status bar color
        statusBarIconBrightness:
        statusBarBrightness, // status bar icons' color
        systemNavigationBarIconBrightness:
        statusBarBrightness, //navigation bar icons' color
      ),
      child: Container(
        color: colorBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: colorBackground,
            appBar: (showAppBar)
                ? AppBar(
              iconTheme: IconThemeData(color: colorBackgroundInverse),
              elevation: 0,
              centerTitle: true,
              actions: <Widget>[
                (widget.enableSharing)
                    ? IconButton(
                  onPressed: () async {
                /*    final description =
                        'Check out this trendy $productName available only on Kibris Order';
                    final shareUrl = await createDynamicLink(
                        link:
                        'https://www.kibrisorder.com/product/$productUrl',
                        imageUrl: imageUrl,
                        title: productName,
                        description: description);
                    Share.share('$description $shareUrl');*/
                  },
                  icon: Icon((Platform.isIOS)
                      ? CupertinoIcons.share
                      : Icons.share),
                  color: colorBackgroundInverse,
                )
                    : Container()
              ],
              backgroundColor: colorBackground,
            )
                : null,
            body: Container(
              height: MediaQuery.of(context).size.height - 56,
              child: Stack(
                children: <Widget>[
                  /*   DragTarget<String>(
                    onWillAccept: (value) => true,
                    onAccept: (value) {
                      Navigator.of(context).pop();
                    },
                    builder: (context, candidateData, rejectedData) {
                      return candidateData.length > 0
                          ? Container(
                              color: colorBackground,
                              height: 200,
                            )
                          : Column(
                              children: <Widget>[
                                Container(
                                  color: colorBackground,
                                  height: 200,
                                ),
                              ],
                            );
                    },
                  ),*/
                  PhotoView(
                    minScale: PhotoViewComputedScale.contained * 1,
                    maxScale: PhotoViewComputedScale.covered * 1.8,
                    initialScale: PhotoViewComputedScale.contained,
                    scaleStateChangedCallback: (value) {
                      // print('**************************');
                      // print('${value == PhotoViewScaleState.zoomedIn}');
                      if (showAppBar !=
                          !(value == PhotoViewScaleState.zoomedIn)) {
                        setState(() {
                          showAppBar =
                          !(value == PhotoViewScaleState.zoomedIn);
                        });
                      }
                    },
                    backgroundDecoration: BoxDecoration(
                      color: colorBackground,
                    ),
                    imageProvider:(widget.isFile?FileImage(File(imageUrl)) as ImageProvider: NetworkImage(imageUrl)),
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: heroTag, transitionOnUserGestures: true),
                  ),
                  /*   Container(
                    margin: EdgeInsets.only(top: 500),
                    child: DragTarget<String>(
                      onWillAccept: (value) => true,
                      onAccept: (value) {
                        Navigator.of(context).pop();
                      },
                      builder: (context, candidateData, rejectedData) {
                        return candidateData.length > 0
                            ? Container(
                                color: colorBackground,
                                height: 300,
                              )
                            : Container(
                                color: colorBackground,
                                height: 300,
                              );
                      },
                    ),
                  ),*/
                  /*     Positioned(
                    top: 10,
                    child: Center(
                      child: Draggable<String>(
                        data: 'Image',
                        axis: Axis.vertical,
                        childWhenDragging: Container(),
                     feedback: Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height *0.8,
                       child: PhotoView(
                         backgroundDecoration: BoxDecoration(
                           color: colorBackground,
                         ),
                         imageProvider:NetworkImage(imageUrl),
                         heroAttributes: PhotoViewHeroAttributes(tag: heroTag, transitionOnUserGestures: true),
                       ),
                     ),
                     */ /*   feedback: Hero(
                          tag: heroTag,
                          child: FadeInImage(
                            image: NetworkImage(imageUrl),
                            placeholder: ExactAssetImage(
                                'assets/images/placeholder.jpg'),
                            fit: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? BoxFit.fitWidth
                                : BoxFit.contain,
                            height: _imageHeight,
                            width: _imageWidth,
                            imageErrorBuilder: (
                              BuildContext context,
                              Object error,
                              StackTrace stackTrace,
                            ) =>
                                Image.network(imageUrl),
                          ),
                        ),*/ /*
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height *0.8,
                          child: PhotoView(
                            backgroundDecoration: BoxDecoration(
                              color: colorBackground,
                            ),
                            imageProvider:NetworkImage(imageUrl),
                            heroAttributes:  PhotoViewHeroAttributes(tag: heroTag),
                          ),
                        ),
                        */ /*child: Hero(
                          tag: heroTag,
                          child: FadeInImage(
                            image: NetworkImage(imageUrl),
                            placeholder: ExactAssetImage(
                                'assets/images/placeholder.jpg'),
                            fit: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? BoxFit.fitWidth
                                : BoxFit.contain,
                            height: _imageHeight,
                            width: _imageWidth,
                          ),
                        ),*/ /*
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<Color> getPaletteColor(String imageUrl) async {
  PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
    NetworkImage(imageUrl),

    filters: [],
// Images are square
    size: const Size(300, 300),

// I want the dominant color of the top left section of the image
    region: Offset.zero & const Size(40, 40),
  );
  // print('our palette is ${paletteGenerator.dominantColor.color}');
  return paletteGenerator.dominantColor?.color as Color;
}