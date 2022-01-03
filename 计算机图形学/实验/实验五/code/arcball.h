//
// Created by pacer on 2019/6/19.
//

#ifndef RORATION_ARCBALL_H
#define RORATION_ARCBALL_H

#endif //RORATION_ARCBALL_H
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////ArcBall.h///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include <stdlib.h>

// 仅在Debug模式下，启用断言
#ifdef _DEBUG
# include "assert.h"
#else
# define assert(x) { }
#endif

#include <GL/glut.h>
#include "math.h"

//2维点
typedef union Tuple2f_t
{
    struct
    {
        GLfloat X, Y;
    } s;

    GLfloat T[2];
} Tuple2fT;

//3维点
typedef union Tuple3f_t
{
    struct
    {
        GLfloat X, Y, Z;
    } s;

    GLfloat T[3];
} Tuple3fT;

//4维点
typedef union Tuple4f_t
{
    struct
    {
        GLfloat X, Y, Z, W;
    } s;

    GLfloat T[4];
} Tuple4fT;


//3x3 矩阵
typedef union Matrix3f_t
{
    struct
    {
        //column major
        union { GLfloat M00; GLfloat XX; GLfloat SX; };
        union { GLfloat M10; GLfloat XY;             };
        union { GLfloat M20; GLfloat XZ;             };
        union { GLfloat M01; GLfloat YX;             };
        union { GLfloat M11; GLfloat YY; GLfloat SY; };
        union { GLfloat M21; GLfloat YZ;             };
        union { GLfloat M02; GLfloat ZX;             };
        union { GLfloat M12; GLfloat ZY;             };
        union { GLfloat M22; GLfloat ZZ; GLfloat SZ; };
    } s;
    GLfloat M[9];
} Matrix3fT;

//4x4 矩阵
typedef union Matrix4f_t
{
    struct
    {
        //column major
        union { GLfloat M00; GLfloat XX; GLfloat SX; };
        union { GLfloat M10; GLfloat XY;             };
        union { GLfloat M20; GLfloat XZ;             };
        union { GLfloat M30; GLfloat XW;             };
        union { GLfloat M01; GLfloat YX;             };
        union { GLfloat M11; GLfloat YY; GLfloat SY; };
        union { GLfloat M21; GLfloat YZ;             };
        union { GLfloat M31; GLfloat YW;             };
        union { GLfloat M02; GLfloat ZX;             };
        union { GLfloat M12; GLfloat ZY;             };
        union { GLfloat M22; GLfloat ZZ; GLfloat SZ; };
        union { GLfloat M32; GLfloat ZW;             };
        union { GLfloat M03; GLfloat TX;             };
        union { GLfloat M13; GLfloat TY;             };
        union { GLfloat M23; GLfloat TZ;             };
        union { GLfloat M33; GLfloat TW; GLfloat SW; };
    } s;
    GLfloat M[16];
} Matrix4fT;


//定义类型的别名
#define Point2fT    Tuple2fT
#define Quat4fT     Tuple4fT
#define Vector2fT   Tuple2fT
#define Vector3fT   Tuple3fT
#define FuncSqrt    sqrtf
# define Epsilon 1.0e-5

//2维点相加
inline
static void Point2fAdd(Point2fT* NewObj, const Tuple2fT* t1)
{
    assert(NewObj && t1);

    NewObj->s.X += t1->s.X;
    NewObj->s.Y += t1->s.Y;
}

//2 维点相减
inline
static void Point2fSub(Point2fT* NewObj, const Tuple2fT* t1)
{
    assert(NewObj && t1);

    NewObj->s.X -= t1->s.X;
    NewObj->s.Y -= t1->s.Y;
}

//3 维点矢积
inline
static void Vector3fCross(Vector3fT* NewObj, const Vector3fT* v1, const Vector3fT* v2)
{
    Vector3fT Result;

    assert(NewObj && v1 && v2);

    Result.s.X = (v1->s.Y * v2->s.Z) - (v1->s.Z * v2->s.Y);
    Result.s.Y = (v1->s.Z * v2->s.X) - (v1->s.X * v2->s.Z);
    Result.s.Z = (v1->s.X * v2->s.Y) - (v1->s.Y * v2->s.X);

    *NewObj = Result;
}

//3维点点积
inline
static GLfloat Vector3fDot(const Vector3fT* NewObj, const Vector3fT* v1)
{
    assert(NewObj && v1);

    return  (NewObj->s.X * v1->s.X) +
            (NewObj->s.Y * v1->s.Y) +
            (NewObj->s.Z * v1->s.Z);
}

