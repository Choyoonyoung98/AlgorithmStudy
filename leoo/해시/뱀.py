from collections import deque

_DIR = ((0, 1), (1, 0), (0, -1), (-1, 0))  # 동남서북


def _is_fin(y, x):
    return not (0 <= y < N and 0 <= x < N) or boards[y][x] == 1


def snake_move():
    time = 1
    d = 0
    snake_queue = deque([])
    snake_queue.append((0, 0))
    boards[0][0] = 1
    while True:
        dy, dx = _DIR[d]
        y, x = snake_queue[-1]
        ny, nx = y + dy, x + dx
        if _is_fin(ny, nx): break

        if boards[ny][nx] == 2:
            snake_queue.append((ny, nx))
            boards[ny][nx] = 1
        elif boards[ny][nx] == 0:
            snake_queue.append((ny, nx))
            boards[ny][nx] = 1
            nny, nnx = snake_queue.popleft()
            boards[nny][nnx] = 0
        nd = snake_dir.get(time)
        if nd:
            if nd == 'D':
                d = (d + 1) % 4
            else:
                d = 3 if d == 0 else d - 1
        time += 1
    return time


if __name__ == '__main__':
    # given input
    N = int(input())
    K = int(input())
    apples = [list(map(int, input().split())) for _ in range(K)]
    L = int(input())

    # when
    snake_dir = {}
    for _ in range(L):
        k, v = input().split()
        snake_dir[int(k)] = v
    boards = [[0 for _ in range(N)] for _ in range(N)]

    # init board with apple
    for apple in apples:
        ay, ax = apple
        boards[ay - 1][ax - 1] = 2  # 1:snake, 2: apple

    result = snake_move()
    print(result)
