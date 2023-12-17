abstract class INetworkService<T> {
  Future<T> post({
    required String path,
    T data,
    Map<String, String>? header,
  });

  Future<T> get({
    required String path,
    Map<String, String>? header,
  });

  Future<T> gaurdedPost({
    required String path,
    T data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  });

   Future<T> gaurdedPut({
    required String path,
    T data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  });

  Future<T> gaurdedGet({
    required String path,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  });

  Future<T> upload({
    required String path,
    required Map<String, dynamic> formData,
    String? baseURL,
    Map<String, String>? header,
  });
}
