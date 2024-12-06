package items;

import java.util.ArrayList;

public class Cart { //장바구니역할의 클래스
	//변수: 상품코드, 장바구니주인, 개수
	//상품코드와 상품개수는 여러개가 저장가능해야함. ArrayList
	
	public Cart(String id) { this.id = id; } //계정은 생성자를 통해 할당
	private String id; //계정저장
	private ArrayList<String> codeList = new ArrayList<String>(); //상품번호 n개 저장
	private ArrayList<Integer> numList = new ArrayList<Integer>(); //상품개수 n개 저장

	//장바구니보기에 사여ㅛ요ㅕㅇㄹ효ㅑㅇ로ㅠㄹ
	public ArrayList<String> getCodeList() { return codeList; }
	public ArrayList<Integer> getNumList() { return numList; }
	
	
	//메서드: 3개 필요(장바구니에 담는, 장바구니에서 삭제하는, 장바구니에서 변경하는 메서드)	
	public void addCart(String code, Integer num) {
		//code안에 있는 상품의 번호를 codeList에 저장 전에, 해당 상품의 번호가 codeList에 있는지 먼저 확인. 
		//만약 codeList에 같은 상품의 번호가 있으면, numList의 해당 상품의 개수를 +1증가하기
		//만약 codeList에 같은 상품의 번호가 없으면, codeList에 상품번호와 numList에 1저장하기
		
		//codeList안의 모든 상품번호를 차례로 검사하기
		for(int i=0; i<codeList.size(); i++) {
			if(codeList.get(i).equals(code)) { //i번째 상품번호와 code에 있는 상품번호가 같은경우
				Integer quantity = numList.get(i); //i번째 상품의 개수 찾기
				int sum = quantity + num; //기존개수 + num의 개수
				numList.set(i, sum); //i번째 상품의 개수를 sum에 있는 개수를 바꾸기
				return; //void 메서드에서 return;의 의미는 메서드종료
			}
		}
		codeList.add(code);
		numList.add(num);
		
		
	}
}
