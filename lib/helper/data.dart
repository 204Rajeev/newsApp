import '../models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];

  //1
  CategoryModel categoryModelBusiness = CategoryModel('Business',
      'https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80');

  categories.add(categoryModelBusiness);
  //2
  CategoryModel categoryModelEntertianment = CategoryModel('Entertianment',
      'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80');
  categories.add(categoryModelEntertianment);
  //3
  CategoryModel categoryModelGeneral = CategoryModel('General',
      'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');

  categories.add(categoryModelGeneral);
  //4
  CategoryModel categoryModelHealth = CategoryModel('Health',
      'https://images.unsplash.com/photo-1505576399279-565b52d4ac71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80');
  categories.add(categoryModelHealth);
  //5
  CategoryModel categoryModelScience = CategoryModel('Science',
      'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80');
  categories.add(categoryModelScience);
  //6
  CategoryModel categoryModelSports = CategoryModel('Sports',
      'https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80');
  categories.add(categoryModelSports);
  //7
  CategoryModel categoryModelTechnology = CategoryModel('Technology',
      'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
  categories.add(categoryModelTechnology);
  return categories;
}
