
#! /bin/sh
# ==========================================================================
GITHUB_ACCOUNT=dilruby
WS_DIR=Workspace_xml_pars
REPO_NAME=XML_Parsers
APP_VERSION=1.1
ARGS_01=
# =========================================================================
if ! which java > /dev/null 2>&1 ; then echo Java not installed; return; fi
if ! which mvn > /dev/null 2>&1 ; then echo Maven not installed; return; fi
if ! which git > /dev/null 2>&1 ; then echo Git not installed; return; fi
if [ -d "$HOME/$WS_DIR" ] ; then cd ~ /$WS_DIR; else echo $WS_DIR directory is not exist; return; fi
if [ -d "$HOME/$WS_DIR/$REPO_NAME" ]; then rm -rf $HOME/$WS_DIR/$REPO_NAME; fi
git clone https://github.com/$GITHUB_ACCOUNT/$REPO_NAME.git
cd ./$REPO_NAME
mvn clean package -Dbuild.version="$APP_VERSION"
echo "Executing XML Parsing ..."
echo "==========================="
echo "DOM Parser without xpath working ..."
echo "===================================="
java -cp target/$REPO_NAME-$APP_VERSION.jar core.DOMParser
echo "===================================="
echo "DOM Parser with xpath working ..."
echo "===================================="
java -cp target/$REPO_NAME-$APP_VERSION.jar core.DOMXPathParser
echo "===================================="
echo "SAX Parser working ..."
echo "===================================="
java -cp target/$REPO_NAME-$APP_VERSION.jar core.SAXParserr
echo "===================================="
echo "STAX Parser working ..."
echo "===================================="
java -cp target/$REPO_NAME-$APP_VERSION.jar core.StAXParser
echo "===================================="



