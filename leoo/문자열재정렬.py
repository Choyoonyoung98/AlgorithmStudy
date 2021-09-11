# -*- coding: utf-8 -*- 

"""
알파벳 대문자와 숫자(0 ~ 9)로만 구성된 문자열이 입력으로 주어집니다. 
이때 모든 알파벳을 오름차순으로 정렬하여 이어서 출련한 뒤에, 그 뒤에 모든 숫자를 더한 값을 이어서 출력합니다.
예를 들어 K1KA5CB7이라는 값이 들어오면 ABCKK13을 출력합니다.

# 입력
첫째 줄에 하나의 문자열 S가 주어집니다. (1 <= S의 길이 <= 10,000)
# 출력
첫째 줄에 문제에서 요구하는 정답을 출력합니다.
# 예시
입력: K1KA5CB7
출력: ABCKK13
"""
_ARABIC_NUMERALS = tuple((str(n) for n in range(10)))

def solution(s):
    count = 0
    chrs = []

    for c in s:
        if c in _ARABIC_NUMERALS:
            count += int(c)
        else:
            chrs += c

    return "".join(sorted(chrs)) + str(count)


s = input()
print(solution(s))


# s = "K1KA5CB7"
# print(solution(s))
# assert solution(s) == 'ABCKK13'
