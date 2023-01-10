package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj7662 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int T = Integer.parseInt(br.readLine());

        // 오름차순 우선순위 큐
        PriorityQueue<Integer> pqAsc = new PriorityQueue<>();
        // 내림차순 우선순위 큐
        PriorityQueue<Integer> pqDesc = new PriorityQueue<>(Collections.reverseOrder());

        // 'I n': 두 개의 큐에 둘 다 추가
        // 'D 1': 내림차순 큐에서 peek, 오름차순 큐에서 remove
        // 'D -1': 오름차순 큐에서 peek, 내림차순 큐에서 remove
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<T; i++) {
            int k = Integer.parseInt(br.readLine());
            for(int j=0; j<k; j++) {
                StringTokenizer command;
                command = new StringTokenizer(br.readLine(), " ");

                String opr = command.nextToken();
                int n = Integer.parseInt(command.nextToken());

                switch (opr) {
                    case "I":
                        pqAsc.offer(n);
                        pqDesc.offer(n);
                        break;
                    case "D":
                        if (pqAsc.isEmpty()) continue;
                        if (n == 1) {
                            int del = pqDesc.poll();
                            pqAsc.remove(del);
                        } else if (n == -1) {
                            int del = pqAsc.poll();
                            pqDesc.remove(del);
                        }
                        break;
                }
            }
            String answer = "";
            if(pqAsc.isEmpty()) answer = "EMPTY";
            else if(pqAsc.size() == 1) answer = String.valueOf(pqAsc.peek());
            else {
                answer = pqDesc.peek() + " " + pqAsc.peek();
            }
            sb.append(answer).append('\n');
        }
        System.out.println(sb);
    }
}
