document.addEventListener('turbolinks:load', () => {
  let showStudentsButton = document.getElementById('show-students')
  showStudentsButton.addEventListener('click', (e) => {
    getStudents(e.target.dataset.id)
      .then(res => res.json())
      .then(students => displayStudents(students))
      .catch(err => displayError("Course not Found"))
  })
})

const getStudents = (courseId) => {
  return myFetch(`http://localhost:3000/courses/${courseId}/students.json`)
}

const displayStudents = (results) => {
  let html = results.map(studentData => new Student(studentData).render()).join('')
  document.getElementById('students').innerHTML = html
}

const displayError = (error) => {
  document.getElementById('students').innerHTML = error;
}

class Student {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
  }

  render() {
    return `
      <div><a href="/students/${this.id}">${this.name}</a></div>
    `
  }
}

