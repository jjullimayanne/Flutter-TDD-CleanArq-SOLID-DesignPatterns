import 'package:meta/meta.dart';

import '../entities/entities.dart';

//serve como modelo para outras classes que dela herdem, nao podem ser instanciadas por si só
//para ter um objeto de uma classe abstrata é necessario criar uma classe mais especializada herdando dela e entao instanciar essa nova classe 

abstract class Authentication {
  Future<AccountEntity>auth({
    @required String email, 
    @required String password
    });
}
