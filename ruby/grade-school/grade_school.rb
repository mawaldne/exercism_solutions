class School
  def initialize
    @school = Hash.new {|h,k| h[k] = [] }
  end

  def students(grade)
    @school[grade]
  end

  def students_by_grade
    @school.sort.map do |grade, students|
      { grade: grade, students: students }
    end
  end

  def add(student, grade)
    @school[grade] << student
    @school[grade].sort!
  end
end
