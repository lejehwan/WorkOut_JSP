package exercise;

public class ExerciseDTO {

	private String exerciseName;
	private String exercisePart;
	private String exercisePlan;
	private String exerciseLevel;
	private String exerciseIntensity;

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getExercisePart() {
		return exercisePart;
	}

	public void setExercisePart(String exercisePart) {
		this.exercisePart = exercisePart;
	}

	public String getExercisePlan() {
		return exercisePlan;
	}

	public void setExercisePlan(String exercisePlan) {
		this.exercisePlan = exercisePlan;
	}

	public String getExerciseLevel() {
		return exerciseLevel;
	}

	public void setExerciseLevel(String exerciseLevel) {
		this.exerciseLevel = exerciseLevel;
	}

	public String getExerciseIntensity() {
		return exerciseIntensity;
	}

	public void setExerciseIntensity(String exerciseIntensity) {
		this.exerciseIntensity = exerciseIntensity;
	}
	
	public ExerciseDTO() {
		
	}

	public ExerciseDTO(String exerciseName, String exercisePart, String exercisePlan, String exerciseLevel,
			String exerciseIntensity) {
		super();
		this.exerciseName = exerciseName;
		this.exercisePart = exercisePart;
		this.exercisePlan = exercisePlan;
		this.exerciseLevel = exerciseLevel;
		this.exerciseIntensity = exerciseIntensity;
	}
	
	

}
