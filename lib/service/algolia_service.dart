import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import 'package:algolia/algolia.dart';

class AlgoliaService {
  static const Algolia algolia = Algolia.init(
      /* applicationId: "YBCSYQA18B",
    apiKey: "199c262d8d137ad07d4ecc932ea59208",*/
      applicationId: "latency",
      apiKey: "927c3fe76d4b52c5a2912973f35a3077");
}
