#/bin/sh

function command_exists {
  command -v "$1" > /dev/null;
}

HOST=abc
PORT=80
APP_DIR=/var/www/app
MYSQL_PASSWORD=root
WP_DATABASE_NAME=wordpress

if ! command_exists git ; then
  yum install -y git
fi

while [ $# -gt 0 ];
do
    case ${1} in

        --host|-h)
            HOST=${2}
            shift
        ;;

        --port|-p)
            PORT=${2}
            shift
        ;;

        --dir)
            APP_DIR=${2}
            shift
        ;;

        --mysql-password)
            MYSQL_PASSWORD=${2}
            shift
        ;;

        --database-name|-n)
            WP_DATABASE_NAME=${2}
            shift
        ;;

        *)
            echo "[ERROR] Invalid option '${1}'"
            usage
            exit 1
        ;;
    esac
    shift
done

if [ ! -e $APP_DIR ] ; then
  git clone https://github.com/polidog/wordpress-vagrant.git $APP_DIR
fi
cd $APP_DIR
./provision.sh --host ${HOST} --port ${PORT} --dir ${APP_DIR} --mysql-password ${MYSQL_PASSWORD} --database-name ${WP_DATABASE_NAME}
