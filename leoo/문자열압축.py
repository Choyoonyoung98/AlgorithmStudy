"""
문자열 압축
https://programmers.co.kr/learn/courses/30/lessons/60057

in: 압축전 문자열
out: 최소 압축 길이
cond
  - s의 길이는 1 이상 1,000 이하입니다.
  - s는 알파벳 소문자로만 이루어져 있습니다.
"""
from math import log10

def solution(s):
    def calculate(count, step) -> int:
        if count == 1:
            return step

        num_size = int(log10(count)) + 1 # 숫자 자릿수
        return step + num_size

    def compress(tkn, step):
        res = 0
        count = 1
        
        # s = token + 나머지
        for i in range(step, n, step):
            nxt_tkn = s[i:i+step]
            if tkn != nxt_tkn:
                tkn = nxt_tkn
                res += calculate(count, step)
                count = 1
            else:
                count+=1
        else:
            # 마지막의 경우, step보다 작다면 길이만큼 더하고 아니라면 calculate
            extra_size = len(nxt_tkn) if step > len(nxt_tkn) else calculate(count, step)
        return res + extra_size

    n = len(s)
    
    if n == 1: 
        return n
    
    answer = n # 하나도 압축 못한 케이스
    min_token_size = 1 
    max_token_size = n//2

    for step in range(min_token_size, max_token_size + 1):
        token = s[:step] # 기준 string
        tmp_answer = compress(token, step)
        if answer > tmp_answer:
            answer = tmp_answer
    return answer
