# FTP Deploy Action

Deploy files to FTP server with SSL/TLS support and enhanced logging capabilities.

## Usage

```yaml
- uses: atssj/gh-actions/actions/ftp-deploy@v1
  with:
    ftp_server: 'ftp.example.com'
    ftp_username: ${{ secrets.FTP_USERNAME }}
    ftp_password: ${{ secrets.FTP_PASSWORD }}
    local_dir: './dist'
    remote_dir: '/public_html'
```

## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `ftp_server` | FTP server hostname | Yes | - |
| `ftp_username` | FTP username | Yes | - |
| `ftp_password` | FTP password | Yes | - |
| `local_dir` | Local directory to upload | No | `.` |
| `remote_dir` | Remote directory on FTP server | No | `/` |
| `ssl_enabled` | Enable SSL/TLS connection | No | `true` |
| `exclude` | Files to exclude (glob pattern) | No | `.git*,.DS_Store` |

## Outputs

| Output | Description |
|--------|-------------|
| `files_uploaded` | Number of files uploaded |
| `transfer_time` | Total transfer time in seconds |

## Examples

### Basic Usage
```yaml
steps:
  - uses: actions/checkout@v4
  - uses: atssj/gh-actions/actions/ftp-deploy@v1
    with:
      ftp_server: ftp.example.com
      ftp_username: ${{ secrets.FTP_USERNAME }}
      ftp_password: ${{ secrets.FTP_PASSWORD }}
      local_dir: ./dist
```

### With SSL Options
```yaml
steps:
  - uses: atssj/gh-actions/actions/ftp-deploy@v1
    with:
      ftp_server: ftps.example.com
      ftp_username: ${{ secrets.FTP_USERNAME }}
      ftp_password: ${{ secrets.FTP_PASSWORD }}
      ssl_enabled: true
      exclude: '.git*,.DS_Store,node_modules/**'
```

## Security

- Always use secrets for sensitive information
- SSL is enabled by default for secure transfers
- Password is never logged in GitHub Actions output

## Contributing

See our [Contributing Guidelines](../../CONTRIBUTING.md) for details on contributing to this action.