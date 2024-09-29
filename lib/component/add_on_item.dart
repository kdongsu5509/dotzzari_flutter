import 'package:dotzzari/common/const/dozzari_color.dart';
import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOnItem extends StatelessWidget {
  final String title;
  final String price;
  final int quantity;
  final VoidCallback onIncrease;

  const AddOnItem({
    Key? key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                fillColor: WidgetStateProperty.all(BRAND_SECONDARY_COLOR),
                checkColor: BG_WHITE,
                value: true,
                onChanged: (value) {},
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: dwidth(context, 0.035),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: dwidth(context, 0.04),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text('${quantity}개',
                        style: TextStyle(fontSize: dwidth(context, 0.04))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey)),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: dheight(context, 0.03),
                      ),
                      onPressed: onIncrease,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
