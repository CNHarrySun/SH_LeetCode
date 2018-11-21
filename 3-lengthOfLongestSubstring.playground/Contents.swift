import UIKit

/*
 题目详情：
    给定一个字符串，请你找出其中不含有重复字符的最长子串的长度。
 
 示例：
    输入: "abcabcbb"
    输出: 3
    解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
    输入: "bbbbb"
    输出: 1
    解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
    输入: "pwwkew"
    输出: 3
    解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
    请注意，你的答案必须是子串的长度，"pwke" 是一个子序列，不是子串。
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var returnCount = 0
        var leftIndex = 0
        var dict = [Character: Int]()
        let chars = Array(s)
        
        for rightIndex in 0..<chars.count {
            let tempString = chars[rightIndex]
            if let tempIndex = dict[tempString] {
                if tempIndex >= leftIndex {
                    leftIndex = tempIndex + 1
                }
            }
            dict[tempString] = rightIndex
            returnCount = max(rightIndex - leftIndex + 1, returnCount)
        }
        return returnCount
    }
}

let string = "pwwkew"
let solution = Solution()
solution.lengthOfLongestSubstring(string)
