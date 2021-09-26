"""
https://programmers.co.kr/learn/courses/30/lessons/42579

- 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
- 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
- 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
"""
from collections import defaultdict


def get_sorted_genre(gen_itr, reverse=True):
    return sorted(gen_itr, key=lambda _: _[1], reverse=reverse)


def solution(genres, plays):
    gen_2_list = defaultdict(list)  # genre -> List[(index, play)]
    gen_2_counter = defaultdict(int)  # genre -> #_play

    for i, (g, p) in enumerate(zip(genres, plays)):
        gen_2_list[g].append((i, p))
        gen_2_counter[g] += p

    answer = []
    for g, count in get_sorted_genre(gen_2_counter.items()):
        for i, play in get_sorted_genre(gen_2_list[g])[:2]:  # 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다.
            answer.append(i)
    return answer


g = ["classic", "pop", "classic", "classic", "pop"]
p = [500, 600, 150, 800, 2500]
print(solution(g, p))
