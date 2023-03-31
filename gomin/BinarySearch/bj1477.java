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
        for(int i=0; i<n+1; i++) {
            dist[i] = arr[i + 1] - arr[i];
        }

        Arrays.sort(dist);
        //높은 숫자가 우선 순위인 int 형 우선순위 큐 선언
        PriorityQueue<Integer> queue = new PriorityQueue<>(Collections.reverseOrder());
        for(int x : dist) {
            queue.add(x);
        }

        int cnt = 1;
        while(cnt <= m && !queue.isEmpty()) {
            int num = queue.poll();
            if(num % 2 == 0) {
                queue.add(num / 2);
            } else {
                int a = num / 2;
                int b = num / 2 + 1;
                queue.add(a);
                queue.add(b);
            }
            cnt++;
        }

        System.out.println(queue.peek());
    }
}
