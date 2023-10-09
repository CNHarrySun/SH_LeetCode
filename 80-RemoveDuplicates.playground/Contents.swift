import UIKit

/*
 题目详情：
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使得出现次数超过两次的元素只出现两次 ，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
 
 示例：
 输入：nums = [1,1,1,2,2,3]
 输出：5, nums = [1,1,2,2,3]
 解释：函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3。 不需要考虑数组中超出新长度后面的元素。
 */


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        if nums.count == 0 {
//            return 0
//        }
//        
//        var left = 0
//        var right = 1
//        var repeatedCount = 0
//        
//        while right < nums.count {
//            if nums[left] != nums[right] {
//                nums[left + 1] = nums[right]
//                left += 1
//                repeatedCount = 0
//            } else {
//                repeatedCount += 1
//                if repeatedCount < 2 {
//                    nums[left + 1] = nums[right]
//                    left += 1
//                }
//            }
//            right += 1
//        }
//        
//        nums.removeSubrange(left+1..<nums.count)
        
        
        if nums.count < 3 {
            return nums.count
        }
        
        var slow = 2
        var fast = 2
        
        while fast < nums.count {
            if nums[slow-2] != nums[fast] {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        nums.removeSubrange(slow..<nums.count)
        return nums.count
    }
}

var nums = [0,0,1,1,1,1,2,3,3]
Solution().removeDuplicates(&nums)
