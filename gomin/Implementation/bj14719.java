package Implementation;

import java.io.*;
import java.util.*;

public class bj14719 {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int h = Integer.parseInt(st.nextToken());
        int w = Integer.parseInt(st.nextToken());

        int[] blockArr = new int[w];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<w; i++) {
            blockArr[i] = Integer.parseInt(st.nextToken());
        }

        int answer = 0;
        // 첫 블록, 마지막 블록은 제외
        for(int i=1; i<w-1; i++) {
            // 만약 블록이 최고높이와 같다면 continue
            if(blockArr[i] == h) continue;

            int lMax = 0, rMax = 0;
            // 왼쪽에서 제일 높은 기둥 찾기
            for(int j=i-1; j>=0; j--) {
                lMax = Math.max(blockArr[j], lMax);
            }
            // 오른쪽에서 제일 높은 기둥 찾기
            for(int j=i+1; j<w; j++) {
                rMax = Math.max(blockArr[j], rMax);
            }

            // 왼쪽에서 가장 높은 기둥과 오른쪽에서 가장 높은 기둥 중에 작은 기둥 구하기
            int finalBlock = Math.min(lMax, rMax);
            if(finalBlock < blockArr[i]) continue;
            // 그 기둥에서 현재 블록 값만큼 뺀 게 고인 빗물 값
            answer += finalBlock - blockArr[i];
        }

        System.out.println(answer);
    }
}
