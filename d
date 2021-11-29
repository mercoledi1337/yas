from typing import Any

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class LinkedList:
    def __init__(self):
        self.head = None

    def __str__(self):
        tmp= ""
        ptr = self.head
        while ptr:
            tmp += str(ptr.data) + " -> "
            ptr = ptr.next

        tmp = tmp.strip("-> ")

        if len(tmp):
            return tmp
        else:
            return "[]"
    def __len__(self) -> int:
        tmp = self.head
        count = 0

        while tmp:
            count += 1
            tmp = tmp.next
        return count

    def print_list(self):
        cur_node = self.head
        while cur_node:
            print(cur_node.data, "->", end="")
            cur_node = cur_node.next

    def push(self, value: Any) -> None:
        NewNode = Node(value)
        NewNode.next = self.head
        self.head = NewNode

    def append(self, value: Any) -> None:
        new_node = Node(value)
        if self.head is None:
            self.head = new_node
            return
        last_node = self.head
        while last_node.next:
            last_node = last_node.next
        last_node.next = new_node


    def node(self, at: int) -> Node:
        current = self.head
        count = 0
        while (current):
            if (count == at):
                return current.data
            count += 1
            current = current.next
        assert (False)
        return

    def insert(self, value: Any, after: Node) -> None:
        n = self.head
        while n is not None:
            if n.data == after:
                break
            n = n.next
        if n is None:
            print("nie na liście")
        else:
            new = Node(value)
            new.next = n.next
            n.next = new
    def pop(self) -> Any:
        if(self.head != None):
            tmp = self.head
            self.head = self.head.next
        return tmp.data

    def remove_last(self) -> Any:
        tmp = self.head
        while(tmp.next is not None):
            tmp1 = tmp
            tmp = tmp.next
        tmp1.next = None
        return tmp.data

    def remove(self, after: Node) -> Any:
        n = self.head
        while n is not None:
            if n.data == after:
                break
            n = n.next
        if n is None:
            print("nie na liście")
        else:
            prev = n
            n = n.next
        if (n == None):
            return

            # Unlink the node from linked list
        prev.next = n.next

        n = None

class Stack(LinkedList):
    _storage: LinkedList

class Queue(LinkedList):
    _storage: LinkedList
    def peek(self) -> Any:
        return self.head

    def dequeue(self):
        if (self.head != None) -> Any:
            tmp = self.head
            self.head = self.head.next
        return tmp.data
    def enqueue(self, element) -> None:
        new_node = Node(element)
        if self.head is None:
            self.head = new_node
            return
        last_node = self.head
        while last_node.next:
            last_node = last_node.next
        last_node.next = new_node

    def __str__(self):
        tmp= ""
        ptr = self.head
        while ptr:
            tmp += str(ptr.data) + ", "
            ptr = ptr.next

        tmp = tmp.strip(", ")

        if len(tmp):
            return tmp
        else:
            return "[]"
#
# llist = LinkedList()
# assert llist.head == None
# llist.push(1)
# llist.push(0)
# assert str(llist) == '0 -> 1'
# print(llist)
# llist.append(9)
# llist.append(10)
# assert str(llist) == '0 -> 1 -> 9 -> 10'
# llist.insert(5,llist.node(at=1))
# assert str(llist) == '0 -> 1 -> 5 -> 9 -> 10'
# print(llist)
# first_element = llist.node(at=0)
# returned_first_element = llist.pop()
#
# assert first_element == returned_first_element
#
# last_element = llist.node(at=3)
# returned_last_element = llist.remove_last()
#
# assert last_element == returned_last_element
# assert str(llist) == '1 -> 5 -> 9'
#
# print(llist)
#
# second_node = llist.node(at=1)
# llist.remove(second_node)
#
# assert str(llist) == '1 -> 5'

# print(llist)

stack = Stack()

stack.push(3)
stack.push(10)
stack.push(1)

top_value = stack.pop()

assert top_value == 1

assert len(stack) == 2

queue = Queue()

assert len(queue) == 0

queue.enqueue('klient1')
queue.enqueue('klient2')
queue.enqueue('klient3')

assert str(queue) == 'klient1, klient2, klient3'

client_first = queue.dequeue()

assert client_first == 'klient1'
assert str(queue) == 'klient2, klient3'
assert len(queue) == 2
