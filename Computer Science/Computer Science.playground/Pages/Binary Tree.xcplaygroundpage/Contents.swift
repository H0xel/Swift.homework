//: [Previous](@previous)

import Foundation

enum BinaryTree<T: Comparable> {
    
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
      switch self {

      case .empty:
        return .node(.empty, newValue, .empty)

      case let .node(left, value, right):
        if newValue < value {
          return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
        } else {
          return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
        }
      }
    }
    
    mutating func append(newValue: T) {
      self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    func search(searchValue: T) -> Bool {
        
        switch self {
            case .empty:
                return false
            case let .node(left, value, right):
                if searchValue == value {
                    return true
                } else if searchValue < value {
                    return left.search(searchValue: searchValue)
                } else {
                    return right.search(searchValue: searchValue)
            }
        }
    }
}

extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}

var tree: BinaryTree<Int> = .empty
tree.append(newValue: 7)
tree.append(newValue: 15)
tree.append(newValue: 12)
tree.append(newValue: 17)
tree.search(searchValue: 17)

print(tree)


