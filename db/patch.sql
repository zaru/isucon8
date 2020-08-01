-- reservations テーブルの更新日フィールドを追加
-- 初期データは必ずキャンセルされているため、キャンセル日時で埋める
alter table reservations add updated_at datetime(6) null;
update reservations set updated_at = IFNULL(canceled_at, reserved_at);
create index idx_updated_at on reservations(updated_at);
create index idx_user_id_event_id on reservations(user_id, event_id);