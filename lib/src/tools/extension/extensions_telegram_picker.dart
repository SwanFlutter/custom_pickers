import 'package:flutter/material.dart';
import 'package:flutter_saver/flutter_saver.dart';
import 'package:iconsax/iconsax.dart';

List<String> allowedExtensions = [
  // Textual and administrative documents
  '.doc', '.docx', '.rtf', '.txt', '.odt', '.pdf',
  '.xls', '.xlsx', '.csv', '.ods',
  '.ppt', '.pptx', '.odp',

  // Compressed files
  '.zip', '.rar', '.7z', '.tar', '.gz',

  "wbs",

  // Design and engineering files
  '.dwg', '.dxf', '.dwf', // AutoCAD
  '.skp', // SketchUp
  '.psd', // Photoshop
  '.ai', '.eps', // Adobe Illustrator
  '.indd', // Adobe InDesign
  '.blend', // Blender

  // Programming and web files
  '.html', '.css', '.js', '.php', '.py', '.java', '.cpp', '.c', '.h',
  '.swift', '.kt', '.dart', '.go', '.rb', '.pl', '.sql',

  // Executable and installation files
  '.exe', '.msi', '.apk', '.app',

  // System and configuration files
  '.ini', '.cfg', '.conf', '.log', '.sys',

  // Database files
  '.db', '.sqlite', '.mdb', '.accdb',

  // Font files
  '.ttf', '.otf', '.woff', '.woff2',

  // Email files
  '.eml', '.msg',

  // 3D modeling files
  '.obj', '.fbx', '.3ds', '.max',

  // GIS and map files
  '.shp', '.kml', '.kmz',

  // Scientific and research files
  '.mat', '.nb', '.r', '.sav',

  // E-book files
  '.epub', '.mobi',

  // Virtual machine files
  '.vdi', '.vmdk', '.ova',

  // Backup files
  '.bak', '.old', '.backup',
];

List<String> common = [
  // Text documents and word processing
  '.txt', '.doc', '.docx', '.rtf', '.odt', '.pages',

  // PDF files
  '.pdf',

  // Spreadsheets
  '.xls', '.xlsx', '.csv', '.ods', '.numbers',

  // Presentations
  '.ppt', '.pptx', '.key', '.odp',

  // Compressed files
  '.zip', '.rar', '.7z', '.tar', '.gz',

  // Image files
  '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp',

  // Audio files
  '.mp3', '.wav', '.aac', '.ogg', '.flac',

  // Video files
  '.mp4', '.avi', '.mov', '.wmv', '.flv', '.mkv',

  // Programming files and code
  '.html', '.css', '.js', '.json', '.xml', '.py', '.java', '.cpp', '.c',
  '.swift', '.kt',

  // System and configuration files
  '.ini', '.cfg', '.log', '.dat',

  // Email files
  '.eml', '.msg',

  // Font files
  '.ttf', '.otf', '.woff', '.woff2',

  // Database files
  '.db', '.sqlite', '.sql',

  // Executable files (use with caution)
  '.exe', '.app', '.dmg',

  // Vector files and design
  '.svg', '.ai', '.eps', '.psd',

  // E-book files
  '.epub', '.mobi',

  // Web related files
  '.htm', '.php', '.asp', '.jsp',

  // Files related to virtualization
  '.iso', '.vdi', '.vmdk',

  // and other common formats
];

List<String> allowedExtensionsVideo = [
  // Video files
  '.mp4', '.avi', '.mov', '.wmv', '.flv', '.mkv',
];

List<String> allowedExtensionsAudio = [
  // Audio files
  '.mp3', '.wav', '.aac', '.ogg', '.flac', '.amr', '.m4a', '.wma',
];

List<String> publicDirectories = [
  ExternalPath.DIRECTORY_MUSIC,
  ExternalPath.DIRECTORY_PODCASTS,
  ExternalPath.DIRECTORY_RINGTONES,
  ExternalPath.DIRECTORY_ALARMS,
  ExternalPath.DIRECTORY_NOTIFICATIONS,
  ExternalPath.DIRECTORY_PICTURES,
  ExternalPath.DIRECTORY_MOVIES,
  ExternalPath.DIRECTORY_DOWNLOADS,
  ExternalPath.DIRECTORY_DCIM,
  ExternalPath.DIRECTORY_DOCUMENTS,
  ExternalPath.DIRECTORY_SCREENSHOTS,
  ExternalPath.DIRECTORY_AUDIOBOOKS,
];

