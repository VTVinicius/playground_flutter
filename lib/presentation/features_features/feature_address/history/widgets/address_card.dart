import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String? zipCode;
  final String? uf;
  final String? city;
  final String? neighborhood;
  final String? address;

  const AddressCard({
    Key? key,
    this.zipCode,
    this.uf,
    this.city,
    this.neighborhood,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              height: 43,
              child: Icon(Icons.location_on, size: 36),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(zipCode ?? ''),
                  Text('${city ?? ''} / ${uf ?? ''}'),
                  Text(neighborhood ?? ''),
                  Text(address ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}