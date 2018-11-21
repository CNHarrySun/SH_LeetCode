import UIKit

/*
 题目详情：
    给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的两个整数。
    你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 示例：
    给定 nums = [2, 7, 11, 15], target = 9
    因为 nums[0] + nums[1] = 2 + 7 = 9
    所以返回 [0, 1]
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index, value) in nums.enumerated() {
            let complement = target - value
            if let dictValue = dict[complement] {
                return [dictValue, index]
            }
            dict[value] = index
        }
        return [0]
    }
}

let array = [2, 7, 11, 15]
let solution = Solution()
solution.twoSum(array, 9)
