package Tree;

import java.io.*;
import java.util.*;

public class bj2263 {
    static int N;
    static int[] inorder, preorder, postorder;
    static int idx;

    // 프리오더 출력 (전위 순회)
    public static void getPreOrder(int is, int ie, int ps, int pe) {
        // is, ie는 inorder의 시작과 끝
        // ps, pe는 postorder의 시작과 끝

        if(is <= ie && ps <= ps) {
            // 후위 순회의 맨 마지막은 루트 노드이다.
            // 전위 순회는 맨 앞에 루트 노드가 온다.
            preorder[idx++] = postorder[pe];

            // 중위 순회에서 루트 노드를 찾아 인덱스 저장
            int pos = is;
            for(int i=is; i<=ie; i++) {
                if(inorder[i] == postorder[pe]) {
                    pos = i;
                    break;
                }
            }

            // 중위 순회로 왼쪽 노드, 오른쪽 노드를 알 수 있다.
            // 왼쪽 자식 트리를 가지고 다시 똑같은 과정을 반복한다.
            getPreOrder(is, pos - 1, ps, ps + pos - is - 1);
            // 오른쪽 자식 트리를 가지고 다시 똑같은 과정을 반복한다.
            getPreOrder(pos + 1, ie, ps + pos - is, pe - 1);
        }
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        N = Integer.parseInt(br.readLine());
        inorder = new int[N];
        postorder = new int[N];
        preorder = new int[N];

        // 중위 순회 입력
        String[] sA = br.readLine().split(" ");
        for(int i=0; i<N; i++) {
            inorder[i] = Integer.parseInt(sA[i]);
        }
        // 후위 순회 입력
        sA = br.readLine().split(" ");
        for(int i=0; i<N; i++) {
            postorder[i] = Integer.parseInt(sA[i]);
        }

        getPreOrder(0, N-1, 0, N-1);

        for(int x : preorder)
            System.out.printf(x + " ");

    }
}
