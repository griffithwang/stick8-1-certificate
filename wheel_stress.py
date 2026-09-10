"""Factored five-line height-stress identities (K5 minus two disjoint edges)."""
from itertools import combinations


def wheels(n):
    for five in combinations(range(n),5):
        for hub in five:
            rest = [x for x in five if x != hub]
            a = rest[0]
            for b in rest[1:]:
                c,d = [x for x in rest if x not in (a,b)]
                yield hub,a,b,c,d


def coefficients(order,bracket,multiply,negative):
    """Return eight (edge-pair, coefficient) terms, using numeric or sign algebra."""
    h,a,b,c,d = order
    v = [bracket(a,b,c),negative(bracket(h,b,c)),bracket(h,a,c),negative(bracket(h,a,b))]
    w = [bracket(a,b,d),negative(bracket(h,b,d)),bracket(h,a,d),negative(bracket(h,a,b))]
    mul4 = lambda x,y,z,t:multiply(multiply(x,y),multiply(z,t))
    result = [((h,a),negative(mul4(v[1],w[1],bracket(h,a,b),bracket(a,c,d)))),
              ((h,b),mul4(v[2],w[2],bracket(h,a,b),bracket(b,c,d)))]
    for i in range(3):
        result.append(((order[i],c),mul4(w[1],w[2],v[i],v[3])))
        result.append(((order[i],d),negative(mul4(v[1],v[2],w[i],w[3]))))
    return result
