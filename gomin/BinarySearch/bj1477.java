package BinarySearch;

import java.io.*;
import java.util.*;

public class bj1477 {
    static int[] dist;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        // 현재 휴게소의 개수 N, 더 지으려고 하는 휴게소의 개수 M, 고속도로의 길이 L
        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int l = Integer.parseInt(st.nextToken());

        int[] arr = new int[n + 2];
        dist = new int[n + 1];

        st = new StringTokenizer(br.readLine(), " ");
        arr[0] = 0;
        for(int i=1; i<=n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }
        arr[n + 1] = l;

        // 정렬
        Arrays.sort(arr);

        int lt = 1, rt = l-1;
        while(lt <= rt) {
            int mid = (lt + rt) / 2;
            int sum = 0;

            for(int i=1; i<arr.length; i++) {
                sum += (arr[i] - arr[i-1] - 1) / mid;
            }

            if(sum > m) {
                lt = mid+1;
            } else {
                rt = mid-1;
            }
        }
        System.out.println(lt);
    }
}
