from typing import Any


class BinaryNode:
    def __init__(self, value: Any):
        self.value: Any = value
        self.left_child: 'BinaryNode' = None
        self.right_child: 'BinaryNode' = None

    def min(self):
        minimum = self

        while minimum.left_child is not None:
            minimum = minimum.left_child

        return minimum


class BinarySearchTree:

    def __init__(self, root):
        self.root: BinaryNode = BinaryNode(root)

    def insert(self, value: Any):
        self.__insert(self.root, value)

    def __insert(self, node: BinaryNode, value: Any):
        if node is None:
            return BinaryNode(value)
        if value < node.value:
            node.left_child = self.__insert(node.left_child, value)
        else:
            node.right_child = self.__insert(node.right_child, value)

        return node


tree = BinarySearchTree(8)
tree.insert(5)
tree.insert(6)
tree.insert(1)

def inorder(root):
    if root is not None:
        # Traverse left
        inorder(root.left_child)

        # Traverse root
        print(str(root.value) + "->", end=' ')

        # Traverse right
        inorder(root.right_child)

inorder(tree.root)
