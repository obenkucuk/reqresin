enum HttpUrls {
  login,
  users;

  Uri url({
    Map<String, dynamic>? queryParameters,
  }) {
    final String unencodedPath = switch (this) {
      login => '/api/login',
      users => 'api/users',
    };

    return Uri.https('reqres.in', unencodedPath, queryParameters);
  }
}
