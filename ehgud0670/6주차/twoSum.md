## two sum

```swift 
class Solution {
    
    class Element {
        var index : Int
        var remain : Int
    
        init(index : Int, remain : Int) {
            self.index = index
            self.remain = remain
        }  
    }
    
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var elements = [Element]()
        
        func hasOther(num: Int) -> Int? {
            for element in elements {
                if element.remain == num {
                    return element.index
                }
            }
            return nil
        }
        
        for i in 0 ..< nums.count {
            if let index = hasOther(num: nums[i]){
                return [index, i]
            } else {
                elements.append(Element(index: i, remain: target - nums[i]))
            }
        }
        
        return []
    }
}

```
