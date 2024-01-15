import 'package:flutter/material.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({super.key});

  @override
  State<DiscussionPage> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("James",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 32, 16),
        child: Column(
          children: [
            Divider(
              color: Colors.grey[400],
            ),
            Row(
              children: [
                Image.asset("assets/profile/ellips1.png"),
                const SizedBox(width: 16),
                const SizedBox(
                  height: 84,
                  width: 299,
                  child: DecoratedBox(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x07000000),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 84,
                  width: 299,
                  child: DecoratedBox(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Expanded(
                          child: Text(
                            "A fast 50mm like f1.8 would help with the bokeh. I’ve been using primes as they tend to get a bit sharper images.",
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x07000000),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Image.asset("assets/profile/ellips2.png"),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Image.asset("assets/profile/ellips1.png"),
                const SizedBox(width: 16),
                const SizedBox(
                  height: 84,
                  width: 299,
                  child: DecoratedBox(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'Thank you! That was very helpful! ',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x07000000),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
