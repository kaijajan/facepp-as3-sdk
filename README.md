# [Face++ SDK For ActionScript3](https://github.com/minoscc/facepp-as3-sdk)

Others SDK [Face++](https://github.com/FacePlusPlus)

Usage
=====

```
var facepp:FacePP = new FacePP(apikey, apiSecret, {} );
facepp.request( APIMethod.DETECTION_DETECT, { url : "" }, onRequestCallback );
function onRequestCallback( err:Object, res:Object ):void
{
	if(err)
	{
		return;
	}
	trace(res);
}
```
