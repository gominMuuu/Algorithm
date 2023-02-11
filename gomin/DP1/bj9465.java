package DP1;

import java.io.*;
import java.util.*;

public class bj9465 {
    public static int DP(int[][] arr, int[][] dp, int n) {
        // 0번째, 1번째 행의 첫 번째 열이 초기화로 초기값이 된다.
        dp[0][1] = arr[0][1];
        dp[1][1] = arr[1][1];

        for(int k=2;k<=n;k++) { // 열 반복만을 통해 0번과 1번행을 동시 처리
            dp[0][k] = Math.max(dp[1][k - 1], dp[1][k - 2]) + arr[0][k];
            dp[1][k] = Math.max(dp[0][k - 1], dp[0][k - 2]) + arr[1][k];
        }

        return Math.max(dp[0][n], dp[1][n]);
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        int t = Integer.parseInt(br.readLine());
        for(int i=0; i<t; i++) {
            int n = Integer.parseInt(br.readLine());
            int[][] arr = new int[2][n+1];
            int[][] dp = new int[2][n+1];

            for(int j=0; j<2; j++) {
                st = new StringTokenizer(br.readLine(), " ");
                for(int k=1; k<=n; k++) {
                    arr[j][k] = Integer.parseInt(st.nextToken());
                }
            }

            sb.append(DP(arr, dp, n)).append('\n');
        }
        System.out.println(sb);
    }
}
