import 'package:scoped_model/scoped_model.dart';

import 'shared_data.dart';
import 'products.dart';
import 'users.dart';

class MainModel extends Model with SharedDataModel, UsersModel, ProductsModel {

}

