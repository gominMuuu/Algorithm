package BinarySearch;

import java.io.*;
import java.util.*;

public class bj2470 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        int[] arr = new int[n];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        Arrays.sort(arr);

        int lt = 0, rt = n - 1;
        int ans1 = 0, ans2 = 0, min = Integer.MAX_VALUE;

        while(lt < rt) {
            int sum = arr[lt] + arr[rt];
            if(min > Math.abs(sum)) {
                min = Math.abs(sum);
                ans1 = arr[lt];
                ans2 = arr[rt];
            }
            if(sum > 0) rt--;
            else lt++;
        }

        System.out.printf("%d %d", ans1, ans2);
    }
}
