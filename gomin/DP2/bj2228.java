package DP2;

import java.io.*;
import java.util.*;

public class bj2228 {
    static int N, M;
    static int[] arr, sum;
    static int[][] dp;

    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        String[] input = br.readLine().split(" ");
        N = Integer.parseInt(input[0]);
        M = Integer.parseInt(input[1]);

        arr = new int[N + 1];
        sum = new int[N + 1];
        dp = new int[N + 1][M + 1];

        for (int i = 1; i <= N; i++) {
            arr[i] = Integer.parseInt(br.readLine());
            sum[i] = sum[i - 1] + arr[i]; // 누적합 구하기
        }

        for (int n = 0; n <= N; n++) {
            for (int m = 1; m <= M; m++) {
                dp[n][m] = Integer.MIN_VALUE / 2;
            }
        }

        dp[1][1] = arr[1];

        for (int n = 2; n <= N; n++) {
            for (int m = 1; m <= M; m++) {

                dp[n][m] = dp[n - 1][m]; // n번째 수가 구간에 포함안되는 경우

                int min = 0;
                if (m == 1)
                    min = -1;

                for (int k = n - 2; k >= min; k--) {

                    if (k < 0)
                        dp[n][m] = Math.max(dp[n][m], sum[n]);
                    else
                        dp[n][m] = Math.max(dp[n][m], dp[k][m - 1] + sum[n] - sum[k + 1]);
                }
            }
        }

        bw.write(dp[N][M] + "\n");
        bw.flush();

    }
}
