%% -*- Mode: Prolog -*-

/**
 * Context-free Grammar Example 1 (ab)^n
 */
ab_s --> [].
ab_s --> [a], ab_s, [b].