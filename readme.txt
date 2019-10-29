Image Processing- Term Project

1. The file for Global histogram Equalization is he.m

	The code needs the user input for  bins, min_img, max_img, alpha present on line 6-9 of he.m

	We use the value of alpha=1 for Global Histogram Equalization.

	In order to see the results for Global Histogram Equalization with Blending we can choose value of alpha between 0-1

2. The file for Local Histogram Equalization is ahe.m
	The code needs user input for bins, ws present on line 6 and 7 of ahe.m

3. The file to generate histogram of each region in local method is histogram_Ruchika.m

4. The folder Results contains all the results that we obtained by using he.m and ahe.m on the given image

5. We have also included the test images in case you want to run and verify the results.

6. The results can be distinguished as:

	Example: For Global Histogram Equalization

		Folder: he_result-test-img-1 (contains he results for test-img-1)

		Files within Folder:

			he_result-test-img-1-input.jpg(input image)
			he_result-test-img-1-input-hist.jpg (histogram for input image)
			he_result-test-img-1-output.jpg (output image)
			he_result-test-img-1-output-hist.jpg (histogram for output image)

	Example: For Global Histogram Equalization with blending
		
		Folder: he_result-blending-test-img-11 (contains results for he with blending)

		Files within folder:
			
			he_result_blend-test-img-11-input.jpg(input image)
			he_result_blend-test-img-11-output-0.5.jpg (output with alpha=0.5)
			he_result_blend-test-img-11-output-1.jpg (output with alpha=1)



	Example: For Local Histogram Equalization

		Folder: ahe_result-test-img-1 (contains ahe results for test-img-1)
	
		Files within folder: 

			ahe_result-test-img-1-input.jpg(input image)
			ahe_result-test-img-1-output-20.jpg(output with window size 20 20)
			ahe_result-test-img-1-output-50.jpg(output with window size 50 50)
			ahe_result-test-img-1-output-100.jpg(output with window size 100 100)

	


