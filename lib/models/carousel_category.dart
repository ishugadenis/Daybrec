import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories =[
    Category(
      name: 'Adiddas',
      imageUrl:'assets/carousels/addidas.jpg',

       ),
       Category(
      name: 'Air force',
      imageUrl:'assets/carousels/airforce.jpg',
      
       ),
       Category(
      name: 'Timberlands',
      imageUrl:'assets/carousels/boots.jpg',
      
       ),
        Category(
      name: 'Sweatpants',
      imageUrl:'assets/carousels/sweatpant.jpg',
      
       )
  ];
}