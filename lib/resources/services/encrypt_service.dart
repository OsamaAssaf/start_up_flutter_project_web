import 'package:encrypt/encrypt.dart';

import '../managers/constants_manager.dart';

class EncryptionService {
  EncryptionService._();
  static final EncryptionService instance = EncryptionService._();

  Future<String> encrypt(String plainText) async {
    final IV iv = _getIv();
    final Encrypter encrypter = _getEncrypter();
    final Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  Future<String> decrypt(String encryptedText) async {
    final IV iv = _getIv();
    final Encrypter encrypter = _getEncrypter();
    final String decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }

  Encrypter _getEncrypter() {
    final Key key = Key.fromBase64(DotenvManager.encryptionKey);
    final Encrypter encrypter = Encrypter(AES(key, mode: AESMode.ecb));
    return encrypter;
  }

  IV _getIv() {
    final IV iv = IV.fromLength(16);
    return iv;
  }
}
