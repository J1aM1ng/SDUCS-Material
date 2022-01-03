//
// Created by LEI XU on 4/27/19.
//

#ifndef RASTERIZER_TEXTURE_H
#define RASTERIZER_TEXTURE_H
#include "global.hpp"
#include <eigen3/Eigen/Eigen>
#include <opencv2/opencv.hpp>
class Texture{
private:
    cv::Mat image_data;

public:
    Texture(const std::string& name)
    {
        image_data = cv::imread(name);
        cv::cvtColor(image_data, image_data, cv::COLOR_RGB2BGR);
        width = image_data.cols;
        height = image_data.rows;
    }

    int width, height;

  // 坐标限定
Eigen::Vector3f getColor(float u, float v)
    {
    	// 坐标限定
		if (u < 0) u = 0;
		if (u > 1) u = 1;
		if (v < 0) v = 0;
		if (v > 1) v = 1;
        auto u_img = u * width;
        auto v_img = (1 - v) * height;
        auto color = image_data.at<cv::Vec3b>(v_img, u_img);
        return Eigen::Vector3f(color[0], color[1], color[2]);
    }
Eigen::Vector3f getColorBilinear(float u, float v)
	{
		if (u < 0) u = 0;
		if (u > 1) u = 1;
		if (v < 0) v = 0;
		if (v > 1) v = 1;
		auto u_img = u * width;
		auto v_img = (1 - v) * height;

		float u_min = std::floor(u_img);
		float u_max = std::min((float)width, std::ceil(u_img));
		float v_min = std::floor(v_img);
		float v_max = std::min((float)height, std::ceil(v_img));
		
		auto Q11 = image_data.at<cv::Vec3b>(v_max, u_min);
		auto Q12 = image_data.at<cv::Vec3b>(v_max, u_max);

		auto Q21 = image_data.at<cv::Vec3b>(v_min, u_min);
		auto Q22 = image_data.at<cv::Vec3b>(v_min, u_max);

		float rs = (u_img - u_min) / (u_max - u_min);
		float rt = (v_img - v_max) / (v_min - v_max);
		auto cBot = (1 - rs) * Q11 + rs * Q12;
		auto cTop = (1 - rs) * Q21 + rs * Q22;
		auto P = (1 - rt) * cBot + rt * cTop;

		return Eigen::Vector3f(P[0], P[1], P[2]);
	}


};
#endif //RASTERIZER_TEXTURE_H
