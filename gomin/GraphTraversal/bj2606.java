package GraphTraversal;

import java.io.*;
import java.util.*;

public class bj2606 {
    static int n;
    static int[][] map;     // 각 정점 간 탐색경로를 저장할 배열
    static boolean visited[];   // 정점의 탐색 여부 체크

    static int count;

    public static int dfs(int x) {
        visited[x] = true;

        for(int i=1; i<=n; i++) {
            if(map[x][i] == 1 && visited[i] == false) {
                count++;
                dfs(i);
            }
        }
        return count;
    }

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        n = Integer.parseInt(br.readLine());    // 컴퓨터의 수 (정점)
        int m = Integer.parseInt(br.readLine());    // 직접 연결되어 있는 컴퓨터쌍의 수 (간선)

        map = new int[n+1][n+1];
        visited = new boolean[n+1];

        for(int i=0; i<m; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int x1 = Integer.parseInt(st.nextToken());
            int x2 = Integer.parseInt(st.nextToken());

            map[x1][x2] = map[x2][x1] = 1;
        }

        System.out.println(dfs(1));
    }
}
