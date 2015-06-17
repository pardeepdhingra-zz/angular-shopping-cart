var app = angular.module('shoppingCart', []);
app.controller('ProductsController', function($scope, $http) {
    $scope.currentPage = 1,
	$scope.totalPages = 2,
	$scope.perPage = 10,
	$scope.records = [10, 25, 50, 100];

    $scope.makeProducts = function() {
    	$http.get("http://localhost:3000/products.json?page=" + $scope.currentPage + "&per_page="+ $scope.perPage)
    	.success(function(response) {$scope.products = response.products; $scope.totalPages = response.meta.total_pages; });
	};
	$scope.makeProducts(); 

	$scope.nextPage = function() {
		if ($scope.currentPage < $scope.totalPages) {
            $scope.currentPage++;
            $scope.makeProducts();
        }
    };
    
    $scope.previousPage = function() {
        if ($scope.currentPage > 1) {
            $scope.currentPage--;
            $scope.makeProducts();
        }
    };

	$scope.thisPage = function(page) {
		console.log(page);
        if (page <= $scope.totalPages && page >= 1 ) {
            $scope.currentPage = page;
            $scope.makeProducts();
        }
    };

 	$scope.range = function(n) {
        return new Array(n);
    };
});