package tpm.study.model;

public class Person {
	private String id;
	private String name;
	private int age;
	private Car car;

	public Person() {
		super();
	}

	public Person(String id, String name, int age, Car car) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.car = car;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	@Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", age=" + age + ", car=" + car + "]";
	}

}
