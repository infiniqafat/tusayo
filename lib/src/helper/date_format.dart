
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;


  Future<String> getLoacleAndDate(DateTime dateParam) async {
    await intl_local_date_data.initializeDateFormatting();
    var dayFormat = DateFormat.EEEE('id_ID');
    var day = dayFormat.format(dateParam);

    var format = DateFormat.yMMMMd('id_ID');
    var date = format.format(dateParam);
    var label = day + ', ' + date;
    return label;
  }