import 'dart:io';

import 'package:purchases_flutter/purchases_flutter.dart';

// enum EntitlementStatus{
//   premium;

//   String get id{
//     switch(this){
//       case premium:return 'premium';
//     }
//   }
// }

enum ProductStatus{
  tickets5,tickets10,tickets30;

  String get id{
      switch(this){
      case tickets5:return 'ticket_5';
      case tickets10:return 'ticket_10';
      case tickets30:return 'ticket_30';
    }
  }

  // String get productId{
  //     switch(this){
  //     case proMonthlyIOS:return 'prod4e0a062bb7';
  //     case proMonthlyAndroid:return 'prod2167791bde';
  //   }
  // }
}