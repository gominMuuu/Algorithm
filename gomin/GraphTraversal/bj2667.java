package GraphTraversal;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class bj2667 {
    static int[] dx = {0, 0, 1, -1};
    static int[] dy = {1, -1, 0, 0};

    static int n;
    static int[][] map;
    static boolean visited[][];

    static int apartCnt = 0;    // 단지 총 개수
    static int[] apartArr = new int[25*25];  // 단지 Array

    public static void dfs(int x, int y) {
        visited[x][y] = true;
        apartArr[apartCnt]++;

        for(int i=0; i<4; i++) {
            // 상하좌우 살피기
            int nx = x + dx[i];
            int ny = y + dy[i];

            if(nx >= 0 && ny >= 0 && nx < n && ny < n) {
                if (map[nx][ny] == 1 && !visited[nx][ny]) {
                    dfs(nx, ny);
                }
            }
        }

    }
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        n = Integer.parseInt(br.readLine());
        map = new int[n][n];
        visited = new boolean[n][n];

        for(int i=0; i<n; i++) {
            char[] tmp = br.readLine().toCharArray();
            for(int j=0; j<tmp.length; j++) {
                map[i][j] = Character.getNumericValue(tmp[j]);
            }
        }

        // 단지가 있는 곳인데 아직 방문하지 않은 곳이라면
        for(int i=0; i<n; i++) {
            for(int j=0; j<n; j++) {
                if(map[i][j] == 1 && !visited[i][j]) {
                    apartCnt++;
                    dfs(i, j);
                }
            }
        }

        System.out.println(apartCnt);
        Arrays.sort(apartArr);
        for(int x : apartArr) {
            if(x != 0)
                System.out.println(x);
        }
    }
}
