package;

import kha.Scheduler;
import kha.Assets;
import kha.System;
import Project;

class Main {

    public static function main() {
        System.start(
            {title: "Project", width: 800, height: 800},
            (window) -> {
                Assets.loadEverything(() -> {
                    final project = new Project();
                    Scheduler.addTimeTask( project.update, 0, 1 / 30);
                    System.notifyOnFrames( project.render );
                });
            }
        );
    }

}
