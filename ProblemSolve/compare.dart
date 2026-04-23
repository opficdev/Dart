import 'dart:io';

const solverFilePath = ''; // 비교할 풀이 Dart 파일 경로
const solverIoFileBaseName = ''; // 풀이 코드가 읽고 쓰는 고정 입출력 파일명 베이스 이름

String normalizeOutput(String output) {
  return output.trimRight();
}

int fileNumber(String fileName) {
  return int.parse(fileName.split('.').first);
}

bool hasEmptyConfiguration() {
  return solverFilePath.isEmpty || solverIoFileBaseName.isEmpty;
}

File? resolveSolverFile() {
  var scriptDirectory = File.fromUri(Platform.script).parent;

  File resolveRelativeFile(String path) {
    var file = File(path);
    if (file.isAbsolute) {
      return file;
    }
    return File('${scriptDirectory.path}/$path');
  }

  Directory resolveRelativeDirectory(String path) {
    var directory = Directory(path);
    if (directory.isAbsolute) {
      return directory;
    }
    return Directory('${scriptDirectory.path}/$path');
  }

  File? findSingleDartFile(Directory directory) {
    if (!directory.existsSync()) {
      return null;
    }

    var dartFileList = directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))
        .toList();
    if (dartFileList.length != 1) {
      return null;
    }

    return dartFileList.first.absolute;
  }

  var directFile = resolveRelativeFile(solverFilePath);
  if (directFile.existsSync()) {
    return directFile.absolute;
  }

  if (!solverFilePath.endsWith('.dart')) {
    var dartFile = resolveRelativeFile('$solverFilePath.dart');
    if (dartFile.existsSync()) {
      return dartFile.absolute;
    }
  }

  var targetDirectory = resolveRelativeDirectory(solverFilePath);
  return findSingleDartFile(targetDirectory);
}

Future<String?> runAndReadOutput({
  required File sourceFile,
  required File solverFile,
}) async {
  var tempDirectory = await Directory.systemTemp.createTemp('compare');
  try {
    await File(
      '${tempDirectory.path}/$solverIoFileBaseName.inp',
    ).writeAsString(await sourceFile.readAsString());

    var processResult = await Process.run(Platform.resolvedExecutable, [
      solverFile.path,
    ], workingDirectory: tempDirectory.path);

    if (processResult.exitCode != 0) {
      stdout.writeln(processResult.stderr);
      return null;
    }

    var outputFile = File('${tempDirectory.path}/$solverIoFileBaseName.out');
    if (!outputFile.existsSync()) {
      return null;
    }

    return outputFile.readAsStringSync();
  } finally {
    if (tempDirectory.existsSync()) {
      tempDirectory.deleteSync(recursive: true);
    }
  }
}

Future<void> main() async {
  if (hasEmptyConfiguration()) {
    stdout.writeln('compare.dart 상단 const 값을 먼저 입력하세요.');
    return;
  }

  var solverFile = resolveSolverFile();
  if (solverFile == null || !solverFile.existsSync()) {
    stdout.writeln('비교할 풀이 파일을 찾을 수 없습니다.');
    return;
  }

  var targetDirectory = solverFile.parent;

  var inputFileList =
      targetDirectory
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.inp'))
          .toList()
        ..sort(
          (firstFile, secondFile) => fileNumber(
            firstFile.uri.pathSegments.last,
          ).compareTo(fileNumber(secondFile.uri.pathSegments.last)),
        );

  if (inputFileList.isEmpty) {
    stdout.writeln('비교할 입력 파일이 없습니다.');
    return;
  }

  var passCount = 0;
  for (var inputFile in inputFileList) {
    var inputFileName = inputFile.uri.pathSegments.last;
    var outputFileName = inputFileName.replaceFirst('.inp', '.out');
    var expectedFile = File('${targetDirectory.path}/$outputFileName');

    if (!expectedFile.existsSync()) {
      stdout.writeln('[SKIP] $inputFileName -> $outputFileName 없음');
      continue;
    }

    var actualOutput = await runAndReadOutput(
      sourceFile: inputFile,
      solverFile: solverFile,
    );
    if (actualOutput == null) {
      stdout.writeln('[FAIL] $inputFileName');
      stdout.writeln('actual output file not found');
      continue;
    }

    var expectedOutput = expectedFile.readAsStringSync();

    if (normalizeOutput(actualOutput) == normalizeOutput(expectedOutput)) {
      passCount += 1;
      stdout.writeln('[PASS] $inputFileName');
      continue;
    }

    stdout.writeln('[FAIL] $inputFileName');
    stdout.writeln('expected:');
    stdout.writeln(normalizeOutput(expectedOutput));
    stdout.writeln('actual:');
    stdout.writeln(normalizeOutput(actualOutput));
  }

  stdout.writeln('result: $passCount/${inputFileList.length} pass');
}
