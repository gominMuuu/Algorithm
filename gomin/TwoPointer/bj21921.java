package TwoPointer;

import java.io.*;
import java.util.*;

public class bj21921 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        st = new StringTokenizer(br.readLine(),  " ");
        int n = Integer.parseInt(st.nextToken());
        int x = Integer.parseInt(st.nextToken());

        int[] arr = new int[n];
        st = new StringTokenizer(br.readLine(),  " ");
        for(int i=0; i<n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }

        int start = 0;
        int max = 0;
        int cnt = 1;
        while((start + x) <= n) {
            int sum = 0;
            for (int i = 0; i < x; i++) {
                sum += arr[start + i];
            }
            if(sum == max) {
                cnt++;
            } else if(sum > max) {
                max = sum;
                cnt = 1;
            }
//            max = Math.max(max, sum);
            start++;
        }
        if(max == 0) System.out.println("SAD");
        else {
            sb.append(max).append('\n').append(cnt);
            System.out.println(sb);
        }
    }
}
