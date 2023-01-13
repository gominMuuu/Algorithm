package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj2075 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        // 우선순위 큐 사용
        PriorityQueue<Integer> pq = new PriorityQueue<>();

        // 일단 첫 N개의 수를 큐에 넣는다.
        StringTokenizer command;
        command = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<N; i++) {
            int n = Integer.parseInt(command.nextToken());
            pq.offer(n);
        }
        // 그 후, 입력값은 넣고 첫 값은 반환하는 형태로 for문을 돌린다.
        // 최종적으로 큐에 남은 값은 N개가 되고,
        // 거기에서 첫 값을 반환(poll or peek)하면 N번째로 큰 수가 나온다.
        for(int i=1; i<N; i++) {
            command = new StringTokenizer(br.readLine(), " ");
            for(int j=0; j<N; j++) {
                int n = Integer.parseInt(command.nextToken());
                pq.offer(n);
                pq.poll();
            }
        }

        System.out.println(pq.peek());
    }
}
