import 'package:flutter/material.dart';
import 'package:note_app/services/components.dart';
import 'package:note_app/presentation/addnotecubit/addnoteapp_cubit.dart';
import 'package:note_app/domain/entites/models/noteModel.dart';
import 'package:intl/intl.dart' as intl;
import 'package:note_app/services/constant.dart';

class AddNoteform extends StatelessWidget {
  const AddNoteform({super.key, required this.cubit});
  final addNoteappCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formkey,
      child: Column(
        children: [
          const SizedBox(height: 55),
          defulitTextFormField(
            title: "Title",
            validator: (value) {
              if (value!.isEmpty) {
                return "please enter a title";
              }
              return null;
            },

            textInputAction: TextInputAction.next,
            controller: cubit.titlecontroll,
          ),
          const SizedBox(height: 22),

          defulitTextFormField(
            title: "Content",
            validator: (value) {
              if (value!.isEmpty) {
                return "please enter a content";
              }
              return null;
            },
            textInputAction: TextInputAction.done,
            controller: cubit.Contentcontroll,
          ),
          const SizedBox(height: 15),

          const SizedBox(height: 39 * 2, child: Colorlist()),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 33),
            ),
            onPressed: () {
              if (cubit.formkey.currentState!.validate()) {
                cubit.addNoteapp(
                  Notemodel(
                    title: cubit.titlecontroll.text,
                    Subtitle: cubit.Contentcontroll.text,
                    Date: intl.DateFormat.yMMMMd().format(DateTime.now()),
                    color: Colors.blue.value,
                  ),
                );
                cubit.formkey.currentState!.save();
              }
            },
            child:
                addNoteappCubit.get(context).isloading
                    ? const CircularProgressIndicator()
                    : defulttext(data: "Add", fSize: 22),
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}

class Colorlist extends StatefulWidget {
  const Colorlist({super.key});

  @override
  State<Colorlist> createState() => _ColorlistState();
}

class _ColorlistState extends State<Colorlist> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              currentindex = index;
              addNoteappCubit.get(context).color = colors[index];
              setState(() {});
            },
            child: ColorItem(
              isActive: currentindex == index,
              color: colors[index],
            ),
          ),
      itemCount: colors.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 4);
      },
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          backgroundColor: Colors.white,
          radius: 38,
          child: CircleAvatar(backgroundColor: color, radius: 36),
        )
        : CircleAvatar(backgroundColor: color, radius: 38);
  }
}


