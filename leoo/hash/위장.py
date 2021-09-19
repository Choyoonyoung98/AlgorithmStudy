from collections import defaultdict
from functools import reduce
from operator import mul


def solution(clothes):
    counter = defaultdict(int)
    for cloth_pair in clothes:
        l, r = cloth_pair
        counter[r] += 1
    combination_count = reduce(mul, [i + 1 for i in list(counter.values())])
    return combination_count - 1
