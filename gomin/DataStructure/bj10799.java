package DataStructure;
import java.util.*;

public class bj10799 {
    public int solution(String str) {
        int answer = 0;
        Stack<Character> stack = new Stack<>();

        for(int i=0; i<str.length(); i++) {
            // 만약 '('가 들어왔을 땐 push
            char x = str.charAt(i);
            if(x == '(') stack.push(x);
            // 만약 ')'가 들어왔을 땐 이전 것과 비교
            // 이전 값이 '('이면 레이저를 의미하기 때문에 Stack의 size만큼 answer에 추가
            // 이전 값이 ')'이면 그냥 막대기를 의미하기 때문에 answer에 1만큼 추가
            else {
                stack.pop();
                if(str.charAt(i-1) == '(')
                    answer += stack.size();
                else
                    answer++;
            }
        }

        return answer;
    }
    public static void main(String[] args)  {
        bj10799 T = new bj10799();
        Scanner kb = new Scanner(System.in);
        String str = kb.nextLine();

        System.out.println(T.solution(str));
    }
}
