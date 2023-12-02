import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportGraphInCsvUseCase {
  Future<String> createCsvFileAndGetPath(String csv) async {
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-${DateTime.now()}.csv";
    final File file = File(path);
    await file.writeAsString(csv);
    return path;
  }

  Future<ShareResultStatus> shareCsvFile(String path) async {
    final result = await Share.shareXFiles([XFile(path)]);
    return result.status;
  }
}
