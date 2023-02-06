package DP1;

import java.io.*;
import java.util.*;

public class bj2748 {
    static int[] dp;

    public static int fibo(int x) {
        if(dp[x] == -1) {
            dp[x] = fibo(x - 1) + fibo(x - 2);
        }
        return dp[x];
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        dp = new int[n + 1];

        for(int i=0; i<n+1; i++) {
            dp[i] = -1;
        }

        dp[0] = 0;
        dp[1] = 1;

        System.out.println(fibo(n));
    }
}
