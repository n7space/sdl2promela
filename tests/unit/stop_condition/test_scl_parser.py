import sdl2promela.stop_condition.parser as scl_parser
import sdl2promela.stop_condition.model as scl_model

import pytest

test_always_comparison_params = [
    ("always 0 = 1;", scl_model.EqualExpression),
    ("always 0 /= 1;", scl_model.NotEqualExpression),
    ("always 0 < 1;", scl_model.LessExpression),
    ("always 0 <= 1;", scl_model.LessEqualExpression),
    ("always 0 > 1;", scl_model.GreaterExpression),
    ("always 0 >= 1;", scl_model.GreaterEqualExpression),
]


@pytest.mark.parametrize(
    "test_input,expected_expression_type", test_always_comparison_params
)
def test_always_comparison(test_input, expected_expression_type):
    model = scl_parser.parse_stop_condition(test_input)
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, expected_expression_type)
    expression: scl_model.BinaryExpression = model.always_statements[0].expression
    assert isinstance(expression.lhs, scl_model.IntegerValue)
    assert isinstance(expression.rhs, scl_model.IntegerValue)
    lhs: scl_model.IntegerValue = expression.lhs
    rhs: scl_model.IntegerValue = expression.rhs
    assert lhs.value == 0
    assert rhs.value == 1


test_always_logical_params = [
    ("always true and false;", scl_model.AndExpression),
    ("always true or false;", scl_model.OrExpression),
    ("always true xor false;", scl_model.XorExpression),
]


@pytest.mark.parametrize(
    "test_input,expected_expression_type", test_always_logical_params
)
def test_always_logical(test_input, expected_expression_type):
    model = scl_parser.parse_stop_condition(test_input)
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, expected_expression_type)
    expression: scl_model.BinaryExpression = model.always_statements[0].expression
    assert isinstance(expression.lhs, scl_model.BooleanValue)
    assert isinstance(expression.rhs, scl_model.BooleanValue)
    lhs: scl_model.BooleanValue = expression.lhs
    rhs: scl_model.BooleanValue = expression.rhs
    assert lhs.value
    assert not rhs.value


test_always_arithmetic_params = [
    ("always 0 = 1 + 2;", scl_model.PlusExpression),
    ("always 0 = 1 - 2;", scl_model.MinusExpression),
    ("always 0 = 1 * 2;", scl_model.MulExpression),
    ("always 0 = 1 / 2;", scl_model.DivExpression),
    ("always 0 = 1 mod 2;", scl_model.ModExpression),
]


@pytest.mark.parametrize(
    "test_input,expected_expression_type", test_always_arithmetic_params
)
def test_always_arithmetic(test_input, expected_expression_type):
    model = scl_parser.parse_stop_condition(test_input)
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, scl_model.EqualExpression)

    equal_expression = model.always_statements[0].expression

    assert isinstance(equal_expression.lhs, scl_model.IntegerValue)

    checked_expression = equal_expression.rhs

    assert isinstance(checked_expression, expected_expression_type)
    expression: scl_model.BinaryExpression = checked_expression
    assert isinstance(expression.lhs, scl_model.IntegerValue)
    assert isinstance(expression.rhs, scl_model.IntegerValue)
    lhs: scl_model.IntegerValue = expression.lhs
    rhs: scl_model.IntegerValue = expression.rhs
    assert lhs.value == 1
    assert rhs.value == 2


def test_always_not():
    model = scl_parser.parse_stop_condition("always not false;")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, scl_model.NotExpression)

    not_expression: scl_model.NotExpression = model.always_statements[0].expression

    assert isinstance(not_expression.expression, scl_model.BooleanValue)

    expression: scl_model.BooleanValue = not_expression.expression
    assert not expression.value


def test_always_negative():
    model = scl_parser.parse_stop_condition("always 0 > - 1;")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(
        model.always_statements[0].expression, scl_model.GreaterExpression
    )

    greater_expression = model.always_statements[0].expression

    assert isinstance(greater_expression.lhs, scl_model.IntegerValue)

    checked_expression = greater_expression.rhs

    assert isinstance(checked_expression, scl_model.NegationExpression)
    expression: scl_model.NegationExpression = checked_expression
    assert isinstance(expression.expression, scl_model.IntegerValue)

    value: scl_model.IntegerValue = expression.expression

    assert value.value == 1


def test_variable_reference():
    model = scl_parser.parse_stop_condition("always somevar;")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(
        model.always_statements[0].expression, scl_model.VariableReference
    )

    ref: scl_model.VariableReference = model.always_statements[0].expression
    assert ref.name == "somevar"


def test_simple_selector():
    model = scl_parser.parse_stop_condition("always object.somevar;")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, scl_model.Selector)

    selector: scl_model.Selector = model.always_statements[0].expression
    assert len(selector.elements) == 2
    assert isinstance(selector.elements[0], scl_model.VariableReference)
    assert isinstance(selector.elements[1], scl_model.VariableReference)
    element1: scl_model.VariableReference = selector.elements[0]
    element2: scl_model.VariableReference = selector.elements[1]
    assert element1.name == "object"
    assert element2.name == "somevar"


def test_long_selector():
    model = scl_parser.parse_stop_condition("always object.somevar.params.data;")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, scl_model.Selector)

    selector: scl_model.Selector = model.always_statements[0].expression
    assert len(selector.elements) == 4
    assert isinstance(selector.elements[0], scl_model.VariableReference)
    assert isinstance(selector.elements[1], scl_model.VariableReference)
    assert isinstance(selector.elements[2], scl_model.VariableReference)
    assert isinstance(selector.elements[3], scl_model.VariableReference)
    element1: scl_model.VariableReference = selector.elements[0]
    element2: scl_model.VariableReference = selector.elements[1]
    element3: scl_model.VariableReference = selector.elements[2]
    element4: scl_model.VariableReference = selector.elements[3]
    assert element1.name == "object"
    assert element2.name == "somevar"
    assert element3.name == "params"
    assert element4.name == "data"


def test_simple_call():
    model = scl_parser.parse_stop_condition("always length(egse);")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, scl_model.CallExpression)

    call: scl_model.CallExpression = model.always_statements[0].expression

    assert len(call.parameters) == 1
    assert isinstance(call.parameters[0], scl_model.VariableReference)
    assert isinstance(call.function, scl_model.VariableReference)
    function: scl_model.VariableReference = call.function
    assert function.name == "length"


def test_call_and_selector():
    model = scl_parser.parse_stop_condition("always egse.params(0).data;")
    assert len(model.always_statements) == 1
    assert len(model.never_statements) == 0
    assert len(model.eventually_statements) == 0
    assert len(model.filter_out_statements) == 0

    assert isinstance(model.always_statements[0].expression, scl_model.Selector)

    selector: scl_model.SelectorExpression = model.always_statements[0].expression

    assert len(selector.elements) == 2
    assert isinstance(selector.elements[0], scl_model.CallExpression)
    assert isinstance(selector.elements[1], scl_model.VariableReference)

    element1: scl_model.CallExpression = selector.elements[0]
    element2: scl_model.VariableReference = selector.elements[1]

    assert element2.name == "data"
    assert isinstance(element1.function, scl_model.Selector)
    assert len(element1.parameters) == 1
    assert isinstance(element1.parameters[0], scl_model.IntegerValue)
    assert element1.parameters[0].value == 0
    assert len(element1.function.elements) == 2
    assert isinstance(element1.function.elements[0], scl_model.VariableReference)
    assert isinstance(element1.function.elements[1], scl_model.VariableReference)
    assert element1.function.elements[0].name == "egse"
    assert element1.function.elements[1].name == "params"
