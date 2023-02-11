package DP1;

import java.io.*;
import java.util.*;

public class bj2293 {
    // dp[i] = j
    // i원을 만드는 데에 가능한 경우의 수 j
    static int[] dp;

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());

        int[] arr = new int[n+1];
        dp = new int[k+1];

        dp[0] = 1;

        for(int i=1; i<=n; i++) {
            arr[i] = Integer.parseInt(br.readLine());

            // dp[i] = dp[i] + dp[i-coin]
            for(int j = arr[i]; j <= k; j++) {
                dp[j] += dp[j - arr[i]];
            }
        }

        System.out.println(dp[k]);

    }
}
