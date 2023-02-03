package Greedy;

import java.io.*;
import java.util.*;

/* 풀이 - 3가지 케이스
    1. 벌통 맨 오른쪽 고정 / 벌1 맨 왼쪽 고정 / 벌2 이동
    2. 벌통 맨 왼쪽 고정 / 벌1 맨 오른쪽 고정 / 벌2 이동
    3. 벌1 맨 왼쪽 고정 / 벌2 맨 오른쪽 고정 / 벌통 이동
 */

public class bj21758 {
    static int maxCount;

    // Case 1. 벌통 맨 오른쪽 고정 / 벌1 맨 왼쪽 고정 / 벌2 이동
    public static void case1(int[] honey) {
        // 벌2 위치 이동
        for(int i=1; i<honey.length - 1; i++) {
            int bee1 = 0;
            int bee2 = 0;
            // 벌1
            for(int j=1; j<honey.length; j++) {
                if(j == i) {continue;}
                else {bee1 += honey[j];}
            }
            // 벌2
            for(int j=i+1; j< honey.length; j++) {
                bee2 += honey[j];
            }
            maxCount = Math.max(maxCount, bee1 + bee2);
        }
    }

    // Case 2. 벌통 맨 왼쪽 고정 / 벌1 맨 오른쪽 고정 / 벌2 이동
    public static void case2(int[] honey) {
        // 벌2 위치 이동
        for(int i=1; i<honey.length - 1; i++) {
            int bee1 = 0;
            int bee2 = 0;
            // 벌1
            for (int j = honey.length - 2; j >= 0; j--) {
                if (j == i) {
                    continue;
                } else bee1 += honey[j];
            }
            // 벌2
            for (int j = i - 1; j >= 0; j--) {
                bee2 += honey[j];
            }
            maxCount = Math.max(maxCount, bee1 + bee2);
        }
    }

    // Case 3. 벌1 맨 왼쪽 고정 / 벌2 맨 오른쪽 고정 / 벌통 이동
    public static void case3(int[] honey) {
        // 벌통 위치 이동
        for(int i=1; i<honey.length-1; i++) {
            int bee1 = 0;
            int bee2 = 0;
            for(int j=1; j<=i; j++) {
                bee1 += honey[j];
            }
            for(int j=honey.length-2; j>=i; j--) {
                bee2 += honey[j];
            }
            maxCount = Math.max(maxCount, bee1 + bee2);
        }
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        int[] honey = new int[n];
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<n; i++) {
            honey[i] = Integer.parseInt(st.nextToken());
        }


        case1(honey);
//        System.out.println("Case1 Max: " + maxCount);
        case2(honey);
//        System.out.println("Case2 Max: " + maxCount);
        case3(honey);
//        System.out.println("Case3 Max: " + maxCount);


        System.out.println(maxCount);
    }
}
