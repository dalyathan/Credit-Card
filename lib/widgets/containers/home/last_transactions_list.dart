import 'package:credit_card/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'last_transaction_tab.dart';

class LastTransactionsListContainer extends StatelessWidget {
  const LastTransactionsListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double tabheight = size.height * 0.08;
    SizedBox space = SizedBox(height: size.height * 0.025);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * 0.5,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Last transactions",
              style: GoogleFonts.sora(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        space,
        LastTransactionTabContainer(
          height: tabheight,
          transaction: Transaction(
              "https://i.scdn.co/image/ab6761610000e5ebcc9df7eebc944ee35038ccc5",
              "Tewodros Kassahun",
              "Jun 22, 12:30 am",
              246.00),
        ),
        space,
        LastTransactionTabContainer(
          height: tabheight,
          transaction: Transaction(
              "https://newafricanmagazine.com/wordpress/wp-content/uploads/2018/03/abiy-ahmed.jpg",
              "Abiy Ahmed",
              "Jun 17, 09:30 pm",
              -246.00),
        ),
        space,
        LastTransactionTabContainer(
          height: tabheight,
          transaction: Transaction("https://yageru.com/images/artists/a242.jpg",
              "Meseret Mebrate", "Jun 17, 09:30 pm", -246.00),
        )
      ],
    );
  }
}
