package String;

import java.io.*;
import java.util.*;

public class bj9046 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int T = Integer.parseInt(br.readLine());

        for(int i=0; i<T; i++) {
            // <알파벳, 개수> 형태의 해시맵
            HashMap<Character, Integer> map = new HashMap<>();
            String str = br.readLine();
            for(char ch : str.toCharArray()) {
                if(ch == ' ') continue;
                if(map.containsKey(ch)) {
                    int n = map.get(ch);
                    map.put(ch, n + 1);
                } else {
                    map.put(ch, 1);
                }
            }
            // max 값 구하기
            int max = 0;
            for(char x : map.keySet()) {
                if(map.get(x) > max) max = map.get(x);
            }
            // max값이 여러 번 나오는 지 확인
            int cnt = 0;
            for(char x : map.keySet()) {
                if(map.get(x) == max) cnt++;
            }
            // 만약 max가 여러 번 나온다면 "?" 출력
            // 아니라면 알파벳 출력
            if(cnt > 1) sb.append("?\n");
            else {
                for(char x : map.keySet()) {
                    if(map.get(x) == max) sb.append(x).append('\n');
                }
            }
        }
        System.out.println(sb);
    }
}
