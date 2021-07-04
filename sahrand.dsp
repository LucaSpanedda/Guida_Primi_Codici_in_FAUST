import("stdfaust.lib");

sampandhold(frequency) = sehout
with{
    // NOISE GENERATION
    random  = +(12345)~*(1103515245);
    noise   = random/2147483647.0;
    // IMPULSE GENERATION
    decimal(x)= x-int(x);
    phase = frequency/ma.SR : (+ : decimal) ~ _;
    saw = phase-0.5;
    ifpos = (saw > 0);
    trig = ( ifpos - (ifpos@(1)) ) > 0;
    // SAH THE NOISE FUNCTION (with the impulse)
    sahrandom = (*(1 - trig) + noise * trig) ~ _;
    sehout = (sahrandom +1) / 2;
};
process = sampandhold(4);