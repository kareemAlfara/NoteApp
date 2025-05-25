
import 'package:hive/hive.dart';
part 'noteModel.g.dart';
@HiveType(typeId: 0)
class Notemodel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String Subtitle;
  @HiveField(2)
  final String Date;
  @HiveField(3)
   int ?color;


  Notemodel(  {required this.title, required this.Subtitle, required this.Date,required this.color,});
}
