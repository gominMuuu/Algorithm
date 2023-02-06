package DP1;

import java.io.*;

public class bj1463 {
    static long[] dp;

    // 4가지 경우로 나뉜다.
    public static long recur(int x) {
        if(dp[x] == -1) {
            // 6으로 나눠지는 경우
            if (x % 6 == 0) {
                dp[x] = Math.min(recur(x - 1), Math.min(recur(x / 3), recur(x / 2))) + 1;
            }
            // 3으로만 나눠지는 경우
            else if (x % 3 == 0) {
                dp[x] = Math.min(recur(x / 3), recur(x - 1)) + 1;
            }
            // 2로만 나눠지는 경우
            else if (x % 2 == 0) {
                dp[x] = Math.min(recur(x / 2), recur(x - 1)) + 1;
            }
            // 2와 3으로 나눠지지 않는 경우, -1한다.
            else {
                dp[x] = recur(x - 1) + 1;
            }
        }
        return dp[x];
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        dp = new long[n + 1];

        for(int i=0; i<n+1; i++) {
            dp[i] = -1;
        }

        dp[0] = dp[1] = 0;

        System.out.println(recur(n));
    }
}