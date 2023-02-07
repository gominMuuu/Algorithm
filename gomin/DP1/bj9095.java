package DP1;

import java.io.*;

public class bj9095 {
    static int[] dp;

    public static int recur(int total) {
        for(int i=4; i<=total; i++) {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3];
        }
        return dp[total];
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int n = Integer.parseInt(br.readLine());
        // 조건) n은 양수이며 11보다 작다.
        dp = new int[11];

        /* 1, 2, 3 을 만드는 경우의 수
            1: {1} 한 개
            2: {1+1, 2} 두 개
            3: {1+1+1, 1+2, 2+1, 3} 4개
         -> 1, 2, 3 각각의 경우에 +1, +2, +3을 해주면 원하는 경우의 수를 구할 수 있다.
         */
        dp[1] = 1;
        dp[2] = 2;
        dp[3] = 4;

        for(int i=0; i<n; i++) {
            int x = Integer.parseInt(br.readLine());
            sb.append(recur(x)).append('\n');
        }

        System.out.println(sb);
    }
}