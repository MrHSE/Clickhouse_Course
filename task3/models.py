from infi.clickhouse_orm import Model, UInt8Field, Int16Field, UInt32Field, StringField, \
    DateTimeField, MergeTree


class MouseEvents(Model):
    id = UInt32Field()
    x = Int16Field()
    y = Int16Field()
    dx = Int16Field()
    dy = Int16Field()
    dt = DateTimeField()
    btn_code = UInt8Field()
    target = StringField()

    engine = MergeTree(date_col='dt', order_by=('id',), index_granularity=8192)
