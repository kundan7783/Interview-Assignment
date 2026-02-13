import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/notification_list_provider.dart';

class DealerNotificationListScreen extends StatefulWidget {
  const DealerNotificationListScreen({super.key});

  @override
  State<DealerNotificationListScreen> createState() =>
      _DealerNotificationListScreenState();
}

class _DealerNotificationListScreenState
    extends State<DealerNotificationListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NotificationListProvider>().getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NotificationListProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: provider.isNotificationLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.notificationModel == null
          ? const Center(child: Text("No Data Found"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount:
                  provider.notificationModel!.data.notificationData.length,
              itemBuilder: (context, index) {
                final item =
                    provider.notificationModel!.data.notificationData[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔹 Image Section
                      if (item.image != null && item.image!.isNotEmpty)
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                          child: Image.network(
                            item.image!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Title
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            /// Description
                            Text(
                              item.description,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),

                            const SizedBox(height: 12),

                            /// Tags
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildTag(item.type),
                                _buildTag(item.language.toUpperCase()),
                                _buildTag(item.category),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Location
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    "${item.country.name}, "
                                    "${item.country.state.name}, "
                                    "${item.country.state.district.name}, "
                                    "${item.country.state.district.city.name} - "
                                    "${item.country.state.district.city.pinCode.name}",
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            /// Date + Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Created: ${item.createdAt.substring(0, 10)}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Status: ${item.status}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.green,
        ),
      ),
    );
  }
}
