package DataStructure;
import java.util.*;

public class bj1918 {
    public int priority(char x) {
        if(x == '*' || x == '/') return 1;
        else if(x == '+' || x == '-') return 0;
        else return -1;
    }
    public String solution(String str) {
        String answer = "";
        Stack<Character> stack = new Stack<>();

        for(char x : str.toCharArray()) {
            if(Character.isAlphabetic(x)) {
                answer += x;
                continue;
            }
            if(x == '(') {
                stack.push(x);
                continue;
            }
            if(x == ')') {
                while(stack.peek() != '(') answer += stack.pop();
                stack.pop();
                continue;
            }
            while(!stack.isEmpty() && priority(stack.peek()) >= x)
                answer += stack.pop();

            stack.add(x);
        }
        while (!stack.isEmpty()) answer += stack.pop();

        return answer;
    }
    public static void main(String[] args) {
        bj1918 T = new bj1918();
        Scanner kb = new Scanner(System.in);
        String str = kb.nextLine();

        System.out.println(T.solution(str));
    }
}
