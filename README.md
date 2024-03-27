# gomart

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# Gomart-Mobile-app" 
Generate icons
flutter pub run flutter_launcher_icons:main

flutter flutter_native_splash
flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml

injectable build_runner
flutter pub run build_runner build --delete-conflicting-outputs

flutterfire configure



A beautiful piece of code that might be useful
 FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: locator<FirebaseFirestore>().collection('PRODUCTS').get(), // async work
        builder: (BuildContext context,snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return const Text('Loading....');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(
                  child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                    return Text('hello ${snapshot.data?.docs[index].id}');
                  }),
                );
              }
          }
        },
      ),



flutter run --no-enable-impeller --enable-software-rendering