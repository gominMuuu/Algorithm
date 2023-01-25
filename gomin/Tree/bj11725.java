package Tree;

import java.io.*;
import java.util.*;

public class bj11725 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int N = Integer.parseInt(br.readLine());

        // 리스트를 가지는 리스트 생성
        ArrayList<ArrayList<Integer>> tree = new ArrayList<>();
        for (int i = 0; i < N; i++) {
            tree.add(new ArrayList<>());
        }

        // 연결된 두 정점의 번호의 인덱스에 서로 넣어준다. (-1해서)
        for (int i = 0; i < N - 1; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int n1 = Integer.parseInt(st.nextToken()) - 1;
            int n2 = Integer.parseInt(st.nextToken()) - 1;

            tree.get(n1).add(n2);
            tree.get(n2).add(n1);
        }

        // 각 인덱스의 제일 첫 값이 부모 노드 번호이다.
        for(int i=1; i<N; i++) {
            System.out.println(tree.get(i).get(0) + 1);
        }

    }
}
