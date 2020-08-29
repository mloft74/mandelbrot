package;

import kha.Scheduler;
import kha.Assets;
import kha.System;
import Project;

class Main {

    public static function main() {
        System.start(
            {title: "Project", width: 800, height: 600},
            (window) -> {
                Assets.loadEverything(() -> {
                    final project = new Project();
                    Scheduler.addTimeTask( project.update, 0, 1 / 60);
                    System.notifyOnFrames( project.render );
                });
            }
        );
    }

}
