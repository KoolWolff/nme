package;
import nmml.TestNMMLParser;
import haxe.Timer;
class TestMain {

	static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestToolRuns());
        r.add(new TestNMMLParser());
        var t0 = Timer.stamp();
        var success = r.run();
        trace(" Time : " + (Timer.stamp()-t0)*1000 );
        Sys.exit(success ? 0 : 1);
	}
}