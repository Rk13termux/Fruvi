import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fruvi/models/cart_item.dart';

class ExcelService {
  Future<File> generateOrderExcel(List<CartItem> items) async {
    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet()!];

    // Título
    sheet!.insertRowIterables([['PEDIDO FRUVI - ${DateTime.now().toLocal()}']], 0);
    sheet.insertRowIterables([[]], 1);
    sheet.insertRowIterables([
      ['Producto', 'Cantidad', 'Tipo', 'Precio Unit.', 'Total']
    ], 2);

    double total = 0;
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final subtotal = item.totalPrice;
      total += subtotal;
      sheet.insertRowIterables([
        [
          item.product.name,
          item.quantity,
          item.measurementType,
          '\$${item.getPriceByType().toStringAsFixed(2)}',
          '\$${subtotal.toStringAsFixed(2)}'
        ]
      ], i + 3);
    }

    sheet.insertRowIterables([['', '', '', 'TOTAL:', '\$${total.toStringAsFixed(2)}']], items.length + 4);

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/pedido_fruvi.xlsx');
    await file.writeAsBytes(excel.save());

    return file;
  }
}