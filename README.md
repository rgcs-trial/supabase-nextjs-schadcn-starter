# Supabase + Next.js + shadcn/ui Starter

A modern, production-ready starter template with Supabase backend, Next.js 15, shadcn/ui components, and GitHub branching integration for seamless deployments.

## 🚀 Features

- **Next.js 15** with App Router and Turbopack
- **Supabase** for backend (Database, Auth, Storage, Realtime)
- **shadcn/ui** component library with Tailwind CSS
- **GitHub Branching Integration** for automatic preview deployments
- **TypeScript** for type safety
- **pnpm** package manager for efficient dependency management
- **Database Migrations** with version control
- **Row Level Security (RLS)** policies configured
- **CI/CD Workflows** for testing and deployment
- **Organized src/ directory** structure

## 📋 Prerequisites

- Node.js 18+ 
- pnpm 10.15.0+ (enforced via packageManager field)
- Docker Desktop (for local Supabase development)
- Supabase CLI
- Git

## 🛠️ Initial Setup

### 1. Clone and Install

```bash
git clone <your-repo-url>
cd supabase-nextjs-schadcn-starter
pnpm install
```

### 2. Environment Variables

Copy the example environment file and configure:

```bash
cp .env.example .env.local
```

For local development, the default values work out of the box. For production, update with your Supabase project credentials.

### 3. Start Local Supabase

```bash
# Start Supabase services (requires Docker)
pnpm run db:start

# Check status
pnpm run db:status
```

This will start:
- PostgreSQL database on port 54322
- Supabase Studio on http://localhost:54323
- API Gateway on http://localhost:54321

### 4. Run Migrations and Seed Data

```bash
# Reset database and apply all migrations + seed data
pnpm run db:reset
```

This creates the `todos` table with RLS policies and seeds sample data.

### 5. Start Development Server

```bash
pnpm run dev
```

Open [http://localhost:3000](http://localhost:3000) to see your app.

## 📁 Project Structure

```
.
├── .github/
│   └── workflows/         # CI/CD workflows
├── app/                   # Next.js app directory
├── src/
│   ├── components/        # React components
│   │   └── ui/           # shadcn/ui components
│   ├── lib/              # Utility functions
│   └── utils/
│       └── supabase/     # Supabase client utilities
├── supabase/
│   ├── migrations/       # Database migrations
│   ├── seed.sql         # Seed data for development
│   └── config.toml      # Supabase configuration
└── package.json
```

## 🔄 GitHub Branching Integration

This project is configured for Supabase GitHub branching integration, which automatically creates preview branches for pull requests.

### Setting Up GitHub Integration

1. **Connect GitHub to Supabase:**
   - Go to your Supabase project dashboard
   - Navigate to Settings > Integrations
   - Click "Connect to GitHub"
   - Authorize and select this repository

2. **Configure Branching:**
   - Enable "Automatic branching"
   - Select "Supabase changes only" if you only want branches for DB changes
   - Enable "Deploy to production" for automatic deployments on merge

3. **Update Remote Configuration:**
   Edit `supabase/config.toml` and uncomment the remotes section:
   ```toml
   [remotes.production]
   project_id = "your-production-project-ref"
   
   [remotes.staging]
   project_id = "your-staging-project-ref"
   ```

### Workflow

1. Create a feature branch
2. Make changes to migrations or code
3. Push to GitHub and create a PR
4. Supabase automatically creates a preview branch
5. Tests run via GitHub Actions
6. Merge PR to deploy to production

## 🗄️ Database Management

### Available Scripts

```bash
# Local Supabase Management
pnpm run db:start          # Start local Supabase
pnpm run db:stop           # Stop local Supabase
pnpm run db:status         # Check service status
pnpm run db:reset          # Reset DB with migrations + seed

# Migration Management
pnpm run db:migration:new  # Create new migration
pnpm run db:migration:list # List all migrations

# Remote Database
pnpm run db:link           # Link to remote project
pnpm run db:push           # Push migrations to remote
pnpm run db:pull           # Pull schema from remote
```

### Creating Migrations

1. **Manual Migration:**
   ```bash
   pnpm run db:migration:new migration_name
   ```
   Then edit the created file in `supabase/migrations/`

2. **From Studio Changes:**
   Make changes in Studio (http://localhost:54323), then:
   ```bash
   pnpm run sb -- db diff migration_name
   ```

## 🔐 Security

### Row Level Security (RLS)

The todos table has RLS enabled with policies for:
- Users can only view their own todos
- Users can only create todos for themselves
- Users can only update their own todos
- Users can only delete their own todos

### Production Checklist

- [ ] Enable RLS on all tables
- [ ] Configure proper CORS settings
- [ ] Set up custom SMTP for auth emails
- [ ] Enable MFA for admin accounts
- [ ] Configure network restrictions
- [ ] Set up monitoring and alerts
- [ ] Review and update security policies
- [ ] Enable SSL enforcement

## 🚀 Deployment

### GitHub Actions Workflows

#### Database Tests (`database-tests.yml`)
- Runs on PRs that modify migrations
- Tests migrations apply cleanly
- Verifies seed data and schema

#### Deploy Migrations (`deploy-migrations.yml`)
- Runs on push to main branch
- Deploys migrations to production
- Requires secrets configuration

#### Backup Database (`backup-database.yml`)
- Daily automated backups
- **⚠️ Only use in PRIVATE repositories**
- Stores backups as GitHub artifacts

### Required GitHub Secrets

Configure these in Settings > Secrets:

- `SUPABASE_PROJECT_REF`: Your project reference ID
- `SUPABASE_ACCESS_TOKEN`: From https://supabase.com/dashboard/account/tokens
- `SUPABASE_DB_PASSWORD`: Database password
- `DATABASE_URL`: PostgreSQL connection string (for backups)

### Deploy to Vercel

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/your-username/your-repo)

Set these environment variables in Vercel:
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## 🧪 Testing

```bash
# Run linting
pnpm run lint

# Run type checking
pnpm run build

# Test database locally
pnpm run db:reset
```

## 📚 Learn More

- [Supabase Documentation](https://supabase.com/docs)
- [Next.js Documentation](https://nextjs.org/docs)
- [shadcn/ui Components](https://ui.shadcn.com)
- [Supabase GitHub Branching](https://supabase.com/docs/guides/platform/branching)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests locally
5. Submit a pull request

## 📄 License

MIT

---

Built with ❤️ using Next.js, Supabase, and shadcn/ui