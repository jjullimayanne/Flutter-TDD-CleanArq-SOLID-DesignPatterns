import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });
  //garantir que o remote chame com a url correta
  Future<void> auth() async {
    await httpClient.request(url: url, method: 'POST');
  }
}

//definir class abstrata que recebe um parametro obrigatorio
abstract class HttpClient {
  Future<void> request({
    @required String url,
    @required String method,
  }) {}
}

// a classe precisa ser implementada da abstrata para que possa ser testada
class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('should call httpclient with corret values ', () async {
    // arrange
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);

    // act
    await sut.auth();

    // assert
    verify(httpClient.request(
      url: url,
      method: 'POST',
    ));
  });
}
