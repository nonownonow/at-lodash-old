require('../config') and that=@
#main은 닫힌 함수 module.exports는 열린 함수, 열린함수일 경우(매인함수가 없을 경우) @at=at={} 로직이 자동 삽임되고 @의 멤버들은 모두 at으로 자동 복제된다
describe 'at_load',->
   it 'inherit_prototype',->
