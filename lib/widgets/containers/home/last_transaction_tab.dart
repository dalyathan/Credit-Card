import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../models/transactions.dart';
import '../../icons/in.dart';
import '../../icons/out.dart';

class LastTransactionTabContainer extends StatelessWidget {
  final double height;
  final Transaction transaction;
  const LastTransactionTabContainer(
      {Key? key, required this.height, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconDiameter = height * 0.75;
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(iconDiameter * 0.5),
            child: SizedBox(
                width: iconDiameter,
                height: iconDiameter,
                child: CachedNetworkImage(imageUrl: transaction.imageUrl)),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                  width: size.width * 0.35,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        transaction.name,
                        style: GoogleFonts.sora(fontWeight: FontWeight.bold),
                      ))),
              const Spacer(
                flex: 4,
              ),
              SizedBox(
                  width: size.width * 0.4,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        transaction.dateTime,
                        style: GoogleFonts.sora(color: Colors.grey),
                      ))),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Row(children: [
                transaction.amount > 0
                    ? OutIcon(height: height * 0.25)
                    : InIcon(height: height * 0.25),
                SizedBox(width: size.width * 0.02),
                Text(
                  transaction.amount > 0 ? "Out" : "In",
                  style: GoogleFonts.sora(
                      color: transaction.amount > 0
                          ? const Color.fromRGBO(255, 109, 109, 1)
                          : const Color.fromRGBO(50, 209, 185, 1),
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                )
              ]),
              const Spacer(
                flex: 2,
              ),
              SizedBox(
                height: height * 0.4,
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text('\$${transaction.amount.abs()}',
                        style: GoogleFonts.sora(fontWeight: FontWeight.bold))),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
