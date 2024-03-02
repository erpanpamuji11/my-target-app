
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:my_terget_app/features/business/data/data_sources/business_data_source.dart';
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';

@GenerateMocks([
  BusinessRepository,
  BusinessDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
  MockSpec<IOClient>(as: #MockIOClient),
])

void main() {}