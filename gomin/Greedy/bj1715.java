package Greedy;

import java.io.*;
import java.util.*;

public class bj1715 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        /*
        풀이
        우선순위 큐로 내림차순 정렬한다.
        하나씩 앞에서부터 꺼내면서 더하면 최소로 구할 수 있다.
         */

        PriorityQueue<Integer> queue = new PriorityQueue<>();

        int N = Integer.parseInt(br.readLine());
        for(int i=0; i<N; i++) {
            queue.offer(Integer.parseInt(br.readLine()));
        }

        int answer = 0;
        while(queue.size() >= 2) {
            int x1 = queue.poll();
            int x2 = queue.poll();
            int sum = x1 + x2;

            answer += sum;
            queue.offer(sum);
        }

        System.out.println(answer);
    }
}
