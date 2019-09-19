document.addEventListener('turbolinks:load', () => {
  let showStudentsButton = document.getElementById('show-students')
  showStudentsButton.addEventListener('click', (e) => {
    getStudents(e.target.dataset.id)
      .then(res => res.json())
      .then(students => displayStudents(students))
      .catch(err => displayError("Course not Found"))
  })

  let newStudentForm = document.getElementById('new_student')
  newStudentForm.addEventListener('submit', (e) => {
    e.preventDefault();
    let data = {
      student: {
        name: e.target.querySelector('#student_name').value,
        email: e.target.querySelector('#student_email').value
      }
    }
    let token = e.target.querySelector('input[name=authenticity_token]').value
    myFetch(e.target.action,{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-token': token
      },
      body: JSON.stringify(data)
    })
      .then(res=>res.json())
      .then(studentData=> {
        let html = new Student(studentData).render()
        getStudentsContainer().innerHTML += html
      })
  })
})

const getStudentsContainer = () => document.getElementById('students')

const getStudents = (courseId) => {
  return myFetch(`http://localhost:3000/courses/${courseId}/students.json`)
}

const displayStudents = (results) => {
  let html = results.map(studentData => new Student(studentData).render()).join('')
  getStudentsContainer().innerHTML = html
}

const displayError = (error) => {
  getStudentsContainer().innerHTML = error;
}

