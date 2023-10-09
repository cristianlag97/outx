import 'package:dio/dio.dart';

import '../../../../../config/config.dart';

Dio get dio => Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
      ),
    );
