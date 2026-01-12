import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_cubit_state.dart';

class ProductsCubitCubit extends Cubit<ProductsCubitState> {
  ProductsCubitCubit(this.productsRepo) : super(ProductsCubitInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsCubitLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsCubitFailure(failure.message)),
      (products) => emit(ProductsCubitSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsCubitLoading());
    var result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsCubitFailure(failure.message)),
      (products) => emit(ProductsCubitSuccess(products)),
    );
  }
}
