import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateUrl(String offSet, String path) {
  final ts = DateTime.now().microsecondsSinceEpoch.toString();
  const apiKey = '9211929f79e57886dd7bdfa5d6e4c775';
  const privateKey = '0f6709b9957052ffa18e4c0f666e57ea3c7bb24f';

  return Uri(
    scheme: 'http',
    host: 'gateway.marvel.com',
    path: '/v1/public/$path',
    queryParameters: {
      'apikey': apiKey,
      'ts': ts,
      'hash': md5.convert(utf8.encode(ts + privateKey + apiKey)).toString(),
      'offset': offSet
    },
  ).toString();
}
