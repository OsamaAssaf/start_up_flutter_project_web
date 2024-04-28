import '../helpers/all_imports.dart';
import '../helpers/conflict_imports.dart' as en;

class EncryptionService {
  EncryptionService._();
  static final EncryptionService _instance = EncryptionService._();
  factory EncryptionService() => _instance;

  Future<String> encrypt(String plainText) async {
    final en.IV iv = _getIv();
    final en.Encrypter encrypter = _getEncrypter();
    final en.Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  Future<String> decrypt(String encryptedText) async {
    final en.IV iv = _getIv();
    final en.Encrypter encrypter = _getEncrypter();
    final String decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }

  en.Encrypter _getEncrypter() {
    final en.Key key = en.Key.fromBase64(DotenvManager.encryptionKey);
    final en.Encrypter encrypter = en.Encrypter(en.AES(key, mode: en.AESMode.ecb));
    return encrypter;
  }

  en.IV _getIv() {
    final en.IV iv = en.IV.fromLength(16);
    return iv;
  }
}
