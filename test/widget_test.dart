import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:latkuis/main.dart';

void main() {
  testWidgets('Ubah jumlah porsi, total di beranda ikut berubah',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RestoApp());

    // Beranda menampilkan daftar menu
    expect(find.text('Nasi Goreng'), findsOneWidget);

    // Buka detail Nasi Goreng
    await tester.tap(find.text('Nasi Goreng'));
    await tester.pumpAndSettle();

    // Isi 2 porsi, total harus 2 x 15.000
    await tester.enterText(find.byType(TextField), '2');
    await tester.pump();
    expect(find.text('Rp 30.000'), findsOneWidget);

    // Simpan, kembali ke beranda
    await tester.tap(find.text('Simpan Pemesanan'));
    await tester.pumpAndSettle();

    expect(find.text('2 porsi'), findsOneWidget);
    expect(find.text('Rp 30.000'), findsOneWidget);
  });
}