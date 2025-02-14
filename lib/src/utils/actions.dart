import '../models/models.dart';

typedef PaginationRequest<M> = Future<PaginationBase<M>> Function(int page);
typedef CursorPaginationRequest<M> = Future<CursorPaginationBase<M>> Function(
    String cursor);
typedef TypeCallback<M> = void Function(List<M> items);
typedef ErrorCallback = void Function(Exception error);
