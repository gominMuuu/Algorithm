package DataStructure;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj22942 {
    // 백트래킹 사용
    // n개의 원소 중에서 r개를 순서없이 뽑는 경우의 수
    // 사용 예시 : combination(arr, visited, 0, n, r)
    static void combination(int[][] arr, boolean[] visited, int start, int n, int r) {
        if(r == 0) {
            int[][] xA = new int[2][2];
            int cnt = 0;
            for(int i=0; i<visited.length; i++) {
                if(visited[i]) {
//                    System.out.printf(arr[i][0] + " ");
                    xA[cnt][0] = arr[i][0];
                    xA[cnt][1] = arr[i][1];
                    cnt++;
                }
            }
            // 두 원 계산
            int d = Math.abs(xA[0][0] - xA[1][0]);
            if((Math.abs(xA[0][1] - xA[1][1]) < d) && (xA[0][1] + xA[1][1] > d)) {
                System.out.println("NO");
                System.exit(0);
//                return;
            }
//            System.out.println();
            return;
        }

        for(int i=start; i<n; i++) {
            visited[i] = true;
            combination(arr, visited, i + 1, n, r - 1);
            visited[i] = false;
        }
    }
    public void solution(int[][] iA) {
        int n = iA.length;
        boolean[] visited = new boolean[n];

        // 임의로 2개의 x좌표를 구하고 연산한다.
        combination(iA, visited, 0, n, 2);
        System.out.println("YES");
    }
    public static void main(String[] args) throws NumberFormatException, IOException {
        bj22942 T = new bj22942();
        // '메모리 초과'
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        int[][] iA = new int[N][N];
        for(int i=0; i<N; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int x = Integer.parseInt(st.nextToken());
            int r = Integer.parseInt(st.nextToken());
            iA[i][0] = x;
            iA[i][1] = r;
        }

        T.solution(iA);
    }
}
