package Greedy;

import java.io.*;
import java.util.*;

public class bj1541 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // 풀이: 덧셈을 먼저 계산하면, 나중에 뺄셈 연산 후 최소값이 된다.
        // 1. (-)를 기준으로 배열을 나눈다.
        // 2. (+)연산을 먼저 수행한다.
        // 3. 뺄셈 연산으로 최종 정답값을 출력한다.

        String[] mA = br.readLine().split("-");
        String[] pA;
        ArrayList<Integer> array = new ArrayList<>();

        for(String x : mA) {
            pA = x.split("\\+");
            int sum = 0;
            for(String pX : pA) {
                int num = Integer.parseInt(pX);
                sum += num;
            }
            array.add(sum);
        }
        int answer = array.get(0);
        for(int i=1; i<array.size(); i++) {
            answer -= array.get(i);
        }
        System.out.println(answer);
    }
}
