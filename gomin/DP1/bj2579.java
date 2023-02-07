package DP1;

import java.io.*;

public class bj2579 {
    static int[] dp;

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());

        int[] stair = new int[n+1];
        dp = new int[n+1];

        for(int i=1; i<=n; i++) {
            stair[i] = Integer.parseInt(br.readLine());
        }

        dp[1] = stair[1];

        // N 이 1이 입력될 수도 있기 때문에 예외처리
        if (n >= 2) {
            dp[2] = stair[1] + stair[2];
        }
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.max(dp[i - 2] , dp[i - 3] + stair[i - 1]) + stair[i];
        }
        System.out.println(dp[n]);
    }
}
