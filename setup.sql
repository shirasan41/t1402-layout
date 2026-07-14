-- T1402 3Dレイアウトの共有保存用テーブル（1回だけ実行）
-- Supabase ダッシュボード → SQL Editor に貼り付けて Run
-- 対象プロジェクト: 現在のSupabaseプロジェクト（README参照）

create table if not exists public.t1402_layout (
  id int primary key,
  data jsonb not null,
  updated_at timestamptz default now()
);

alter table public.t1402_layout enable row level security;

-- URLを知っている人なら誰でも読み書きできる（家具配置の共有用途のため）
create policy "t1402 public read"   on public.t1402_layout for select using (true);
create policy "t1402 public insert" on public.t1402_layout for insert with check (true);
create policy "t1402 public update" on public.t1402_layout for update using (true);

insert into public.t1402_layout (id, data) values (1, '{}'::jsonb)
on conflict (id) do nothing;
