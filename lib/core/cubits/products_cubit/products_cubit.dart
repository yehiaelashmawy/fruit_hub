import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productsLength = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductsFailure(failure.message)), (
      products,
    ) {
      productsLength += products.length;
      emit(ProductsSuccess(products));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) {
        // print('❌ Products Error: ${failure.message}');
        emit(ProductsFailure(failure.message));
      },
      (products) {
        emit(ProductsSuccess(products));
      },
    );
  }
}
