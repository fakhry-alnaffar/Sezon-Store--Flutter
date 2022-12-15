import 'package:equatable/equatable.dart';

import 'details.dart';
import 'near_vendor.dart';

class VendorUnderCategory extends Equatable {
  final List<NearVendor> vendorsNearest;
  final List<VendorDetails> allVendors;

  const VendorUnderCategory({
    required this.vendorsNearest,
    required this.allVendors,
  });

  @override
  List<Object> get props => [vendorsNearest, allVendors];
}
