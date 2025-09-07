#!/bin/bash

# 极睿科技Infimind展示页面部署脚本
# 使用方法: ./deploy.sh YOUR_GITHUB_USERNAME

if [ $# -eq 0 ]; then
    echo "❌ 请提供您的GitHub用户名"
    echo "使用方法: ./deploy.sh YOUR_GITHUB_USERNAME"
    echo "例如: ./deploy.sh xiaoyanzhou"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="infimind-showcase"

echo "🚀 开始部署极睿科技Infimind展示页面..."
echo "📝 GitHub用户名: $GITHUB_USERNAME"
echo "📁 仓库名称: $REPO_NAME"

# 检查是否已经初始化Git
if [ ! -d ".git" ]; then
    echo "📦 初始化Git仓库..."
    git init
fi

# 添加远程仓库
echo "🔗 添加远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# 添加所有文件
echo "📄 添加文件到Git..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Deploy: 极睿科技Infimind AI智能工作流解决方案展示页面" || echo "没有新的更改需要提交"

# 推送到GitHub
echo "🚀 推送到GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ 部署完成！"
echo ""
echo "🌐 您的网站将在以下地址可用："
echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME"
echo ""
echo "📋 接下来的步骤："
echo "1. 访问 https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "2. 点击 'Settings' 标签"
echo "3. 在左侧菜单找到 'Pages'"
echo "4. 在 'Source' 部分选择 'GitHub Actions'"
echo "5. 等待几分钟让GitHub Pages生效"
echo ""
echo "🎉 完成后，您就可以分享这个链接给客户了！"
