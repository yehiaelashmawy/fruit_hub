part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> productsList;

  ProductsSuccess(this.productsList);
}

final class ProductsFailure extends ProductsState {
  final String errMassage;

  ProductsFailure(this.errMassage);
}
