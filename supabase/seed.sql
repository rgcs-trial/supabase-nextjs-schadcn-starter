-- Seed data for local development and preview branches
-- This file is automatically run when you start Supabase locally or reset the database

-- Create test users (only for local development)
-- Note: In preview branches, you might want to use different test data
INSERT INTO auth.users (id, email, raw_app_meta_data, raw_user_meta_data, created_at, updated_at)
VALUES 
  ('d0d2c5f8-3c4a-4b7a-8f1e-2a3b4c5d6e7f', 'test@example.com', '{"provider":"email","providers":["email"]}', '{}', now(), now()),
  ('a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'demo@example.com', '{"provider":"email","providers":["email"]}', '{}', now(), now())
ON CONFLICT (id) DO NOTHING;

-- Create sample todos for test users
INSERT INTO public.todos (title, description, is_completed, user_id, created_at, updated_at)
VALUES
  -- Todos for test@example.com
  ('Set up Supabase project', 'Initialize Supabase and configure authentication', true, 'd0d2c5f8-3c4a-4b7a-8f1e-2a3b4c5d6e7f', now() - interval '5 days', now() - interval '5 days'),
  ('Create database schema', 'Design and implement the todos table with RLS policies', true, 'd0d2c5f8-3c4a-4b7a-8f1e-2a3b4c5d6e7f', now() - interval '4 days', now() - interval '4 days'),
  ('Implement authentication', 'Add sign up, sign in, and sign out functionality', false, 'd0d2c5f8-3c4a-4b7a-8f1e-2a3b4c5d6e7f', now() - interval '3 days', now() - interval '3 days'),
  ('Build todo CRUD operations', 'Create, read, update, and delete todos', false, 'd0d2c5f8-3c4a-4b7a-8f1e-2a3b4c5d6e7f', now() - interval '2 days', now() - interval '2 days'),
  ('Add real-time subscriptions', 'Implement real-time updates for todos', false, 'd0d2c5f8-3c4a-4b7a-8f1e-2a3b4c5d6e7f', now() - interval '1 day', now() - interval '1 day'),
  
  -- Todos for demo@example.com
  ('Review project requirements', 'Go through all the project specifications', true, 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', now() - interval '3 days', now() - interval '3 days'),
  ('Set up development environment', 'Install Node.js, pnpm, and required tools', true, 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', now() - interval '2 days', now() - interval '2 days'),
  ('Deploy to production', 'Set up CI/CD and deploy the application', false, 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', now() - interval '1 day', now() - interval '1 day'),
  ('Write documentation', 'Create comprehensive README and API docs', false, 'a1b2c3d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d', now(), now())
ON CONFLICT DO NOTHING;

-- Add some public todos (if you want to show todos without authentication)
-- These would need different RLS policies to be visible
-- Uncomment if you want public todos:
/*
INSERT INTO public.todos (title, description, is_completed, user_id, created_at, updated_at)
VALUES
  ('Public Todo 1', 'This is a public todo visible to everyone', false, null, now(), now()),
  ('Public Todo 2', 'Another public todo', true, null, now() - interval '1 day', now() - interval '1 day')
ON CONFLICT DO NOTHING;
*/