import 'dart:collection';

base class EntryItem extends LinkedListEntry<EntryItem> {
  int id;
  int value;
  EntryItem(this.id, this.value);

  @override
  String toString() {
    return '$id : $value';
  }
}

void main() {
  var arr = [10, 6, 5, 7, 3, 2];
  print("array be like: $arr");

  var linkedList = LinkedList<EntryItem>();
  for (var i = 0; i < arr.length; i++) {
    linkedList.add(EntryItem(i, arr[i]));
  }
//   for (var e in linkedList) {
//     print(e);}
  print('linkedlist be like: $linkedList');
//   print(linkedList.elementAt(5).value);
  bubbleSort(linkedList);
  print('Sorted linkedlist: $linkedList');
}

LinkedList<EntryItem> bubbleSort(linkedList) {
  int lengthll = linkedList.length;
  for (int i = 0; i < lengthll - 1; i++) {
    for (int j = 0; j < lengthll - i - 1; j++) {
//       print('$i $j ${linkedList.elementAt(j).value}');
      if (linkedList.elementAt(j).value > linkedList.elementAt(j + 1).value) {
        // Swapping using temporary variable
        int temp = linkedList.elementAt(j).value;
        linkedList.elementAt(j).value = linkedList.elementAt(j + 1).value;
//         print("hhh");
        linkedList.elementAt(j + 1).value = temp;
      }
    }
  }
  return linkedList;
}
