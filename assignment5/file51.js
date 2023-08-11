class Person {
  constructor(name, age, gender) {
    this.name = name;
    this.age = age;
    this.gender = gender;
  }
  intro() {
    console.log(
      "Hello👋, my name is " +
        this.name +
        " and i am " +
        this.age +
        " years old. i am " +
        this.gender
    );
  }
}
class student extends Person {
  constructor(name, age, gender, studentid) {
    super(name, age, gender);
    this.studentid = studentid;
  }
  intro() {
    super.intro();
    console.log("My studentId is " + this.studentid);
  }
}
class teacher extends Person {
  constructor(name, age, gender, subject) {
    super(name, age, gender);
    this.subject = subject;
  }
  intro() {
    super.intro();
    console.log("i am currently teaching " + this.subject);
  }
}
//input data
const person1 = new Person("Shriraj", 21, "Male");
const student1 = new student("anuj", 13, "Male", "PCCOE20231002");
const teacher1 = new teacher("madhura", 40, "Female", "Computer graphics");

console.log(person1.intro());
console.log(student1.intro());
console.log(teacher1.intro());
