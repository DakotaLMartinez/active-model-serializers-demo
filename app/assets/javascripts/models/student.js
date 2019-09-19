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

