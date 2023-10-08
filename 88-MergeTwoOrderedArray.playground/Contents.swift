import UIKit

/*
 题目详情：
    给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。
    请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

    注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。
 
 示例：
     输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     输出：[1,2,2,3,5,6]
     解释：需要合并 [1,2,3] 和 [2,5,6] 。
     合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
 */
class Solution {
    func twoOrderedArray(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) -> [Int] {
        // nums1 后半部分为空，可以取两个数组中最大的数从后向前覆盖
        var tempM = m - 1
        var tempN = n - 1
        while tempN >= 0 {
            // 当 tempM < 0 时，会导致数组越界，这里需要判断
            if tempM >= 0, nums1[tempM] > nums2[tempN]  {
                nums1[tempM+tempN+1] = nums1[tempM]
                tempM -= 1
            } else {
                nums1[tempM+tempN+1] = nums2[tempN]
                tempN -= 1
            }
        }
        return nums1
    }
}


var nums1 = [1,2,3,0,0,0]
let m = 3
var nums2 = [2,5,6]
let n = 3

Solution().twoOrderedArray(&nums1, m, &nums2, n)

