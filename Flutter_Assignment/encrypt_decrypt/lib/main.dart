import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:encrypt/encrypt.dart' as enc;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isGranted = false;
  String fileName = 'Flower.jpeg';
  String fileURL = '/storage/emulated/0/Pictures/Flower.jpeg';
  Future<Directory> get getAppDir async {
    final appDocDir = await getExternalStorageDirectory();
    return appDocDir!;
  }

  Future<Directory> get getExternalVisibleDir async {
    if (await Directory('/storage/emulated/0/MyEncrypted').exists()) {
      final externalDir = Directory('/storage/emulated/0/Pictures/MyEncrypted');
      return externalDir;
    } else {
      await Directory('/storage/emulated/0/Pictures/MyEncrypted')
          .create(recursive: true);
      final externalDir = Directory('/storage/emulated/0/Pictures/MyEncrypted');
      return externalDir;
    }
  }

  requestStoragePermission() async {
    if (!await Permission.storage.isGranted) {
      PermissionStatus result = await Permission.storage.request();
      if (result.isGranted) {
        setState(() {
          _isGranted = true;
        });
      } else {
        _isGranted = false;
      }
    }
  }

  Future<String> getExternalStorageDirectoryPath() async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                if (_isGranted) {
                  String externalStoragePath =
                      await getExternalStorageDirectoryPath();
                  Directory d =
                      Directory('$externalStoragePath/Pictures/MyEncrypted');
                  _encryptedFile(fileURL, d, fileName);
                } else {
                  print('no permission');
                  requestStoragePermission();
                }
              },
              child: Text("Encrypt"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_isGranted) {
                  String externalStoragePath =
                      await getExternalStorageDirectoryPath();
                  Directory d =
                      Directory('$externalStoragePath/Pictures/MyEncrypted');
                  _getNormalFile(d, fileName);
                } else {
                  print('no permission');
                  requestStoragePermission();
                }
              },
              child: Text("Decrypt"),
            )
          ],
        ),
      ),
    );
  }

  _encryptedFile(String url, Directory d, filename) async {
    print("Data Encrypting");
    var resp =
        await File('/storage/emulated/0/Pictures/Flower.jpeg').readAsBytes();
    var encResult = _encryptData(resp);
    String p = await _writeData(encResult, '${d.path}/$filename.aes');
    print("File encrypted");
  }

  _getNormalFile(Directory d, filename) async {
    Uint8List encData = await _readData('${d.path}/$filename.aes');
    var plainData = await _decryptData(encData);
    String p = await _writeData(plainData, '${d.path}/${filename}');
    print("File decrypted");
  }

  _encryptData(plainString) {
    print("Encrypting file");
    final encrypted =
        MyEncrypt.myEncrypter.encryptBytes(plainString, iv: MyEncrypt.myIv);
    return encrypted.bytes;
  }

  _decryptData(encData) {
    print("File decryption in progress");
    enc.Encrypted en = enc.Encrypted(encData);
    return MyEncrypt.myEncrypter.decryptBytes(en, iv: MyEncrypt.myIv);
  }

  Future<Uint8List> _readData(fileNameWithPath) async {
    print("Reading data");
    File f = File(fileNameWithPath);
    return await f.readAsBytes();
  }

  Future<String> _writeData(dataToWrite, fileNameWithPath) async {
    print("Writing data");
    File f = await File(fileNameWithPath).create(recursive: true);
    await f.writeAsBytes(dataToWrite);
    return f.absolute.toString();
  }
}

class MyEncrypt {
  static final myKey = enc.Key.fromUtf8('1234567890123456');
  static final myIv = enc.IV.fromUtf8('shriraj');
  static final myEncrypter = enc.Encrypter(enc.AES(myKey));
}
