package Greedy;

import java.io.*;
import java.util.*;

public class bj1092 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        ArrayList<Integer> crane = new ArrayList<>();   // 각 크레인의 무게 제한
        ArrayList<Integer> box = new ArrayList<>();     // 각 박스의 무게

        int N = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<N; i++) {
            crane.add(Integer.parseInt(st.nextToken()));
        }
        int M = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<M; i++) {
            box.add(Integer.parseInt(st.nextToken()));
        }

        // 내림차순으로 정렬
        Collections.sort(crane, Collections.reverseOrder());
        Collections.sort(box, Collections.reverseOrder());

        // 모든 박스를 배로 옮길 수 없으면 -1을 출력
        if(box.get(0) > crane.get(0)) {
            System.out.println(-1);
            return;
        }

        // 각 박스를 돌면서, 해당 박스를 옮길 수 있는 크레인이면 사용한다.
        // 크레인을 다 썼다면 answer+1 후, 다시 첫 크레인부터 돈다.
        // 박스를 다 옮겼을 때 break
        int answer = 0;
        while(!box.isEmpty()) {
            int idx = 0;
            for(int i=0; i< N; ) {
                if(idx == box.size()) break;
                else if(crane.get(i) >= box.get(idx)) {
                    box.remove(idx);
                    i++;
                } else idx++;
            }
            answer++;
        }

        System.out.println(answer);
    }
}
