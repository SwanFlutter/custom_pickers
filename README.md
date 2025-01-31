

This is a multi-picker package that includes several different modes, making it easy to use.

## Donation Message for Support

### Quick Links for Donations:
![icon-128x128](https://github.com/user-attachments/assets/b9ebe656-0984-430c-aab6-6e2ca93cd300)
- [Donate via Zarinpal](https://zarinp.al/swanflutterdevpackage) 
- [Support through our Website](https://swanflutterdev.com/pay.html) 





## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

```yaml
import 'package:custom_pickers/custom_pickers.dart';
```

```yaml
  dependencies:
  custom_pickers:
      path: your package directory
       
```

for example 
```yaml
  dependencies:
  custom_pickers:
      path: G:\Android\Pakege\custom_pickers
       
```

## Usage



- use customPicker

## instagram pickers

```dart
 List<AssetEntity> selectedAssetList = [];

  ElevatedButton(
        onPressed: ()  {
           var picker = const CustomPicker(
                maxCount: 5,
                requestType: MyRequestType.image,
              ).instagram(context);
            picker.then((value) {
             selectedAssetList = value;
          convertToFileList();
        });
       },
    child: const Text("CustomPickers"),
 ),

```

- OR 

```dart
  onPressed: () {
          const CustomPickers(maxCount: 10, requestType: MyRequestType.image)
           .instagram(context)
          .then((onValue) {
         setState(() {
         selectedAssetList = onValue;
         convertToFileList();
     });
   });
},
```

## CustomPicker

```dart
ElevatedButton(
            onPressed: () {
                  var picker = const CustomPicker(
                     maxCount: 5,
                    requestType: MyRequestType.image,
                 ).getPicAssets(context);
               picker.then((value) {
            selectedAssetList = value;
          convertToFileList();
      });
    })
```


## BottomSheets

```dart
ElevatedButton(
                onPressed: () {
                  var picker = CustomPickers.bottomSheets(
                    context: context,
                    maxCount: 5,
                    requestType: MyRequestType.image,
                  );
                  picker.then(
                    (value) {
                      setState(() {
                        selectedAssetList = value;
                        convertToFileList(); // تبدیل AssetEntity به فایل‌ها
                      });
                    },
                  );
                },
                child: const Text("BottomSheet"),
              ),
```

## TelegramMediaPickers

- Step 1: Create a GlobalKey
 Start by creating a GlobalKey to manage the state of the TelegramMediaPickers widget.

```dart
final GlobalKey<TelegramMediaPickersState> _sheetKey = GlobalKey();

```

- Step 2: Create a Button to Open the Picker
Next, create a button that will open the media picker when pressed.

```dart
ElevatedButton(
  onPressed: () {
    // Open the TelegramMediaPickers
    _sheetKey.currentState?.toggleSheet(context);
  },
  child: const Text("Open Telegram Pickers"),
),

```

- Step 3: Implement the TelegramMediaPickers Widget
Add the TelegramMediaPickers widget to your widget tree. It's important to set the requestType to a general value (like MyRequestType.all) to ensure that all types of media (images, videos, files) are displayed. Avoid changing this to a more specific type if you want the user to have access to all media options.

```dart
TelegramMediaPickers(
  key: _sheetKey,
  requestType: MyRequestType.all, // Set to 'all' to display images, videos, and files
  maxCountPickMedia: 5, // Maximum number of media that can be selected
  primeryColor: Colors.green, // Primary color for the UI
  isRealCameraView: false, // Set to true to use the real camera view
  onMediaPicked: (assets, files) {
    if (files != null) {
      for (var file in files) {
        debugPrint(file.path); // Print the path of selected files
      }
    } else if (assets != null) {
      for (var asset in assets) {
        debugPrint("Asset: ${asset.file}"); // Print the asset details
      }
    }
  },
),


```

- Complete Example
Here's a complete example of how to implement the TelegramMediaPickers in your Flutter app. This example shows how to select media files, convert them to a list of File, and prepare them for database storage.

```dart
import 'package:flutter/material.dart';
import 'package:telegram_media_pickers/telegram_media_pickers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<TelegramMediaPickersState> _sheetKey = GlobalKey();
  
  List<File>? imageFiles = [];
  List<AssetEntity> selectedAssetList = [];

  void convertToFileList() async {
    List<File>? files = [];

    for (var asset in selectedAssetList) {
      final file = await asset.file; // Convert AssetEntity to File
      if (file != null) {
        files.add(file);
      }
    }
    setState(() {
      imageFiles = files; // Update the state with the list of files
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Open and close TelegramMediaPickers
                _sheetKey.currentState?.toggleSheet(context);
                setState(() {});
              },
              child: const Text("Telegram Pickers"),
            ),
          ),

          // TelegramMediaPickers widget
        TelegramMediaPickers(
            key: _sheetKey,
            requestType: MyRequestType.all, // Set to 'all' to display all media types
            maxCountPickMedia: 5,
            maxCountPickFiles: 5,
            primeryColor: Colors.green,
            isRealCameraView: false,
            onMediaPicked: (assets, files) {
              // Update the selectedAssetList
              if (assets != null) {
                selectedAssetList = assets;
                convertToFileList(); // Convert selected assets to files
              }

              if (files != null) {
                for (var file in files) {
                  debugPrint(file.path); // Print the path of selected files
                }
              }
            },
          )
        ],
      ),
    );
  }
}
```

## scaffoldBottomSheet

```dart
elevatedButton(
 onPressed: () async {
 await CustomPickers.scaffoldBottomSheet(
 context: context,
 maxCount: 5,
 requestType: MyRequestType.image,
 confirmText: "Confirm",
 textEmptyList: "No album found",
 confirmButtonColor: Colors.blue,
 confirmTextColor: Colors.white,
 backgroundColor: Colors.white,
 textEmptyListColor: Colors.grey,
 backgroundSnackBarColor: Colors.red,
 ).then((value) {
 selectedAssetList = value;
 convertToFileList();
 });
 },
 child: const Text("scaffoldBottomSheet"),
 ),
```


## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
