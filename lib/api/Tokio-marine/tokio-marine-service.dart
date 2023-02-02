import '../../utils/request.dart';
import 'i-tokio-marine-service.dart';

class TokioMarineService extends Service implements ITokioMarineService {
  TokioMarineService() : super();

  Future<bool> Authentication(String email, String senha) async {
    try {
      String url =
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCB5iYh2oEC4aiKS3uN9o4wrPmukzDXNOY";
      var response = await request(url, Service.HTTP_POST,
          body: {"email": email, "password": senha, "returnSecureToken": true});

      return response!.statusCode >= 200 || response.statusCode <= 300;
    } catch (e) {
      return false;
    }
  }
}
