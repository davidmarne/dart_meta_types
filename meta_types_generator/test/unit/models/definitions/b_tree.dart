part of models;

// Binary tree is an example of an algebreic data type
// It is the combination of two unions

@SealedClass()
abstract class $BinaryTree<T> {
  T get leaf;
  $Branch<T> get branch;
}

@DataClass()
abstract class $Branch<T> {
  T get value;
  $BinaryTree<T> get left;
  $BinaryTree<T> get right;
}

String preorderTraversal(BinaryTree<int> tree) => tree.when(
      leaf: (val) => '$val',
      branch: (b) => [
            '${b.value}',
            preorderTraversal(b.left),
            preorderTraversal(b.right),
          ].join(','),
    );

final testTree = BinaryTree<int>.branchFactory(
  Branch(
    value: 1,
    left: BinaryTree.branchFactory(
      Branch(
        value: 2,
        left: BinaryTree.leafFactory(3),
        right: BinaryTree.leafFactory(4),
      ),
    ),
    right: BinaryTree.leafFactory(5),
  ),
);
