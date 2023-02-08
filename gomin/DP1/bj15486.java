package DP1;

import java.io.*;
import java.util.*;

public class bj15486 {
    static int[] dp;    // 각각의 날짜에 받을 수 있는 최대 금액

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        // (n+1)일에 퇴사
        int[][] arr = new int[n+2][2];
        dp = new int[n+2];

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            arr[i][0] = Integer.parseInt(st.nextToken());
            arr[i][1] = Integer.parseInt(st.nextToken());
        }

        int max = -1;
        for(int i=1; i<=n; i++) {
            if(max < dp[i]) {
                max = dp[i];
            }
            int idx = i + arr[i][0];
            if(idx < n+2) {
                dp[idx] = Math.max(dp[idx], max + arr[i][1]);
            }
        }

        // dp에 퇴사날에 저장된 max값 출력
        System.out.println(arr[n+1][1]);
    }
}