class ProjectUtils {
  final String image;
  final String title;
  final String subTitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subTitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// HOBBY PROJECTS
List<ProjectUtils> hobbyProjects = [
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'My Portfolio Website',
    subTitle: 'This website will showcase my resume and portfolio',
    androidLink: 'https://www.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Hobby Project 1',
    subTitle: 'This website will showcase my resume and portfolio',
    iosLink: 'https://www.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Hobby Project 2',
    subTitle: 'This website will showcase my resume and portfolio',
    androidLink: 'https://www.google.com/',
    iosLink: 'https://www.google.com/',
    webLink: 'https://www.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Hobby Project 3',
    subTitle: 'This website will showcase my resume and portfolio',
    webLink: 'https://www.google.com/',
    iosLink: 'https://www.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Hobby Project 4',
    subTitle: 'This website will showcase my resume and portfolio',
    androidLink: 'https://www.google.com/',
    webLink: 'https://www.google.com/',
  ),
];

// WORK PROJECTS
List<ProjectUtils> workProjects = [
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Work Project 1',
    subTitle: 'This website will showcase my resume and portfolio',
    webLink: 'https://www.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Work Project 2',
    subTitle: 'This website will showcase my resume and portfolio',
    androidLink: 'https://www.google.com/',
    webLink: 'https://www.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/my_portfolio_project.png',
    title: 'Work Project 3',
    subTitle: 'This website will showcase my resume and portfolio',
    androidLink: 'https://www.google.com/',
    iosLink: 'https://www.google.com/',
  ),
];
