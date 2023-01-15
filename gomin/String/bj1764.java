package String;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj1764 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());

        // HashSet 이용
        HashSet<String> hs = new HashSet<>();
        for(int i=0; i<N; i++) {
            hs.add(br.readLine());
        }

        ArrayList<String> answer = new ArrayList<>();
        for(int i=0; i<M; i++) {
            String name = br.readLine();
            if(hs.contains(name)) answer.add(name);
        }

        // 사전 순 정렬 후 답 출력
        answer.sort((s1,s2) -> s1.compareTo(s2));
        System.out.println(answer.size());
        for(String name : answer) {
            System.out.println(name);
        }
    }
}
