def set_quickfix_list(nvim, items):
    nvim.command(render_call(render_items(items)))


def render_call(rendered_items):
    return f"call setqflist([], ' ', {{'items': [{rendered_items}]}})"


def render_items(items):
    return ",".join(render_item(item) for item in items)


def render_item(item):
    return "{" + ",".join(f"'{k}': '{v}'" for k, v in item.items()) + "}"
