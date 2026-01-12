part of 'products_cubit_cubit.dart';

@immutable
sealed class ProductsCubitState {}

final class ProductsCubitInitial extends ProductsCubitState {}

final class ProductsCubitLoading extends ProductsCubitState {}

final class ProductsCubitSuccess extends ProductsCubitState {
  final List<ProductEntity> productsList;

  ProductsCubitSuccess(this.productsList);
}

final class ProductsCubitFailure extends ProductsCubitState {
  final String errMassage;

  ProductsCubitFailure(this.errMassage);
}
