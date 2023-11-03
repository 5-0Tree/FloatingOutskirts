/// @description Remove Unwanted Objects

//Make sure that there is only one control object
var _obj = instance_number(objControl);

if (_obj > 1) {
	instance_destroy(instance_find(objControl, _obj - 1), false);
}
