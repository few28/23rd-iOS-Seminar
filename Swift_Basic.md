# Swift Basic
> `Swift`의 기본 문법을 다룹니다.

## 목차
* 상수와 변수
* 기본 데이터 타입
* 컬렉션
* 함수
* 조건문, 반복문
* 옵셔널 `Optional`
* 구조체, 클래스
* 프로토콜 `Protocol`
* 확장 `extension`
* POP (Protocol Oriented Programming)

## 01. 상수와 변수
### 상수, 변수의 선언
* 상수 선언 키워드 `let`
* 변수 선언 키워드 `var`  
```swift
let name: Type = value  
var name: Type = value  
```
> 값의 타입이 명확하다면 타입 생략 가능
```swift
let name = value
var name = value
```
```swift
let constant: String = "선언 후 값의 변경이 불가능한 상수"
var variable: String = "선언 후에도 변경이 가능한 변수"

variable = "변수는 이렇게 다른 값을 할당할 수 있지만"
constant = "상수는 불가능합니다." // 에러
```
## 01-1. 네이밍 규칙, 로그 찍어보기

### 카멜표기법 "camelCase"
* 각 단어의 첫 알파벳을 대문자로 표기하는 것이 마치 낙타의 등과 같아보여서 붙여진 이름
* 띄어쓰기 대신 대문자로 단어를 구분하는 표기 방식
#### lowerCamelCase 와 UpperCamelCase
> lowerCamelCase : 첫번째 단어만 소문자로 표현하고 다음 단어부터 첫 알파벳을 대문자로 표기  
> UpperCamelCase :  모든 단어의 첫 알파벳을 대문자로 표기

타입이나 프로토콜의 이름은 모두 UpperCamelCase 로 표기  
> 여기서 타입은 타입이 될 수 있는 모든 것을 의미함 : `Class`, `Structure`, `Enum` 등
그 외는 모두 lowerCamelCase 로 사용


```swift
let maximumNumberOfLines = 3
```

## 02. 기본 데이터 타입



## 03. 컬렉션


## 04. 함수


## 05. 조건문, 반복문


## 06. Optional


## 07. 구조체, 클래스


## 08. Protocol


## 09. Extension


## 10. Protocol Oriented Programming, POP
