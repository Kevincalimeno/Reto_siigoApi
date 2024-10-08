package run;

import com.intuit.karate.junit5.Karate;

public class Siigo {

    @Karate.Test
    Karate siigo(){
        return Karate.run().relativeTo(getClass());

    }
}
