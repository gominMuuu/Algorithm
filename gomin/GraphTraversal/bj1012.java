package GraphTraversal;

import java.io.*;
import java.util.*;

public class bj1012 {
    static int[] dx = {0, 0, 1, -1};
    static int[] dy = {1, -1, 0, 0};

    static int n, m;
    static int[][] map;
    static boolean visited[][];

    static int wormCnt = 0;

    public static void dfs(int x, int y) {
        visited[x][y] = true;

        for(int i=0; i<4; i++) {
            int nx = x + dx[i];
            int ny = y + dy[i];

            if(nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
            if(!visited[nx][ny] && map[nx][ny] == 1)
                dfs(nx, ny);
        }
    }

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        int t = Integer.parseInt(br.readLine());

        for(int i=0; i<t; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            m = Integer.parseInt(st.nextToken());
            n = Integer.parseInt(st.nextToken());
            int k = Integer.parseInt(st.nextToken());

            map = new int[m][n];
            visited = new boolean[m][n];

            for(int j=0; j<k; j++) {
                st = new StringTokenizer(br.readLine(), " ");
                int wx = Integer.parseInt(st.nextToken());
                int wy = Integer.parseInt(st.nextToken());

                map[wx][wy] = 1;
            }

            wormCnt = 0;
            for(int x=0; x<m; x++) {
                for(int y=0; y<n; y++) {
                    if(map[x][y] == 1 && !visited[x][y]) {
                        dfs(x, y);
                        wormCnt++;
                    }
                }
            }
            sb.append(wormCnt).append('\n');
        }

        System.out.println(sb);
    }
}