//3维点的长度的平方
inline
static GLfloat Vector3fLengthSquared(const Vector3fT* NewObj)
{
    assert(NewObj);

    return  (NewObj->s.X * NewObj->s.X) +
            (NewObj->s.Y * NewObj->s.Y) +
            (NewObj->s.Z * NewObj->s.Z);
}

//3维点的长度
inline
static GLfloat Vector3fLength(const Vector3fT* NewObj)
{
    assert(NewObj);

    return FuncSqrt(Vector3fLengthSquared(NewObj));
}

//设置3x3矩阵为0 矩阵
inline
static void Matrix3fSetZero(Matrix3fT* NewObj)
{
    NewObj->s.M00 = NewObj->s.M01 = NewObj->s.M02 =
    NewObj->s.M10 = NewObj->s.M11 = NewObj->s.M12 =
    NewObj->s.M20 = NewObj->s.M21 = NewObj->s.M22 = 0.0f;
}

// 设置4x4矩阵为0矩阵
inline
static void Matrix4fSetZero(Matrix4fT* NewObj)
{
    NewObj->s.M00 = NewObj->s.M01 = NewObj->s.M02 =
    NewObj->s.M10 = NewObj->s.M11 = NewObj->s.M12 =
    NewObj->s.M20 = NewObj->s.M21 = NewObj->s.M22 =
    NewObj->s.M30 = NewObj->s.M31 = NewObj->s.M32 = 0.0f;
}

// 设置3x3矩阵为单位矩阵
inline
static void Matrix3fSetIdentity(Matrix3fT* NewObj)
{
    Matrix3fSetZero(NewObj);

    NewObj->s.M00 =
    NewObj->s.M11 =
    NewObj->s.M22 = 1.0f;
}

// 设置4x4矩阵为单位矩阵
inline
static void Matrix4fSetIdentity(Matrix4fT* NewObj)
{
    Matrix4fSetZero(NewObj);

    NewObj->s.M00 = 1.0f;
    NewObj->s.M11 = 1.0f;
    NewObj->s.M22 = 1.0f;
    NewObj->s.M33=1.0f;
}

//从四元数设置旋转矩阵
//
inline
static void Matrix3fSetRotationFromQuat4f(Matrix3fT* NewObj, const Quat4fT* q1)
{
    GLfloat n, s;
    GLfloat xs, ys, zs;
    GLfloat wx, wy, wz;
    GLfloat xx, xy, xz;
    GLfloat yy, yz, zz;

    assert(NewObj && q1);

    n = (q1->s.X * q1->s.X) + (q1->s.Y * q1->s.Y) + (q1->s.Z * q1->s.Z) + (q1->s.W * q1->s.W);
    s = (n > 0.0f) ? (2.0f / n) : 0.0f;

    xs = q1->s.X * s;  ys = q1->s.Y * s;  zs = q1->s.Z * s;
    wx = q1->s.W * xs; wy = q1->s.W * ys; wz = q1->s.W * zs;
    xx = q1->s.X * xs; xy = q1->s.X * ys; xz = q1->s.X * zs;
    yy = q1->s.Y * ys; yz = q1->s.Y * zs; zz = q1->s.Z * zs;

    NewObj->s.XX = 1.0f - (yy + zz); NewObj->s.YX =         xy - wz;  NewObj->s.ZX =         xz + wy;
    NewObj->s.XY =         xy + wz;  NewObj->s.YY = 1.0f - (xx + zz); NewObj->s.ZY =         yz - wx;
    NewObj->s.XZ =         xz - wy;  NewObj->s.YZ =         yz + wx;  NewObj->s.ZZ = 1.0f - (xx + yy);
}

