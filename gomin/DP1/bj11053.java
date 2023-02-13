package DP1;

import java.io.*;
import java.util.*;

// 가장 긴 증가하는 수열
public class bj11053 {
    static int[] dp;

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        int[] arr = new int[n+1];
        dp = new int[n + 1];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=1; i<=n; i++) {
            int x = Integer.parseInt(st.nextToken());
            arr[i] = x;
        }

        dp[1] = arr[1];

        for(int i=1; i<=n; i++) {
            dp[i] = 1;
            // 0 ~ i 이전 원소들 탐색
            for(int j=1; j < i; j++) {
                // j번째 원소가 i번째 원소보다 작으면서 i번째 dp가 j번째 dp+1 값보다 작은경우
                if(arr[j] < arr[i] && dp[i] < dp[j] + 1) {
                    dp[i] = dp[j] + 1;	// j번째 원소의 +1 값이 i번째 dp가 된다.
                }
            }
        }

        // 최댓값(최대 길이) 탐색
        int max = -1;
        for(int i=1; i<=n; i++) {
            max = dp[i] > max ? dp[i] : max;
        }
        System.out.println(max);
    }
}
