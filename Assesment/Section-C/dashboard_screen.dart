import 'package:flutter/material.dart';
import 'health_card.dart';
import 'detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  String getGreeting() {

    int hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  String getDate() {

    DateTime now = DateTime.now();

    return "${now.day}/${now.month}/${now.year}";
  }

  @override
  Widget build(BuildContext context) {

    Color cardColor = Theme.of(context).cardColor;

    Color textColor =
    Theme.of(context).textTheme.bodyLarge!.color!;

    return DefaultTabController(
      length: 2,

      child: Scaffold(

        appBar: AppBar(
          title: const Text("Health Dashboard"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      getGreeting(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      getDate(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // TAB BAR
              TabBar(
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.grey,

                tabs: const [
                  Tab(text: "Daily Stats"),
                  Tab(text: "Weekly Trends"),
                ],
              ),

              const SizedBox(height: 15),

              Expanded(
                child: TabBarView(
                  children: [

                    // DAILY STATS
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,

                      children: [

                        // CARDIO
                        HealthCard(
                          title: "Cardio",
                          icon: Icons.favorite,
                          color: Colors.red,

                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(

                                  title: "Cardio",

                                  activities: [

                                    {
                                      "title": "Morning Run",
                                      "subtitle": "5 KM Running",
                                      "metric": "350 kcal",
                                    },

                                    {
                                      "title": "Cycling",
                                      "subtitle": "30 Minutes",
                                      "metric": "220 kcal",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        // STRENGTH
                        HealthCard(
                          title: "Strength",
                          icon: Icons.fitness_center,
                          color: Colors.orange,

                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(

                                  title: "Strength",

                                  activities: [

                                    {
                                      "title": "Push Ups",
                                      "subtitle": "50 Reps",
                                      "metric": "Strong",
                                    },

                                    {
                                      "title": "Weight Lifting",
                                      "subtitle": "45 Minutes",
                                      "metric": "500 kcal",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        // FLEXIBILITY
                        HealthCard(
                          title: "Flexibility",
                          icon: Icons.self_improvement,
                          color: Colors.purple,

                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(

                                  title: "Flexibility",

                                  activities: [

                                    {
                                      "title": "Yoga",
                                      "subtitle": "1 Hour Session",
                                      "metric": "Relaxed",
                                    },

                                    {
                                      "title": "Stretching",
                                      "subtitle": "20 Minutes",
                                      "metric": "Flexible",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        // DIET
                        HealthCard(
                          title: "Diet",
                          icon: Icons.restaurant,
                          color: Colors.green,

                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(

                                  title: "Diet",

                                  activities: [

                                    {
                                      "title": "Breakfast",
                                      "subtitle": "Oats & Fruits",
                                      "metric": "250 kcal",
                                    },

                                    {
                                      "title": "Lunch",
                                      "subtitle": "Salad & Rice",
                                      "metric": "450 kcal",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    // WEEKLY TRENDS
                    Container(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        children: [

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),

                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius:
                              BorderRadius.circular(20),
                            ),

                            child: Column(
                              children: [

                                const Icon(
                                  Icons.show_chart,
                                  size: 60,
                                  color: Colors.teal,
                                ),

                                const SizedBox(height: 15),

                                Text(
                                  "Weekly Health Trends",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                    FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),

                                const SizedBox(height: 15),

                                const Text(
                                  "Your weekly performance is improving steadily.",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}