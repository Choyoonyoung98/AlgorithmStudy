"""
https://www.acmicpc.net/problem/15686
"""
from functools import lru_cache
from itertools import combinations
from sys import stdin


def _get_input_to_int_list():
    return map(int, stdin.readline().split())


class Solution:
    HOUSE = 1
    CHICKEN = 2

    def __init__(self):
        self._n = None
        self._m = None
        self.houses = []
        self.chickens = []
        self.result = float('inf')

    def init(self):
        self._n, self._m = _get_input_to_int_list()
        for y in range(self._n):
            row = _get_input_to_int_list()
            for x, v in enumerate(row):
                if v == Solution.HOUSE:
                    self.houses.append((y, x))
                if v == Solution.CHICKEN:
                    self.chickens.append((y, x))

    def get_min_chicken_distance(self):
        self._calculate()
        return self.result

    def _calculate(self):
        for combination in combinations(self.chickens, self._m):
            dis = [self._get_distance(y, x) for y, x in combination]
            tmp_result = sum([min(col) for col in zip(*dis)])
            self.result = min(self.result, tmp_result)

    @lru_cache
    def _get_distance(self, y, x):
        return [abs(h[0] - y) + abs(h[1] - x) for h in self.houses]


s = Solution()
s.init()
print(s.get_min_chicken_distance())
