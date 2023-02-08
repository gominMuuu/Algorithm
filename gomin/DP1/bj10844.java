package DP1;

import java.io.*;

public class bj10844 {
    /* 점화식
        a) 길이가 i일 때, dp[i][0]은 dp[i-1][0]과 동일
        b) 길이가 i이고 j로 시작할 때, dp[i][j]는 dp[i-1][j-1] + dp[i-1][j+1] 과 동일
        * 단, i는 2부터 시작
     */

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        // 10자리 수도 가능해야하기 때문에 Int 말고 Long 타입
        long[][] dp = new long[n+1][10];

        // init
        // 길이가 1일 때의 계단수 초기 설정
        for(int i=0; i<10; i++) {
            dp[1][i] = 1;
        }

        long MOD = 1000000000;
        for(int i=2; i<=n; i++) {
            // 0으로 시작하는 길이가 i인 계단수
            dp[i][0] = dp[i-1][1] % MOD;
            // 1~8 로 시작하는 계단수
            for(int j=1; j<=8; j++) {
                dp[i][j] = (dp[i-1][j-1] % MOD + dp[i-1][j+1] % MOD) % MOD;
            }
            // j=9로 시작하는 계단수는 (i-1)길이의 8로 시작하는 계단수와 같다.
            dp[i][9] = dp[i-1][8] % MOD;
        }

        long answer = 0;
        for(int i=0; i<10; i++) {
            answer += dp[n][i];
        }

        System.out.println(answer % MOD);
    }
}