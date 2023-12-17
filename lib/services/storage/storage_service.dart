abstract class IStorageService {
  Future<bool> writeString({
    required String key,
    required String data,
  });

  String readString({
    required String key,
  });

  int readInt({
    required String key,
  });

  Future<bool> writeInt({
    required String key,
    required int data,
  });

  bool readBool({
    required String key,
  });

  Future<bool> writeBool({
    required String key,
    required bool data,
  });

  Future<bool> clear();
}
