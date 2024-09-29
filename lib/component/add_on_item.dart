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
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text('${quantity}개', style: TextStyle(fontSize: 16)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
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