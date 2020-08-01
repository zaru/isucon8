-- reservations テーブルの更新日フィールドを追加
-- 初期データは必ずキャンセルされているため、キャンセル日時で埋める
alter table reservations add updated_at datetime(6) null;
update reservations set updated_at = IFNULL(canceled_at, reserved_at);
create index idx_updated_at on reservations(updated_at);
create index idx_user_id_event_id on reservations(user_id, event_id);

-- キャンセル済みフィールドを追加する
alter table reservations add canceled tinyint(1) not null default 0;
update reservations set canceled = case when canceled_at is not null then 1 else 0 end;
create index idx_event_id_canceled on reservations(event_id, canceled);
create index idx_user_id_canceled on reservations(user_id, canceled);
create index idx_sheet_id_canceled on reservations(sheet_id, canceled);
