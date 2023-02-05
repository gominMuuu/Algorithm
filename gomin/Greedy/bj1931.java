package Greedy;

import java.io.*;
import java.util.*;

/* 풀이
    1. 종료시간을 빨리 끝나는 순으로 정렬 (오름차순)
    2. 제일 빨리 끝나는 회의 선택
        - 겹친다면 제외
        - 겹치지 않는다면 선택
 */

public class bj1931 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        int[][] arr = new int[n][2];

        for(int i=0; i<n; i++) {
            // (시작시간, 종료시간) 저장
            st = new StringTokenizer(br.readLine(), " ");
            int x1 = Integer.parseInt(st.nextToken());
            int x2 = Integer.parseInt(st.nextToken());
            arr[i][0] = x1;
            arr[i][1] = x2;
        }

        // 종료시간 기준 오름차순 정렬
        Arrays.sort(arr, (o1, o2) -> {
            // 종료시간이 같을 경우 시작시간이 빠른순으로 정렬
            if(o1[1] == o2[1]) {
                return o1[0] - o2[0];
            }
            return o1[1]-o2[1];
        });

        int answer = 1;     // 종료 시간이 제일 빠른 첫번째 회의를 선택
        int end = arr[0][1];    // 현재 선택된 회의의 종료시간
        for(int i=1; i<n; i++) {
            // a와 b의 회의가 겹치지 않을 때
            if(end <= arr[i][0]) {
                answer++;
                end = arr[i][1];
            }
        }
        System.out.println(answer);
    }
}