Future<List<String?>> getPublicDirectories() async {
  final externalPathIos = ExternalPathIosMac();

  // دریافت لیست مسیرهای عمومی برای دایرکتوری‌ها
  List<String?> publicDirectories = await Future.wait([
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_DOWNLOADS),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_MUSIC),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_PODCASTS),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_RINGTONES),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_ALARMS),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_NOTIFICATIONS),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_PICTURES),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_MOVIES),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_DCIM),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_DOCUMENTS),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_SCREENSHOTS),
    externalPathIos.getDirectoryPath(
        directory: ExternalPathIosMac.DIRECTORY_AUDIOBOOKS),
  ]);

  return publicDirectories;
}

Widget getIconForFile(String extension) {
  Map<String, IconData> icons = {
    '.doc': Iconsax.document_1,
    '.docx': Iconsax.document_1,
    '.rtf': Iconsax.document_text,
    '.txt': Iconsax.document_text,
    '.odt': Iconsax.document_1,
    '.pdf': Iconsax.document_favorite,
    '.xls': Iconsax.chart_2,
    '.xlsx': Iconsax.chart_2,
    '.csv': Iconsax.chart_21,
    '.ods': Iconsax.chart_2,
    '.ppt': Iconsax.document,
    '.pptx': Iconsax.document,
    '.odp': Iconsax.document,
    '.zip': Iconsax.archive,
    '.rar': Iconsax.archive,
    '.7z': Iconsax.archive,
    '.tar': Iconsax.archive,
    '.gz': Iconsax.archive,
    '.wbs': Iconsax.task,
    '.dwg': Iconsax.ruler,
    '.dxf': Iconsax.ruler,
    '.dwf': Iconsax.ruler,
    '.skp': Iconsax.document,
    '.psd': Iconsax.image,
    '.ai': Iconsax.brush_2,
    '.eps': Iconsax.brush_2,
    '.indd': Iconsax.book_1,
    '.blend': Iconsax.document,
    '.html': Iconsax.code,
    '.css': Iconsax.code_1,
    '.js': Icons.javascript,
    '.php': Icons.php,
    '.py': Iconsax.document,
    '.java': Icons.javascript_sharp,
    '.cpp': Iconsax.code,
    '.c': Iconsax.code,
    '.h': Iconsax.code,
    '.swift': Iconsax.code,
    '.kt': Iconsax.code,
    '.dart': Iconsax.code,
    '.go': Iconsax.code,
    '.rb': Iconsax.code,
    '.pl': Iconsax.code,
    '.sql': Iconsax.data,
    '.mp3': Iconsax.music,
    '.wav': Iconsax.music_circle,
    '.ogg': Iconsax.music_dashboard,
    '.flac': Iconsax.music_filter,
    '.aac': Iconsax.music_library_2,
    '.wma': Iconsax.music_play,
    '.mp4': Iconsax.video,
    '.avi': Iconsax.video_circle,
    '.mov': Iconsax.video_horizontal,
    '.wmv': Iconsax.video_octagon,
    '.flv': Iconsax.video_play,
    '.mkv': Iconsax.video_square,
    '.exe': Iconsax.code_circle,
    '.msi': Iconsax.code_circle,
    '.apk': Icons.android,
    '.app': Icons.apple,
    '.ini': Iconsax.setting_2,
    '.cfg': Iconsax.setting_3,
    '.conf': Iconsax.setting_4,
    '.log': Iconsax.document_text,
    '.sys': Iconsax.cpu,
    '.db': Iconsax.data,
    '.sqlite': Iconsax.data,
    '.mdb': Iconsax.data,
    '.accdb': Iconsax.data,
    '.ttf': Iconsax.text,
    '.otf': Iconsax.text,
    '.woff': Iconsax.text,
    '.woff2': Iconsax.text,
    '.eml': Iconsax.sms,
    '.msg': Iconsax.message,
    '.obj': Icons.data_object,
    '.fbx': Iconsax.document,
    '.3ds': Iconsax.document,
    '.max': Iconsax.document,
    '.shp': Iconsax.map,
    '.kml': Iconsax.map,
    '.kmz': Iconsax.map,
    '.mat': Iconsax.math,
    '.nb': Iconsax.note,
    '.r': Iconsax.code,
    '.sav': Iconsax.save_2,
    '.epub': Iconsax.book,
    '.mobi': Iconsax.book_1,
    '.vdi': Iconsax.monitor,
    '.vmdk': Iconsax.monitor,
    '.ova': Iconsax.monitor,
    '.bak': Iconsax.refresh_circle,
    '.old': Iconsax.clock,
    '.backup': Iconsax.refresh_square_2,
    '.jpg': Iconsax.gallery,
    '.jpeg': Iconsax.gallery,
    '.png': Iconsax.gallery_favorite,
    '.gif': Iconsax.gallery_import,
  };

  Map<String, Color> colors = {
    '.doc': Colors.blue,
    '.docx': Colors.blue,
    '.rtf': Colors.blueGrey,
    '.txt': Colors.grey,
    '.odt': Colors.teal,
    '.pdf': Colors.red,
    '.xls': Colors.green,
    '.xlsx': Colors.green,
    '.csv': Colors.lightGreen,
    '.ods': Colors.lightGreen,
    '.ppt': Colors.orange,
    '.pptx': Colors.orange,
    '.odp': Colors.deepOrange,
    '.zip': Colors.purple,
    '.rar': Colors.deepPurple,
    '.7z': Colors.purple,
    '.tar': Colors.purpleAccent,
    '.gz': Colors.deepPurple,
    '.wbs': Colors.brown,
    '.dwg': Colors.indigo,
    '.dxf': Colors.indigo,
    '.dwf': Colors.indigo,
    '.skp': Colors.cyan,
    '.psd': Colors.deepPurple,
    '.ai': Colors.orange,
    '.eps': Colors.orange,
    '.indd': Colors.pink,
    '.blend': Colors.lightBlue,
    '.html': Colors.orangeAccent,
    '.css': Colors.blue,
    '.js': Colors.yellow,
    '.php': Colors.indigo,
    '.py': Colors.green,
    '.java': Colors.brown,
    '.cpp': Colors.lightBlue,
    '.c': Colors.blue,
    '.h': Colors.blueGrey,
    '.swift': Colors.orange,
    '.kt': Colors.purple,
    '.dart': Colors.blue,
    '.go': Colors.cyan,
    '.rb': Colors.red,
    '.pl': Colors.indigo,
    '.sql': Colors.teal,
    '.mp3': Colors.pink,
    '.wav': Colors.pinkAccent,
    '.ogg': Colors.deepPurple,
    '.flac': Colors.purple,
    '.aac': Colors.purpleAccent,
    '.wma': Colors.pink,
    '.mp4': Colors.redAccent,
    '.avi': Colors.red,
    '.mov': Colors.deepOrange,
    '.wmv': Colors.orange,
    '.flv': Colors.amber,
    '.mkv': Colors.deepOrange,
    '.exe': Colors.grey,
    '.msi': Colors.blueGrey,
    '.apk': Colors.green,
    '.app': Colors.deepPurple,
    '.ini': Colors.grey,
    '.cfg': Colors.blueGrey,
    '.conf': Colors.grey,
    '.log': Colors.brown,
    '.sys': Colors.blueGrey,
    '.db': Colors.teal,
    '.sqlite': Colors.tealAccent,
    '.mdb': Colors.green,
    '.accdb': Colors.lightGreen,
    '.ttf': Colors.deepPurple,
    '.otf': Colors.purple,
    '.woff': Colors.purpleAccent,
    '.woff2': Colors.deepPurpleAccent,
    '.eml': Colors.red,
    '.msg': Colors.redAccent,
    '.obj': Colors.brown,
    '.fbx': Colors.amber,
    '.3ds': Colors.orange,
    '.max': Colors.deepOrange,
    '.shp': Colors.green,
    '.kml': Colors.lightGreen,
    '.kmz': Colors.lime,
    '.mat': Colors.blue,
    '.nb': Colors.indigo,
    '.r': Colors.red,
    '.sav': Colors.teal,
    '.epub': Colors.green,
    '.mobi': Colors.lightGreen,
    '.vdi': Colors.grey,
    '.vmdk': Colors.blueGrey,
    '.ova': Colors.grey,
    '.bak': Colors.amber,
    '.old': Colors.brown,
    '.backup': Colors.orange,
    '.jpg': Colors.blue,
    '.jpeg': Colors.blue,
    '.png': Colors.blue,
    '.gif': Colors.purple,
  };

  IconData iconData = icons[extension.toLowerCase()] ?? Icons.insert_drive_file;
  Color color = colors[extension.toLowerCase()] ?? Colors.grey;

  return Icon(iconData, color: color);
}
