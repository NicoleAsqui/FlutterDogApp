import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileSystemUtils {
  static Future<Directory?> getLocalDirectory(String directoryName) async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final Directory directory = Directory('${appDocDir.path}/$directoryName');
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      return directory;
    } catch (e) {
      print('Error getting local directory: $e');
      return null;
    }
  }

  static Future<File?> saveFile(String directoryName, String fileName, List<int> bytes) async {
    try {
      final Directory? directory = await getLocalDirectory(directoryName);
      if (directory != null) {
        final File file = File('${directory.path}/$fileName');
        await file.writeAsBytes(bytes);
        return file;
      }
    } catch (e) {
      print('Error saving file: $e');
    }
    return null;
  }
}
