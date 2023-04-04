package BackTracking;

import java.util.*;
import java.io.*;

public class bj15650 {
    public static void combination(int[] arr, boolean[] visited, int start, int n, int r) {
        if(r == 0) {
            for(int i=0; i<n; i++) {
                if(visited[i]) {
                    System.out.printf(arr[i] + " ");
                }
            }
            System.out.println();
            return;
        }
        for(int i=start; i<n; i++) {
            visited[i] = true;
            combination(arr, visited, i+1, n, r-1);
            visited[i] = false;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int[] arr = new int[n];
        boolean[] visited = new boolean[n];

        for(int i=0; i<n; i++)
            arr[i] = i + 1;

        combination(arr, visited, 0, n, m);

    }
}
