package Greedy;

import java.io.*;
import java.util.*;


public class bj13305 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int N = Integer.parseInt(br.readLine());

        int[] distArray = new int[N-1];
        int[] cityArray = new int[N];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<N-1; i++) {
            distArray[i] = Integer.parseInt(st.nextToken());
        }
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<N; i++) {
            cityArray[i] = Integer.parseInt(st.nextToken());
        }

        long sum = 0;
        long minCost = cityArray[0];	// 이전 까지의 과정 중 주유 최소 비용

        for(int i=0; i<N-1; i++) {
            //현재 주유소가 이전 주유소의 기름값보다 쌀 경우, minCost를 갱신해준다.
            if(cityArray[i] < minCost) {
                minCost = cityArray[i];
            }
            sum += (minCost * distArray[i]);
        }

        System.out.println(sum);
    }
}