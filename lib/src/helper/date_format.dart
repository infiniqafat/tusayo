
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;


  Future<String> getLoacleAndDate({DateTime dateParam, String type='full'}) async {
    await intl_local_date_data.initializeDateFormatting();
    var label;
    if (type == 'full'){
      var dayFormat = DateFormat.EEEE('id_ID');
      var day = dayFormat.format(dateParam);

      var format = DateFormat.yMMMMd('id_ID');
      var date = format.format(dateParam);
      label = day + ', ' + date;
    }
    if(type == 'date_month'){
      var format = DateFormat.d('id_ID');
      var date = format.format(dateParam);
  
      var monthF = DateFormat.MMMM('id_ID');
      var mo = monthF.format(dateParam);
      label =  date +' ' +mo;
      print(label);
    }
    return label;
  }