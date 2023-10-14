class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
}

class BST {
    var root: Node?
    func insert(key: Int) {
        root = insertItem(root, key)
    }
    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        guard let node = node else {
            let node = Node(key)
            return node
        }
        
        if key < node.key {
            node.left = insertItem(node.left, key)
        }
        if key >= node.key {
            node.right = insertItem(node.right, key)
        }
        
        return node;
    }
    func printTree(root:Node?){
        if let rootNode = root {
            printTree(root: rootNode.left)
            print("\(String(describing: rootNode.key))")
            printTree(root: rootNode.right)
        }
    }
}

let tree = BST()

tree.insert(key: 5)
tree.insert(key: 3)
tree.insert(key: 8)
tree.insert(key: 4)
tree.insert(key: 9)
tree.insert(key: 1)

tree.printTree(root: tree.root)