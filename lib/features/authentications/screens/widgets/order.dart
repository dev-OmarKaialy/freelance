import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/costants/const.dart';
import '../../controllers-onboarding/order_controller.dart';



class OrderListScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employment requests', style: TextStyle(color: Colors.white)),
        backgroundColor: ksecondColor,
        elevation: 0,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Obx(() {
              return ListView.builder(
                itemCount: orderController.orders.length,
                itemBuilder: (context, index) {
                  final order = orderController.orders[index];
                  return _buildOrderListTile(order, index);
                },
              );
            }),
          ),
          Expanded(
            flex: 1,
            child: _buildImageContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderListTile(Map<String, String?> order, int index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(order["imageUrl"]!),
        ),
        title: Text(order["name"]!),
        trailing: _buildOrderActionButtons(index),
      ),
    );
  }

  Widget _buildOrderActionButtons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.check),
          color: Colors.green,
          onPressed: () {
            orderController.acceptOrder(index);
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            orderController.deleteOrder(index);
          },
        ),
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
      color: Colors.grey[200],
      child: Image.asset(
        'assets/enhanced.jpg',
        fit: BoxFit.cover, // اختر نوع التعديل الذي يناسب تصميمك
      ),
    );

  }
}