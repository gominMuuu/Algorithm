package String;

import java.io.*;
import java.util.*;

public class bj20437 {
    /* 문제 출력값
        3. 어떤 문자를 정확히 K개를 포함하는 가장 짧은 연속 문자열의 길이를 구한다.
        4. 어떤 문자를 정확히 K개를 포함하고, 문자열의 첫 번째와 마지막 글자가 해당 문자로 같은 가장 긴 연속 문자열의 길이를 구한다.
           만약 만족하는 연속 문자열이 없을 시 -1을 출력한다.
     */
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int T = Integer.parseInt(br.readLine());

        for(int i=0; i<T; i++) {
            String W = br.readLine();
            int K = Integer.parseInt(br.readLine());

            if(K == 1) { //k가 1일때
                System.out.println("1 1");
                continue;
            }

            //알파벳 별 개수를 저장한다.
            int[] alpha = new int[26];
            for(int j = 0; j < W.length(); j++) {
                alpha[W.charAt(j) - 'a']++;
            }

            int min = Integer.MAX_VALUE;
            int max = -1;
            for(int j = 0; j < W.length(); j++) {
                // 알파벳의 개수가 K개 이하라면 바로 패스해줌으로서 시간 절약
                if(alpha[W.charAt(j) - 'a'] < K) continue;

                int count = 1;
                for(int l = j + 1; l < W.length(); l++) {
                    if(W.charAt(j) == W.charAt(l)) count++;
                    if(count == K) {
                        min = Math.min(min, l - j + 1);
                        max = Math.max(max, l - j + 1);
                        break;
                    }
                }
            }
            if(min == Integer.MAX_VALUE || max == -1) sb.append("-1").append('\n');
            else sb.append(min + " " + max).append('\n');
        }

        System.out.println(sb);
    }
}
