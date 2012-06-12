/*
 Hello world!
*/

#include "eth_util.angelscript"

void main()
{
	LoadScene("empty", "preLoop", "loop");
}

void preLoop()
{
	AddEntity("line.ent", vector3(GetScreenSize() * 0.5f, 0.0f), 0.0f);
}

void loop()
{
	const vector3 accel(GetInputHandle().GetAccelerometerData());
	const vector3 norm(normalize(accel));
	const string output = vector3ToString(accel) + "\n" + vector3ToString(norm);
	DrawText(vector2(0,0), output, "Verdana20_shadow.fnt", 0xFFFFFFFF);
}

void ETHCallback_line(ETHEntity@ thisEntity)
{
	const vector3 accel(GetInputHandle().GetAccelerometerData());
	//const vector3 accel(0,-1,0);
	const float angle =-radianToDegree(getAngle(vector2(accel.x,-accel.y) * -1.0f));
	thisEntity.SetAngle(angle);
}