//3x3 矩阵相乘
inline
static void Matrix3fMulMatrix3f(Matrix3fT* NewObj, const Matrix3fT* m1)
{
    Matrix3fT Result;

    assert(NewObj && m1);

    Result.s.M00 = (NewObj->s.M00 * m1->s.M00) + (NewObj->s.M01 * m1->s.M10) + (NewObj->s.M02 * m1->s.M20);
    Result.s.M01 = (NewObj->s.M00 * m1->s.M01) + (NewObj->s.M01 * m1->s.M11) + (NewObj->s.M02 * m1->s.M21);
    Result.s.M02 = (NewObj->s.M00 * m1->s.M02) + (NewObj->s.M01 * m1->s.M12) + (NewObj->s.M02 * m1->s.M22);

    Result.s.M10 = (NewObj->s.M10 * m1->s.M00) + (NewObj->s.M11 * m1->s.M10) + (NewObj->s.M12 * m1->s.M20);
    Result.s.M11 = (NewObj->s.M10 * m1->s.M01) + (NewObj->s.M11 * m1->s.M11) + (NewObj->s.M12 * m1->s.M21);
    Result.s.M12 = (NewObj->s.M10 * m1->s.M02) + (NewObj->s.M11 * m1->s.M12) + (NewObj->s.M12 * m1->s.M22);

    Result.s.M20 = (NewObj->s.M20 * m1->s.M00) + (NewObj->s.M21 * m1->s.M10) + (NewObj->s.M22 * m1->s.M20);
    Result.s.M21 = (NewObj->s.M20 * m1->s.M01) + (NewObj->s.M21 * m1->s.M11) + (NewObj->s.M22 * m1->s.M21);
    Result.s.M22 = (NewObj->s.M20 * m1->s.M02) + (NewObj->s.M21 * m1->s.M12) + (NewObj->s.M22 * m1->s.M22);

    *NewObj = Result;
}

//4x4 矩阵相乘
inline
static void Matrix4fSetRotationScaleFromMatrix4f(Matrix4fT* NewObj, const Matrix4fT* m1)
{
    assert(NewObj && m1);

    NewObj->s.XX = m1->s.XX; NewObj->s.YX = m1->s.YX; NewObj->s.ZX = m1->s.ZX;
    NewObj->s.XY = m1->s.XY; NewObj->s.YY = m1->s.YY; NewObj->s.ZY = m1->s.ZY;
    NewObj->s.XZ = m1->s.XZ; NewObj->s.YZ = m1->s.YZ; NewObj->s.ZZ = m1->s.ZZ;
}

//进行矩阵的奇异值分解，旋转矩阵被保存到rot3和 rot4中，返回矩阵的缩放因子
inline
static GLfloat Matrix4fSVD(const Matrix4fT* NewObj, Matrix3fT* rot3, Matrix4fT* rot4)
{
    GLfloat s, n;

    assert(NewObj);

    s = FuncSqrt(
            ( (NewObj->s.XX * NewObj->s.XX) + (NewObj->s.XY * NewObj->s.XY) + (NewObj->s.XZ * NewObj->s.XZ) +
              (NewObj->s.YX * NewObj->s.YX) + (NewObj->s.YY * NewObj->s.YY) + (NewObj->s.YZ * NewObj->s.YZ) +
              (NewObj->s.ZX * NewObj->s.ZX) + (NewObj->s.ZY * NewObj->s.ZY) + (NewObj->s.ZZ * NewObj->s.ZZ) ) / 3.0f );

    if (rot3)
    {
        rot3->s.XX = NewObj->s.XX; rot3->s.XY = NewObj->s.XY; rot3->s.XZ = NewObj->s.XZ;
        rot3->s.YX = NewObj->s.YX; rot3->s.YY = NewObj->s.YY; rot3->s.YZ = NewObj->s.YZ;
        rot3->s.ZX = NewObj->s.ZX; rot3->s.ZY = NewObj->s.ZY; rot3->s.ZZ = NewObj->s.ZZ;

        n = 1.0f / FuncSqrt( (NewObj->s.XX * NewObj->s.XX) +
                             (NewObj->s.XY * NewObj->s.XY) +
                             (NewObj->s.XZ * NewObj->s.XZ) );
        rot3->s.XX *= n;
        rot3->s.XY *= n;
        rot3->s.XZ *= n;

        n = 1.0f / FuncSqrt( (NewObj->s.YX * NewObj->s.YX) +
                             (NewObj->s.YY * NewObj->s.YY) +
                             (NewObj->s.YZ * NewObj->s.YZ) );
        rot3->s.YX *= n;
        rot3->s.YY *= n;
        rot3->s.YZ *= n;

        n = 1.0f / FuncSqrt( (NewObj->s.ZX * NewObj->s.ZX) +
                             (NewObj->s.ZY * NewObj->s.ZY) +
                             (NewObj->s.ZZ * NewObj->s.ZZ) );
        rot3->s.ZX *= n;
        rot3->s.ZY *= n;
        rot3->s.ZZ *= n;
    }

    if (rot4)
    {
        if (rot4 != NewObj)
        {
            Matrix4fSetRotationScaleFromMatrix4f(rot4, NewObj);
        }


        n = 1.0f / FuncSqrt( (NewObj->s.XX * NewObj->s.XX) +
                             (NewObj->s.XY * NewObj->s.XY) +
                             (NewObj->s.XZ * NewObj->s.XZ) );
        rot4->s.XX *= n;
        rot4->s.XY *= n;
        rot4->s.XZ *= n;

        n = 1.0f / FuncSqrt( (NewObj->s.YX * NewObj->s.YX) +
                             (NewObj->s.YY * NewObj->s.YY) +
                             (NewObj->s.YZ * NewObj->s.YZ) );
        rot4->s.YX *= n;
        rot4->s.YY *= n;
        rot4->s.YZ *= n;

        n = 1.0f / FuncSqrt( (NewObj->s.ZX * NewObj->s.ZX) +
                             (NewObj->s.ZY * NewObj->s.ZY) +
                             (NewObj->s.ZZ * NewObj->s.ZZ) );
        rot4->s.ZX *= n;
        rot4->s.ZY *= n;
        rot4->s.ZZ *= n;
    }

    return s;
}

