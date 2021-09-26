"""
https://programmers.co.kr/learn/courses/30/lessons/60061

"""


class Building:
    def __init__(self, frames):
        self.frames = frames
        self.wall = {}
        self.floor = {}

    def _check_wall(self, y, x):
        if y == 0:
            return True
        if self.floor.get((y, x - 1), 0) or self.floor.get((y, x), 0):
            return True
        if self.wall.get((y - 1, x), 0):
            return True
        return False

    def _check_floor(self, y, x):
        if y == 0:
            return False
        if self.wall.get((y - 1, x), 0) or self.wall.get((y - 1, x + 1), 0):
            return True
        if self.floor.get((y, x - 1), 0) and self.floor.get((y, x + 1), 0):
            return True
        return False

    def _check_wall_if_exist(self, y, x):
        if self.wall.get((y, x), 0) == 0:
            return True
        return self._check_wall(y, x)

    def _check_floor_if_exist(self, y, x):
        if self.floor.get((y, x), 0) == 0:
            return True
        return self._check_floor(y, x)

    def _remove_wall(self, y, x):
        del self.wall[(y, x)]

        if not (self._check_floor_if_exist(y + 1, x - 1) and self._check_floor_if_exist(y + 1, x)):
            self.wall[(y, x)] = 1

        elif not self._check_wall_if_exist(y + 1, x):
            self.wall[(y, x)] = 1

    def _remove_floor(self, y, x):
        del self.floor[(y, x)]

        if not (self._check_floor_if_exist(y, x - 1) and self._check_floor_if_exist(y, x + 1)):
            self.floor[(y, x)] = 1

        elif not (self._check_wall_if_exist(y, x) and self._check_wall_if_exist(y, x + 1)):
            self.floor[(y, x)] = 1

    def _build_wall(self, y, x):
        if self._check_wall(y, x):
            self.wall[(y, x)] = 1

    def _build_floor(self, y, x):
        if self._check_floor(y, x):
            self.floor[(y, x)] = 1

    def build(self):
        for x, y, a, b in self.frames:
            if a == 0 and b == 0:
                self._remove_wall(y, x)
            elif a == 1 and b == 0:
                self._remove_floor(y, x)
            elif a == 0 and b == 1:
                self._build_wall(y, x)
            elif a == 1 and b == 1:
                self._build_floor(y, x)
            else:
                raise ValueError("invalid frame")

    def get_state(self):
        result = []
        for w in self.wall:
            result.append([w[1], w[0], 0])
        for f in self.floor:
            result.append([f[1], f[0], 1])
        return sorted(result)


def solution(n, build_frame):
    building = Building(build_frame)
    building.build()
    answer = building.get_state()
    return answer
