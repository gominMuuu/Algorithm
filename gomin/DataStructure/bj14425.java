package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj14425 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // 첫 줄의 숫자 두 개를 인식하기 위해 tokenize
        StringTokenizer command;
        command = new StringTokenizer(br.readLine(), " ");

        int N = Integer.parseInt(command.nextToken());
        int M = Integer.parseInt(command.nextToken());

        HashMap<String, Integer> map = new HashMap<>();
        for(int i=0; i<N; i++) {
            map.put(br.readLine(), i);
        }

        int answer = 0;
        for(int i=0; i<M; i++) {
            String str = br.readLine();
            if(map.get(str) != null) {
                answer++;
            }
        }
        System.out.println(answer);
    }
}
