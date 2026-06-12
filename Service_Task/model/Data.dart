import 'package:flutter/material.dart';
import 'package:work_space/model/provider_model.dart';
import 'package:work_space/model/service_model.dart';

class Dummydata {
  List<ServiceModel> Servises = [
    ServiceModel(
      title: 'Electrician',
      description: 'Fix Electric problems',
      icon: Icons.electric_bolt,
    ),
    ServiceModel(
      title: 'Plumber',
      description: 'Fix Licks',
      icon: Icons.water_drop,
    ),
    ServiceModel(
      title: 'Carpenter',
      description: 'Wood nd furniture',
      icon: Icons.handyman,
    ),
    ServiceModel(
      title: 'Painter',
      description: 'Paint House and walls',
      icon: Icons.format_paint,
    ),
    ServiceModel(
        title: 'AC',
        description: 'Fix your AC',
        icon: Icons.ac_unit
    ),
    ServiceModel(
      title: 'Cleaning Service',
      description: 'Home cleaning',
      icon: Icons.cleaning_services,
    ),
  ];

  List<ProviderModel> Provider = [
    ProviderModel(
      name: 'Mohan',
      service: 'Electrician',
      experience: '4 years',
      rating: '4.5',
      phone: '1234567890',
      address: 'Gujarat,rajkot',
      about: 'A well experienced and professional worker',

    ),
    ProviderModel(
      name: 'Amit',
      service: 'Electrician',
      experience: '3.5 years',
      rating: '4',
      phone: '0987654321',
      address: 'Gujarat,rajkot',
      about: 'A well experienced and professional worker',

    ),
    ProviderModel(
      name: 'Mukesh',
      service: 'Plumber',
      experience: '5 years',
      rating: '4.5',
      phone: '3214567890',
      address: 'Gujarat,rajkot',
      about: 'A well experienced and professional worker',

    ),
    ProviderModel(
      name: 'Rohit',
      service: 'Plumber',
      experience: '4 years',
      rating: '5',
      phone: '1235437890',
      address: 'Gujarat,rajkot',
      about: 'A well experienced and professional worker',

    ),
    ProviderModel(
      name: 'Rakesh Patel',
      service: 'AC Repair',
      experience: '5 years',
      rating: '4.8',
      phone: '9876543210',
      address: 'Ahmedabad, Gujarat',
      about: 'Experienced AC technician specializing in installation, repair, and maintenance.',
    ),

    ProviderModel(
      name: 'Vikram Sharma',
      service: 'AC Repair',
      experience: '7 years',
      rating: '4.9',
      phone: '9876501234',
      address: 'Surat, Gujarat',
      about: 'Professional AC repair expert with expertise in all major AC brands.',
    ),

    ProviderModel(
      name: 'Priya Desai',
      service: 'Cleaning Service',
      experience: '3 years',
      rating: '4.7',
      phone: '9123456780',
      address: 'Rajkot, Gujarat',
      about: 'Provides home and office deep cleaning services with attention to detail.',
    ),

    ProviderModel(
      name: 'Neha Joshi',
      service: 'Cleaning Service',
      experience: '4 years',
      rating: '4.8',
      phone: '9012345678',
      address: 'Vadodara, Gujarat',
      about: 'Reliable cleaning professional offering residential and commercial cleaning.',
    ),

    ProviderModel(
      name: 'Suresh Kumar',
      service: 'Painter',
      experience: '6 years',
      rating: '4.9',
      phone: '9988776655',
      address: 'Bhavnagar, Gujarat',
      about: 'Skilled painter specializing in interior and exterior wall painting.',
    ),

    ProviderModel(
      name: 'Mahesh Solanki',
      service: 'Painter',
      experience: '8 years',
      rating: '5.0',
      phone: '9877894561',
      address: 'Jamnagar, Gujarat',
      about: 'Professional painter known for high-quality finishes and timely work.',
    ),
  ];
}
