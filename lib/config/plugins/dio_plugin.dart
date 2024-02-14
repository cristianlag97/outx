import 'package:dio/dio.dart';

import 'dotenv_plugin.dart';

Dio get dio => Dio(
      BaseOptions(baseUrl: DotenvPlugin.apiUrl),
    );
