def solution(p):
    phones = sorted(p)

    for p1, p2 in zip(phones, phones[1:]):
        if p2.startswith(p1):
            return False
    return True
