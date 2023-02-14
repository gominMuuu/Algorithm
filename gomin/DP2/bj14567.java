package DP2;

import java.io.*;
import java.util.*;

public class bj14567 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int[] dp = new int[n + 1];
        ArrayList<Integer> parents[] = new ArrayList[n + 1];

        for(int i=1; i<=n; i++) {
            dp[i] = 1;
        }
        for (int i=1; i<=n; i++) {
            parents[i] = new ArrayList<Integer>();
            parents[i].add(0);
        }

        for(int i=0; i<m; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());

            parents[b].add(a);
        }

        // 선수 과목에 +1한 값과 기존 값을 비교
        for(int i = 1 ; i <= n ; i++) {
            for(int j : parents[i]) {
                dp[i] = Math.max(dp[i], dp[j] + 1);
            }
            System.out.print(dp[i]+" ");
        }
    }
}
