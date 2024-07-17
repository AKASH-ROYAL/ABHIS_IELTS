import 'dart:ui';

import 'package:ielts_frontend/activity/task_list/controller/task_controller.dart';

import 'activity/task_list/model/task_model.dart';

final inter_family = "Inter";
var primary_color = Color(0xff0D5D50);
TaskController taskController = TaskController();
final List<Task> writingTasks = [
  Task("Floor-Plan Cathersall", true, false), // First task is always unlocked
  Task("The Time Traveler's Quest", false, true),
  Task("Shadows of the Past", false, true),
  Task("The Enchanted Forest", false, true),
  Task("The Lost Treasure of Avalon", false, true),
  Task("The Whispering Winds", false, true),
  Task("Journey to the Unknown", false, true),
  Task("The Magic of the Old Oak Tree", false, true),
  Task("The Mystery of the Hidden Cave", false, true),
  Task("A Night at the Haunted Mansion", false, true),
];
final List<Task> speakingTasks = [
  Task("Series of Speaking 01", true, false), // First task is always unlocked
  Task("Series of Speaking 02", false, true),
  Task("Series of Speaking 03", false, true),
  Task("Series of Speaking 04", false, true),
  Task("Series of Speaking 05", false, true),
  Task("Series of Speaking 06", false, true),
  Task("Series of Speaking 07", false, true),
  Task("Series of Speaking 08", false, true),
  Task("Series of Speaking 09", false, true),
  Task("Series of Speaking 10", false, true),
];

final List<Task> listeningTask = [
  Task('Travel Destination', true, true),
  Task('Ace Language School', false, true),
  Task('Clean Eats', false, true),
  Task('Gorillas', false, false),
  Task('Divine Touch', false, false),
  Task('The Future of Management', false, false),
  Task('Student Internships', false, true),
  Task('The Eastern Red Cedar Tree', false, true),
  Task('William Shakespeare', false, true),
  Task('Imperial Garden', false, true),
];
final List<Task> readingTasks = [
  Task("Series of Reading 01", true, false), // First task is always unlocked
  Task("Series of Reading 02", false, true),
  Task("Series of Reading 03", false, true),
  Task("Series of Reading 04", false, true),
  Task("Series of Reading 05", false, true),
  Task("Series of Reading 06", false, true),
  Task("Series of Reading 07", false, true),
  Task("Series of Reading 08", false, true),
  Task("Series of Reading 09", false, true),
  Task("Series of Reading 10", false, true),
];
