import 'package:custom_pickers/src/tools/media_services.dart';
import 'package:custom_pickers/src/widget/image_widget.dart';
import 'package:custom_pickers/src/widget/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class CustomPicker extends StatefulWidget {
  final int maxCount;
  final MyRequestType requestType;
  final bool showOnlyVideo;
  final bool showOnlyImage;
  final String confirmText;
  final String textTitleImageTabBar;
  final String textTitleVideoTabBar;
  final String textEmptyList;
  final Widget title;
  final Color confirmTextColor;
  final Color backBottomColor;
  final Color backgroundColor;
  final Color backgroundAppBarColor;
  final Color backgroundTabBarColor;
  final Color indicatorColor;
  final Color textEmptyListColor;
  const CustomPicker({
    super.key,
    required this.maxCount,
    required this.requestType,
    this.showOnlyVideo = true,
    this.showOnlyImage = true,
    this.confirmText = "Send",
    this.textTitleImageTabBar = "Image",
    this.textTitleVideoTabBar = "Video",
    this.textEmptyList = "No albums found.",
    this.confirmTextColor = Colors.white,
    this.backBottomColor = Colors.white,
    this.backgroundColor = const Color.fromARGB(255, 206, 164, 236),
    this.backgroundAppBarColor = const Color.fromARGB(255, 206, 164, 236),
    this.backgroundTabBarColor = const Color(0xFF6A0DAD),
    this.indicatorColor = Colors.blue,
    this.textEmptyListColor = const Color(0xFF6A0DAD),
    this.title = const Text(
      'Album',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  });

  @override
  State<CustomPicker> createState() => _CustomPickerState();
  Future<List<AssetEntity>> getPicAssets(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomPicker(
          maxCount: maxCount,
          requestType: requestType,
          showOnlyVideo: showOnlyVideo,
          showOnlyImage: showOnlyImage,
          confirmText: confirmText,
          textTitleImageTabBar: textTitleImageTabBar,
          textTitleVideoTabBar: textTitleVideoTabBar,
          textEmptyList: textEmptyList,
          confirmTextColor: confirmTextColor,
          backBottomColor: backBottomColor,
          backgroundColor: backgroundColor,
          backgroundAppBarColor: backgroundAppBarColor,
          backgroundTabBarColor: backgroundTabBarColor,
          indicatorColor: indicatorColor,
        ),
      ),
    );
    if (result != null && result.isNotEmpty) {
      return result;
    }
    return [];
  }
}

class _CustomPickerState extends State<CustomPicker>
    with AutomaticKeepAliveClientMixin {
  AssetEntity? selectedEntity;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetsList = [];
  List<AssetEntity> selectedAssetList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _startLoading();
    _loadAlbum();
  }

  void _startLoading() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 10),
      () {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      },
    );
  }

  Future<void> _loadAlbum() async {
    MediaServices.loadAlbums(widget.requestType).then((value) {
      setState(() {
        if (value == null || value.isEmpty) {
          albumList = [];
        } else {
          albumList = value;
          selectedAlbum = value[0];

          MediaServices.loadAssets(selectedAlbum!).then((value) {
            setState(() {
              if (value == null || value.isEmpty) {
                selectedEntity = null;
                assetsList = [];
              } else {
                selectedEntity = value[0];
                assetsList = value;
              }
            });
          }).catchError((error) {
            debugPrint("Error loading assets: $error");
          });
        }
      });
    }).catchError((error) {
      debugPrint("Error loading albums: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: widget.backgroundColor,
          appBar: AppBar(
            backgroundColor: widget.backgroundAppBarColor,
            title: widget.title,
            centerTitle: true,
            leading: BackButton(
              color: widget.backBottomColor,
              onPressed: () {
                setState(() {
                  selectedAssetList.clear();
                  Navigator.pop(context);
                });
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkResponse(
                  onTap: () {
                    if (selectedAssetList.isNotEmpty) {
                      Navigator.pop(context, selectedAssetList);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: widget.backgroundTabBarColor,
                          margin: const EdgeInsets.all(15.0),
                          behavior: SnackBarBehavior.floating,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          content: const Text("No image selected"),
                        ),
                      );
                    }
                  },
                  child: Text(
                    widget.confirmText,
                    style: TextStyle(
                      color: widget.confirmTextColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height + 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    height: 40,
                    color: widget.backgroundTabBarColor,
                    child: TabBar(
                      indicatorWeight: 4,
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: widget.indicatorColor,
                      unselectedLabelColor: Colors.white,
                      labelStyle: const TextStyle(fontSize: 18),
                      tabs: [
                        Text(widget.textTitleImageTabBar),
                        Text(widget.textTitleVideoTabBar),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: TabBarView(
                        children: [
                          ImageWidget(
                            size: size,
                            widget: widget,
                            selectedAssetList: selectedAssetList,
                            assetsList: assetsList,
                            selectedEntity: selectedEntity,
                            loading: isLoading,
                          ),
                          VideoWidget(
                            size: size,
                            widget: widget,
                            selectedAssetList: selectedAssetList,
                            assetsList: assetsList,
                            selectedEntity: selectedEntity,
                            loading: isLoading,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
