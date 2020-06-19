echo "-------------START---------------"
pwd
cd ./Example
pod install
cd ..
pwd
echo "----------------------------"
pod lib lint --no-clean --allow-warnings SwiftStandardRouter.podspec
git tag 0.1.0
git add .
git commit -m "0.1.0"
git pull
git push
git push --tag
pod repo add SwiftStandardRouter https://github.com/agan23/SwiftStandardRouter.git
pod repo push --allow-warnings SwiftStandardRouter SwiftStandardRouter.podspec

pod trunk --allow-warnings push SwiftStandardRouter.podspec
echo "-------------END---------------"
