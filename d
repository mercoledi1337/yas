from typing import Any, List, Callable


class TreeNode:
    def __init__(self, value):
        self.value: Any = value
        self.parent: Any = None
        self.children: List['TreeNode'] = []

    def add(self, child: 'TreeNode') -> None:
        child.parent = self
        assert isinstance(child, TreeNode)
        self.children.append(child)

    def is_leaf(self) -> bool:
        if (self.children is None):
            return True
        return False

    # def print(self):
    #     print(self.value)
    #
    def for_each_deep_first(self, visit: Callable[['TreeNode'], None]) -> None:
        visit.append(TreeNode)
        for children in self.children[TreeNode]:
            if children not in visit:
                self.for_each_deep_first(children, visit)


class Tree:
    def __init__(self):
        self.root: TreeNode = None
        self.tree = []

    def add(self, value: Any, parent_value: Any) -> None:
        child = TreeNode(value)
        child.parent = parent_value
        self.tree.append(child)


root = TreeNode('root')
tree = Tree()
tree.add(root, None)
tree.add(5, root)
tree.add(6, 5)
tree.add(7, 5)

for c in tree.tree:
    print(c.value)
