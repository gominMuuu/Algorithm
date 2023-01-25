package Tree;

import java.io.*;
import java.util.*;

public class bj14267 {
    static ArrayList<Integer>[] tree;   // 직속상사 관계를 나타내는 Tree
    static int[] cnt;       // 칭찬의 수치를 저장하는 배열

    // 깊이 우선 탐색으로 한 번에 칭찬 수치를 더해 연산
    public static void DFS(int idx) {
        for(int x : tree[idx]) {
            cnt[x] += cnt[idx];     // 부하의 칭찬 누적치에 본인의 칭찬 누적치를 더한다.
            DFS(x);
        }
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        tree = new ArrayList[n + 1];
        for(int i=1; i<=n; i++)
            tree[i] = new ArrayList<>();

        // 직속 상사 관계를 저장
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=1; i<=n; i++) {
            int num = Integer.parseInt(st.nextToken());
            if(num != -1)
                tree[num].add(i);
            else
                continue;
        }

        // 칭찬 번호와 칭찬 수치를 cnt배열에 저장
        cnt = new int[n + 1];
        for(int i=0; i<m; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int num = Integer.parseInt(st.nextToken());
            int weight = Integer.parseInt(st.nextToken());
            cnt[num] += weight;
        }

        DFS(1);

        // cnt 배열 출력 - 누적 칭찬치
        for(int i=1; i<=n; i++)
            System.out.printf(cnt[i] + " ");
    }
}
