#include "mainwindow.h"
#include "ui_mainwindow.h"   // 由 uic 自动生成

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    setWindowTitle("xmake + Qt5-Widgets 示例");
}

MainWindow::~MainWindow()
{
    delete ui;
}