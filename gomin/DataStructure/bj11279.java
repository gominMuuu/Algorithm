package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj11279 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        // BufferedReader로 읽어오기
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        // 내림차순 우선순위 큐
        PriorityQueue<Integer> pq = new PriorityQueue<>(Collections.reverseOrder());
        StringBuilder sb = new StringBuilder();

        // 입력값이 자연수이면 offer
        // 입력값이 0이면 첫 값 반환 후 제거 (poll)
        for(int i=0; i<N; i++) {
            int x = Integer.parseInt(br.readLine());
            if(x != 0) {
                pq.offer(x);
            } else {
                if(pq.isEmpty()) sb.append(0).append('\n');
                else sb.append(pq.poll()).append('\n');
            }
        }

        System.out.println(sb);
    }
}
