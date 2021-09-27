# twoSum

```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var dict = [Int: Int]()

        for i in 0...nums.count-1 {
            let check = target - nums[i]

            if let j = dict[check] {
                result.append(i)
                result.append(j)
                break
            }
            dict[nums[i]] = i
        }

        return result
    }
}
```