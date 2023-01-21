import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    Key? key,
    this.url,
    required this.size,
    this.showBorder = true,
  }) : super(key: key);

  final String? url;
  final Size size;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height,
      // width: size.width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: showBorder
            ? Border.all(
                width: 2,
                color: Colors.cyan.withOpacity(.2),
              )
            : null,
      ),
      child: url != null && url!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(size.height),
              child: CachedNetworkImage(
                  imageUrl: url!,
                  errorWidget: (context, url, error) => const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                      ),
                  progressIndicatorBuilder: (context, _, progress) {
                    return CircularProgressIndicator(
                      value: progress.progress,
                    );
                  }),
            )
          : const Icon(Icons.person),
    );
  }
}
