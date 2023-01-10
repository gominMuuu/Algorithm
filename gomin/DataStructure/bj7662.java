package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj7662 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        // 우선순위 큐를 사용하면 remove할 때 O(n) 으로 시간 초과
        // TreeMap 사용
        // 'I n': (n, 숫자의 개수) 를 삽입
        StringBuilder sb = new StringBuilder();
        for(int i=0; i<T; i++) {
            int k = Integer.parseInt(br.readLine());
            TreeMap<Integer, Integer> que = new TreeMap<>();

            for(int j=0; j<k; j++) {
                StringTokenizer command;
                command = new StringTokenizer(br.readLine(), " ");

                String opr = command.nextToken();
                int n = Integer.parseInt(command.nextToken());

                switch (opr) {
                    case "I":
                        que.put(n, que.getOrDefault(n, 0) + 1);
                        break;
                    case "D":
                        if (que.size() == 0) continue;
                        int num = n == 1 ? que.lastKey() : que.firstKey();
                        if (que.put(num, que.get(num) - 1) == 1)
                            que.remove(num);
                        break;
                }
            }
            String answer = que.size() == 0 ? "EMPTY" : que.lastKey() + " " + que.firstKey();
            sb.append(answer).append('\n');
        }
        System.out.println(sb);
    }
}
