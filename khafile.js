let project = new Project("New Project");
project.addAssets("assets/**");
project.addShaders("shaders/**");
project.addSources("src");
resolve(project);
