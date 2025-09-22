import 'dart:io';
import 'package:open_file_plus/open_file_plus.dart';

Future<void> openFileInWhatsApp(File file) async {
  await OpenFile.open(file.path);
}