//从3x3矩阵变为4x4的旋转矩阵
inline
static void Matrix4fSetRotationScaleFromMatrix3f(Matrix4fT* NewObj, const Matrix3fT* m1)
{
    assert(NewObj && m1);

    NewObj->s.XX = m1->s.XX; NewObj->s.YX = m1->s.YX; NewObj->s.ZX = m1->s.ZX;
    NewObj->s.XY = m1->s.XY; NewObj->s.YY = m1->s.YY; NewObj->s.ZY = m1->s.ZY;
    NewObj->s.XZ = m1->s.XZ; NewObj->s.YZ = m1->s.YZ; NewObj->s.ZZ = m1->s.ZZ;
}

//4x4矩阵的与标量的乘积
inline
static void Matrix4fMulRotationScale(Matrix4fT* NewObj, GLfloat scale)
{
    assert(NewObj);

    NewObj->s.XX *= scale; NewObj->s.YX *= scale; NewObj->s.ZX *= scale;
    NewObj->s.XY *= scale; NewObj->s.YY *= scale; NewObj->s.ZY *= scale;
    NewObj->s.XZ *= scale; NewObj->s.YZ *= scale; NewObj->s.ZZ *= scale;
}

//设置旋转矩阵
inline
static void Matrix4fSetRotationFromMatrix3f(Matrix4fT* NewObj, const Matrix3fT* m1)
{
    GLfloat scale;

    assert(NewObj && m1);

    scale = Matrix4fSVD(NewObj, NULL, NULL);

    Matrix4fSetRotationScaleFromMatrix3f(NewObj, m1);
    Matrix4fMulRotationScale(NewObj, scale);
}



typedef class ArcBall_t
{
protected:
    //把二维点映射到三维点
    inline
    void _mapToSphere(const Point2fT* NewPt, Vector3fT* NewVec) const;

public:
    //构造/析构函数
    ArcBall_t(GLfloat NewWidth, GLfloat NewHeight);
    ~ArcBall_t() { };

    //设置边界
    inline
    void    setBounds(GLfloat NewWidth, GLfloat NewHeight)
    {
        assert((NewWidth > 1.0f) && (NewHeight > 1.0f));

        //设置长宽的调整因子
        this->AdjustWidth  = 1.0f / ((NewWidth  - 1.0f) * 0.5f);
        this->AdjustHeight = 1.0f / ((NewHeight - 1.0f) * 0.5f);
    }

    //鼠标点击
    void    click(const Point2fT* NewPt);

    //鼠标拖动计算旋转
    void    drag(const Point2fT* NewPt, Quat4fT* NewRot);

    //更新鼠标状态
    void    upstate();
    //void    mousemove(WPARAM wParam,LPARAM lParam);

protected:
    Vector3fT   StVec;          //保存鼠标点击的坐标
    Vector3fT   EnVec;          //保存鼠标拖动的坐标
    GLfloat     AdjustWidth;    //宽度的调整因子
    GLfloat     AdjustHeight;   //长度的调整因子
public:
    Matrix4fT   Transform;      //计算变换
    Matrix3fT   LastRot;        //上一次的旋转
    Matrix3fT   ThisRot;        //这次的旋转
    float zoomRate;
    float lastZoomRate;

    bool        isDragging;     // 是否拖动
    bool        isRClicked;     // 是否右击鼠标
    bool        isClicked;      // 是否点击鼠标
    bool        isZooming;    //是否正在缩放
    Point2fT    LastPt;
    Point2fT    MousePt;        // 当前的鼠标位置

} ArcBallT;
