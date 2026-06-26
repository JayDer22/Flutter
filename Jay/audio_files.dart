import 'package:photo_manager/photo_manager.dart';

Future<void> requestPermission() async {
  final PermissionState permission =
  await PhotoManager.requestPermissionExtend();

  if (permission.isAuth) {
    print("Permission Granted");
    fetchFiles();
  } else {
    print("Permission Denied");
  }
}

Future<void> fetchFiles() async {
  List<AssetPathEntity> albums =
  await PhotoManager.getAssetPathList(
    type: RequestType.image,
  );

  print(albums);
}