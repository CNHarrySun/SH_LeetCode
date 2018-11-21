import UIKit

/*
 题目详情：
    给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储一位数字。
    如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
    您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
    输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
    输出：7 -> 0 -> 8
    原因：342 + 465 = 807
 */

class ListNode {
    var val: Int?
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1
        var q = l2
        var curr = dummyHead
        var carry: Int = 0
        while p != nil || q != nil {
            let x = (p != nil) ? p?.val : 0
            let y = (q != nil) ? q?.val : 0
            let sum = carry + x! + y!
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if p != nil {
                p = p?.next
            }
            if q != nil {
                q = q?.next
            }
        }
        if carry > 0 {
            curr.next = ListNode(carry)
        }
        
        return dummyHead.next
    }
}

let nodeA = ListNode(2)
nodeA.next = ListNode(4)
nodeA.next?.next = ListNode(3)
let nodeB = ListNode(5)
nodeB.next = ListNode(6)
nodeB.next?.next = ListNode(4)

let solution = Solution()
let node = solution.addTwoNumbers(nodeA, nodeB)
print(node?.val ?? 0)
print(node?.next?.val ?? 0)
print(node?.next?.next?.val ?? 0)
