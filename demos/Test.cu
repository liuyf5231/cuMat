#include <iostream>
#include <cuMat/Core>

using namespace cuMat;
using namespace std;

int main()
{
    double data[2][2][2] {
        {
            {1, 2},
            {3, 4}
        },
        {
            {5, 6},
            {7, 8}
        }
    };
    BMatrixXdR mat = BMatrixXdR::fromArray(data);
    cout << "Input matrix: " << mat << endl;
    cout << "Full reduction: " << mat.sum<ReductionAxis::Row | ReductionAxis::Column | ReductionAxis::Batch>().eval() << endl;
    cout << " dynamic version: " << mat.sum(ReductionAxis::Row | ReductionAxis::Column | ReductionAxis::Batch).eval() << endl;
    cout << "Along rows: " << mat.sum<ReductionAxis::Row>().eval() << endl;
    cout << "Along columns: " << mat.sum<ReductionAxis::Column>().eval() << endl;
    cout << "Along batches: " << mat.sum<ReductionAxis::Batch>().eval() << endl;
    cout << "Along rows and columns: " << mat.sum<ReductionAxis::Row | ReductionAxis::Column>().eval() << endl;

    /*
    //create a 2x4 matrix
    int data1[1][2][4] {
        {
            {1, 2, 6, 9},
            {3, 1, 7, 2}
        }
    };
    MatrixXiR m = MatrixXiR::fromArray(data1);

    //create a 2-dim column vector
    int data2[1][2][1] {
        {
            {0},
            {1}
        }
    };
    VectorXiR v = VectorXiR::fromArray(data2);

    MatrixXiR result = m + v;
    std::cout << "Broadcasting result:" << std::endl;
    std::cout << result << std::endl;
    */
}
