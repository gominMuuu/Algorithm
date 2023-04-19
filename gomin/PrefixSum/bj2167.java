package PrefixSum;

import java.io.*;
import java.util.*;

public class bj2167 {
    static int[][] matrix;
    static int[][] prefixSum;
    static int n, m;

    // 구간 합 구하기
    public static int getRangeValue(int x1, int y1, int x2, int y2) {
        int rangeValue = prefixSum[x2][y2] - prefixSum[x2][y1-1] - prefixSum[x1-1][y2] + prefixSum[x1-1][y1-1];

        return rangeValue;
    }
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        matrix = new int[n][m];
        prefixSum = new int[n+1][m+1];

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            for(int j=0; j<m; j++) {
                matrix[i][j] = Integer.parseInt(st.nextToken());
            }
        }

        // 누적 합 배열 prefixSum 설정하기
        // = 기존 배열의 왼쪽 대각선 + 누적합 배열의 위 + 누적합 배열의 왼쪽 - 누적합 배열의 왼쪽 대각선 값
        for(int i=1; i<=n; i++) {
            for(int j=1; j<=m; j++) {
                prefixSum[i][j] = matrix[i-1][j-1] + prefixSum[i][j-1] + prefixSum[i-1][j] - prefixSum[i-1][j-1];
            }
        }

        int k = Integer.parseInt(br.readLine());

        for(int i=0; i<k; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int x1 = Integer.parseInt(st.nextToken());
            int y1 = Integer.parseInt(st.nextToken());
            int x2 = Integer.parseInt(st.nextToken());
            int y2 = Integer.parseInt(st.nextToken());

            sb.append(getRangeValue(x1, y1, x2, y2)).append('\n');
        }

        System.out.println(sb);
    }
}