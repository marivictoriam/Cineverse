import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ActorDetail extends StatelessWidget {
  final String actorImage;
  final String actorName;
  final String actorBio;

  const ActorDetail(
      {super.key,
      required this.actorImage,
      required this.actorName,
      required this.actorBio});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/loader.jpg',
                      image: actorImage,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/loader.jpg',
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        actorName,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        actorBio,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
