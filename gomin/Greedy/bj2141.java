package Greedy;

import java.io.*;
import java.util.*;

public class bj2141 {
    static int getDistance(HashMap<Integer, Integer> map, int post) {
        int dist = 0;
        for(int x : map.keySet()) {
            if(x == post) continue;
            dist += Math.abs(x - post) * map.get(x);
        }

        return dist;
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        HashMap<Integer, Integer> map = new HashMap<>();

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine(),  " ");
            map.put(Integer.parseInt(st.nextToken()), Integer.parseInt(st.nextToken()));
        }

        int post = 1;
        int min = Integer.MAX_VALUE;
        // 우체국 이동 및 연산
        for(int i=1; i<=n; i++) {
            int tmp = getDistance(map, i);
            if(tmp < min) {
                min = tmp;
                post = i;
            }
        }
        System.out.println(post);
    }
}
