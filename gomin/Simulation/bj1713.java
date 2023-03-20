package Simulation;

import java.io.*;
import java.util.*;

public class bj1713 {
    // 비어있는 사진틀이 없는 경우에는 현재까지 추천 받은 횟수가 가장 적은 학생의 사진을 삭제
    // 현재까지 추천 받은 횟수가 가장 적은 학생이 두 명 이상일 경우에는 그러한 학생들 중 게시된 지 가장 오래된 사진을 삭제
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        int m = Integer.parseInt(br.readLine());

        HashMap<Integer, Integer> map = new HashMap<>();

        st = new StringTokenizer(br.readLine(), " ");

        int cnt = 0;
        for(int i=0; i<m; i++) {
            int p = Integer.parseInt(st.nextToken());
            // 추천 받은 학생 추가
            if(map.get(p) != null) {
                map.put(p, map.get(p) + 1);
                cnt++;
            } else {
                // 비어있는 사진틀이 없을 때
                if(cnt >= n) {
                    // 가장 작은 추천 횟수 min을 구한다.
                    int min = Integer.MAX_VALUE;
                    for(int x : map.keySet()) {
                        min = Math.min(min, map.get(x));
                    }
                    // 추천 횟수가 min인 학생을 Queue에 넣는다.
                    Queue<Integer> minPersonArr = new LinkedList<>();
                    for(int x : map.keySet()) {
                        if(min == map.get(x)) {
                            minPersonArr.add(x);
                        }
                    }
                    // Queue에 있는 학생이 한 명이든 두 명 이상이든, 가장 오래된 사진을 삭제할 수 있다.
                    if(!minPersonArr.isEmpty()) {
                        map.remove(minPersonArr.remove());
                        map.put(p, 1);
                    }
                } else {
                    map.put(p, 1);
                    cnt++;
                }
            }
        }

        // 증가하는 학생 번호 순대로 출력
        List<Integer> keyList = new ArrayList<>(map.keySet());
        keyList.sort((s1, s2) -> s1.compareTo(s2));
        for (int key : keyList) {
            System.out.printf(key + " ");
        }

    }
}
