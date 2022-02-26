import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Order "mo:base/Order";
import Int "mo:base/Int";


func quicksort(xs : [var Int]) {
  Debug.print("before quicksort: " # debug_show(xs));

  let n = xs.size();
  if (n > 1) {
    sortByHelper(xs, 0, n - 1, Int.compare);
  };

  Debug.print("after quicksort: " # debug_show(xs));
};

type Order = Order.Order;

func sortByHelper(
  xs : [var Int],
  l : Int,
  r : Int,
  f : (Int, Int) -> Order,
) {
  if (l < r) {
    var i = l;
    var j = r;
    var swap  = xs[0];
    let pivot = xs[Int.abs(l + r) / 2];
    while (i <= j) {
      while (Order.isLess(f(xs[Int.abs(i)], pivot))) {
        i += 1;
      };
      while (Order.isGreater(f(xs[Int.abs(j)], pivot))) {
        j -= 1;
      };
      if (i <= j) {
        swap := xs[Int.abs(i)];
        xs[Int.abs(i)] := xs[Int.abs(j)];
        xs[Int.abs(j)] := swap;
        i += 1;
        j -= 1;
      };
    };
    if (l < j) {
      sortByHelper(xs, l, j, f);
    };
    if (i < r) {
      sortByHelper(xs, i, r, f);
    };
  };
};

quicksort([var 3, 1, 4, 1, 5, 9, 2, 6, 5, 3]);
