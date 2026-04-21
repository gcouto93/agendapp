import 'package:agenda_ja_app/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderConfig {
  static List<SingleChildWidget> init = [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
  ];
}
