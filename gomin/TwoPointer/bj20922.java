package TwoPointer;

import java.io.*;
import java.util.*;

public class bj20922 {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());

        int[] arr = new int[n];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        int start = 0, end = 0;
        int answer = 0;
        int cnt[] = new int[100001];
        while(end < arr.length) {
            while(end < arr.length && cnt[arr[end]] + 1 <= K) {
                cnt[arr[end]]++;
                end++;
            }
            int len = end-start;
            answer = Math.max(answer, len);
            cnt[arr[start]]--;
            start++;
        }
        System.out.println(answer);
    }
}