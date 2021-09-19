board = []
k_pos = []


def check(y, x, zero_cnt):
    for (ky, kx) in k_pos:
        z_cnt = zero_cnt
        for (dy, dx) in k_pos:
            ny, nx = y + dy - ky, x + dx - kx
            if not (0 <= ny < len(board) and (0 <= nx < len(board))): continue
            if board[ny][nx]: break
            z_cnt -= 1
        else:
            if z_cnt == 0: return True
    return False


def is_correct(zero_cnt):
    for y in range(len(board)):
        for x in range(len(board)):
            if not board[y][x] and check(y, x, zero_cnt): return True
    return False


def rotate():
    global board
    board = [row[::-1] for row in zip(*board)]


def solution(key, lock):
    global board
    board = lock
    zero_cnt = sum([row.count(0) for row in board])
    if zero_cnt == 0: return True  # 자물쇠에 0이 없는 경우

    for y in range(len(key)):
        for x in range(len(key)):
            if key[y][x]:
                k_pos.append((y, x))
    # 검사 (4)
    for i in range(4):
        if is_correct(zero_cnt): return True
        if i == 3: break
        rotate()
    return False