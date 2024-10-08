package run;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

class ParallelRunner {

    @Test
    Karate testAll() {
        return Karate.run("classpath:features/siigo.feature").relativeTo(getClass());
}
}

