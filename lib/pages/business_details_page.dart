import 'package:business_directory/controllers/business_details_controller.dart';
import 'package:business_directory/models/business.dart';
import 'package:business_directory/widgets/business_profile_card.dart';
import 'package:business_directory/widgets/header_text.dart';
import 'package:business_directory/widgets/image_slider_btn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class BusinessDetailsPage extends StatelessWidget {
  final businessDetailsController = Get.put(BusinessDetailsController());
  BusinessDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final business = Get.arguments['business'] as Business;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          business.name,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            BusinessProfileCard(
              logoUrl: business.logo,
              name: business.name,
              description: business.description ?? "",
              isVerified: business.isVerified,
            ),
            SizedBox(height: Get.height * 0.04),
            HeaderText(headerText: "Categories"),
            SizedBox(height: Get.height * 0.04),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: business.categories
                    .map((category) => Chip(
                          shape: StadiumBorder(),
                          backgroundColor: Get.theme.primaryColor,
                          labelStyle: Get.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                          label: Text(category.name),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            HeaderText(headerText: "Average Rating"),
            SizedBox(height: Get.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text(
                    business.averageRating.toString(),
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                RatingBarIndicator(
                  itemSize: 32,
                  rating: business.averageRating?.toDouble() ?? 0,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            if (business.images!.isNotEmpty) ...[
              SizedBox(height: Get.height * 0.02),
              HeaderText(headerText: "Gallery"),
              SizedBox(height: Get.height * 0.02),
              SizedBox(
                height: Get.height * 0.3,
                child: Container(
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        carouselController:
                            businessDetailsController.controller,
                        itemCount: business.images!.length,
                        itemBuilder: (context, index, realIndex) {
                          return Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(
                                business.images![index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            businessDetailsController.setCurrentIndex(index);
                          },
                        ),
                      ),
                      ImageSliderBtn(
                        icon: Icons.arrow_back_ios_rounded,
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          businessDetailsController.controller.previousPage(
                            duration: Duration(milliseconds: 5),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                      ImageSliderBtn(
                        icon: Icons.arrow_forward_ios_rounded,
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          businessDetailsController.controller.nextPage(
                            duration: Duration(milliseconds: 5),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: businessDetailsController.activeIndex.value,
                    count: business.images!.length,
                    onDotClicked: (index) {
                      businessDetailsController.controller.animateToPage(index);
                    },
                    effect: ExpandingDotsEffect(
                      activeDotColor: Get.theme.primaryColor,
                      dotHeight: 8,
                    ),
                  ),
                ),
              ),
            ],
            SizedBox(height: Get.height * 0.04),
            HeaderText(headerText: "Contact Information"),
            SizedBox(height: Get.height * 0.04),
            if (business.phone != null)
              Row(
                children: [
                  Icon(Icons.phone, size: 32),
                  SizedBox(width: Get.width * 0.03),
                  Column(
                    children: business.phone!
                        .map(
                          (phone) => GestureDetector(
                            onTap: () async {
                              await launchUrl(Uri.parse("tel:${phone}"));
                            },
                            child: Text(
                              phone,
                              style: Get.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            Divider(),
            if (business.email != null)
              Row(
                children: [
                  Icon(Icons.email, size: 32),
                  SizedBox(width: Get.width * 0.03),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse("mailto:${business.email}"));
                    },
                    child: Text(
                      business.email!,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: Get.height * 0.04),
            HeaderText(headerText: "User ratings"),
            SizedBox(height: Get.height * 0.04),
            business.ratings != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: business.ratings!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RatingRow(
                        userFirstName:
                            business.ratings![index].ratedBy.firstName,
                        userLastName: business.ratings![index].ratedBy.lastName,
                        rating: business.ratings![index].rating.toDouble(),
                        createdAt: business.ratings![index].createdAt,
                        comment: business.ratings![index].comment,
                        userProfileImage: business
                                .ratings![index].ratedBy.profileImageUrl ??
                            "https://eu.ui-avatars.com/api/?name=${business.ratings![index].ratedBy.firstName}+${business.ratings![index].ratedBy.lastName}&size=250",
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "No ratings yet.",
                      style: Get.textTheme.bodyLarge,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.userFirstName,
    required this.userLastName,
    required this.createdAt,
    required this.rating,
    required this.userProfileImage,
    this.comment,
  });

  final String userFirstName;
  final String userLastName;
  final String userProfileImage;
  final double rating;
  final DateTime createdAt;
  final String? comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(userProfileImage),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: Get.width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userFirstName} ${userLastName}',
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd("en-us").format(createdAt),
                    ),
                  ],
                ),
                Spacer(),
                RatingBarIndicator(
                  itemSize: 20,
                  rating: rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            if (comment != null) ...[
              SizedBox(height: Get.height * 0.02),
              Text(comment!)
            ],
          ],
        ),
      ),
    );
  }
}
