package DataStructure;
import java.util.*;

public class bj1935 {
    public Double solution(HashMap<Character, Double> iM, String str) {
        Double answer = 0.00;
        Stack<Double> stack = new Stack<>();    // Stack 사용

        for(char x : str.toCharArray()) {
            // 만약 알파벳이 나온다면
            // 알파벳에 맞는 숫자를 해쉬맵에서 찾아 Stack에 넣는다.
            if(Character.isAlphabetic(x)) {
                stack.push(iM.get(x));
            } else {
                // 만약 연산자가 나온다면
                // Stack에서 숫자 2개를 꺼내
                // 연산 후 Stack에 넣는다.
                Double rt = stack.pop();
                Double lt = stack.pop();
                if(x == '+') stack.push(lt + rt);
                else if(x == '-') stack.push(lt - rt);
                else if(x == '*') stack.push(lt * rt);
                else if(x == '/') stack.push(lt / rt);
            }
        }
        answer = stack.get(0);
        return answer;
    }
    public static void main(String[] args) {
        bj1935 T = new bj1935();
        Scanner kb = new Scanner(System.in);
        int N = kb.nextInt();
        String str = kb.next();

        // 해쉬맵에 '알파벳 - 숫자'의 형태로 저장
        HashMap<Character, Double> iM = new HashMap<>();
        for(int i=0; i<N; i++) {
            Double n = kb.nextDouble();
            iM.put((char)('A' + i), n);
        }

        // 소수점 둘째자리까지 출력
        System.out.printf("%.2f", T.solution(iM, str));
    }
}