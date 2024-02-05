import 'package:bloc_cubit_base/services/graphql_service.dart';

class AuthRepository {
  GraphQLService graphQLService;

  AuthRepository({required this.graphQLService});

// Future<TokenEntity?> getToken() async {
// return await SecureStorageHelper.instance.getToken();
// }
}
