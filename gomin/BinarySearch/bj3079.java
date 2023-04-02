package BinarySearch;

import java.io.*;
import java.util.*;

public class bj3079 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int[] arr = new int[n];
        int max_value = 0;

        for(int i=0; i<n; i++) {
            arr[i] = Integer.parseInt(br.readLine());
            max_value = Math.max(max_value, arr[i]);
        }

        long left = 0L;
        long right = (max_value) * 1000000000L;

        long ans = 0L;
        while (left<= right){
            long mid = (left+right) / 2;
            // mid초 일 때 각 입국 심사대에서 보낼 수 있는 수를 카운트 해줌
            long cnt = 0;
            for(int i=0;i<n;i++){
                cnt += (mid / arr[i]);

            }
            // 비교 후 탐색 범위 변경
            if(cnt >= m){
                ans = mid;
                right = mid-1;
            }  else if (cnt < m){
                left = mid +1;

            }
        }

        System.out.println(ans);
    }
}
