package DataStructure;
import java.util.*;

public class bj1874 {
    public ArrayList<String> solution(int[] nA) {
        ArrayList<String> answer = new ArrayList<>();   // +, - 를 ArrayList에 넣고 답 출력
        Stack<Integer> stack = new Stack<>();   // 스택 사용

        // 초기값 1 넣어준다.
        answer.add("+");
        stack.push(1);

        int i = 1;
        int j = 0;
        // 스택의 최근값과 수열의 값을 비교 연산
        // 값이 같다면 pop
        // 스택의 최근값이 더 크다면 수열을 만들 수 없는 것이기 때문에 "NO"
        // 스택의 최근값이 더 작다면 push
        while(true) {
            int tmp = stack.peek();
            if(nA[j] == tmp) {
                answer.add("-");
                stack.pop();
                if(j != nA.length - 1) j++;
            } else if(nA[j] < tmp) {
                answer.clear();
                answer.add("NO");
                break;
            } else {
                answer.add("+");
                stack.push(i + 1);
                i++;
            }
            if(stack.isEmpty()) {
                if (nA[j] >= (i + 1)) {
                    answer.add("+");
                    stack.push(i + 1);
                    i++;
                } else {break;}
            }
        }
        return answer;  // 맞추긴 맞췄지만 뭔가 더 나은 방법이 있을 것 같다.
    }
    public static void main(String[] args) {
        bj1874 T = new bj1874();
        Scanner kb = new Scanner(System.in);
        int N = kb.nextInt();
        int[] nA = new int[N];
        for(int i=0; i<N; i++) {
            nA[i] = kb.nextInt();
        }

        for(String str : T.solution(nA)) {
            System.out.println(str);
        }
    }
}
