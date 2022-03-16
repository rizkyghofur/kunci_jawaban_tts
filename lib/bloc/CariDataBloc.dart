import 'package:kunci_jawaban_tts/models/responses/CariDataResponse.dart';
import 'package:kunci_jawaban_tts/repositories/CariData.dart';

class CariDataBloc {
  CariData cariData = CariData();

  Future<CariDataResponse> ambilData(String kata) async {
    try {
      return cariData.cariData(kata);
    } catch (e) {
      return null;
    }
  }
}
