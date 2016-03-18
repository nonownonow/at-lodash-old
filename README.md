# **@lodash** #

설치 : npm install at-lodash

nodejs에서 coffeescript로 코딩시,

1. 프로토타입 상속
1. 함수지향 (Lodash 기본상속)
1. 객체지향 (메소드체인패턴 자동구현)

을 특징으로 하는 at 라이브러리는, 

1. 가독성과
1. 유연성과
1. 표현력을 높여

빠른 개발과, 견고한 유지보수를 꾀하는
Helper 라이브러리로써, 

1. nodejs의 module을 활용한 prototype기반의 객체지향과
1. javascript의 일급함수를 활용한 클로저 기반의 함수지향을

바탕으로 구현된 라이브러리다.

### **at 모듈 작성법** ###
[load.coffee = require 시킬 모듈들을 작성, 작성하는 파일과 같은 경로에 생성]
```
@fs = require 'fs'
@path = require 'path'
@Q = require 'q'
@tracer = (require 'tracer').console
   format: "{{message}} {{file}}:{{line}} {{title}}",
   dateformat: "HH:MM:ss.L"
   inspectOpt:
      depth: 12
@log = @console.log

```

[my_module_father.coffee]
```
require 'at'

@my_id= ->
   @path.resolve '.'

@father_hobby= ->
   "#{@my_id()}'s hobby is reading"
```


[my_module_mother.coffee]
```
require 'at'

@my_id= ->
   @path.resolve '.'

@mother_hobby =>
   "#{@my_id()}'s hobby is to play the piano"   
```

[my_module_uncle.coffee]
```
require 'at'

#t는 lodash의 flow, $는 curryRight, S는 partialRight를 참조함

#FDD : main 함수는 filename으로 자동 참조한다

###
ODD : @[filename]함수객체의 @[filename].new(obj)를 호출하면(obj는 생성자에서 
초기화에 사용되는는 object) 새로운 객체 new_obj생성한다. 그리고 
obj의 member를 new_obj의 member(불변변수)로써 집어 넣는다. 그리고 
@의 모든 함수를 실행context의 member를 참조하는 인자가 실행context에 curry된 형태로 
가공하여 new_obj의 method로 집어 넣는다. 그리고 
이렇게 member와 method를 갖춘 new_obj를 인스턴스객체로써 반환한다. 
###

###
ODD 체인패턴 : 위에서 생성되는 new_obj는 함수객체로써 new_obj(obj)함수가 실행되면
new_obj의 모든 method는 실행 context를 반환하도록 가공되어 new_obj에 재장착된다 그리고 lodash 에 mixin된다
###

@main = (@arr)->@t(
   @$(@get_odd_sum2)
   @$(@set_more_element_by_odd) [11,12,13,14,15]
) arguments...

@get_odd_sum2 = (@arr,fn=@identity)->@t(
   @$(@filter) @odd
   @$(@sum) 2
   @$(fn)
) arguments...

@set_more_element_by_odd=(@arr,el...)->@t(
   @$(@concat) @S(@filter,@odd) el
) arguments...
```


### **at 사용법 : 프로토타입 상속** ###

[my_module_son.coffee]
```
require 'at'
require 'my_module_mother'
require 'my_module_father'

@my_id= ->
   "#{@my_id()}'s son"

@my_hobby= ->
   @father_hobby()+@mother_hobby()   
```

[my_module_house.coffee]
```
require 'at'
require 'my_module_son'

@console.log @my_id()
#my_module_mother의 @my_id가 아니라 my_module_father의 @my_id가 출력
#my_module_son의 require순서에 주의 
@console.log @my_hobby()
#my_module_son의 @my_hobby() 결과가 출력   
```
결론 : 모든 require된 module이 at에 의하여 최종 module에 __proto__체인으로 연결된다. 이 때 같은 이름의 함수가 오버라이드 됨으로 그 결과를 모두 보장할 수 없고, at은 main module에서 2단계 깊이의 module의 함수까지만 보장해준다. 2단계 깊이의 module간에는 먼저 require된 module의 함수가 shadowing된다.

### **at 사용법 : 함수지향 (Lodash 기본상속)** ###

[my_module_FDD.coffee]

```
require 'at'
require 'my_module_uncle'

res=@my_module_daughter [1,2,3,4,5]
#res는 [3,5,7,11,13,15]
res=@get_odd_sum2 [5..10]
#res는 [5,7,9]
```
### **at 사용법 : 객체지향 (메소드체인패턴 자동구현)** ###

[my_module_ODD.coffee]

```
require 'at'
require 'my_module_uncle'

@my_obj=@my_module_uncle.new(arg: [1...5])
@my_obj2=@my_module_uncle.new(arg: [10...15])

res=@my_obj.my_module_uncle [21...25]
#res는 [3,5,7,21,23,25]
res=@my_obj.get_odd_sum2()
#res는 [5,7,9,23,25,27]

res2=@my_obj2.set_more_element_by_odd([1...10])
#res는 [11,13,15,1,3,5,7,9]

res=@my_obj2(arg:[1...5]).set_more_element_by_odd([1...10])
#res는 [3,5,7,1,3,5,7,9]
```

결론 1 : javascript는 prototype 기반의 객체지향언어이기에 function객체를 
클래스 용도로 사용하지 않고, __proto__ 체인을 사용하여 객체지향의 모든 개념을 
구현할 수 있다. 오히려 function객체를 클래스 용도로 사용함으로 우회현상이 발생하기에, 
보다 동적이고 직관적인 __proto__체인의 사용이 더 효율적이지 않을까 생각된다. 


결론 2 : nodejs는 require함수를 통해 모든 모듈을 객체로 다루며, 모듈과 모듈간의 관계도 모듈객체를 통해 객체로 다루기 때문에 객체와 객체의 관계를 function객체를 통해 클래스계념으로 다루기보다 객체 내부의 __proto__체인을 통해 prototype계념으로 다루는 것이 낫다고 생각된다. 

현재 2015/3/9 : FDD 구현중
