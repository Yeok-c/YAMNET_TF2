??.
??
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( ?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

?
DepthwiseConv2dNative

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

?
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%??8"&
exponential_avg_factorfloat%  ??";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
?
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ??
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68??(
?
layer1/conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_namelayer1/conv/kernel
?
&layer1/conv/kernel/Read/ReadVariableOpReadVariableOplayer1/conv/kernel*&
_output_shapes
: *
dtype0
~
layer1/conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *$
shared_namelayer1/conv/bn/beta
w
'layer1/conv/bn/beta/Read/ReadVariableOpReadVariableOplayer1/conv/bn/beta*
_output_shapes
: *
dtype0
?
layer1/conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_namelayer1/conv/bn/moving_mean
?
.layer1/conv/bn/moving_mean/Read/ReadVariableOpReadVariableOplayer1/conv/bn/moving_mean*
_output_shapes
: *
dtype0
?
layer1/conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape: */
shared_name layer1/conv/bn/moving_variance
?
2layer1/conv/bn/moving_variance/Read/ReadVariableOpReadVariableOplayer1/conv/bn/moving_variance*
_output_shapes
: *
dtype0
?
&layer2/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *7
shared_name(&layer2/depthwise_conv/depthwise_kernel
?
:layer2/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer2/depthwise_conv/depthwise_kernel*&
_output_shapes
: *
dtype0
?
layer2/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *.
shared_namelayer2/depthwise_conv/bn/beta
?
1layer2/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer2/depthwise_conv/bn/beta*
_output_shapes
: *
dtype0
?
$layer2/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$layer2/depthwise_conv/bn/moving_mean
?
8layer2/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer2/depthwise_conv/bn/moving_mean*
_output_shapes
: *
dtype0
?
(layer2/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape: *9
shared_name*(layer2/depthwise_conv/bn/moving_variance
?
<layer2/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer2/depthwise_conv/bn/moving_variance*
_output_shapes
: *
dtype0
?
layer2/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*-
shared_namelayer2/pointwise_conv/kernel
?
0layer2/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer2/pointwise_conv/kernel*&
_output_shapes
: @*
dtype0
?
layer2/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*.
shared_namelayer2/pointwise_conv/bn/beta
?
1layer2/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer2/pointwise_conv/bn/beta*
_output_shapes
:@*
dtype0
?
$layer2/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$layer2/pointwise_conv/bn/moving_mean
?
8layer2/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer2/pointwise_conv/bn/moving_mean*
_output_shapes
:@*
dtype0
?
(layer2/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*9
shared_name*(layer2/pointwise_conv/bn/moving_variance
?
<layer2/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer2/pointwise_conv/bn/moving_variance*
_output_shapes
:@*
dtype0
?
&layer3/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*7
shared_name(&layer3/depthwise_conv/depthwise_kernel
?
:layer3/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer3/depthwise_conv/depthwise_kernel*&
_output_shapes
:@*
dtype0
?
layer3/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*.
shared_namelayer3/depthwise_conv/bn/beta
?
1layer3/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer3/depthwise_conv/bn/beta*
_output_shapes
:@*
dtype0
?
$layer3/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$layer3/depthwise_conv/bn/moving_mean
?
8layer3/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer3/depthwise_conv/bn/moving_mean*
_output_shapes
:@*
dtype0
?
(layer3/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*9
shared_name*(layer3/depthwise_conv/bn/moving_variance
?
<layer3/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer3/depthwise_conv/bn/moving_variance*
_output_shapes
:@*
dtype0
?
layer3/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@?*-
shared_namelayer3/pointwise_conv/kernel
?
0layer3/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer3/pointwise_conv/kernel*'
_output_shapes
:@?*
dtype0
?
layer3/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer3/pointwise_conv/bn/beta
?
1layer3/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer3/pointwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer3/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer3/pointwise_conv/bn/moving_mean
?
8layer3/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer3/pointwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer3/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer3/pointwise_conv/bn/moving_variance
?
<layer3/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer3/pointwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
&layer4/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*7
shared_name(&layer4/depthwise_conv/depthwise_kernel
?
:layer4/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer4/depthwise_conv/depthwise_kernel*'
_output_shapes
:?*
dtype0
?
layer4/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer4/depthwise_conv/bn/beta
?
1layer4/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer4/depthwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer4/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer4/depthwise_conv/bn/moving_mean
?
8layer4/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer4/depthwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer4/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer4/depthwise_conv/bn/moving_variance
?
<layer4/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer4/depthwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
layer4/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*-
shared_namelayer4/pointwise_conv/kernel
?
0layer4/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer4/pointwise_conv/kernel*(
_output_shapes
:??*
dtype0
?
layer4/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer4/pointwise_conv/bn/beta
?
1layer4/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer4/pointwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer4/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer4/pointwise_conv/bn/moving_mean
?
8layer4/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer4/pointwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer4/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer4/pointwise_conv/bn/moving_variance
?
<layer4/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer4/pointwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
&layer5/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*7
shared_name(&layer5/depthwise_conv/depthwise_kernel
?
:layer5/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer5/depthwise_conv/depthwise_kernel*'
_output_shapes
:?*
dtype0
?
layer5/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer5/depthwise_conv/bn/beta
?
1layer5/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer5/depthwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer5/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer5/depthwise_conv/bn/moving_mean
?
8layer5/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer5/depthwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer5/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer5/depthwise_conv/bn/moving_variance
?
<layer5/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer5/depthwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
layer5/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*-
shared_namelayer5/pointwise_conv/kernel
?
0layer5/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer5/pointwise_conv/kernel*(
_output_shapes
:??*
dtype0
?
layer5/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer5/pointwise_conv/bn/beta
?
1layer5/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer5/pointwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer5/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer5/pointwise_conv/bn/moving_mean
?
8layer5/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer5/pointwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer5/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer5/pointwise_conv/bn/moving_variance
?
<layer5/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer5/pointwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
&layer6/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*7
shared_name(&layer6/depthwise_conv/depthwise_kernel
?
:layer6/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer6/depthwise_conv/depthwise_kernel*'
_output_shapes
:?*
dtype0
?
layer6/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer6/depthwise_conv/bn/beta
?
1layer6/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer6/depthwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer6/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer6/depthwise_conv/bn/moving_mean
?
8layer6/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer6/depthwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer6/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer6/depthwise_conv/bn/moving_variance
?
<layer6/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer6/depthwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
layer6/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*-
shared_namelayer6/pointwise_conv/kernel
?
0layer6/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer6/pointwise_conv/kernel*(
_output_shapes
:??*
dtype0
?
layer6/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer6/pointwise_conv/bn/beta
?
1layer6/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer6/pointwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer6/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer6/pointwise_conv/bn/moving_mean
?
8layer6/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer6/pointwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer6/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer6/pointwise_conv/bn/moving_variance
?
<layer6/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer6/pointwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
&layer7/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*7
shared_name(&layer7/depthwise_conv/depthwise_kernel
?
:layer7/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer7/depthwise_conv/depthwise_kernel*'
_output_shapes
:?*
dtype0
?
layer7/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer7/depthwise_conv/bn/beta
?
1layer7/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer7/depthwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer7/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer7/depthwise_conv/bn/moving_mean
?
8layer7/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer7/depthwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer7/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer7/depthwise_conv/bn/moving_variance
?
<layer7/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer7/depthwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
?
layer7/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*-
shared_namelayer7/pointwise_conv/kernel
?
0layer7/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer7/pointwise_conv/kernel*(
_output_shapes
:??*
dtype0
?
layer7/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_namelayer7/pointwise_conv/bn/beta
?
1layer7/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer7/pointwise_conv/bn/beta*
_output_shapes	
:?*
dtype0
?
$layer7/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$layer7/pointwise_conv/bn/moving_mean
?
8layer7/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer7/pointwise_conv/bn/moving_mean*
_output_shapes	
:?*
dtype0
?
(layer7/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*9
shared_name*(layer7/pointwise_conv/bn/moving_variance
?
<layer7/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer7/pointwise_conv/bn/moving_variance*
_output_shapes	
:?*
dtype0
u
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?
*
shared_namedense/kernel
n
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	?
*
dtype0
l

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_name
dense/bias
e
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes
:
*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
?
Adam/layer1/conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_nameAdam/layer1/conv/kernel/m
?
-Adam/layer1/conv/kernel/m/Read/ReadVariableOpReadVariableOpAdam/layer1/conv/kernel/m*&
_output_shapes
: *
dtype0
?
Adam/layer1/conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_nameAdam/layer1/conv/bn/beta/m
?
.Adam/layer1/conv/bn/beta/m/Read/ReadVariableOpReadVariableOpAdam/layer1/conv/bn/beta/m*
_output_shapes
: *
dtype0
?
-Adam/layer2/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *>
shared_name/-Adam/layer2/depthwise_conv/depthwise_kernel/m
?
AAdam/layer2/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer2/depthwise_conv/depthwise_kernel/m*&
_output_shapes
: *
dtype0
?
$Adam/layer2/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$Adam/layer2/depthwise_conv/bn/beta/m
?
8Adam/layer2/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer2/depthwise_conv/bn/beta/m*
_output_shapes
: *
dtype0
?
#Adam/layer2/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*4
shared_name%#Adam/layer2/pointwise_conv/kernel/m
?
7Adam/layer2/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer2/pointwise_conv/kernel/m*&
_output_shapes
: @*
dtype0
?
$Adam/layer2/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer2/pointwise_conv/bn/beta/m
?
8Adam/layer2/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer2/pointwise_conv/bn/beta/m*
_output_shapes
:@*
dtype0
?
-Adam/layer3/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*>
shared_name/-Adam/layer3/depthwise_conv/depthwise_kernel/m
?
AAdam/layer3/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer3/depthwise_conv/depthwise_kernel/m*&
_output_shapes
:@*
dtype0
?
$Adam/layer3/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer3/depthwise_conv/bn/beta/m
?
8Adam/layer3/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer3/depthwise_conv/bn/beta/m*
_output_shapes
:@*
dtype0
?
#Adam/layer3/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@?*4
shared_name%#Adam/layer3/pointwise_conv/kernel/m
?
7Adam/layer3/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer3/pointwise_conv/kernel/m*'
_output_shapes
:@?*
dtype0
?
$Adam/layer3/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer3/pointwise_conv/bn/beta/m
?
8Adam/layer3/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer3/pointwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
-Adam/layer4/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer4/depthwise_conv/depthwise_kernel/m
?
AAdam/layer4/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer4/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:?*
dtype0
?
$Adam/layer4/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer4/depthwise_conv/bn/beta/m
?
8Adam/layer4/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer4/depthwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
#Adam/layer4/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer4/pointwise_conv/kernel/m
?
7Adam/layer4/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer4/pointwise_conv/kernel/m*(
_output_shapes
:??*
dtype0
?
$Adam/layer4/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer4/pointwise_conv/bn/beta/m
?
8Adam/layer4/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer4/pointwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
-Adam/layer5/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer5/depthwise_conv/depthwise_kernel/m
?
AAdam/layer5/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer5/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:?*
dtype0
?
$Adam/layer5/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer5/depthwise_conv/bn/beta/m
?
8Adam/layer5/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer5/depthwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
#Adam/layer5/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer5/pointwise_conv/kernel/m
?
7Adam/layer5/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer5/pointwise_conv/kernel/m*(
_output_shapes
:??*
dtype0
?
$Adam/layer5/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer5/pointwise_conv/bn/beta/m
?
8Adam/layer5/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer5/pointwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
-Adam/layer6/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer6/depthwise_conv/depthwise_kernel/m
?
AAdam/layer6/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer6/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:?*
dtype0
?
$Adam/layer6/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer6/depthwise_conv/bn/beta/m
?
8Adam/layer6/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer6/depthwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
#Adam/layer6/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer6/pointwise_conv/kernel/m
?
7Adam/layer6/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer6/pointwise_conv/kernel/m*(
_output_shapes
:??*
dtype0
?
$Adam/layer6/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer6/pointwise_conv/bn/beta/m
?
8Adam/layer6/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer6/pointwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
-Adam/layer7/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer7/depthwise_conv/depthwise_kernel/m
?
AAdam/layer7/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer7/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:?*
dtype0
?
$Adam/layer7/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer7/depthwise_conv/bn/beta/m
?
8Adam/layer7/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer7/depthwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
#Adam/layer7/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer7/pointwise_conv/kernel/m
?
7Adam/layer7/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer7/pointwise_conv/kernel/m*(
_output_shapes
:??*
dtype0
?
$Adam/layer7/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer7/pointwise_conv/bn/beta/m
?
8Adam/layer7/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer7/pointwise_conv/bn/beta/m*
_output_shapes	
:?*
dtype0
?
Adam/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?
*$
shared_nameAdam/dense/kernel/m
|
'Adam/dense/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense/kernel/m*
_output_shapes
:	?
*
dtype0
z
Adam/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*"
shared_nameAdam/dense/bias/m
s
%Adam/dense/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense/bias/m*
_output_shapes
:
*
dtype0
?
Adam/layer1/conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_nameAdam/layer1/conv/kernel/v
?
-Adam/layer1/conv/kernel/v/Read/ReadVariableOpReadVariableOpAdam/layer1/conv/kernel/v*&
_output_shapes
: *
dtype0
?
Adam/layer1/conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_nameAdam/layer1/conv/bn/beta/v
?
.Adam/layer1/conv/bn/beta/v/Read/ReadVariableOpReadVariableOpAdam/layer1/conv/bn/beta/v*
_output_shapes
: *
dtype0
?
-Adam/layer2/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *>
shared_name/-Adam/layer2/depthwise_conv/depthwise_kernel/v
?
AAdam/layer2/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer2/depthwise_conv/depthwise_kernel/v*&
_output_shapes
: *
dtype0
?
$Adam/layer2/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$Adam/layer2/depthwise_conv/bn/beta/v
?
8Adam/layer2/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer2/depthwise_conv/bn/beta/v*
_output_shapes
: *
dtype0
?
#Adam/layer2/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*4
shared_name%#Adam/layer2/pointwise_conv/kernel/v
?
7Adam/layer2/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer2/pointwise_conv/kernel/v*&
_output_shapes
: @*
dtype0
?
$Adam/layer2/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer2/pointwise_conv/bn/beta/v
?
8Adam/layer2/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer2/pointwise_conv/bn/beta/v*
_output_shapes
:@*
dtype0
?
-Adam/layer3/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*>
shared_name/-Adam/layer3/depthwise_conv/depthwise_kernel/v
?
AAdam/layer3/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer3/depthwise_conv/depthwise_kernel/v*&
_output_shapes
:@*
dtype0
?
$Adam/layer3/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer3/depthwise_conv/bn/beta/v
?
8Adam/layer3/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer3/depthwise_conv/bn/beta/v*
_output_shapes
:@*
dtype0
?
#Adam/layer3/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@?*4
shared_name%#Adam/layer3/pointwise_conv/kernel/v
?
7Adam/layer3/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer3/pointwise_conv/kernel/v*'
_output_shapes
:@?*
dtype0
?
$Adam/layer3/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer3/pointwise_conv/bn/beta/v
?
8Adam/layer3/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer3/pointwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
-Adam/layer4/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer4/depthwise_conv/depthwise_kernel/v
?
AAdam/layer4/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer4/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:?*
dtype0
?
$Adam/layer4/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer4/depthwise_conv/bn/beta/v
?
8Adam/layer4/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer4/depthwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
#Adam/layer4/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer4/pointwise_conv/kernel/v
?
7Adam/layer4/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer4/pointwise_conv/kernel/v*(
_output_shapes
:??*
dtype0
?
$Adam/layer4/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer4/pointwise_conv/bn/beta/v
?
8Adam/layer4/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer4/pointwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
-Adam/layer5/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer5/depthwise_conv/depthwise_kernel/v
?
AAdam/layer5/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer5/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:?*
dtype0
?
$Adam/layer5/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer5/depthwise_conv/bn/beta/v
?
8Adam/layer5/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer5/depthwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
#Adam/layer5/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer5/pointwise_conv/kernel/v
?
7Adam/layer5/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer5/pointwise_conv/kernel/v*(
_output_shapes
:??*
dtype0
?
$Adam/layer5/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer5/pointwise_conv/bn/beta/v
?
8Adam/layer5/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer5/pointwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
-Adam/layer6/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer6/depthwise_conv/depthwise_kernel/v
?
AAdam/layer6/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer6/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:?*
dtype0
?
$Adam/layer6/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer6/depthwise_conv/bn/beta/v
?
8Adam/layer6/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer6/depthwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
#Adam/layer6/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer6/pointwise_conv/kernel/v
?
7Adam/layer6/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer6/pointwise_conv/kernel/v*(
_output_shapes
:??*
dtype0
?
$Adam/layer6/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer6/pointwise_conv/bn/beta/v
?
8Adam/layer6/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer6/pointwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
-Adam/layer7/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*>
shared_name/-Adam/layer7/depthwise_conv/depthwise_kernel/v
?
AAdam/layer7/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer7/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:?*
dtype0
?
$Adam/layer7/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer7/depthwise_conv/bn/beta/v
?
8Adam/layer7/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer7/depthwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
#Adam/layer7/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*4
shared_name%#Adam/layer7/pointwise_conv/kernel/v
?
7Adam/layer7/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer7/pointwise_conv/kernel/v*(
_output_shapes
:??*
dtype0
?
$Adam/layer7/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*5
shared_name&$Adam/layer7/pointwise_conv/bn/beta/v
?
8Adam/layer7/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer7/pointwise_conv/bn/beta/v*
_output_shapes	
:?*
dtype0
?
Adam/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?
*$
shared_nameAdam/dense/kernel/v
|
'Adam/dense/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense/kernel/v*
_output_shapes
:	?
*
dtype0
z
Adam/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*"
shared_nameAdam/dense/bias/v
s
%Adam/dense/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense/bias/v*
_output_shapes
:
*
dtype0
R
ConstConst*
_output_shapes
: *
dtype0*
valueB *  ??
T
Const_1Const*
_output_shapes
: *
dtype0*
valueB *  ??
T
Const_2Const*
_output_shapes
:@*
dtype0*
valueB@*  ??
T
Const_3Const*
_output_shapes
:@*
dtype0*
valueB@*  ??
V
Const_4Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
V
Const_5Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
V
Const_6Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
V
Const_7Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
V
Const_8Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
V
Const_9Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
W
Const_10Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
W
Const_11Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??
W
Const_12Const*
_output_shapes	
:?*
dtype0*
valueB?*  ??

NoOpNoOp
??
Const_13Const"/device:CPU:0*
_output_shapes
: *
dtype0*??
value??B?? B??
?
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
layer_with_weights-4
layer-7
	layer_with_weights-5
	layer-8

layer-9
layer_with_weights-6
layer-10
layer_with_weights-7
layer-11
layer-12
layer_with_weights-8
layer-13
layer_with_weights-9
layer-14
layer-15
layer_with_weights-10
layer-16
layer_with_weights-11
layer-17
layer-18
layer_with_weights-12
layer-19
layer_with_weights-13
layer-20
layer-21
layer_with_weights-14
layer-22
layer_with_weights-15
layer-23
layer-24
layer_with_weights-16
layer-25
layer_with_weights-17
layer-26
layer-27
layer_with_weights-18
layer-28
layer_with_weights-19
layer-29
layer-30
 layer_with_weights-20
 layer-31
!layer_with_weights-21
!layer-32
"layer-33
#layer_with_weights-22
#layer-34
$layer_with_weights-23
$layer-35
%layer-36
&layer_with_weights-24
&layer-37
'layer_with_weights-25
'layer-38
(layer-39
)layer-40
*layer_with_weights-26
*layer-41
+	optimizer
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses
2_default_save_signature
3
signatures*
* 
?

4kernel
5	variables
6trainable_variables
7regularization_losses
8	keras_api
9__call__
*:&call_and_return_all_conditional_losses*
?
;axis
<beta
=moving_mean
>moving_variance
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses*
?
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses* 
?
Kdepthwise_kernel
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses*
?
Raxis
Sbeta
Tmoving_mean
Umoving_variance
V	variables
Wtrainable_variables
Xregularization_losses
Y	keras_api
Z__call__
*[&call_and_return_all_conditional_losses*
?
\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses* 
?

bkernel
c	variables
dtrainable_variables
eregularization_losses
f	keras_api
g__call__
*h&call_and_return_all_conditional_losses*
?
iaxis
jbeta
kmoving_mean
lmoving_variance
m	variables
ntrainable_variables
oregularization_losses
p	keras_api
q__call__
*r&call_and_return_all_conditional_losses*
?
s	variables
ttrainable_variables
uregularization_losses
v	keras_api
w__call__
*x&call_and_return_all_conditional_losses* 
?
ydepthwise_kernel
z	variables
{trainable_variables
|regularization_losses
}	keras_api
~__call__
*&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses* 
?
?kernel
	?bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses*
?
	?iter
?beta_1
?beta_2

?decay
?learning_rate4m?<m?Km?Sm?bm?jm?ym?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?4v?<v?Kv?Sv?bv?jv?yv?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?*
?
40
<1
=2
>3
K4
S5
T6
U7
b8
j9
k10
l11
y12
?13
?14
?15
?16
?17
?18
?19
?20
?21
?22
?23
?24
?25
?26
?27
?28
?29
?30
?31
?32
?33
?34
?35
?36
?37
?38
?39
?40
?41
?42
?43
?44
?45
?46
?47
?48
?49
?50
?51
?52
?53*
?
40
<1
K2
S3
b4
j5
y6
?7
?8
?9
?10
?11
?12
?13
?14
?15
?16
?17
?18
?19
?20
?21
?22
?23
?24
?25
?26
?27*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
2_default_save_signature
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses*
* 
* 
* 

?serving_default* 
b\
VARIABLE_VALUElayer1/conv/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*

40*

40*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
5	variables
6trainable_variables
7regularization_losses
9__call__
*:&call_and_return_all_conditional_losses
&:"call_and_return_conditional_losses*
* 
* 
* 
a[
VARIABLE_VALUElayer1/conv/bn/beta4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUElayer1/conv/bn/moving_mean;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUElayer1/conv/bn/moving_variance?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

<0
=1
>2*

<0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses* 
* 
* 
?z
VARIABLE_VALUE&layer2/depthwise_conv/depthwise_kernel@layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

K0*

K0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses*
* 
* 
* 
ke
VARIABLE_VALUElayer2/depthwise_conv/bn/beta4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE$layer2/depthwise_conv/bn/moving_mean;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?{
VARIABLE_VALUE(layer2/depthwise_conv/bn/moving_variance?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

S0
T1
U2*

S0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
V	variables
Wtrainable_variables
Xregularization_losses
Z__call__
*[&call_and_return_all_conditional_losses
&["call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses* 
* 
* 
lf
VARIABLE_VALUElayer2/pointwise_conv/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*

b0*

b0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
c	variables
dtrainable_variables
eregularization_losses
g__call__
*h&call_and_return_all_conditional_losses
&h"call_and_return_conditional_losses*
* 
* 
* 
ke
VARIABLE_VALUElayer2/pointwise_conv/bn/beta4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE$layer2/pointwise_conv/bn/moving_mean;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?{
VARIABLE_VALUE(layer2/pointwise_conv/bn/moving_variance?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

j0
k1
l2*

j0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
m	variables
ntrainable_variables
oregularization_losses
q__call__
*r&call_and_return_all_conditional_losses
&r"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
s	variables
ttrainable_variables
uregularization_losses
w__call__
*x&call_and_return_all_conditional_losses
&x"call_and_return_conditional_losses* 
* 
* 
?z
VARIABLE_VALUE&layer3/depthwise_conv/depthwise_kernel@layer_with_weights-6/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

y0*

y0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
z	variables
{trainable_variables
|regularization_losses
~__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
* 
* 
* 
ke
VARIABLE_VALUElayer3/depthwise_conv/bn/beta4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE$layer3/depthwise_conv/bn/moving_mean;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?{
VARIABLE_VALUE(layer3/depthwise_conv/bn/moving_variance?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
lf
VARIABLE_VALUElayer3/pointwise_conv/kernel6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
ke
VARIABLE_VALUElayer3/pointwise_conv/bn/beta4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE$layer3/pointwise_conv/bn/moving_mean;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?{
VARIABLE_VALUE(layer3/pointwise_conv/bn/moving_variance?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
?{
VARIABLE_VALUE&layer4/depthwise_conv/depthwise_kernelAlayer_with_weights-10/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer4/depthwise_conv/bn/beta5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer4/depthwise_conv/bn/moving_mean<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer4/depthwise_conv/bn/moving_variance@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer4/pointwise_conv/kernel7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer4/pointwise_conv/bn/beta5layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer4/pointwise_conv/bn/moving_mean<layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer4/pointwise_conv/bn/moving_variance@layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
?{
VARIABLE_VALUE&layer5/depthwise_conv/depthwise_kernelAlayer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer5/depthwise_conv/bn/beta5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer5/depthwise_conv/bn/moving_mean<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer5/depthwise_conv/bn/moving_variance@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer5/pointwise_conv/kernel7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer5/pointwise_conv/bn/beta5layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer5/pointwise_conv/bn/moving_mean<layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer5/pointwise_conv/bn/moving_variance@layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
?{
VARIABLE_VALUE&layer6/depthwise_conv/depthwise_kernelAlayer_with_weights-18/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer6/depthwise_conv/bn/beta5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer6/depthwise_conv/bn/moving_mean<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer6/depthwise_conv/bn/moving_variance@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer6/pointwise_conv/kernel7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer6/pointwise_conv/bn/beta5layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer6/pointwise_conv/bn/moving_mean<layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer6/pointwise_conv/bn/moving_variance@layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
?{
VARIABLE_VALUE&layer7/depthwise_conv/depthwise_kernelAlayer_with_weights-22/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer7/depthwise_conv/bn/beta5layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer7/depthwise_conv/bn/moving_mean<layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer7/depthwise_conv/bn/moving_variance@layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer7/pointwise_conv/kernel7layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer7/pointwise_conv/bn/beta5layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer7/pointwise_conv/bn/moving_mean<layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
?|
VARIABLE_VALUE(layer7/pointwise_conv/bn/moving_variance@layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1
?2*

?0*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses* 
* 
* 
]W
VARIABLE_VALUEdense/kernel7layer_with_weights-26/kernel/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUE
dense/bias5layer_with_weights-26/bias/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1*

?0
?1*
* 
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses*
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
?
=0
>1
T2
U3
k4
l5
?6
?7
?8
?9
?10
?11
?12
?13
?14
?15
?16
?17
?18
?19
?20
?21
?22
?23
?24
?25*
?
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
 31
!32
"33
#34
$35
%36
&37
'38
(39
)40
*41*

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 

=0
>1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

T0
U1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

k0
l1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

?0
?1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<

?total

?count
?	variables
?	keras_api*
M

?total

?count
?
_fn_kwargs
?	variables
?	keras_api*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

?0
?1*

?	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 

?0
?1*

?	variables*
?
VARIABLE_VALUEAdam/layer1/conv/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?~
VARIABLE_VALUEAdam/layer1/conv/bn/beta/mPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer2/depthwise_conv/depthwise_kernel/m\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer2/depthwise_conv/bn/beta/mPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer2/pointwise_conv/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer2/pointwise_conv/bn/beta/mPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer3/depthwise_conv/depthwise_kernel/m\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer3/depthwise_conv/bn/beta/mPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer3/pointwise_conv/kernel/mRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer3/pointwise_conv/bn/beta/mPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer4/depthwise_conv/depthwise_kernel/m]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer4/depthwise_conv/bn/beta/mQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer4/pointwise_conv/kernel/mSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer4/pointwise_conv/bn/beta/mQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer5/depthwise_conv/depthwise_kernel/m]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer5/depthwise_conv/bn/beta/mQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer5/pointwise_conv/kernel/mSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer5/pointwise_conv/bn/beta/mQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer6/depthwise_conv/depthwise_kernel/m]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer6/depthwise_conv/bn/beta/mQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer6/pointwise_conv/kernel/mSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer6/pointwise_conv/bn/beta/mQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer7/depthwise_conv/depthwise_kernel/m]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer7/depthwise_conv/bn/beta/mQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer7/pointwise_conv/kernel/mSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer7/pointwise_conv/bn/beta/mQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?z
VARIABLE_VALUEAdam/dense/kernel/mSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense/bias/mQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUEAdam/layer1/conv/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?~
VARIABLE_VALUEAdam/layer1/conv/bn/beta/vPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer2/depthwise_conv/depthwise_kernel/v\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer2/depthwise_conv/bn/beta/vPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer2/pointwise_conv/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer2/pointwise_conv/bn/beta/vPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer3/depthwise_conv/depthwise_kernel/v\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer3/depthwise_conv/bn/beta/vPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer3/pointwise_conv/kernel/vRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer3/pointwise_conv/bn/beta/vPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer4/depthwise_conv/depthwise_kernel/v]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer4/depthwise_conv/bn/beta/vQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer4/pointwise_conv/kernel/vSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer4/pointwise_conv/bn/beta/vQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer5/depthwise_conv/depthwise_kernel/v]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer5/depthwise_conv/bn/beta/vQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer5/pointwise_conv/kernel/vSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer5/pointwise_conv/bn/beta/vQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer6/depthwise_conv/depthwise_kernel/v]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer6/depthwise_conv/bn/beta/vQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer6/pointwise_conv/kernel/vSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer6/pointwise_conv/bn/beta/vQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE-Adam/layer7/depthwise_conv/depthwise_kernel/v]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer7/depthwise_conv/bn/beta/vQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE#Adam/layer7/pointwise_conv/kernel/vSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
??
VARIABLE_VALUE$Adam/layer7/pointwise_conv/bn/beta/vQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?z
VARIABLE_VALUEAdam/dense/kernel/vSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense/bias/vQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?
serving_default_input_1Placeholder*/
_output_shapes
:?????????`@*
dtype0*$
shape:?????????`@
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1layer1/conv/kernelConstlayer1/conv/bn/betalayer1/conv/bn/moving_meanlayer1/conv/bn/moving_variance&layer2/depthwise_conv/depthwise_kernelConst_1layer2/depthwise_conv/bn/beta$layer2/depthwise_conv/bn/moving_mean(layer2/depthwise_conv/bn/moving_variancelayer2/pointwise_conv/kernelConst_2layer2/pointwise_conv/bn/beta$layer2/pointwise_conv/bn/moving_mean(layer2/pointwise_conv/bn/moving_variance&layer3/depthwise_conv/depthwise_kernelConst_3layer3/depthwise_conv/bn/beta$layer3/depthwise_conv/bn/moving_mean(layer3/depthwise_conv/bn/moving_variancelayer3/pointwise_conv/kernelConst_4layer3/pointwise_conv/bn/beta$layer3/pointwise_conv/bn/moving_mean(layer3/pointwise_conv/bn/moving_variance&layer4/depthwise_conv/depthwise_kernelConst_5layer4/depthwise_conv/bn/beta$layer4/depthwise_conv/bn/moving_mean(layer4/depthwise_conv/bn/moving_variancelayer4/pointwise_conv/kernelConst_6layer4/pointwise_conv/bn/beta$layer4/pointwise_conv/bn/moving_mean(layer4/pointwise_conv/bn/moving_variance&layer5/depthwise_conv/depthwise_kernelConst_7layer5/depthwise_conv/bn/beta$layer5/depthwise_conv/bn/moving_mean(layer5/depthwise_conv/bn/moving_variancelayer5/pointwise_conv/kernelConst_8layer5/pointwise_conv/bn/beta$layer5/pointwise_conv/bn/moving_mean(layer5/pointwise_conv/bn/moving_variance&layer6/depthwise_conv/depthwise_kernelConst_9layer6/depthwise_conv/bn/beta$layer6/depthwise_conv/bn/moving_mean(layer6/depthwise_conv/bn/moving_variancelayer6/pointwise_conv/kernelConst_10layer6/pointwise_conv/bn/beta$layer6/pointwise_conv/bn/moving_mean(layer6/pointwise_conv/bn/moving_variance&layer7/depthwise_conv/depthwise_kernelConst_11layer7/depthwise_conv/bn/beta$layer7/depthwise_conv/bn/moving_mean(layer7/depthwise_conv/bn/moving_variancelayer7/pointwise_conv/kernelConst_12layer7/pointwise_conv/bn/beta$layer7/pointwise_conv/bn/moving_mean(layer7/pointwise_conv/bn/moving_variancedense/kernel
dense/bias*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8? *.
f)R'
%__inference_signature_wrapper_4850001
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?5
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename&layer1/conv/kernel/Read/ReadVariableOp'layer1/conv/bn/beta/Read/ReadVariableOp.layer1/conv/bn/moving_mean/Read/ReadVariableOp2layer1/conv/bn/moving_variance/Read/ReadVariableOp:layer2/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer2/depthwise_conv/bn/beta/Read/ReadVariableOp8layer2/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer2/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer2/pointwise_conv/kernel/Read/ReadVariableOp1layer2/pointwise_conv/bn/beta/Read/ReadVariableOp8layer2/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer2/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer3/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer3/depthwise_conv/bn/beta/Read/ReadVariableOp8layer3/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer3/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer3/pointwise_conv/kernel/Read/ReadVariableOp1layer3/pointwise_conv/bn/beta/Read/ReadVariableOp8layer3/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer3/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer4/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer4/depthwise_conv/bn/beta/Read/ReadVariableOp8layer4/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer4/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer4/pointwise_conv/kernel/Read/ReadVariableOp1layer4/pointwise_conv/bn/beta/Read/ReadVariableOp8layer4/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer4/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer5/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer5/depthwise_conv/bn/beta/Read/ReadVariableOp8layer5/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer5/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer5/pointwise_conv/kernel/Read/ReadVariableOp1layer5/pointwise_conv/bn/beta/Read/ReadVariableOp8layer5/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer5/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer6/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer6/depthwise_conv/bn/beta/Read/ReadVariableOp8layer6/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer6/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer6/pointwise_conv/kernel/Read/ReadVariableOp1layer6/pointwise_conv/bn/beta/Read/ReadVariableOp8layer6/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer6/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer7/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer7/depthwise_conv/bn/beta/Read/ReadVariableOp8layer7/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer7/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer7/pointwise_conv/kernel/Read/ReadVariableOp1layer7/pointwise_conv/bn/beta/Read/ReadVariableOp8layer7/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer7/pointwise_conv/bn/moving_variance/Read/ReadVariableOp dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp-Adam/layer1/conv/kernel/m/Read/ReadVariableOp.Adam/layer1/conv/bn/beta/m/Read/ReadVariableOpAAdam/layer2/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer2/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer2/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer2/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer3/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer3/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer3/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer3/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer4/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer4/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer4/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer4/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer5/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer5/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer5/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer5/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer6/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer6/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer6/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer6/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer7/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer7/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer7/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer7/pointwise_conv/bn/beta/m/Read/ReadVariableOp'Adam/dense/kernel/m/Read/ReadVariableOp%Adam/dense/bias/m/Read/ReadVariableOp-Adam/layer1/conv/kernel/v/Read/ReadVariableOp.Adam/layer1/conv/bn/beta/v/Read/ReadVariableOpAAdam/layer2/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer2/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer2/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer2/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer3/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer3/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer3/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer3/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer4/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer4/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer4/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer4/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer5/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer5/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer5/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer5/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer6/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer6/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer6/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer6/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer7/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer7/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer7/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer7/pointwise_conv/bn/beta/v/Read/ReadVariableOp'Adam/dense/kernel/v/Read/ReadVariableOp%Adam/dense/bias/v/Read/ReadVariableOpConst_13*?
Tin}
{2y	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *)
f$R"
 __inference__traced_save_4851528
?#
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamelayer1/conv/kernellayer1/conv/bn/betalayer1/conv/bn/moving_meanlayer1/conv/bn/moving_variance&layer2/depthwise_conv/depthwise_kernellayer2/depthwise_conv/bn/beta$layer2/depthwise_conv/bn/moving_mean(layer2/depthwise_conv/bn/moving_variancelayer2/pointwise_conv/kernellayer2/pointwise_conv/bn/beta$layer2/pointwise_conv/bn/moving_mean(layer2/pointwise_conv/bn/moving_variance&layer3/depthwise_conv/depthwise_kernellayer3/depthwise_conv/bn/beta$layer3/depthwise_conv/bn/moving_mean(layer3/depthwise_conv/bn/moving_variancelayer3/pointwise_conv/kernellayer3/pointwise_conv/bn/beta$layer3/pointwise_conv/bn/moving_mean(layer3/pointwise_conv/bn/moving_variance&layer4/depthwise_conv/depthwise_kernellayer4/depthwise_conv/bn/beta$layer4/depthwise_conv/bn/moving_mean(layer4/depthwise_conv/bn/moving_variancelayer4/pointwise_conv/kernellayer4/pointwise_conv/bn/beta$layer4/pointwise_conv/bn/moving_mean(layer4/pointwise_conv/bn/moving_variance&layer5/depthwise_conv/depthwise_kernellayer5/depthwise_conv/bn/beta$layer5/depthwise_conv/bn/moving_mean(layer5/depthwise_conv/bn/moving_variancelayer5/pointwise_conv/kernellayer5/pointwise_conv/bn/beta$layer5/pointwise_conv/bn/moving_mean(layer5/pointwise_conv/bn/moving_variance&layer6/depthwise_conv/depthwise_kernellayer6/depthwise_conv/bn/beta$layer6/depthwise_conv/bn/moving_mean(layer6/depthwise_conv/bn/moving_variancelayer6/pointwise_conv/kernellayer6/pointwise_conv/bn/beta$layer6/pointwise_conv/bn/moving_mean(layer6/pointwise_conv/bn/moving_variance&layer7/depthwise_conv/depthwise_kernellayer7/depthwise_conv/bn/beta$layer7/depthwise_conv/bn/moving_mean(layer7/depthwise_conv/bn/moving_variancelayer7/pointwise_conv/kernellayer7/pointwise_conv/bn/beta$layer7/pointwise_conv/bn/moving_mean(layer7/pointwise_conv/bn/moving_variancedense/kernel
dense/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/layer1/conv/kernel/mAdam/layer1/conv/bn/beta/m-Adam/layer2/depthwise_conv/depthwise_kernel/m$Adam/layer2/depthwise_conv/bn/beta/m#Adam/layer2/pointwise_conv/kernel/m$Adam/layer2/pointwise_conv/bn/beta/m-Adam/layer3/depthwise_conv/depthwise_kernel/m$Adam/layer3/depthwise_conv/bn/beta/m#Adam/layer3/pointwise_conv/kernel/m$Adam/layer3/pointwise_conv/bn/beta/m-Adam/layer4/depthwise_conv/depthwise_kernel/m$Adam/layer4/depthwise_conv/bn/beta/m#Adam/layer4/pointwise_conv/kernel/m$Adam/layer4/pointwise_conv/bn/beta/m-Adam/layer5/depthwise_conv/depthwise_kernel/m$Adam/layer5/depthwise_conv/bn/beta/m#Adam/layer5/pointwise_conv/kernel/m$Adam/layer5/pointwise_conv/bn/beta/m-Adam/layer6/depthwise_conv/depthwise_kernel/m$Adam/layer6/depthwise_conv/bn/beta/m#Adam/layer6/pointwise_conv/kernel/m$Adam/layer6/pointwise_conv/bn/beta/m-Adam/layer7/depthwise_conv/depthwise_kernel/m$Adam/layer7/depthwise_conv/bn/beta/m#Adam/layer7/pointwise_conv/kernel/m$Adam/layer7/pointwise_conv/bn/beta/mAdam/dense/kernel/mAdam/dense/bias/mAdam/layer1/conv/kernel/vAdam/layer1/conv/bn/beta/v-Adam/layer2/depthwise_conv/depthwise_kernel/v$Adam/layer2/depthwise_conv/bn/beta/v#Adam/layer2/pointwise_conv/kernel/v$Adam/layer2/pointwise_conv/bn/beta/v-Adam/layer3/depthwise_conv/depthwise_kernel/v$Adam/layer3/depthwise_conv/bn/beta/v#Adam/layer3/pointwise_conv/kernel/v$Adam/layer3/pointwise_conv/bn/beta/v-Adam/layer4/depthwise_conv/depthwise_kernel/v$Adam/layer4/depthwise_conv/bn/beta/v#Adam/layer4/pointwise_conv/kernel/v$Adam/layer4/pointwise_conv/bn/beta/v-Adam/layer5/depthwise_conv/depthwise_kernel/v$Adam/layer5/depthwise_conv/bn/beta/v#Adam/layer5/pointwise_conv/kernel/v$Adam/layer5/pointwise_conv/bn/beta/v-Adam/layer6/depthwise_conv/depthwise_kernel/v$Adam/layer6/depthwise_conv/bn/beta/v#Adam/layer6/pointwise_conv/kernel/v$Adam/layer6/pointwise_conv/bn/beta/v-Adam/layer7/depthwise_conv/depthwise_kernel/v$Adam/layer7/depthwise_conv/bn/beta/v#Adam/layer7/pointwise_conv/kernel/v$Adam/layer7/pointwise_conv/bn/beta/vAdam/dense/kernel/vAdam/dense/bias/v*?
Tin|
z2x*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *,
f'R%
#__inference__traced_restore_4851895??#
?	
?
:__inference_layer2/depthwise_conv/bn_layer_call_fn_4850127

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+??????????????????????????? *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846709?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
?
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850994

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847361

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850511

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
X
<__inference_layer7/depthwise_conv/relu_layer_call_fn_4851016

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847756i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4847597

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
7__inference_layer5/depthwise_conv_layer_call_fn_4850602

inputs"
unknown:?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4847626x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850161

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
s
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850765

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer2/depthwise_conv/bn_layer_call_fn_4850114

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+??????????????????????????? *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846679?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
??
?=
 __inference__traced_save_4851528
file_prefix1
-savev2_layer1_conv_kernel_read_readvariableop2
.savev2_layer1_conv_bn_beta_read_readvariableop9
5savev2_layer1_conv_bn_moving_mean_read_readvariableop=
9savev2_layer1_conv_bn_moving_variance_read_readvariableopE
Asavev2_layer2_depthwise_conv_depthwise_kernel_read_readvariableop<
8savev2_layer2_depthwise_conv_bn_beta_read_readvariableopC
?savev2_layer2_depthwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer2_depthwise_conv_bn_moving_variance_read_readvariableop;
7savev2_layer2_pointwise_conv_kernel_read_readvariableop<
8savev2_layer2_pointwise_conv_bn_beta_read_readvariableopC
?savev2_layer2_pointwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer2_pointwise_conv_bn_moving_variance_read_readvariableopE
Asavev2_layer3_depthwise_conv_depthwise_kernel_read_readvariableop<
8savev2_layer3_depthwise_conv_bn_beta_read_readvariableopC
?savev2_layer3_depthwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer3_depthwise_conv_bn_moving_variance_read_readvariableop;
7savev2_layer3_pointwise_conv_kernel_read_readvariableop<
8savev2_layer3_pointwise_conv_bn_beta_read_readvariableopC
?savev2_layer3_pointwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer3_pointwise_conv_bn_moving_variance_read_readvariableopE
Asavev2_layer4_depthwise_conv_depthwise_kernel_read_readvariableop<
8savev2_layer4_depthwise_conv_bn_beta_read_readvariableopC
?savev2_layer4_depthwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer4_depthwise_conv_bn_moving_variance_read_readvariableop;
7savev2_layer4_pointwise_conv_kernel_read_readvariableop<
8savev2_layer4_pointwise_conv_bn_beta_read_readvariableopC
?savev2_layer4_pointwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer4_pointwise_conv_bn_moving_variance_read_readvariableopE
Asavev2_layer5_depthwise_conv_depthwise_kernel_read_readvariableop<
8savev2_layer5_depthwise_conv_bn_beta_read_readvariableopC
?savev2_layer5_depthwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer5_depthwise_conv_bn_moving_variance_read_readvariableop;
7savev2_layer5_pointwise_conv_kernel_read_readvariableop<
8savev2_layer5_pointwise_conv_bn_beta_read_readvariableopC
?savev2_layer5_pointwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer5_pointwise_conv_bn_moving_variance_read_readvariableopE
Asavev2_layer6_depthwise_conv_depthwise_kernel_read_readvariableop<
8savev2_layer6_depthwise_conv_bn_beta_read_readvariableopC
?savev2_layer6_depthwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer6_depthwise_conv_bn_moving_variance_read_readvariableop;
7savev2_layer6_pointwise_conv_kernel_read_readvariableop<
8savev2_layer6_pointwise_conv_bn_beta_read_readvariableopC
?savev2_layer6_pointwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer6_pointwise_conv_bn_moving_variance_read_readvariableopE
Asavev2_layer7_depthwise_conv_depthwise_kernel_read_readvariableop<
8savev2_layer7_depthwise_conv_bn_beta_read_readvariableopC
?savev2_layer7_depthwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer7_depthwise_conv_bn_moving_variance_read_readvariableop;
7savev2_layer7_pointwise_conv_kernel_read_readvariableop<
8savev2_layer7_pointwise_conv_bn_beta_read_readvariableopC
?savev2_layer7_pointwise_conv_bn_moving_mean_read_readvariableopG
Csavev2_layer7_pointwise_conv_bn_moving_variance_read_readvariableop+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop8
4savev2_adam_layer1_conv_kernel_m_read_readvariableop9
5savev2_adam_layer1_conv_bn_beta_m_read_readvariableopL
Hsavev2_adam_layer2_depthwise_conv_depthwise_kernel_m_read_readvariableopC
?savev2_adam_layer2_depthwise_conv_bn_beta_m_read_readvariableopB
>savev2_adam_layer2_pointwise_conv_kernel_m_read_readvariableopC
?savev2_adam_layer2_pointwise_conv_bn_beta_m_read_readvariableopL
Hsavev2_adam_layer3_depthwise_conv_depthwise_kernel_m_read_readvariableopC
?savev2_adam_layer3_depthwise_conv_bn_beta_m_read_readvariableopB
>savev2_adam_layer3_pointwise_conv_kernel_m_read_readvariableopC
?savev2_adam_layer3_pointwise_conv_bn_beta_m_read_readvariableopL
Hsavev2_adam_layer4_depthwise_conv_depthwise_kernel_m_read_readvariableopC
?savev2_adam_layer4_depthwise_conv_bn_beta_m_read_readvariableopB
>savev2_adam_layer4_pointwise_conv_kernel_m_read_readvariableopC
?savev2_adam_layer4_pointwise_conv_bn_beta_m_read_readvariableopL
Hsavev2_adam_layer5_depthwise_conv_depthwise_kernel_m_read_readvariableopC
?savev2_adam_layer5_depthwise_conv_bn_beta_m_read_readvariableopB
>savev2_adam_layer5_pointwise_conv_kernel_m_read_readvariableopC
?savev2_adam_layer5_pointwise_conv_bn_beta_m_read_readvariableopL
Hsavev2_adam_layer6_depthwise_conv_depthwise_kernel_m_read_readvariableopC
?savev2_adam_layer6_depthwise_conv_bn_beta_m_read_readvariableopB
>savev2_adam_layer6_pointwise_conv_kernel_m_read_readvariableopC
?savev2_adam_layer6_pointwise_conv_bn_beta_m_read_readvariableopL
Hsavev2_adam_layer7_depthwise_conv_depthwise_kernel_m_read_readvariableopC
?savev2_adam_layer7_depthwise_conv_bn_beta_m_read_readvariableopB
>savev2_adam_layer7_pointwise_conv_kernel_m_read_readvariableopC
?savev2_adam_layer7_pointwise_conv_bn_beta_m_read_readvariableop2
.savev2_adam_dense_kernel_m_read_readvariableop0
,savev2_adam_dense_bias_m_read_readvariableop8
4savev2_adam_layer1_conv_kernel_v_read_readvariableop9
5savev2_adam_layer1_conv_bn_beta_v_read_readvariableopL
Hsavev2_adam_layer2_depthwise_conv_depthwise_kernel_v_read_readvariableopC
?savev2_adam_layer2_depthwise_conv_bn_beta_v_read_readvariableopB
>savev2_adam_layer2_pointwise_conv_kernel_v_read_readvariableopC
?savev2_adam_layer2_pointwise_conv_bn_beta_v_read_readvariableopL
Hsavev2_adam_layer3_depthwise_conv_depthwise_kernel_v_read_readvariableopC
?savev2_adam_layer3_depthwise_conv_bn_beta_v_read_readvariableopB
>savev2_adam_layer3_pointwise_conv_kernel_v_read_readvariableopC
?savev2_adam_layer3_pointwise_conv_bn_beta_v_read_readvariableopL
Hsavev2_adam_layer4_depthwise_conv_depthwise_kernel_v_read_readvariableopC
?savev2_adam_layer4_depthwise_conv_bn_beta_v_read_readvariableopB
>savev2_adam_layer4_pointwise_conv_kernel_v_read_readvariableopC
?savev2_adam_layer4_pointwise_conv_bn_beta_v_read_readvariableopL
Hsavev2_adam_layer5_depthwise_conv_depthwise_kernel_v_read_readvariableopC
?savev2_adam_layer5_depthwise_conv_bn_beta_v_read_readvariableopB
>savev2_adam_layer5_pointwise_conv_kernel_v_read_readvariableopC
?savev2_adam_layer5_pointwise_conv_bn_beta_v_read_readvariableopL
Hsavev2_adam_layer6_depthwise_conv_depthwise_kernel_v_read_readvariableopC
?savev2_adam_layer6_depthwise_conv_bn_beta_v_read_readvariableopB
>savev2_adam_layer6_pointwise_conv_kernel_v_read_readvariableopC
?savev2_adam_layer6_pointwise_conv_bn_beta_v_read_readvariableopL
Hsavev2_adam_layer7_depthwise_conv_depthwise_kernel_v_read_readvariableopC
?savev2_adam_layer7_depthwise_conv_bn_beta_v_read_readvariableopB
>savev2_adam_layer7_pointwise_conv_kernel_v_read_readvariableopC
?savev2_adam_layer7_pointwise_conv_bn_beta_v_read_readvariableop2
.savev2_adam_dense_kernel_v_read_readvariableop0
,savev2_adam_dense_bias_v_read_readvariableop
savev2_const_13

identity_1??MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : ?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ?C
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*?B
value?BB?BxB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-6/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-10/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-18/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-22/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-26/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-26/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*?
value?B?xB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ?;
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0-savev2_layer1_conv_kernel_read_readvariableop.savev2_layer1_conv_bn_beta_read_readvariableop5savev2_layer1_conv_bn_moving_mean_read_readvariableop9savev2_layer1_conv_bn_moving_variance_read_readvariableopAsavev2_layer2_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer2_depthwise_conv_bn_beta_read_readvariableop?savev2_layer2_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer2_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer2_pointwise_conv_kernel_read_readvariableop8savev2_layer2_pointwise_conv_bn_beta_read_readvariableop?savev2_layer2_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer2_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer3_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer3_depthwise_conv_bn_beta_read_readvariableop?savev2_layer3_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer3_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer3_pointwise_conv_kernel_read_readvariableop8savev2_layer3_pointwise_conv_bn_beta_read_readvariableop?savev2_layer3_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer3_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer4_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer4_depthwise_conv_bn_beta_read_readvariableop?savev2_layer4_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer4_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer4_pointwise_conv_kernel_read_readvariableop8savev2_layer4_pointwise_conv_bn_beta_read_readvariableop?savev2_layer4_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer4_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer5_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer5_depthwise_conv_bn_beta_read_readvariableop?savev2_layer5_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer5_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer5_pointwise_conv_kernel_read_readvariableop8savev2_layer5_pointwise_conv_bn_beta_read_readvariableop?savev2_layer5_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer5_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer6_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer6_depthwise_conv_bn_beta_read_readvariableop?savev2_layer6_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer6_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer6_pointwise_conv_kernel_read_readvariableop8savev2_layer6_pointwise_conv_bn_beta_read_readvariableop?savev2_layer6_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer6_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer7_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer7_depthwise_conv_bn_beta_read_readvariableop?savev2_layer7_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer7_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer7_pointwise_conv_kernel_read_readvariableop8savev2_layer7_pointwise_conv_bn_beta_read_readvariableop?savev2_layer7_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer7_pointwise_conv_bn_moving_variance_read_readvariableop'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop4savev2_adam_layer1_conv_kernel_m_read_readvariableop5savev2_adam_layer1_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer2_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer2_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer2_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer2_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer3_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer3_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer3_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer3_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer4_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer4_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer4_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer4_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer5_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer5_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer5_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer5_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer6_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer6_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer6_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer6_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer7_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer7_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer7_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer7_pointwise_conv_bn_beta_m_read_readvariableop.savev2_adam_dense_kernel_m_read_readvariableop,savev2_adam_dense_bias_m_read_readvariableop4savev2_adam_layer1_conv_kernel_v_read_readvariableop5savev2_adam_layer1_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer2_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer2_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer2_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer2_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer3_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer3_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer3_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer3_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer4_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer4_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer4_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer4_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer5_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer5_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer5_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer5_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer6_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer6_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer6_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer6_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer7_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer7_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer7_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer7_pointwise_conv_bn_beta_v_read_readvariableop.savev2_adam_dense_kernel_v_read_readvariableop,savev2_adam_dense_bias_v_read_readvariableopsavev2_const_13"/device:CPU:0*
_output_shapes
 *?
dtypes|
z2x	?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*?	
_input_shapes?	
?	: : : : : : : : : : @:@:@:@:@:@:@:@:@?:?:?:?:?:?:?:?:??:?:?:?:?:?:?:?:??:?:?:?:?:?:?:?:??:?:?:?:?:?:?:?:??:?:?:?:	?
:
: : : : : : : : : : : : : : @:@:@:@:@?:?:?:?:??:?:?:?:??:?:?:?:??:?:?:?:??:?:	?
:
: : : : : @:@:@:@:@?:?:?:?:??:?:?:?:??:?:?:?:??:?:?:?:??:?:	?
:
: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: :,	(
&
_output_shapes
: @: 


_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@:,(
&
_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@:-)
'
_output_shapes
:@?:!

_output_shapes	
:?:!

_output_shapes	
:?:!

_output_shapes	
:?:-)
'
_output_shapes
:?:!

_output_shapes	
:?:!

_output_shapes	
:?:!

_output_shapes	
:?:.*
(
_output_shapes
:??:!

_output_shapes	
:?:!

_output_shapes	
:?:!

_output_shapes	
:?:-)
'
_output_shapes
:?:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:.!*
(
_output_shapes
:??:!"

_output_shapes	
:?:!#

_output_shapes	
:?:!$

_output_shapes	
:?:-%)
'
_output_shapes
:?:!&

_output_shapes	
:?:!'

_output_shapes	
:?:!(

_output_shapes	
:?:.)*
(
_output_shapes
:??:!*

_output_shapes	
:?:!+

_output_shapes	
:?:!,

_output_shapes	
:?:--)
'
_output_shapes
:?:!.

_output_shapes	
:?:!/

_output_shapes	
:?:!0

_output_shapes	
:?:.1*
(
_output_shapes
:??:!2

_output_shapes	
:?:!3

_output_shapes	
:?:!4

_output_shapes	
:?:%5!

_output_shapes
:	?
: 6

_output_shapes
:
:7

_output_shapes
: :8

_output_shapes
: :9

_output_shapes
: ::

_output_shapes
: :;

_output_shapes
: :<

_output_shapes
: :=

_output_shapes
: :>

_output_shapes
: :?

_output_shapes
: :,@(
&
_output_shapes
: : A

_output_shapes
: :,B(
&
_output_shapes
: : C

_output_shapes
: :,D(
&
_output_shapes
: @: E

_output_shapes
:@:,F(
&
_output_shapes
:@: G

_output_shapes
:@:-H)
'
_output_shapes
:@?:!I

_output_shapes	
:?:-J)
'
_output_shapes
:?:!K

_output_shapes	
:?:.L*
(
_output_shapes
:??:!M

_output_shapes	
:?:-N)
'
_output_shapes
:?:!O

_output_shapes	
:?:.P*
(
_output_shapes
:??:!Q

_output_shapes	
:?:-R)
'
_output_shapes
:?:!S

_output_shapes	
:?:.T*
(
_output_shapes
:??:!U

_output_shapes	
:?:-V)
'
_output_shapes
:?:!W

_output_shapes	
:?:.X*
(
_output_shapes
:??:!Y

_output_shapes	
:?:%Z!

_output_shapes
:	?
: [

_output_shapes
:
:,\(
&
_output_shapes
: : ]

_output_shapes
: :,^(
&
_output_shapes
: : _

_output_shapes
: :,`(
&
_output_shapes
: @: a

_output_shapes
:@:,b(
&
_output_shapes
:@: c

_output_shapes
:@:-d)
'
_output_shapes
:@?:!e

_output_shapes	
:?:-f)
'
_output_shapes
:?:!g

_output_shapes	
:?:.h*
(
_output_shapes
:??:!i

_output_shapes	
:?:-j)
'
_output_shapes
:?:!k

_output_shapes	
:?:.l*
(
_output_shapes
:??:!m

_output_shapes	
:?:-n)
'
_output_shapes
:?:!o

_output_shapes	
:?:.p*
(
_output_shapes
:??:!q

_output_shapes	
:?:-r)
'
_output_shapes
:?:!s

_output_shapes	
:?:.t*
(
_output_shapes
:??:!u

_output_shapes	
:?:%v!

_output_shapes
:	?
: w

_output_shapes
:
:x

_output_shapes
: 
?
s
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847476

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0  :W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?	
?
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4847626

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
7__inference_layer4/pointwise_conv_layer_call_fn_4850518

inputs#
unknown:??
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4847597x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4847429

inputs8
conv2d_readvariableop_resource: 
identity??Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:?????????0  ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????`@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs
?	
?
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4850951

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4850101

inputs;
!depthwise_readvariableop_resource: 
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*&
_output_shapes
: *
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"             h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:?????????0  a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0  : 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?
?
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4847709

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4850781

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847391

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
:__inference_layer4/depthwise_conv/bn_layer_call_fn_4850454

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846927?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
d
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4847447

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0  :W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?	
?
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4847570

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?!
?
/__inference_yamnet_frames_layer_call_fn_4849231

inputs!
unknown: 
	unknown_0
	unknown_1: 
	unknown_2: 
	unknown_3: #
	unknown_4: 
	unknown_5
	unknown_6: 
	unknown_7: 
	unknown_8: #
	unknown_9: @

unknown_10

unknown_11:@

unknown_12:@

unknown_13:@$

unknown_14:@

unknown_15

unknown_16:@

unknown_17:@

unknown_18:@%

unknown_19:@?

unknown_20

unknown_21:	?

unknown_22:	?

unknown_23:	?%

unknown_24:?

unknown_25

unknown_26:	?

unknown_27:	?

unknown_28:	?&

unknown_29:??

unknown_30

unknown_31:	?

unknown_32:	?

unknown_33:	?%

unknown_34:?

unknown_35

unknown_36:	?

unknown_37:	?

unknown_38:	?&

unknown_39:??

unknown_40

unknown_41:	?

unknown_42:	?

unknown_43:	?%

unknown_44:?

unknown_45

unknown_46:	?

unknown_47:	?

unknown_48:	?&

unknown_49:??

unknown_50

unknown_51:	?

unknown_52:	?

unknown_53:	?%

unknown_54:?

unknown_55

unknown_56:	?

unknown_57:	?

unknown_58:	?&

unknown_59:??

unknown_60

unknown_61:	?

unknown_62:	?

unknown_63:	?

unknown_64:	?


unknown_65:

identity??StatefulPartitionedCall?	
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62
unknown_63
unknown_64
unknown_65*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8? *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4847803o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
??
?:
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849615

inputsD
*layer1_conv_conv2d_readvariableop_resource: 
layer1_conv_bn_scale4
&layer1_conv_bn_readvariableop_resource: E
7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource: G
9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource: Q
7layer2_depthwise_conv_depthwise_readvariableop_resource: "
layer2_depthwise_conv_bn_scale>
0layer2_depthwise_conv_bn_readvariableop_resource: O
Alayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource: Q
Clayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource: N
4layer2_pointwise_conv_conv2d_readvariableop_resource: @"
layer2_pointwise_conv_bn_scale>
0layer2_pointwise_conv_bn_readvariableop_resource:@O
Alayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:@Q
Clayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:@Q
7layer3_depthwise_conv_depthwise_readvariableop_resource:@"
layer3_depthwise_conv_bn_scale>
0layer3_depthwise_conv_bn_readvariableop_resource:@O
Alayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:@Q
Clayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:@O
4layer3_pointwise_conv_conv2d_readvariableop_resource:@?"
layer3_pointwise_conv_bn_scale?
0layer3_pointwise_conv_bn_readvariableop_resource:	?P
Alayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer4_depthwise_conv_depthwise_readvariableop_resource:?"
layer4_depthwise_conv_bn_scale?
0layer4_depthwise_conv_bn_readvariableop_resource:	?P
Alayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer4_pointwise_conv_conv2d_readvariableop_resource:??"
layer4_pointwise_conv_bn_scale?
0layer4_pointwise_conv_bn_readvariableop_resource:	?P
Alayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer5_depthwise_conv_depthwise_readvariableop_resource:?"
layer5_depthwise_conv_bn_scale?
0layer5_depthwise_conv_bn_readvariableop_resource:	?P
Alayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer5_pointwise_conv_conv2d_readvariableop_resource:??"
layer5_pointwise_conv_bn_scale?
0layer5_pointwise_conv_bn_readvariableop_resource:	?P
Alayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer6_depthwise_conv_depthwise_readvariableop_resource:?"
layer6_depthwise_conv_bn_scale?
0layer6_depthwise_conv_bn_readvariableop_resource:	?P
Alayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer6_pointwise_conv_conv2d_readvariableop_resource:??"
layer6_pointwise_conv_bn_scale?
0layer6_pointwise_conv_bn_readvariableop_resource:	?P
Alayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer7_depthwise_conv_depthwise_readvariableop_resource:?"
layer7_depthwise_conv_bn_scale?
0layer7_depthwise_conv_bn_readvariableop_resource:	?P
Alayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer7_pointwise_conv_conv2d_readvariableop_resource:??"
layer7_pointwise_conv_bn_scale?
0layer7_pointwise_conv_bn_readvariableop_resource:	?P
Alayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?7
$dense_matmul_readvariableop_resource:	?
3
%dense_biasadd_readvariableop_resource:

identity??dense/BiasAdd/ReadVariableOp?dense/MatMul/ReadVariableOp?!layer1/conv/Conv2D/ReadVariableOp?.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp?0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1?layer1/conv/bn/ReadVariableOp?8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer2/depthwise_conv/bn/ReadVariableOp?.layer2/depthwise_conv/depthwise/ReadVariableOp?+layer2/pointwise_conv/Conv2D/ReadVariableOp?8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer2/pointwise_conv/bn/ReadVariableOp?8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer3/depthwise_conv/bn/ReadVariableOp?.layer3/depthwise_conv/depthwise/ReadVariableOp?+layer3/pointwise_conv/Conv2D/ReadVariableOp?8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer3/pointwise_conv/bn/ReadVariableOp?8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer4/depthwise_conv/bn/ReadVariableOp?.layer4/depthwise_conv/depthwise/ReadVariableOp?+layer4/pointwise_conv/Conv2D/ReadVariableOp?8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer4/pointwise_conv/bn/ReadVariableOp?8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer5/depthwise_conv/bn/ReadVariableOp?.layer5/depthwise_conv/depthwise/ReadVariableOp?+layer5/pointwise_conv/Conv2D/ReadVariableOp?8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer5/pointwise_conv/bn/ReadVariableOp?8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer6/depthwise_conv/bn/ReadVariableOp?.layer6/depthwise_conv/depthwise/ReadVariableOp?+layer6/pointwise_conv/Conv2D/ReadVariableOp?8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer6/pointwise_conv/bn/ReadVariableOp?8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer7/depthwise_conv/bn/ReadVariableOp?.layer7/depthwise_conv/depthwise/ReadVariableOp?+layer7/pointwise_conv/Conv2D/ReadVariableOp?8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer7/pointwise_conv/bn/ReadVariableOp?
!layer1/conv/Conv2D/ReadVariableOpReadVariableOp*layer1_conv_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0?
layer1/conv/Conv2DConv2Dinputs)layer1/conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
?
layer1/conv/bn/ReadVariableOpReadVariableOp&layer1_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
.layer1/conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOp7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
layer1/conv/bn/FusedBatchNormV3FusedBatchNormV3layer1/conv/Conv2D:output:0layer1_conv_bn_scale%layer1/conv/bn/ReadVariableOp:value:06layer1/conv/bn/FusedBatchNormV3/ReadVariableOp:value:08layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0  : : : : :*
is_training( w
layer1/relu/ReluRelu#layer1/conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0  ?
.layer2/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer2_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
: *
dtype0~
%layer2/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"             ~
-layer2/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer2/depthwise_conv/depthwiseDepthwiseConv2dNativelayer1/relu/Relu:activations:06layer2/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
?
'layer2/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer2_depthwise_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
)layer2/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer2/depthwise_conv/depthwise:output:0layer2_depthwise_conv_bn_scale/layer2/depthwise_conv/bn/ReadVariableOp:value:0@layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0  : : : : :*
is_training( ?
layer2/depthwise_conv/relu/ReluRelu-layer2/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0  ?
+layer2/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer2_pointwise_conv_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0?
layer2/pointwise_conv/Conv2DConv2D-layer2/depthwise_conv/relu/Relu:activations:03layer2/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0 @*
paddingSAME*
strides
?
'layer2/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer2_pointwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0?
8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
)layer2/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer2/pointwise_conv/Conv2D:output:0layer2_pointwise_conv_bn_scale/layer2/pointwise_conv/bn/ReadVariableOp:value:0@layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0 @:@:@:@:@:*
is_training( ?
layer2/pointwise_conv/relu/ReluRelu-layer2/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0 @?
.layer3/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer3_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
:@*
dtype0~
%layer3/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      @      ~
-layer3/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer3/depthwise_conv/depthwiseDepthwiseConv2dNative-layer2/pointwise_conv/relu/Relu:activations:06layer3/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????@*
paddingSAME*
strides
?
'layer3/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer3_depthwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0?
8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
)layer3/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer3/depthwise_conv/depthwise:output:0layer3_depthwise_conv_bn_scale/layer3/depthwise_conv/bn/ReadVariableOp:value:0@layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????@:@:@:@:@:*
is_training( ?
layer3/depthwise_conv/relu/ReluRelu-layer3/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????@?
+layer3/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer3_pointwise_conv_conv2d_readvariableop_resource*'
_output_shapes
:@?*
dtype0?
layer3/pointwise_conv/Conv2DConv2D-layer3/depthwise_conv/relu/Relu:activations:03layer3/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer3/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer3_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer3/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer3/pointwise_conv/Conv2D:output:0layer3_pointwise_conv_bn_scale/layer3/pointwise_conv/bn/ReadVariableOp:value:0@layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer3/pointwise_conv/relu/ReluRelu-layer3/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer4/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer4_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer4/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      ~
-layer4/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer4/depthwise_conv/depthwiseDepthwiseConv2dNative-layer3/pointwise_conv/relu/Relu:activations:06layer4/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer4/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer4_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer4/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer4/depthwise_conv/depthwise:output:0layer4_depthwise_conv_bn_scale/layer4/depthwise_conv/bn/ReadVariableOp:value:0@layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer4/depthwise_conv/relu/ReluRelu-layer4/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer4/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer4_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer4/pointwise_conv/Conv2DConv2D-layer4/depthwise_conv/relu/Relu:activations:03layer4/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer4/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer4_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer4/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer4/pointwise_conv/Conv2D:output:0layer4_pointwise_conv_bn_scale/layer4/pointwise_conv/bn/ReadVariableOp:value:0@layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer4/pointwise_conv/relu/ReluRelu-layer4/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer5/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer5_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer5/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      ~
-layer5/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer5/depthwise_conv/depthwiseDepthwiseConv2dNative-layer4/pointwise_conv/relu/Relu:activations:06layer5/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer5/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer5_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer5/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer5/depthwise_conv/depthwise:output:0layer5_depthwise_conv_bn_scale/layer5/depthwise_conv/bn/ReadVariableOp:value:0@layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer5/depthwise_conv/relu/ReluRelu-layer5/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer5/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer5_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer5/pointwise_conv/Conv2DConv2D-layer5/depthwise_conv/relu/Relu:activations:03layer5/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer5/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer5_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer5/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer5/pointwise_conv/Conv2D:output:0layer5_pointwise_conv_bn_scale/layer5/pointwise_conv/bn/ReadVariableOp:value:0@layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer5/pointwise_conv/relu/ReluRelu-layer5/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer6/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer6_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer6/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer6/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer6/depthwise_conv/depthwiseDepthwiseConv2dNative-layer5/pointwise_conv/relu/Relu:activations:06layer6/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer6/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer6_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer6/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer6/depthwise_conv/depthwise:output:0layer6_depthwise_conv_bn_scale/layer6/depthwise_conv/bn/ReadVariableOp:value:0@layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer6/depthwise_conv/relu/ReluRelu-layer6/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer6/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer6_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer6/pointwise_conv/Conv2DConv2D-layer6/depthwise_conv/relu/Relu:activations:03layer6/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer6/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer6_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer6/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer6/pointwise_conv/Conv2D:output:0layer6_pointwise_conv_bn_scale/layer6/pointwise_conv/bn/ReadVariableOp:value:0@layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer6/pointwise_conv/relu/ReluRelu-layer6/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer7/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer7_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer7/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer7/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer7/depthwise_conv/depthwiseDepthwiseConv2dNative-layer6/pointwise_conv/relu/Relu:activations:06layer7/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer7/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer7_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer7/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer7/depthwise_conv/depthwise:output:0layer7_depthwise_conv_bn_scale/layer7/depthwise_conv/bn/ReadVariableOp:value:0@layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer7/depthwise_conv/relu/ReluRelu-layer7/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer7/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer7_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer7/pointwise_conv/Conv2DConv2D-layer7/depthwise_conv/relu/Relu:activations:03layer7/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer7/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer7_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer7/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer7/pointwise_conv/Conv2D:output:0layer7_pointwise_conv_bn_scale/layer7/pointwise_conv/bn/ReadVariableOp:value:0@layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
layer7/pointwise_conv/relu/ReluRelu-layer7/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
/global_average_pooling2d/Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      ?
global_average_pooling2d/MeanMean-layer7/pointwise_conv/relu/Relu:activations:08global_average_pooling2d/Mean/reduction_indices:output:0*
T0*(
_output_shapes
:???????????
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	?
*
dtype0?
dense/MatMulMatMul&global_average_pooling2d/Mean:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0?
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
e
IdentityIdentitydense/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????
?
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp"^layer1/conv/Conv2D/ReadVariableOp/^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp1^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1^layer1/conv/bn/ReadVariableOp9^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/depthwise_conv/bn/ReadVariableOp/^layer2/depthwise_conv/depthwise/ReadVariableOp,^layer2/pointwise_conv/Conv2D/ReadVariableOp9^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/pointwise_conv/bn/ReadVariableOp9^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/depthwise_conv/bn/ReadVariableOp/^layer3/depthwise_conv/depthwise/ReadVariableOp,^layer3/pointwise_conv/Conv2D/ReadVariableOp9^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/pointwise_conv/bn/ReadVariableOp9^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/depthwise_conv/bn/ReadVariableOp/^layer4/depthwise_conv/depthwise/ReadVariableOp,^layer4/pointwise_conv/Conv2D/ReadVariableOp9^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/pointwise_conv/bn/ReadVariableOp9^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/depthwise_conv/bn/ReadVariableOp/^layer5/depthwise_conv/depthwise/ReadVariableOp,^layer5/pointwise_conv/Conv2D/ReadVariableOp9^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/pointwise_conv/bn/ReadVariableOp9^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/depthwise_conv/bn/ReadVariableOp/^layer6/depthwise_conv/depthwise/ReadVariableOp,^layer6/pointwise_conv/Conv2D/ReadVariableOp9^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/pointwise_conv/bn/ReadVariableOp9^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/depthwise_conv/bn/ReadVariableOp/^layer7/depthwise_conv/depthwise/ReadVariableOp,^layer7/pointwise_conv/Conv2D/ReadVariableOp9^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/pointwise_conv/bn/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2F
!layer1/conv/Conv2D/ReadVariableOp!layer1/conv/Conv2D/ReadVariableOp2`
.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp2d
0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_10layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_12>
layer1/conv/bn/ReadVariableOplayer1/conv/bn/ReadVariableOp2t
8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer2/depthwise_conv/bn/ReadVariableOp'layer2/depthwise_conv/bn/ReadVariableOp2`
.layer2/depthwise_conv/depthwise/ReadVariableOp.layer2/depthwise_conv/depthwise/ReadVariableOp2Z
+layer2/pointwise_conv/Conv2D/ReadVariableOp+layer2/pointwise_conv/Conv2D/ReadVariableOp2t
8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer2/pointwise_conv/bn/ReadVariableOp'layer2/pointwise_conv/bn/ReadVariableOp2t
8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer3/depthwise_conv/bn/ReadVariableOp'layer3/depthwise_conv/bn/ReadVariableOp2`
.layer3/depthwise_conv/depthwise/ReadVariableOp.layer3/depthwise_conv/depthwise/ReadVariableOp2Z
+layer3/pointwise_conv/Conv2D/ReadVariableOp+layer3/pointwise_conv/Conv2D/ReadVariableOp2t
8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer3/pointwise_conv/bn/ReadVariableOp'layer3/pointwise_conv/bn/ReadVariableOp2t
8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer4/depthwise_conv/bn/ReadVariableOp'layer4/depthwise_conv/bn/ReadVariableOp2`
.layer4/depthwise_conv/depthwise/ReadVariableOp.layer4/depthwise_conv/depthwise/ReadVariableOp2Z
+layer4/pointwise_conv/Conv2D/ReadVariableOp+layer4/pointwise_conv/Conv2D/ReadVariableOp2t
8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer4/pointwise_conv/bn/ReadVariableOp'layer4/pointwise_conv/bn/ReadVariableOp2t
8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer5/depthwise_conv/bn/ReadVariableOp'layer5/depthwise_conv/bn/ReadVariableOp2`
.layer5/depthwise_conv/depthwise/ReadVariableOp.layer5/depthwise_conv/depthwise/ReadVariableOp2Z
+layer5/pointwise_conv/Conv2D/ReadVariableOp+layer5/pointwise_conv/Conv2D/ReadVariableOp2t
8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer5/pointwise_conv/bn/ReadVariableOp'layer5/pointwise_conv/bn/ReadVariableOp2t
8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer6/depthwise_conv/bn/ReadVariableOp'layer6/depthwise_conv/bn/ReadVariableOp2`
.layer6/depthwise_conv/depthwise/ReadVariableOp.layer6/depthwise_conv/depthwise/ReadVariableOp2Z
+layer6/pointwise_conv/Conv2D/ReadVariableOp+layer6/pointwise_conv/Conv2D/ReadVariableOp2t
8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer6/pointwise_conv/bn/ReadVariableOp'layer6/pointwise_conv/bn/ReadVariableOp2t
8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer7/depthwise_conv/bn/ReadVariableOp'layer7/depthwise_conv/bn/ReadVariableOp2`
.layer7/depthwise_conv/depthwise/ReadVariableOp.layer7/depthwise_conv/depthwise/ReadVariableOp2Z
+layer7/pointwise_conv/Conv2D/ReadVariableOp+layer7/pointwise_conv/Conv2D/ReadVariableOp2t
8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer7/pointwise_conv/bn/ReadVariableOp'layer7/pointwise_conv/bn/ReadVariableOp:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847267

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850144

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846833

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846709

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?	
?
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4850441

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4850355

inputs9
conv2d_readvariableop_resource:@?
identity??Conv2D/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:@?*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4851011

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4847738

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer4/pointwise_conv/bn_layer_call_fn_4850538

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846989?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850824

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4850525

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850654

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
:__inference_layer6/pointwise_conv/bn_layer_call_fn_4850878

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847237?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
??
?#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4847803

inputs-
layer1_conv_4847430: 
layer1_conv_bn_4847433$
layer1_conv_bn_4847435: $
layer1_conv_bn_4847437: $
layer1_conv_bn_4847439: 7
layer2_depthwise_conv_4847459: $
 layer2_depthwise_conv_bn_4847462.
 layer2_depthwise_conv_bn_4847464: .
 layer2_depthwise_conv_bn_4847466: .
 layer2_depthwise_conv_bn_4847468: 7
layer2_pointwise_conv_4847486: @$
 layer2_pointwise_conv_bn_4847489.
 layer2_pointwise_conv_bn_4847491:@.
 layer2_pointwise_conv_bn_4847493:@.
 layer2_pointwise_conv_bn_4847495:@7
layer3_depthwise_conv_4847515:@$
 layer3_depthwise_conv_bn_4847518.
 layer3_depthwise_conv_bn_4847520:@.
 layer3_depthwise_conv_bn_4847522:@.
 layer3_depthwise_conv_bn_4847524:@8
layer3_pointwise_conv_4847542:@?$
 layer3_pointwise_conv_bn_4847545/
 layer3_pointwise_conv_bn_4847547:	?/
 layer3_pointwise_conv_bn_4847549:	?/
 layer3_pointwise_conv_bn_4847551:	?8
layer4_depthwise_conv_4847571:?$
 layer4_depthwise_conv_bn_4847574/
 layer4_depthwise_conv_bn_4847576:	?/
 layer4_depthwise_conv_bn_4847578:	?/
 layer4_depthwise_conv_bn_4847580:	?9
layer4_pointwise_conv_4847598:??$
 layer4_pointwise_conv_bn_4847601/
 layer4_pointwise_conv_bn_4847603:	?/
 layer4_pointwise_conv_bn_4847605:	?/
 layer4_pointwise_conv_bn_4847607:	?8
layer5_depthwise_conv_4847627:?$
 layer5_depthwise_conv_bn_4847630/
 layer5_depthwise_conv_bn_4847632:	?/
 layer5_depthwise_conv_bn_4847634:	?/
 layer5_depthwise_conv_bn_4847636:	?9
layer5_pointwise_conv_4847654:??$
 layer5_pointwise_conv_bn_4847657/
 layer5_pointwise_conv_bn_4847659:	?/
 layer5_pointwise_conv_bn_4847661:	?/
 layer5_pointwise_conv_bn_4847663:	?8
layer6_depthwise_conv_4847683:?$
 layer6_depthwise_conv_bn_4847686/
 layer6_depthwise_conv_bn_4847688:	?/
 layer6_depthwise_conv_bn_4847690:	?/
 layer6_depthwise_conv_bn_4847692:	?9
layer6_pointwise_conv_4847710:??$
 layer6_pointwise_conv_bn_4847713/
 layer6_pointwise_conv_bn_4847715:	?/
 layer6_pointwise_conv_bn_4847717:	?/
 layer6_pointwise_conv_bn_4847719:	?8
layer7_depthwise_conv_4847739:?$
 layer7_depthwise_conv_bn_4847742/
 layer7_depthwise_conv_bn_4847744:	?/
 layer7_depthwise_conv_bn_4847746:	?/
 layer7_depthwise_conv_bn_4847748:	?9
layer7_pointwise_conv_4847766:??$
 layer7_pointwise_conv_bn_4847769/
 layer7_pointwise_conv_bn_4847771:	?/
 layer7_pointwise_conv_bn_4847773:	?/
 layer7_pointwise_conv_bn_4847775:	? 
dense_4847797:	?

dense_4847799:

identity??dense/StatefulPartitionedCall?#layer1/conv/StatefulPartitionedCall?&layer1/conv/bn/StatefulPartitionedCall?-layer2/depthwise_conv/StatefulPartitionedCall?0layer2/depthwise_conv/bn/StatefulPartitionedCall?-layer2/pointwise_conv/StatefulPartitionedCall?0layer2/pointwise_conv/bn/StatefulPartitionedCall?-layer3/depthwise_conv/StatefulPartitionedCall?0layer3/depthwise_conv/bn/StatefulPartitionedCall?-layer3/pointwise_conv/StatefulPartitionedCall?0layer3/pointwise_conv/bn/StatefulPartitionedCall?-layer4/depthwise_conv/StatefulPartitionedCall?0layer4/depthwise_conv/bn/StatefulPartitionedCall?-layer4/pointwise_conv/StatefulPartitionedCall?0layer4/pointwise_conv/bn/StatefulPartitionedCall?-layer5/depthwise_conv/StatefulPartitionedCall?0layer5/depthwise_conv/bn/StatefulPartitionedCall?-layer5/pointwise_conv/StatefulPartitionedCall?0layer5/pointwise_conv/bn/StatefulPartitionedCall?-layer6/depthwise_conv/StatefulPartitionedCall?0layer6/depthwise_conv/bn/StatefulPartitionedCall?-layer6/pointwise_conv/StatefulPartitionedCall?0layer6/pointwise_conv/bn/StatefulPartitionedCall?-layer7/depthwise_conv/StatefulPartitionedCall?0layer7/depthwise_conv/bn/StatefulPartitionedCall?-layer7/pointwise_conv/StatefulPartitionedCall?0layer7/pointwise_conv/bn/StatefulPartitionedCall?
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinputslayer1_conv_4847430*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4847429?
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_4847433layer1_conv_bn_4847435layer1_conv_bn_4847437layer1_conv_bn_4847439*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846617?
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4847447?
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_4847459*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4847458?
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_4847462 layer2_depthwise_conv_bn_4847464 layer2_depthwise_conv_bn_4847466 layer2_depthwise_conv_bn_4847468*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846679?
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847476?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_4847486*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4847485?
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_4847489 layer2_pointwise_conv_bn_4847491 layer2_pointwise_conv_bn_4847493 layer2_pointwise_conv_bn_4847495*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846741?
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847503?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_4847515*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4847514?
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_4847518 layer3_depthwise_conv_bn_4847520 layer3_depthwise_conv_bn_4847522 layer3_depthwise_conv_bn_4847524*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846803?
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847532?
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_4847542*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4847541?
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_4847545 layer3_pointwise_conv_bn_4847547 layer3_pointwise_conv_bn_4847549 layer3_pointwise_conv_bn_4847551*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846865?
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847559?
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_4847571*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4847570?
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_4847574 layer4_depthwise_conv_bn_4847576 layer4_depthwise_conv_bn_4847578 layer4_depthwise_conv_bn_4847580*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846927?
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847588?
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_4847598*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4847597?
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_4847601 layer4_pointwise_conv_bn_4847603 layer4_pointwise_conv_bn_4847605 layer4_pointwise_conv_bn_4847607*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846989?
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847615?
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_4847627*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4847626?
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_4847630 layer5_depthwise_conv_bn_4847632 layer5_depthwise_conv_bn_4847634 layer5_depthwise_conv_bn_4847636*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847051?
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847644?
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_4847654*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4847653?
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_4847657 layer5_pointwise_conv_bn_4847659 layer5_pointwise_conv_bn_4847661 layer5_pointwise_conv_bn_4847663*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847113?
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847671?
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_4847683*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4847682?
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_4847686 layer6_depthwise_conv_bn_4847688 layer6_depthwise_conv_bn_4847690 layer6_depthwise_conv_bn_4847692*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847175?
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847700?
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_4847710*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4847709?
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_4847713 layer6_pointwise_conv_bn_4847715 layer6_pointwise_conv_bn_4847717 layer6_pointwise_conv_bn_4847719*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847237?
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847727?
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_4847739*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4847738?
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_4847742 layer7_depthwise_conv_bn_4847744 layer7_depthwise_conv_bn_4847746 layer7_depthwise_conv_bn_4847748*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847299?
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847756?
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_4847766*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4847765?
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_4847769 layer7_pointwise_conv_bn_4847771 layer7_pointwise_conv_bn_4847773 layer7_pointwise_conv_bn_4847775*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847361?
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847783?
(global_average_pooling2d/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4847412?
dense/StatefulPartitionedCallStatefulPartitionedCall1global_average_pooling2d/PartitionedCall:output:0dense_4847797dense_4847799*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_4847796u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
?

NoOpNoOp^dense/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2J
#layer1/conv/StatefulPartitionedCall#layer1/conv/StatefulPartitionedCall2P
&layer1/conv/bn/StatefulPartitionedCall&layer1/conv/bn/StatefulPartitionedCall2^
-layer2/depthwise_conv/StatefulPartitionedCall-layer2/depthwise_conv/StatefulPartitionedCall2d
0layer2/depthwise_conv/bn/StatefulPartitionedCall0layer2/depthwise_conv/bn/StatefulPartitionedCall2^
-layer2/pointwise_conv/StatefulPartitionedCall-layer2/pointwise_conv/StatefulPartitionedCall2d
0layer2/pointwise_conv/bn/StatefulPartitionedCall0layer2/pointwise_conv/bn/StatefulPartitionedCall2^
-layer3/depthwise_conv/StatefulPartitionedCall-layer3/depthwise_conv/StatefulPartitionedCall2d
0layer3/depthwise_conv/bn/StatefulPartitionedCall0layer3/depthwise_conv/bn/StatefulPartitionedCall2^
-layer3/pointwise_conv/StatefulPartitionedCall-layer3/pointwise_conv/StatefulPartitionedCall2d
0layer3/pointwise_conv/bn/StatefulPartitionedCall0layer3/pointwise_conv/bn/StatefulPartitionedCall2^
-layer4/depthwise_conv/StatefulPartitionedCall-layer4/depthwise_conv/StatefulPartitionedCall2d
0layer4/depthwise_conv/bn/StatefulPartitionedCall0layer4/depthwise_conv/bn/StatefulPartitionedCall2^
-layer4/pointwise_conv/StatefulPartitionedCall-layer4/pointwise_conv/StatefulPartitionedCall2d
0layer4/pointwise_conv/bn/StatefulPartitionedCall0layer4/pointwise_conv/bn/StatefulPartitionedCall2^
-layer5/depthwise_conv/StatefulPartitionedCall-layer5/depthwise_conv/StatefulPartitionedCall2d
0layer5/depthwise_conv/bn/StatefulPartitionedCall0layer5/depthwise_conv/bn/StatefulPartitionedCall2^
-layer5/pointwise_conv/StatefulPartitionedCall-layer5/pointwise_conv/StatefulPartitionedCall2d
0layer5/pointwise_conv/bn/StatefulPartitionedCall0layer5/pointwise_conv/bn/StatefulPartitionedCall2^
-layer6/depthwise_conv/StatefulPartitionedCall-layer6/depthwise_conv/StatefulPartitionedCall2d
0layer6/depthwise_conv/bn/StatefulPartitionedCall0layer6/depthwise_conv/bn/StatefulPartitionedCall2^
-layer6/pointwise_conv/StatefulPartitionedCall-layer6/pointwise_conv/StatefulPartitionedCall2d
0layer6/pointwise_conv/bn/StatefulPartitionedCall0layer6/pointwise_conv/bn/StatefulPartitionedCall2^
-layer7/depthwise_conv/StatefulPartitionedCall-layer7/depthwise_conv/StatefulPartitionedCall2d
0layer7/depthwise_conv/bn/StatefulPartitionedCall0layer7/depthwise_conv/bn/StatefulPartitionedCall2^
-layer7/pointwise_conv/StatefulPartitionedCall-layer7/pointwise_conv/StatefulPartitionedCall2d
0layer7/pointwise_conv/bn/StatefulPartitionedCall0layer7/pointwise_conv/bn/StatefulPartitionedCall:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850415

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4847653

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer4/depthwise_conv/bn_layer_call_fn_4850467

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846957?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4851078

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850341

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????@b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?	
?
:__inference_layer5/depthwise_conv/bn_layer_call_fn_4850624

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847051?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846647

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
?
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847205

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
7__inference_layer5/pointwise_conv_layer_call_fn_4850688

inputs#
unknown:??
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4847653x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
V
:__inference_global_average_pooling2d_layer_call_fn_4851110

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4847412i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
s
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850595

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
7__inference_layer2/depthwise_conv_layer_call_fn_4850092

inputs!
unknown: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4847458w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:?????????0  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0  : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?
?
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847113

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847671

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
7__inference_layer4/depthwise_conv_layer_call_fn_4850432

inputs"
unknown:?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4847570x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4851035

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850171

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0  :W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?	
?
B__inference_dense_layer_call_and_return_conditional_losses_4851135

inputs1
matmul_readvariableop_resource:	?
-
biasadd_readvariableop_resource:

identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????
w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer2/pointwise_conv/bn_layer_call_fn_4850198

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+???????????????????????????@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846741?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847329

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
X
<__inference_layer5/pointwise_conv/relu_layer_call_fn_4850760

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847671i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4851021

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4847765

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850755

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847559

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
7__inference_layer7/depthwise_conv_layer_call_fn_4850942

inputs"
unknown:?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4847738x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847503

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????0 @b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????0 @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0 @:W S
/
_output_shapes
:?????????0 @
 
_user_specified_nameinputs
?
?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846895

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
0__inference_layer1/conv/bn_layer_call_fn_4850028

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+??????????????????????????? *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846617?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?!
?
%__inference_signature_wrapper_4850001
input_1!
unknown: 
	unknown_0
	unknown_1: 
	unknown_2: 
	unknown_3: #
	unknown_4: 
	unknown_5
	unknown_6: 
	unknown_7: 
	unknown_8: #
	unknown_9: @

unknown_10

unknown_11:@

unknown_12:@

unknown_13:@$

unknown_14:@

unknown_15

unknown_16:@

unknown_17:@

unknown_18:@%

unknown_19:@?

unknown_20

unknown_21:	?

unknown_22:	?

unknown_23:	?%

unknown_24:?

unknown_25

unknown_26:	?

unknown_27:	?

unknown_28:	?&

unknown_29:??

unknown_30

unknown_31:	?

unknown_32:	?

unknown_33:	?%

unknown_34:?

unknown_35

unknown_36:	?

unknown_37:	?

unknown_38:	?&

unknown_39:??

unknown_40

unknown_41:	?

unknown_42:	?

unknown_43:	?%

unknown_44:?

unknown_45

unknown_46:	?

unknown_47:	?

unknown_48:	?&

unknown_49:??

unknown_50

unknown_51:	?

unknown_52:	?

unknown_53:	?%

unknown_54:?

unknown_55

unknown_56:	?

unknown_57:	?

unknown_58:	?&

unknown_59:??

unknown_60

unknown_61:	?

unknown_62:	?

unknown_63:	?

unknown_64:	?


unknown_65:

identity??StatefulPartitionedCall?	
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62
unknown_63
unknown_64
unknown_65*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8? *+
f&R$
"__inference__wrapped_model_4846596o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:?????????`@
!
_user_specified_name	input_1: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4850185

inputs8
conv2d_readvariableop_resource: @
identity??Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0 @*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:?????????0 @^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0  : 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?	
?
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4850271

inputs;
!depthwise_readvariableop_resource:@
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*&
_output_shapes
:@*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      @      h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????@*
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:?????????@a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0 @: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:?????????0 @
 
_user_specified_nameinputs
?
?
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846989

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847019

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846617

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?	
?
:__inference_layer7/pointwise_conv/bn_layer_call_fn_4851048

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847361?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4847682

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
q
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4847412

inputs
identityg
Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      p
MeanMeaninputsMean/reduction_indices:output:0*
T0*0
_output_shapes
:??????????????????^
IdentityIdentityMean:output:0*
T0*0
_output_shapes
:??????????????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
X
<__inference_layer4/pointwise_conv/relu_layer_call_fn_4850590

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847615i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4850058

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846679

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
s
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847756

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
??
?#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849086
input_1-
layer1_conv_4848910: 
layer1_conv_bn_4848913$
layer1_conv_bn_4848915: $
layer1_conv_bn_4848917: $
layer1_conv_bn_4848919: 7
layer2_depthwise_conv_4848923: $
 layer2_depthwise_conv_bn_4848926.
 layer2_depthwise_conv_bn_4848928: .
 layer2_depthwise_conv_bn_4848930: .
 layer2_depthwise_conv_bn_4848932: 7
layer2_pointwise_conv_4848936: @$
 layer2_pointwise_conv_bn_4848939.
 layer2_pointwise_conv_bn_4848941:@.
 layer2_pointwise_conv_bn_4848943:@.
 layer2_pointwise_conv_bn_4848945:@7
layer3_depthwise_conv_4848949:@$
 layer3_depthwise_conv_bn_4848952.
 layer3_depthwise_conv_bn_4848954:@.
 layer3_depthwise_conv_bn_4848956:@.
 layer3_depthwise_conv_bn_4848958:@8
layer3_pointwise_conv_4848962:@?$
 layer3_pointwise_conv_bn_4848965/
 layer3_pointwise_conv_bn_4848967:	?/
 layer3_pointwise_conv_bn_4848969:	?/
 layer3_pointwise_conv_bn_4848971:	?8
layer4_depthwise_conv_4848975:?$
 layer4_depthwise_conv_bn_4848978/
 layer4_depthwise_conv_bn_4848980:	?/
 layer4_depthwise_conv_bn_4848982:	?/
 layer4_depthwise_conv_bn_4848984:	?9
layer4_pointwise_conv_4848988:??$
 layer4_pointwise_conv_bn_4848991/
 layer4_pointwise_conv_bn_4848993:	?/
 layer4_pointwise_conv_bn_4848995:	?/
 layer4_pointwise_conv_bn_4848997:	?8
layer5_depthwise_conv_4849001:?$
 layer5_depthwise_conv_bn_4849004/
 layer5_depthwise_conv_bn_4849006:	?/
 layer5_depthwise_conv_bn_4849008:	?/
 layer5_depthwise_conv_bn_4849010:	?9
layer5_pointwise_conv_4849014:??$
 layer5_pointwise_conv_bn_4849017/
 layer5_pointwise_conv_bn_4849019:	?/
 layer5_pointwise_conv_bn_4849021:	?/
 layer5_pointwise_conv_bn_4849023:	?8
layer6_depthwise_conv_4849027:?$
 layer6_depthwise_conv_bn_4849030/
 layer6_depthwise_conv_bn_4849032:	?/
 layer6_depthwise_conv_bn_4849034:	?/
 layer6_depthwise_conv_bn_4849036:	?9
layer6_pointwise_conv_4849040:??$
 layer6_pointwise_conv_bn_4849043/
 layer6_pointwise_conv_bn_4849045:	?/
 layer6_pointwise_conv_bn_4849047:	?/
 layer6_pointwise_conv_bn_4849049:	?8
layer7_depthwise_conv_4849053:?$
 layer7_depthwise_conv_bn_4849056/
 layer7_depthwise_conv_bn_4849058:	?/
 layer7_depthwise_conv_bn_4849060:	?/
 layer7_depthwise_conv_bn_4849062:	?9
layer7_pointwise_conv_4849066:??$
 layer7_pointwise_conv_bn_4849069/
 layer7_pointwise_conv_bn_4849071:	?/
 layer7_pointwise_conv_bn_4849073:	?/
 layer7_pointwise_conv_bn_4849075:	? 
dense_4849080:	?

dense_4849082:

identity??dense/StatefulPartitionedCall?#layer1/conv/StatefulPartitionedCall?&layer1/conv/bn/StatefulPartitionedCall?-layer2/depthwise_conv/StatefulPartitionedCall?0layer2/depthwise_conv/bn/StatefulPartitionedCall?-layer2/pointwise_conv/StatefulPartitionedCall?0layer2/pointwise_conv/bn/StatefulPartitionedCall?-layer3/depthwise_conv/StatefulPartitionedCall?0layer3/depthwise_conv/bn/StatefulPartitionedCall?-layer3/pointwise_conv/StatefulPartitionedCall?0layer3/pointwise_conv/bn/StatefulPartitionedCall?-layer4/depthwise_conv/StatefulPartitionedCall?0layer4/depthwise_conv/bn/StatefulPartitionedCall?-layer4/pointwise_conv/StatefulPartitionedCall?0layer4/pointwise_conv/bn/StatefulPartitionedCall?-layer5/depthwise_conv/StatefulPartitionedCall?0layer5/depthwise_conv/bn/StatefulPartitionedCall?-layer5/pointwise_conv/StatefulPartitionedCall?0layer5/pointwise_conv/bn/StatefulPartitionedCall?-layer6/depthwise_conv/StatefulPartitionedCall?0layer6/depthwise_conv/bn/StatefulPartitionedCall?-layer6/pointwise_conv/StatefulPartitionedCall?0layer6/pointwise_conv/bn/StatefulPartitionedCall?-layer7/depthwise_conv/StatefulPartitionedCall?0layer7/depthwise_conv/bn/StatefulPartitionedCall?-layer7/pointwise_conv/StatefulPartitionedCall?0layer7/pointwise_conv/bn/StatefulPartitionedCall?
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinput_1layer1_conv_4848910*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4847429?
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_4848913layer1_conv_bn_4848915layer1_conv_bn_4848917layer1_conv_bn_4848919*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846647?
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4847447?
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_4848923*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4847458?
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_4848926 layer2_depthwise_conv_bn_4848928 layer2_depthwise_conv_bn_4848930 layer2_depthwise_conv_bn_4848932*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846709?
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847476?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_4848936*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4847485?
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_4848939 layer2_pointwise_conv_bn_4848941 layer2_pointwise_conv_bn_4848943 layer2_pointwise_conv_bn_4848945*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846771?
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847503?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_4848949*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4847514?
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_4848952 layer3_depthwise_conv_bn_4848954 layer3_depthwise_conv_bn_4848956 layer3_depthwise_conv_bn_4848958*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846833?
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847532?
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_4848962*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4847541?
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_4848965 layer3_pointwise_conv_bn_4848967 layer3_pointwise_conv_bn_4848969 layer3_pointwise_conv_bn_4848971*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846895?
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847559?
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_4848975*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4847570?
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_4848978 layer4_depthwise_conv_bn_4848980 layer4_depthwise_conv_bn_4848982 layer4_depthwise_conv_bn_4848984*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846957?
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847588?
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_4848988*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4847597?
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_4848991 layer4_pointwise_conv_bn_4848993 layer4_pointwise_conv_bn_4848995 layer4_pointwise_conv_bn_4848997*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847019?
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847615?
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_4849001*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4847626?
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_4849004 layer5_depthwise_conv_bn_4849006 layer5_depthwise_conv_bn_4849008 layer5_depthwise_conv_bn_4849010*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847081?
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847644?
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_4849014*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4847653?
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_4849017 layer5_pointwise_conv_bn_4849019 layer5_pointwise_conv_bn_4849021 layer5_pointwise_conv_bn_4849023*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847143?
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847671?
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_4849027*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4847682?
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_4849030 layer6_depthwise_conv_bn_4849032 layer6_depthwise_conv_bn_4849034 layer6_depthwise_conv_bn_4849036*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847205?
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847700?
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_4849040*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4847709?
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_4849043 layer6_pointwise_conv_bn_4849045 layer6_pointwise_conv_bn_4849047 layer6_pointwise_conv_bn_4849049*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847267?
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847727?
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_4849053*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4847738?
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_4849056 layer7_depthwise_conv_bn_4849058 layer7_depthwise_conv_bn_4849060 layer7_depthwise_conv_bn_4849062*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847329?
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847756?
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_4849066*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4847765?
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_4849069 layer7_pointwise_conv_bn_4849071 layer7_pointwise_conv_bn_4849073 layer7_pointwise_conv_bn_4849075*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847391?
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847783?
(global_average_pooling2d/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4847412?
dense/StatefulPartitionedCallStatefulPartitionedCall1global_average_pooling2d/PartitionedCall:output:0dense_4849080dense_4849082*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_4847796u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
?

NoOpNoOp^dense/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2J
#layer1/conv/StatefulPartitionedCall#layer1/conv/StatefulPartitionedCall2P
&layer1/conv/bn/StatefulPartitionedCall&layer1/conv/bn/StatefulPartitionedCall2^
-layer2/depthwise_conv/StatefulPartitionedCall-layer2/depthwise_conv/StatefulPartitionedCall2d
0layer2/depthwise_conv/bn/StatefulPartitionedCall0layer2/depthwise_conv/bn/StatefulPartitionedCall2^
-layer2/pointwise_conv/StatefulPartitionedCall-layer2/pointwise_conv/StatefulPartitionedCall2d
0layer2/pointwise_conv/bn/StatefulPartitionedCall0layer2/pointwise_conv/bn/StatefulPartitionedCall2^
-layer3/depthwise_conv/StatefulPartitionedCall-layer3/depthwise_conv/StatefulPartitionedCall2d
0layer3/depthwise_conv/bn/StatefulPartitionedCall0layer3/depthwise_conv/bn/StatefulPartitionedCall2^
-layer3/pointwise_conv/StatefulPartitionedCall-layer3/pointwise_conv/StatefulPartitionedCall2d
0layer3/pointwise_conv/bn/StatefulPartitionedCall0layer3/pointwise_conv/bn/StatefulPartitionedCall2^
-layer4/depthwise_conv/StatefulPartitionedCall-layer4/depthwise_conv/StatefulPartitionedCall2d
0layer4/depthwise_conv/bn/StatefulPartitionedCall0layer4/depthwise_conv/bn/StatefulPartitionedCall2^
-layer4/pointwise_conv/StatefulPartitionedCall-layer4/pointwise_conv/StatefulPartitionedCall2d
0layer4/pointwise_conv/bn/StatefulPartitionedCall0layer4/pointwise_conv/bn/StatefulPartitionedCall2^
-layer5/depthwise_conv/StatefulPartitionedCall-layer5/depthwise_conv/StatefulPartitionedCall2d
0layer5/depthwise_conv/bn/StatefulPartitionedCall0layer5/depthwise_conv/bn/StatefulPartitionedCall2^
-layer5/pointwise_conv/StatefulPartitionedCall-layer5/pointwise_conv/StatefulPartitionedCall2d
0layer5/pointwise_conv/bn/StatefulPartitionedCall0layer5/pointwise_conv/bn/StatefulPartitionedCall2^
-layer6/depthwise_conv/StatefulPartitionedCall-layer6/depthwise_conv/StatefulPartitionedCall2d
0layer6/depthwise_conv/bn/StatefulPartitionedCall0layer6/depthwise_conv/bn/StatefulPartitionedCall2^
-layer6/pointwise_conv/StatefulPartitionedCall-layer6/pointwise_conv/StatefulPartitionedCall2d
0layer6/pointwise_conv/bn/StatefulPartitionedCall0layer6/pointwise_conv/bn/StatefulPartitionedCall2^
-layer7/depthwise_conv/StatefulPartitionedCall-layer7/depthwise_conv/StatefulPartitionedCall2d
0layer7/depthwise_conv/bn/StatefulPartitionedCall0layer7/depthwise_conv/bn/StatefulPartitionedCall2^
-layer7/pointwise_conv/StatefulPartitionedCall-layer7/pointwise_conv/StatefulPartitionedCall2d
0layer7/pointwise_conv/bn/StatefulPartitionedCall0layer7/pointwise_conv/bn/StatefulPartitionedCall:X T
/
_output_shapes
:?????????`@
!
_user_specified_name	input_1: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
7__inference_layer6/depthwise_conv_layer_call_fn_4850772

inputs"
unknown:?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4847682x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4847541

inputs9
conv2d_readvariableop_resource:@?
identity??Conv2D/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:@?*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846741

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
X
<__inference_layer6/pointwise_conv/relu_layer_call_fn_4850930

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847727i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850585

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850841

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850681

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850255

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????0 @b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????0 @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0 @:W S
/
_output_shapes
:?????????0 @
 
_user_specified_nameinputs
?
?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850398

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
:__inference_layer3/pointwise_conv/bn_layer_call_fn_4850368

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846865?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
X
<__inference_layer7/pointwise_conv/relu_layer_call_fn_4851100

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847783i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer6/depthwise_conv/bn_layer_call_fn_4850794

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847175?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4850695

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer6/pointwise_conv/bn_layer_call_fn_4850891

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847267?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847143

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
7__inference_layer6/pointwise_conv_layer_call_fn_4850858

inputs#
unknown:??
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4847709x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4850075

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+??????????????????????????? : : : : :*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? ?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?
?
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850908

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
:__inference_layer7/depthwise_conv/bn_layer_call_fn_4850977

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847329?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847588

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850925

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
??
?#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4848452

inputs-
layer1_conv_4848276: 
layer1_conv_bn_4848279$
layer1_conv_bn_4848281: $
layer1_conv_bn_4848283: $
layer1_conv_bn_4848285: 7
layer2_depthwise_conv_4848289: $
 layer2_depthwise_conv_bn_4848292.
 layer2_depthwise_conv_bn_4848294: .
 layer2_depthwise_conv_bn_4848296: .
 layer2_depthwise_conv_bn_4848298: 7
layer2_pointwise_conv_4848302: @$
 layer2_pointwise_conv_bn_4848305.
 layer2_pointwise_conv_bn_4848307:@.
 layer2_pointwise_conv_bn_4848309:@.
 layer2_pointwise_conv_bn_4848311:@7
layer3_depthwise_conv_4848315:@$
 layer3_depthwise_conv_bn_4848318.
 layer3_depthwise_conv_bn_4848320:@.
 layer3_depthwise_conv_bn_4848322:@.
 layer3_depthwise_conv_bn_4848324:@8
layer3_pointwise_conv_4848328:@?$
 layer3_pointwise_conv_bn_4848331/
 layer3_pointwise_conv_bn_4848333:	?/
 layer3_pointwise_conv_bn_4848335:	?/
 layer3_pointwise_conv_bn_4848337:	?8
layer4_depthwise_conv_4848341:?$
 layer4_depthwise_conv_bn_4848344/
 layer4_depthwise_conv_bn_4848346:	?/
 layer4_depthwise_conv_bn_4848348:	?/
 layer4_depthwise_conv_bn_4848350:	?9
layer4_pointwise_conv_4848354:??$
 layer4_pointwise_conv_bn_4848357/
 layer4_pointwise_conv_bn_4848359:	?/
 layer4_pointwise_conv_bn_4848361:	?/
 layer4_pointwise_conv_bn_4848363:	?8
layer5_depthwise_conv_4848367:?$
 layer5_depthwise_conv_bn_4848370/
 layer5_depthwise_conv_bn_4848372:	?/
 layer5_depthwise_conv_bn_4848374:	?/
 layer5_depthwise_conv_bn_4848376:	?9
layer5_pointwise_conv_4848380:??$
 layer5_pointwise_conv_bn_4848383/
 layer5_pointwise_conv_bn_4848385:	?/
 layer5_pointwise_conv_bn_4848387:	?/
 layer5_pointwise_conv_bn_4848389:	?8
layer6_depthwise_conv_4848393:?$
 layer6_depthwise_conv_bn_4848396/
 layer6_depthwise_conv_bn_4848398:	?/
 layer6_depthwise_conv_bn_4848400:	?/
 layer6_depthwise_conv_bn_4848402:	?9
layer6_pointwise_conv_4848406:??$
 layer6_pointwise_conv_bn_4848409/
 layer6_pointwise_conv_bn_4848411:	?/
 layer6_pointwise_conv_bn_4848413:	?/
 layer6_pointwise_conv_bn_4848415:	?8
layer7_depthwise_conv_4848419:?$
 layer7_depthwise_conv_bn_4848422/
 layer7_depthwise_conv_bn_4848424:	?/
 layer7_depthwise_conv_bn_4848426:	?/
 layer7_depthwise_conv_bn_4848428:	?9
layer7_pointwise_conv_4848432:??$
 layer7_pointwise_conv_bn_4848435/
 layer7_pointwise_conv_bn_4848437:	?/
 layer7_pointwise_conv_bn_4848439:	?/
 layer7_pointwise_conv_bn_4848441:	? 
dense_4848446:	?

dense_4848448:

identity??dense/StatefulPartitionedCall?#layer1/conv/StatefulPartitionedCall?&layer1/conv/bn/StatefulPartitionedCall?-layer2/depthwise_conv/StatefulPartitionedCall?0layer2/depthwise_conv/bn/StatefulPartitionedCall?-layer2/pointwise_conv/StatefulPartitionedCall?0layer2/pointwise_conv/bn/StatefulPartitionedCall?-layer3/depthwise_conv/StatefulPartitionedCall?0layer3/depthwise_conv/bn/StatefulPartitionedCall?-layer3/pointwise_conv/StatefulPartitionedCall?0layer3/pointwise_conv/bn/StatefulPartitionedCall?-layer4/depthwise_conv/StatefulPartitionedCall?0layer4/depthwise_conv/bn/StatefulPartitionedCall?-layer4/pointwise_conv/StatefulPartitionedCall?0layer4/pointwise_conv/bn/StatefulPartitionedCall?-layer5/depthwise_conv/StatefulPartitionedCall?0layer5/depthwise_conv/bn/StatefulPartitionedCall?-layer5/pointwise_conv/StatefulPartitionedCall?0layer5/pointwise_conv/bn/StatefulPartitionedCall?-layer6/depthwise_conv/StatefulPartitionedCall?0layer6/depthwise_conv/bn/StatefulPartitionedCall?-layer6/pointwise_conv/StatefulPartitionedCall?0layer6/pointwise_conv/bn/StatefulPartitionedCall?-layer7/depthwise_conv/StatefulPartitionedCall?0layer7/depthwise_conv/bn/StatefulPartitionedCall?-layer7/pointwise_conv/StatefulPartitionedCall?0layer7/pointwise_conv/bn/StatefulPartitionedCall?
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinputslayer1_conv_4848276*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4847429?
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_4848279layer1_conv_bn_4848281layer1_conv_bn_4848283layer1_conv_bn_4848285*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846647?
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4847447?
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_4848289*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4847458?
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_4848292 layer2_depthwise_conv_bn_4848294 layer2_depthwise_conv_bn_4848296 layer2_depthwise_conv_bn_4848298*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846709?
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847476?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_4848302*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4847485?
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_4848305 layer2_pointwise_conv_bn_4848307 layer2_pointwise_conv_bn_4848309 layer2_pointwise_conv_bn_4848311*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846771?
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847503?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_4848315*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4847514?
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_4848318 layer3_depthwise_conv_bn_4848320 layer3_depthwise_conv_bn_4848322 layer3_depthwise_conv_bn_4848324*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846833?
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847532?
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_4848328*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4847541?
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_4848331 layer3_pointwise_conv_bn_4848333 layer3_pointwise_conv_bn_4848335 layer3_pointwise_conv_bn_4848337*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846895?
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847559?
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_4848341*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4847570?
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_4848344 layer4_depthwise_conv_bn_4848346 layer4_depthwise_conv_bn_4848348 layer4_depthwise_conv_bn_4848350*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846957?
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847588?
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_4848354*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4847597?
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_4848357 layer4_pointwise_conv_bn_4848359 layer4_pointwise_conv_bn_4848361 layer4_pointwise_conv_bn_4848363*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847019?
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847615?
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_4848367*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4847626?
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_4848370 layer5_depthwise_conv_bn_4848372 layer5_depthwise_conv_bn_4848374 layer5_depthwise_conv_bn_4848376*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847081?
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847644?
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_4848380*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4847653?
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_4848383 layer5_pointwise_conv_bn_4848385 layer5_pointwise_conv_bn_4848387 layer5_pointwise_conv_bn_4848389*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847143?
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847671?
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_4848393*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4847682?
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_4848396 layer6_depthwise_conv_bn_4848398 layer6_depthwise_conv_bn_4848400 layer6_depthwise_conv_bn_4848402*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847205?
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847700?
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_4848406*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4847709?
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_4848409 layer6_pointwise_conv_bn_4848411 layer6_pointwise_conv_bn_4848413 layer6_pointwise_conv_bn_4848415*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847267?
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847727?
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_4848419*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4847738?
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_4848422 layer7_depthwise_conv_bn_4848424 layer7_depthwise_conv_bn_4848426 layer7_depthwise_conv_bn_4848428*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847329?
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847756?
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_4848432*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4847765?
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_4848435 layer7_pointwise_conv_bn_4848437 layer7_pointwise_conv_bn_4848439 layer7_pointwise_conv_bn_4848441*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847391?
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847783?
(global_average_pooling2d/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4847412?
dense/StatefulPartitionedCallStatefulPartitionedCall1global_average_pooling2d/PartitionedCall:output:0dense_4848446dense_4848448*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_4847796u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
?

NoOpNoOp^dense/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2J
#layer1/conv/StatefulPartitionedCall#layer1/conv/StatefulPartitionedCall2P
&layer1/conv/bn/StatefulPartitionedCall&layer1/conv/bn/StatefulPartitionedCall2^
-layer2/depthwise_conv/StatefulPartitionedCall-layer2/depthwise_conv/StatefulPartitionedCall2d
0layer2/depthwise_conv/bn/StatefulPartitionedCall0layer2/depthwise_conv/bn/StatefulPartitionedCall2^
-layer2/pointwise_conv/StatefulPartitionedCall-layer2/pointwise_conv/StatefulPartitionedCall2d
0layer2/pointwise_conv/bn/StatefulPartitionedCall0layer2/pointwise_conv/bn/StatefulPartitionedCall2^
-layer3/depthwise_conv/StatefulPartitionedCall-layer3/depthwise_conv/StatefulPartitionedCall2d
0layer3/depthwise_conv/bn/StatefulPartitionedCall0layer3/depthwise_conv/bn/StatefulPartitionedCall2^
-layer3/pointwise_conv/StatefulPartitionedCall-layer3/pointwise_conv/StatefulPartitionedCall2d
0layer3/pointwise_conv/bn/StatefulPartitionedCall0layer3/pointwise_conv/bn/StatefulPartitionedCall2^
-layer4/depthwise_conv/StatefulPartitionedCall-layer4/depthwise_conv/StatefulPartitionedCall2d
0layer4/depthwise_conv/bn/StatefulPartitionedCall0layer4/depthwise_conv/bn/StatefulPartitionedCall2^
-layer4/pointwise_conv/StatefulPartitionedCall-layer4/pointwise_conv/StatefulPartitionedCall2d
0layer4/pointwise_conv/bn/StatefulPartitionedCall0layer4/pointwise_conv/bn/StatefulPartitionedCall2^
-layer5/depthwise_conv/StatefulPartitionedCall-layer5/depthwise_conv/StatefulPartitionedCall2d
0layer5/depthwise_conv/bn/StatefulPartitionedCall0layer5/depthwise_conv/bn/StatefulPartitionedCall2^
-layer5/pointwise_conv/StatefulPartitionedCall-layer5/pointwise_conv/StatefulPartitionedCall2d
0layer5/pointwise_conv/bn/StatefulPartitionedCall0layer5/pointwise_conv/bn/StatefulPartitionedCall2^
-layer6/depthwise_conv/StatefulPartitionedCall-layer6/depthwise_conv/StatefulPartitionedCall2d
0layer6/depthwise_conv/bn/StatefulPartitionedCall0layer6/depthwise_conv/bn/StatefulPartitionedCall2^
-layer6/pointwise_conv/StatefulPartitionedCall-layer6/pointwise_conv/StatefulPartitionedCall2d
0layer6/pointwise_conv/bn/StatefulPartitionedCall0layer6/pointwise_conv/bn/StatefulPartitionedCall2^
-layer7/depthwise_conv/StatefulPartitionedCall-layer7/depthwise_conv/StatefulPartitionedCall2d
0layer7/depthwise_conv/bn/StatefulPartitionedCall0layer7/depthwise_conv/bn/StatefulPartitionedCall2^
-layer7/pointwise_conv/StatefulPartitionedCall-layer7/pointwise_conv/StatefulPartitionedCall2d
0layer7/pointwise_conv/bn/StatefulPartitionedCall0layer7/pointwise_conv/bn/StatefulPartitionedCall:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
??
?G
"__inference__wrapped_model_4846596
input_1R
8yamnet_frames_layer1_conv_conv2d_readvariableop_resource: &
"yamnet_frames_layer1_conv_bn_scaleB
4yamnet_frames_layer1_conv_bn_readvariableop_resource: S
Eyamnet_frames_layer1_conv_bn_fusedbatchnormv3_readvariableop_resource: U
Gyamnet_frames_layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource: _
Eyamnet_frames_layer2_depthwise_conv_depthwise_readvariableop_resource: 0
,yamnet_frames_layer2_depthwise_conv_bn_scaleL
>yamnet_frames_layer2_depthwise_conv_bn_readvariableop_resource: ]
Oyamnet_frames_layer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource: _
Qyamnet_frames_layer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource: \
Byamnet_frames_layer2_pointwise_conv_conv2d_readvariableop_resource: @0
,yamnet_frames_layer2_pointwise_conv_bn_scaleL
>yamnet_frames_layer2_pointwise_conv_bn_readvariableop_resource:@]
Oyamnet_frames_layer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:@_
Qyamnet_frames_layer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:@_
Eyamnet_frames_layer3_depthwise_conv_depthwise_readvariableop_resource:@0
,yamnet_frames_layer3_depthwise_conv_bn_scaleL
>yamnet_frames_layer3_depthwise_conv_bn_readvariableop_resource:@]
Oyamnet_frames_layer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:@_
Qyamnet_frames_layer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:@]
Byamnet_frames_layer3_pointwise_conv_conv2d_readvariableop_resource:@?0
,yamnet_frames_layer3_pointwise_conv_bn_scaleM
>yamnet_frames_layer3_pointwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?`
Eyamnet_frames_layer4_depthwise_conv_depthwise_readvariableop_resource:?0
,yamnet_frames_layer4_depthwise_conv_bn_scaleM
>yamnet_frames_layer4_depthwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?^
Byamnet_frames_layer4_pointwise_conv_conv2d_readvariableop_resource:??0
,yamnet_frames_layer4_pointwise_conv_bn_scaleM
>yamnet_frames_layer4_pointwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?`
Eyamnet_frames_layer5_depthwise_conv_depthwise_readvariableop_resource:?0
,yamnet_frames_layer5_depthwise_conv_bn_scaleM
>yamnet_frames_layer5_depthwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?^
Byamnet_frames_layer5_pointwise_conv_conv2d_readvariableop_resource:??0
,yamnet_frames_layer5_pointwise_conv_bn_scaleM
>yamnet_frames_layer5_pointwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?`
Eyamnet_frames_layer6_depthwise_conv_depthwise_readvariableop_resource:?0
,yamnet_frames_layer6_depthwise_conv_bn_scaleM
>yamnet_frames_layer6_depthwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?^
Byamnet_frames_layer6_pointwise_conv_conv2d_readvariableop_resource:??0
,yamnet_frames_layer6_pointwise_conv_bn_scaleM
>yamnet_frames_layer6_pointwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?`
Eyamnet_frames_layer7_depthwise_conv_depthwise_readvariableop_resource:?0
,yamnet_frames_layer7_depthwise_conv_bn_scaleM
>yamnet_frames_layer7_depthwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?^
Byamnet_frames_layer7_pointwise_conv_conv2d_readvariableop_resource:??0
,yamnet_frames_layer7_pointwise_conv_bn_scaleM
>yamnet_frames_layer7_pointwise_conv_bn_readvariableop_resource:	?^
Oyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?`
Qyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?E
2yamnet_frames_dense_matmul_readvariableop_resource:	?
A
3yamnet_frames_dense_biasadd_readvariableop_resource:

identity??*yamnet_frames/dense/BiasAdd/ReadVariableOp?)yamnet_frames/dense/MatMul/ReadVariableOp?/yamnet_frames/layer1/conv/Conv2D/ReadVariableOp?<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp?>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1?+yamnet_frames/layer1/conv/bn/ReadVariableOp?Fyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp?<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp?9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp?Fyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp?Fyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp?<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp?9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp?Fyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp?Fyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp?<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp?9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp?Fyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp?Fyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp?<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp?9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp?Fyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp?Fyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp?<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp?9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp?Fyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp?Fyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp?<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp?9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp?Fyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp?
/yamnet_frames/layer1/conv/Conv2D/ReadVariableOpReadVariableOp8yamnet_frames_layer1_conv_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0?
 yamnet_frames/layer1/conv/Conv2DConv2Dinput_17yamnet_frames/layer1/conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
?
+yamnet_frames/layer1/conv/bn/ReadVariableOpReadVariableOp4yamnet_frames_layer1_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpEyamnet_frames_layer1_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpGyamnet_frames_layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
-yamnet_frames/layer1/conv/bn/FusedBatchNormV3FusedBatchNormV3)yamnet_frames/layer1/conv/Conv2D:output:0"yamnet_frames_layer1_conv_bn_scale3yamnet_frames/layer1/conv/bn/ReadVariableOp:value:0Dyamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Fyamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0  : : : : :*
is_training( ?
yamnet_frames/layer1/relu/ReluRelu1yamnet_frames/layer1/conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0  ?
<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer2_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
: *
dtype0?
3yamnet_frames/layer2/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"             ?
;yamnet_frames/layer2/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
-yamnet_frames/layer2/depthwise_conv/depthwiseDepthwiseConv2dNative,yamnet_frames/layer1/relu/Relu:activations:0Dyamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
?
5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer2_depthwise_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
Fyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
7yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer2/depthwise_conv/depthwise:output:0,yamnet_frames_layer2_depthwise_conv_bn_scale=yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0  : : : : :*
is_training( ?
-yamnet_frames/layer2/depthwise_conv/relu/ReluRelu;yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0  ?
9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer2_pointwise_conv_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0?
*yamnet_frames/layer2/pointwise_conv/Conv2DConv2D;yamnet_frames/layer2/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0 @*
paddingSAME*
strides
?
5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer2_pointwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0?
Fyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
7yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer2/pointwise_conv/Conv2D:output:0,yamnet_frames_layer2_pointwise_conv_bn_scale=yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0 @:@:@:@:@:*
is_training( ?
-yamnet_frames/layer2/pointwise_conv/relu/ReluRelu;yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0 @?
<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer3_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
:@*
dtype0?
3yamnet_frames/layer3/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      @      ?
;yamnet_frames/layer3/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
-yamnet_frames/layer3/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer2/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????@*
paddingSAME*
strides
?
5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer3_depthwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0?
Fyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
7yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer3/depthwise_conv/depthwise:output:0,yamnet_frames_layer3_depthwise_conv_bn_scale=yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????@:@:@:@:@:*
is_training( ?
-yamnet_frames/layer3/depthwise_conv/relu/ReluRelu;yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????@?
9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer3_pointwise_conv_conv2d_readvariableop_resource*'
_output_shapes
:@?*
dtype0?
*yamnet_frames/layer3/pointwise_conv/Conv2DConv2D;yamnet_frames/layer3/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer3_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer3/pointwise_conv/Conv2D:output:0,yamnet_frames_layer3_pointwise_conv_bn_scale=yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer3/pointwise_conv/relu/ReluRelu;yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer4_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0?
3yamnet_frames/layer4/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      ?
;yamnet_frames/layer4/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
-yamnet_frames/layer4/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer3/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer4_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer4/depthwise_conv/depthwise:output:0,yamnet_frames_layer4_depthwise_conv_bn_scale=yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer4/depthwise_conv/relu/ReluRelu;yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer4_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
*yamnet_frames/layer4/pointwise_conv/Conv2DConv2D;yamnet_frames/layer4/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer4_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer4/pointwise_conv/Conv2D:output:0,yamnet_frames_layer4_pointwise_conv_bn_scale=yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer4/pointwise_conv/relu/ReluRelu;yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer5_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0?
3yamnet_frames/layer5/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      ?
;yamnet_frames/layer5/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
-yamnet_frames/layer5/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer4/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer5_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer5/depthwise_conv/depthwise:output:0,yamnet_frames_layer5_depthwise_conv_bn_scale=yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer5/depthwise_conv/relu/ReluRelu;yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer5_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
*yamnet_frames/layer5/pointwise_conv/Conv2DConv2D;yamnet_frames/layer5/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer5_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer5/pointwise_conv/Conv2D:output:0,yamnet_frames_layer5_pointwise_conv_bn_scale=yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer5/pointwise_conv/relu/ReluRelu;yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer6_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0?
3yamnet_frames/layer6/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ?
;yamnet_frames/layer6/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
-yamnet_frames/layer6/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer5/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer6_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer6/depthwise_conv/depthwise:output:0,yamnet_frames_layer6_depthwise_conv_bn_scale=yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer6/depthwise_conv/relu/ReluRelu;yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer6_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
*yamnet_frames/layer6/pointwise_conv/Conv2DConv2D;yamnet_frames/layer6/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer6_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer6/pointwise_conv/Conv2D:output:0,yamnet_frames_layer6_pointwise_conv_bn_scale=yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer6/pointwise_conv/relu/ReluRelu;yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer7_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0?
3yamnet_frames/layer7/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ?
;yamnet_frames/layer7/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
-yamnet_frames/layer7/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer6/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer7_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer7/depthwise_conv/depthwise:output:0,yamnet_frames_layer7_depthwise_conv_bn_scale=yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer7/depthwise_conv/relu/ReluRelu;yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer7_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
*yamnet_frames/layer7/pointwise_conv/Conv2DConv2D;yamnet_frames/layer7/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer7_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Fyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
7yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer7/pointwise_conv/Conv2D:output:0,yamnet_frames_layer7_pointwise_conv_bn_scale=yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
is_training( ?
-yamnet_frames/layer7/pointwise_conv/relu/ReluRelu;yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
=yamnet_frames/global_average_pooling2d/Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      ?
+yamnet_frames/global_average_pooling2d/MeanMean;yamnet_frames/layer7/pointwise_conv/relu/Relu:activations:0Fyamnet_frames/global_average_pooling2d/Mean/reduction_indices:output:0*
T0*(
_output_shapes
:???????????
)yamnet_frames/dense/MatMul/ReadVariableOpReadVariableOp2yamnet_frames_dense_matmul_readvariableop_resource*
_output_shapes
:	?
*
dtype0?
yamnet_frames/dense/MatMulMatMul4yamnet_frames/global_average_pooling2d/Mean:output:01yamnet_frames/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
?
*yamnet_frames/dense/BiasAdd/ReadVariableOpReadVariableOp3yamnet_frames_dense_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0?
yamnet_frames/dense/BiasAddBiasAdd$yamnet_frames/dense/MatMul:product:02yamnet_frames/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
s
IdentityIdentity$yamnet_frames/dense/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????
?
NoOpNoOp+^yamnet_frames/dense/BiasAdd/ReadVariableOp*^yamnet_frames/dense/MatMul/ReadVariableOp0^yamnet_frames/layer1/conv/Conv2D/ReadVariableOp=^yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp?^yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1,^yamnet_frames/layer1/conv/bn/ReadVariableOpG^yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2X
*yamnet_frames/dense/BiasAdd/ReadVariableOp*yamnet_frames/dense/BiasAdd/ReadVariableOp2V
)yamnet_frames/dense/MatMul/ReadVariableOp)yamnet_frames/dense/MatMul/ReadVariableOp2b
/yamnet_frames/layer1/conv/Conv2D/ReadVariableOp/yamnet_frames/layer1/conv/Conv2D/ReadVariableOp2|
<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp2?
>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_12Z
+yamnet_frames/layer1/conv/bn/ReadVariableOp+yamnet_frames/layer1/conv/bn/ReadVariableOp2?
Fyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp2?
Fyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp2?
Fyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp2?
Fyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp2?
Fyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp2?
Fyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp2?
Fyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp2?
Fyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp2?
Fyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp2?
Fyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp2?
Fyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp2?
Fyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2?
Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp:X T
/
_output_shapes
:?????????`@
!
_user_specified_name	input_1: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850245

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
q
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4851116

inputs
identityg
Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      p
MeanMeaninputsMean/reduction_indices:output:0*
T0*0
_output_shapes
:??????????????????^
IdentityIdentityMean:output:0*
T0*0
_output_shapes
:??????????????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4????????????????????????????????????:r n
J
_output_shapes8
6:4????????????????????????????????????
 
_user_specified_nameinputs
?
?
7__inference_layer3/depthwise_conv_layer_call_fn_4850262

inputs!
unknown:@
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4847514w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:?????????@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0 @: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????0 @
 
_user_specified_nameinputs
?
X
<__inference_layer6/depthwise_conv/relu_layer_call_fn_4850846

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847700i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
X
<__inference_layer3/depthwise_conv/relu_layer_call_fn_4850336

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847532h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:?????????@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?	
?
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4847514

inputs;
!depthwise_readvariableop_resource:@
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*&
_output_shapes
:@*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      @      h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????@*
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:?????????@a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0 @: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:?????????0 @
 
_user_specified_nameinputs
?	
?
B__inference_dense_layer_call_and_return_conditional_losses_4847796

inputs1
matmul_readvariableop_resource:	?
-
biasadd_readvariableop_resource:

identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????
w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
-__inference_layer1/conv_layer_call_fn_4850008

inputs!
unknown: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4847429w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:?????????0  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????`@: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs
?	
?
:__inference_layer3/depthwise_conv/bn_layer_call_fn_4850297

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+???????????????????????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846833?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4850015

inputs8
conv2d_readvariableop_resource: 
identity??Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:?????????0  ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????`@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs
?	
?
:__inference_layer5/pointwise_conv/bn_layer_call_fn_4850708

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847113?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4847458

inputs;
!depthwise_readvariableop_resource: 
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*&
_output_shapes
: *
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"             h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:?????????0  a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0  : 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?	
?
:__inference_layer4/pointwise_conv/bn_layer_call_fn_4850551

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847019?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850314

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847051

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
:__inference_layer5/depthwise_conv/bn_layer_call_fn_4850637

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847081?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850738

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847532

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????@b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????@:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
?
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850671

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?!
?
/__inference_yamnet_frames_layer_call_fn_4849370

inputs!
unknown: 
	unknown_0
	unknown_1: 
	unknown_2: 
	unknown_3: #
	unknown_4: 
	unknown_5
	unknown_6: 
	unknown_7: 
	unknown_8: #
	unknown_9: @

unknown_10

unknown_11:@

unknown_12:@

unknown_13:@$

unknown_14:@

unknown_15

unknown_16:@

unknown_17:@

unknown_18:@%

unknown_19:@?

unknown_20

unknown_21:	?

unknown_22:	?

unknown_23:	?%

unknown_24:?

unknown_25

unknown_26:	?

unknown_27:	?

unknown_28:	?&

unknown_29:??

unknown_30

unknown_31:	?

unknown_32:	?

unknown_33:	?%

unknown_34:?

unknown_35

unknown_36:	?

unknown_37:	?

unknown_38:	?&

unknown_39:??

unknown_40

unknown_41:	?

unknown_42:	?

unknown_43:	?%

unknown_44:?

unknown_45

unknown_46:	?

unknown_47:	?

unknown_48:	?&

unknown_49:??

unknown_50

unknown_51:	?

unknown_52:	?

unknown_53:	?%

unknown_54:?

unknown_55

unknown_56:	?

unknown_57:	?

unknown_58:	?&

unknown_59:??

unknown_60

unknown_61:	?

unknown_62:	?

unknown_63:	?

unknown_64:	?


unknown_65:

identity??StatefulPartitionedCall?	
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62
unknown_63
unknown_64
unknown_65*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*>
_read_only_resource_inputs 
!$&)+.0358:=?BC*0
config_proto 

CPU

GPU2*0J 8? *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4848452o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
s
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847615

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer6/depthwise_conv/bn_layer_call_fn_4850807

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847205?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850851

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer7/pointwise_conv/bn_layer_call_fn_4851061

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847391?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
s
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850935

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
X
<__inference_layer3/pointwise_conv/relu_layer_call_fn_4850420

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847559i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4851105

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
:__inference_layer3/depthwise_conv/bn_layer_call_fn_4850284

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+???????????????????????????@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846803?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850484

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
X
<__inference_layer5/depthwise_conv/relu_layer_call_fn_4850676

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847644i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?	
?
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4850611

inputs<
!depthwise_readvariableop_resource:?
identity??depthwise/ReadVariableOp?
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:??????????a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847700

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846803

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847175

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846927

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846771

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?	
?
:__inference_layer3/pointwise_conv/bn_layer_call_fn_4850381

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846895?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
d
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4850085

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:?????????0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:?????????0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0  :W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?
s
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850425

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850501

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4851095

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
X
<__inference_layer2/depthwise_conv/relu_layer_call_fn_4850166

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847476h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:?????????0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0  :W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?	
?
:__inference_layer7/depthwise_conv/bn_layer_call_fn_4850964

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847299?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?	
?
:__inference_layer2/pointwise_conv/bn_layer_call_fn_4850211

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+???????????????????????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846771?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
s
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847727

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
X
<__inference_layer2/pointwise_conv/relu_layer_call_fn_4850250

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847503h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:?????????0 @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0 @:W S
/
_output_shapes
:?????????0 @
 
_user_specified_nameinputs
?
?
7__inference_layer3/pointwise_conv_layer_call_fn_4850348

inputs"
unknown:@?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4847541x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????@: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????@
 
_user_specified_nameinputs
?
s
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847644

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847081

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4847485

inputs8
conv2d_readvariableop_resource: @
identity??Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0 @*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:?????????0 @^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0  : 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?
?
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846957

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847299

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850228

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?	
?
0__inference_layer1/conv/bn_layer_call_fn_4850041

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+??????????????????????????? *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846647?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+??????????????????????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+??????????????????????????? : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+??????????????????????????? 
 
_user_specified_nameinputs: 

_output_shapes
: 
?	
?
:__inference_layer5/pointwise_conv/bn_layer_call_fn_4850721

inputs
unknown
	unknown_0:	?
	unknown_1:	?
	unknown_2:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,????????????????????????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847143?
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,????????????????????????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
I
-__inference_layer1/relu_layer_call_fn_4850080

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4847447h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:?????????0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:?????????0  :W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?!
?
/__inference_yamnet_frames_layer_call_fn_4847940
input_1!
unknown: 
	unknown_0
	unknown_1: 
	unknown_2: 
	unknown_3: #
	unknown_4: 
	unknown_5
	unknown_6: 
	unknown_7: 
	unknown_8: #
	unknown_9: @

unknown_10

unknown_11:@

unknown_12:@

unknown_13:@$

unknown_14:@

unknown_15

unknown_16:@

unknown_17:@

unknown_18:@%

unknown_19:@?

unknown_20

unknown_21:	?

unknown_22:	?

unknown_23:	?%

unknown_24:?

unknown_25

unknown_26:	?

unknown_27:	?

unknown_28:	?&

unknown_29:??

unknown_30

unknown_31:	?

unknown_32:	?

unknown_33:	?%

unknown_34:?

unknown_35

unknown_36:	?

unknown_37:	?

unknown_38:	?&

unknown_39:??

unknown_40

unknown_41:	?

unknown_42:	?

unknown_43:	?%

unknown_44:?

unknown_45

unknown_46:	?

unknown_47:	?

unknown_48:	?&

unknown_49:??

unknown_50

unknown_51:	?

unknown_52:	?

unknown_53:	?%

unknown_54:?

unknown_55

unknown_56:	?

unknown_57:	?

unknown_58:	?&

unknown_59:??

unknown_60

unknown_61:	?

unknown_62:	?

unknown_63:	?

unknown_64:	?


unknown_65:

identity??StatefulPartitionedCall?	
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62
unknown_63
unknown_64
unknown_65*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8? *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4847803o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:?????????`@
!
_user_specified_name	input_1: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846865

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
??
?#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4848907
input_1-
layer1_conv_4848731: 
layer1_conv_bn_4848734$
layer1_conv_bn_4848736: $
layer1_conv_bn_4848738: $
layer1_conv_bn_4848740: 7
layer2_depthwise_conv_4848744: $
 layer2_depthwise_conv_bn_4848747.
 layer2_depthwise_conv_bn_4848749: .
 layer2_depthwise_conv_bn_4848751: .
 layer2_depthwise_conv_bn_4848753: 7
layer2_pointwise_conv_4848757: @$
 layer2_pointwise_conv_bn_4848760.
 layer2_pointwise_conv_bn_4848762:@.
 layer2_pointwise_conv_bn_4848764:@.
 layer2_pointwise_conv_bn_4848766:@7
layer3_depthwise_conv_4848770:@$
 layer3_depthwise_conv_bn_4848773.
 layer3_depthwise_conv_bn_4848775:@.
 layer3_depthwise_conv_bn_4848777:@.
 layer3_depthwise_conv_bn_4848779:@8
layer3_pointwise_conv_4848783:@?$
 layer3_pointwise_conv_bn_4848786/
 layer3_pointwise_conv_bn_4848788:	?/
 layer3_pointwise_conv_bn_4848790:	?/
 layer3_pointwise_conv_bn_4848792:	?8
layer4_depthwise_conv_4848796:?$
 layer4_depthwise_conv_bn_4848799/
 layer4_depthwise_conv_bn_4848801:	?/
 layer4_depthwise_conv_bn_4848803:	?/
 layer4_depthwise_conv_bn_4848805:	?9
layer4_pointwise_conv_4848809:??$
 layer4_pointwise_conv_bn_4848812/
 layer4_pointwise_conv_bn_4848814:	?/
 layer4_pointwise_conv_bn_4848816:	?/
 layer4_pointwise_conv_bn_4848818:	?8
layer5_depthwise_conv_4848822:?$
 layer5_depthwise_conv_bn_4848825/
 layer5_depthwise_conv_bn_4848827:	?/
 layer5_depthwise_conv_bn_4848829:	?/
 layer5_depthwise_conv_bn_4848831:	?9
layer5_pointwise_conv_4848835:??$
 layer5_pointwise_conv_bn_4848838/
 layer5_pointwise_conv_bn_4848840:	?/
 layer5_pointwise_conv_bn_4848842:	?/
 layer5_pointwise_conv_bn_4848844:	?8
layer6_depthwise_conv_4848848:?$
 layer6_depthwise_conv_bn_4848851/
 layer6_depthwise_conv_bn_4848853:	?/
 layer6_depthwise_conv_bn_4848855:	?/
 layer6_depthwise_conv_bn_4848857:	?9
layer6_pointwise_conv_4848861:??$
 layer6_pointwise_conv_bn_4848864/
 layer6_pointwise_conv_bn_4848866:	?/
 layer6_pointwise_conv_bn_4848868:	?/
 layer6_pointwise_conv_bn_4848870:	?8
layer7_depthwise_conv_4848874:?$
 layer7_depthwise_conv_bn_4848877/
 layer7_depthwise_conv_bn_4848879:	?/
 layer7_depthwise_conv_bn_4848881:	?/
 layer7_depthwise_conv_bn_4848883:	?9
layer7_pointwise_conv_4848887:??$
 layer7_pointwise_conv_bn_4848890/
 layer7_pointwise_conv_bn_4848892:	?/
 layer7_pointwise_conv_bn_4848894:	?/
 layer7_pointwise_conv_bn_4848896:	? 
dense_4848901:	?

dense_4848903:

identity??dense/StatefulPartitionedCall?#layer1/conv/StatefulPartitionedCall?&layer1/conv/bn/StatefulPartitionedCall?-layer2/depthwise_conv/StatefulPartitionedCall?0layer2/depthwise_conv/bn/StatefulPartitionedCall?-layer2/pointwise_conv/StatefulPartitionedCall?0layer2/pointwise_conv/bn/StatefulPartitionedCall?-layer3/depthwise_conv/StatefulPartitionedCall?0layer3/depthwise_conv/bn/StatefulPartitionedCall?-layer3/pointwise_conv/StatefulPartitionedCall?0layer3/pointwise_conv/bn/StatefulPartitionedCall?-layer4/depthwise_conv/StatefulPartitionedCall?0layer4/depthwise_conv/bn/StatefulPartitionedCall?-layer4/pointwise_conv/StatefulPartitionedCall?0layer4/pointwise_conv/bn/StatefulPartitionedCall?-layer5/depthwise_conv/StatefulPartitionedCall?0layer5/depthwise_conv/bn/StatefulPartitionedCall?-layer5/pointwise_conv/StatefulPartitionedCall?0layer5/pointwise_conv/bn/StatefulPartitionedCall?-layer6/depthwise_conv/StatefulPartitionedCall?0layer6/depthwise_conv/bn/StatefulPartitionedCall?-layer6/pointwise_conv/StatefulPartitionedCall?0layer6/pointwise_conv/bn/StatefulPartitionedCall?-layer7/depthwise_conv/StatefulPartitionedCall?0layer7/depthwise_conv/bn/StatefulPartitionedCall?-layer7/pointwise_conv/StatefulPartitionedCall?0layer7/pointwise_conv/bn/StatefulPartitionedCall?
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinput_1layer1_conv_4848731*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4847429?
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_4848734layer1_conv_bn_4848736layer1_conv_bn_4848738layer1_conv_bn_4848740*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4846617?
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4847447?
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_4848744*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4847458?
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_4848747 layer2_depthwise_conv_bn_4848749 layer2_depthwise_conv_bn_4848751 layer2_depthwise_conv_bn_4848753*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846679?
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847476?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_4848757*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4847485?
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_4848760 layer2_pointwise_conv_bn_4848762 layer2_pointwise_conv_bn_4848764 layer2_pointwise_conv_bn_4848766*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846741?
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847503?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_4848770*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4847514?
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_4848773 layer3_depthwise_conv_bn_4848775 layer3_depthwise_conv_bn_4848777 layer3_depthwise_conv_bn_4848779*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846803?
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847532?
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_4848783*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4847541?
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_4848786 layer3_pointwise_conv_bn_4848788 layer3_pointwise_conv_bn_4848790 layer3_pointwise_conv_bn_4848792*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846865?
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847559?
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_4848796*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4847570?
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_4848799 layer4_depthwise_conv_bn_4848801 layer4_depthwise_conv_bn_4848803 layer4_depthwise_conv_bn_4848805*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4846927?
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847588?
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_4848809*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4847597?
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_4848812 layer4_pointwise_conv_bn_4848814 layer4_pointwise_conv_bn_4848816 layer4_pointwise_conv_bn_4848818*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4846989?
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847615?
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_4848822*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4847626?
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_4848825 layer5_depthwise_conv_bn_4848827 layer5_depthwise_conv_bn_4848829 layer5_depthwise_conv_bn_4848831*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847051?
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847644?
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_4848835*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4847653?
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_4848838 layer5_pointwise_conv_bn_4848840 layer5_pointwise_conv_bn_4848842 layer5_pointwise_conv_bn_4848844*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847113?
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847671?
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_4848848*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4847682?
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_4848851 layer6_depthwise_conv_bn_4848853 layer6_depthwise_conv_bn_4848855 layer6_depthwise_conv_bn_4848857*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847175?
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847700?
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_4848861*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4847709?
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_4848864 layer6_pointwise_conv_bn_4848866 layer6_pointwise_conv_bn_4848868 layer6_pointwise_conv_bn_4848870*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847237?
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847727?
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_4848874*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4847738?
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_4848877 layer7_depthwise_conv_bn_4848879 layer7_depthwise_conv_bn_4848881 layer7_depthwise_conv_bn_4848883*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4847299?
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847756?
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_4848887*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4847765?
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_4848890 layer7_pointwise_conv_bn_4848892 layer7_pointwise_conv_bn_4848894 layer7_pointwise_conv_bn_4848896*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847361?
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847783?
(global_average_pooling2d/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *^
fYRW
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4847412?
dense/StatefulPartitionedCallStatefulPartitionedCall1global_average_pooling2d/PartitionedCall:output:0dense_4848901dense_4848903*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_4847796u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
?

NoOpNoOp^dense/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2J
#layer1/conv/StatefulPartitionedCall#layer1/conv/StatefulPartitionedCall2P
&layer1/conv/bn/StatefulPartitionedCall&layer1/conv/bn/StatefulPartitionedCall2^
-layer2/depthwise_conv/StatefulPartitionedCall-layer2/depthwise_conv/StatefulPartitionedCall2d
0layer2/depthwise_conv/bn/StatefulPartitionedCall0layer2/depthwise_conv/bn/StatefulPartitionedCall2^
-layer2/pointwise_conv/StatefulPartitionedCall-layer2/pointwise_conv/StatefulPartitionedCall2d
0layer2/pointwise_conv/bn/StatefulPartitionedCall0layer2/pointwise_conv/bn/StatefulPartitionedCall2^
-layer3/depthwise_conv/StatefulPartitionedCall-layer3/depthwise_conv/StatefulPartitionedCall2d
0layer3/depthwise_conv/bn/StatefulPartitionedCall0layer3/depthwise_conv/bn/StatefulPartitionedCall2^
-layer3/pointwise_conv/StatefulPartitionedCall-layer3/pointwise_conv/StatefulPartitionedCall2d
0layer3/pointwise_conv/bn/StatefulPartitionedCall0layer3/pointwise_conv/bn/StatefulPartitionedCall2^
-layer4/depthwise_conv/StatefulPartitionedCall-layer4/depthwise_conv/StatefulPartitionedCall2d
0layer4/depthwise_conv/bn/StatefulPartitionedCall0layer4/depthwise_conv/bn/StatefulPartitionedCall2^
-layer4/pointwise_conv/StatefulPartitionedCall-layer4/pointwise_conv/StatefulPartitionedCall2d
0layer4/pointwise_conv/bn/StatefulPartitionedCall0layer4/pointwise_conv/bn/StatefulPartitionedCall2^
-layer5/depthwise_conv/StatefulPartitionedCall-layer5/depthwise_conv/StatefulPartitionedCall2d
0layer5/depthwise_conv/bn/StatefulPartitionedCall0layer5/depthwise_conv/bn/StatefulPartitionedCall2^
-layer5/pointwise_conv/StatefulPartitionedCall-layer5/pointwise_conv/StatefulPartitionedCall2d
0layer5/pointwise_conv/bn/StatefulPartitionedCall0layer5/pointwise_conv/bn/StatefulPartitionedCall2^
-layer6/depthwise_conv/StatefulPartitionedCall-layer6/depthwise_conv/StatefulPartitionedCall2d
0layer6/depthwise_conv/bn/StatefulPartitionedCall0layer6/depthwise_conv/bn/StatefulPartitionedCall2^
-layer6/pointwise_conv/StatefulPartitionedCall-layer6/pointwise_conv/StatefulPartitionedCall2d
0layer6/pointwise_conv/bn/StatefulPartitionedCall0layer6/pointwise_conv/bn/StatefulPartitionedCall2^
-layer7/depthwise_conv/StatefulPartitionedCall-layer7/depthwise_conv/StatefulPartitionedCall2d
0layer7/depthwise_conv/bn/StatefulPartitionedCall0layer7/depthwise_conv/bn/StatefulPartitionedCall2^
-layer7/pointwise_conv/StatefulPartitionedCall-layer7/pointwise_conv/StatefulPartitionedCall2d
0layer7/pointwise_conv/bn/StatefulPartitionedCall0layer7/pointwise_conv/bn/StatefulPartitionedCall:X T
/
_output_shapes
:?????????`@
!
_user_specified_name	input_1: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
'__inference_dense_layer_call_fn_4851125

inputs
unknown:	?

	unknown_0:

identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_4847796o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
??
?X
#__inference__traced_restore_4851895
file_prefix=
#assignvariableop_layer1_conv_kernel: 4
&assignvariableop_1_layer1_conv_bn_beta: ;
-assignvariableop_2_layer1_conv_bn_moving_mean: ?
1assignvariableop_3_layer1_conv_bn_moving_variance: S
9assignvariableop_4_layer2_depthwise_conv_depthwise_kernel: >
0assignvariableop_5_layer2_depthwise_conv_bn_beta: E
7assignvariableop_6_layer2_depthwise_conv_bn_moving_mean: I
;assignvariableop_7_layer2_depthwise_conv_bn_moving_variance: I
/assignvariableop_8_layer2_pointwise_conv_kernel: @>
0assignvariableop_9_layer2_pointwise_conv_bn_beta:@F
8assignvariableop_10_layer2_pointwise_conv_bn_moving_mean:@J
<assignvariableop_11_layer2_pointwise_conv_bn_moving_variance:@T
:assignvariableop_12_layer3_depthwise_conv_depthwise_kernel:@?
1assignvariableop_13_layer3_depthwise_conv_bn_beta:@F
8assignvariableop_14_layer3_depthwise_conv_bn_moving_mean:@J
<assignvariableop_15_layer3_depthwise_conv_bn_moving_variance:@K
0assignvariableop_16_layer3_pointwise_conv_kernel:@?@
1assignvariableop_17_layer3_pointwise_conv_bn_beta:	?G
8assignvariableop_18_layer3_pointwise_conv_bn_moving_mean:	?K
<assignvariableop_19_layer3_pointwise_conv_bn_moving_variance:	?U
:assignvariableop_20_layer4_depthwise_conv_depthwise_kernel:?@
1assignvariableop_21_layer4_depthwise_conv_bn_beta:	?G
8assignvariableop_22_layer4_depthwise_conv_bn_moving_mean:	?K
<assignvariableop_23_layer4_depthwise_conv_bn_moving_variance:	?L
0assignvariableop_24_layer4_pointwise_conv_kernel:??@
1assignvariableop_25_layer4_pointwise_conv_bn_beta:	?G
8assignvariableop_26_layer4_pointwise_conv_bn_moving_mean:	?K
<assignvariableop_27_layer4_pointwise_conv_bn_moving_variance:	?U
:assignvariableop_28_layer5_depthwise_conv_depthwise_kernel:?@
1assignvariableop_29_layer5_depthwise_conv_bn_beta:	?G
8assignvariableop_30_layer5_depthwise_conv_bn_moving_mean:	?K
<assignvariableop_31_layer5_depthwise_conv_bn_moving_variance:	?L
0assignvariableop_32_layer5_pointwise_conv_kernel:??@
1assignvariableop_33_layer5_pointwise_conv_bn_beta:	?G
8assignvariableop_34_layer5_pointwise_conv_bn_moving_mean:	?K
<assignvariableop_35_layer5_pointwise_conv_bn_moving_variance:	?U
:assignvariableop_36_layer6_depthwise_conv_depthwise_kernel:?@
1assignvariableop_37_layer6_depthwise_conv_bn_beta:	?G
8assignvariableop_38_layer6_depthwise_conv_bn_moving_mean:	?K
<assignvariableop_39_layer6_depthwise_conv_bn_moving_variance:	?L
0assignvariableop_40_layer6_pointwise_conv_kernel:??@
1assignvariableop_41_layer6_pointwise_conv_bn_beta:	?G
8assignvariableop_42_layer6_pointwise_conv_bn_moving_mean:	?K
<assignvariableop_43_layer6_pointwise_conv_bn_moving_variance:	?U
:assignvariableop_44_layer7_depthwise_conv_depthwise_kernel:?@
1assignvariableop_45_layer7_depthwise_conv_bn_beta:	?G
8assignvariableop_46_layer7_depthwise_conv_bn_moving_mean:	?K
<assignvariableop_47_layer7_depthwise_conv_bn_moving_variance:	?L
0assignvariableop_48_layer7_pointwise_conv_kernel:??@
1assignvariableop_49_layer7_pointwise_conv_bn_beta:	?G
8assignvariableop_50_layer7_pointwise_conv_bn_moving_mean:	?K
<assignvariableop_51_layer7_pointwise_conv_bn_moving_variance:	?3
 assignvariableop_52_dense_kernel:	?
,
assignvariableop_53_dense_bias:
'
assignvariableop_54_adam_iter:	 )
assignvariableop_55_adam_beta_1: )
assignvariableop_56_adam_beta_2: (
assignvariableop_57_adam_decay: 0
&assignvariableop_58_adam_learning_rate: #
assignvariableop_59_total: #
assignvariableop_60_count: %
assignvariableop_61_total_1: %
assignvariableop_62_count_1: G
-assignvariableop_63_adam_layer1_conv_kernel_m: <
.assignvariableop_64_adam_layer1_conv_bn_beta_m: [
Aassignvariableop_65_adam_layer2_depthwise_conv_depthwise_kernel_m: F
8assignvariableop_66_adam_layer2_depthwise_conv_bn_beta_m: Q
7assignvariableop_67_adam_layer2_pointwise_conv_kernel_m: @F
8assignvariableop_68_adam_layer2_pointwise_conv_bn_beta_m:@[
Aassignvariableop_69_adam_layer3_depthwise_conv_depthwise_kernel_m:@F
8assignvariableop_70_adam_layer3_depthwise_conv_bn_beta_m:@R
7assignvariableop_71_adam_layer3_pointwise_conv_kernel_m:@?G
8assignvariableop_72_adam_layer3_pointwise_conv_bn_beta_m:	?\
Aassignvariableop_73_adam_layer4_depthwise_conv_depthwise_kernel_m:?G
8assignvariableop_74_adam_layer4_depthwise_conv_bn_beta_m:	?S
7assignvariableop_75_adam_layer4_pointwise_conv_kernel_m:??G
8assignvariableop_76_adam_layer4_pointwise_conv_bn_beta_m:	?\
Aassignvariableop_77_adam_layer5_depthwise_conv_depthwise_kernel_m:?G
8assignvariableop_78_adam_layer5_depthwise_conv_bn_beta_m:	?S
7assignvariableop_79_adam_layer5_pointwise_conv_kernel_m:??G
8assignvariableop_80_adam_layer5_pointwise_conv_bn_beta_m:	?\
Aassignvariableop_81_adam_layer6_depthwise_conv_depthwise_kernel_m:?G
8assignvariableop_82_adam_layer6_depthwise_conv_bn_beta_m:	?S
7assignvariableop_83_adam_layer6_pointwise_conv_kernel_m:??G
8assignvariableop_84_adam_layer6_pointwise_conv_bn_beta_m:	?\
Aassignvariableop_85_adam_layer7_depthwise_conv_depthwise_kernel_m:?G
8assignvariableop_86_adam_layer7_depthwise_conv_bn_beta_m:	?S
7assignvariableop_87_adam_layer7_pointwise_conv_kernel_m:??G
8assignvariableop_88_adam_layer7_pointwise_conv_bn_beta_m:	?:
'assignvariableop_89_adam_dense_kernel_m:	?
3
%assignvariableop_90_adam_dense_bias_m:
G
-assignvariableop_91_adam_layer1_conv_kernel_v: <
.assignvariableop_92_adam_layer1_conv_bn_beta_v: [
Aassignvariableop_93_adam_layer2_depthwise_conv_depthwise_kernel_v: F
8assignvariableop_94_adam_layer2_depthwise_conv_bn_beta_v: Q
7assignvariableop_95_adam_layer2_pointwise_conv_kernel_v: @F
8assignvariableop_96_adam_layer2_pointwise_conv_bn_beta_v:@[
Aassignvariableop_97_adam_layer3_depthwise_conv_depthwise_kernel_v:@F
8assignvariableop_98_adam_layer3_depthwise_conv_bn_beta_v:@R
7assignvariableop_99_adam_layer3_pointwise_conv_kernel_v:@?H
9assignvariableop_100_adam_layer3_pointwise_conv_bn_beta_v:	?]
Bassignvariableop_101_adam_layer4_depthwise_conv_depthwise_kernel_v:?H
9assignvariableop_102_adam_layer4_depthwise_conv_bn_beta_v:	?T
8assignvariableop_103_adam_layer4_pointwise_conv_kernel_v:??H
9assignvariableop_104_adam_layer4_pointwise_conv_bn_beta_v:	?]
Bassignvariableop_105_adam_layer5_depthwise_conv_depthwise_kernel_v:?H
9assignvariableop_106_adam_layer5_depthwise_conv_bn_beta_v:	?T
8assignvariableop_107_adam_layer5_pointwise_conv_kernel_v:??H
9assignvariableop_108_adam_layer5_pointwise_conv_bn_beta_v:	?]
Bassignvariableop_109_adam_layer6_depthwise_conv_depthwise_kernel_v:?H
9assignvariableop_110_adam_layer6_depthwise_conv_bn_beta_v:	?T
8assignvariableop_111_adam_layer6_pointwise_conv_kernel_v:??H
9assignvariableop_112_adam_layer6_pointwise_conv_bn_beta_v:	?]
Bassignvariableop_113_adam_layer7_depthwise_conv_depthwise_kernel_v:?H
9assignvariableop_114_adam_layer7_depthwise_conv_bn_beta_v:	?T
8assignvariableop_115_adam_layer7_pointwise_conv_kernel_v:??H
9assignvariableop_116_adam_layer7_pointwise_conv_bn_beta_v:	?;
(assignvariableop_117_adam_dense_kernel_v:	?
4
&assignvariableop_118_adam_dense_bias_v:

identity_120??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_100?AssignVariableOp_101?AssignVariableOp_102?AssignVariableOp_103?AssignVariableOp_104?AssignVariableOp_105?AssignVariableOp_106?AssignVariableOp_107?AssignVariableOp_108?AssignVariableOp_109?AssignVariableOp_11?AssignVariableOp_110?AssignVariableOp_111?AssignVariableOp_112?AssignVariableOp_113?AssignVariableOp_114?AssignVariableOp_115?AssignVariableOp_116?AssignVariableOp_117?AssignVariableOp_118?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_25?AssignVariableOp_26?AssignVariableOp_27?AssignVariableOp_28?AssignVariableOp_29?AssignVariableOp_3?AssignVariableOp_30?AssignVariableOp_31?AssignVariableOp_32?AssignVariableOp_33?AssignVariableOp_34?AssignVariableOp_35?AssignVariableOp_36?AssignVariableOp_37?AssignVariableOp_38?AssignVariableOp_39?AssignVariableOp_4?AssignVariableOp_40?AssignVariableOp_41?AssignVariableOp_42?AssignVariableOp_43?AssignVariableOp_44?AssignVariableOp_45?AssignVariableOp_46?AssignVariableOp_47?AssignVariableOp_48?AssignVariableOp_49?AssignVariableOp_5?AssignVariableOp_50?AssignVariableOp_51?AssignVariableOp_52?AssignVariableOp_53?AssignVariableOp_54?AssignVariableOp_55?AssignVariableOp_56?AssignVariableOp_57?AssignVariableOp_58?AssignVariableOp_59?AssignVariableOp_6?AssignVariableOp_60?AssignVariableOp_61?AssignVariableOp_62?AssignVariableOp_63?AssignVariableOp_64?AssignVariableOp_65?AssignVariableOp_66?AssignVariableOp_67?AssignVariableOp_68?AssignVariableOp_69?AssignVariableOp_7?AssignVariableOp_70?AssignVariableOp_71?AssignVariableOp_72?AssignVariableOp_73?AssignVariableOp_74?AssignVariableOp_75?AssignVariableOp_76?AssignVariableOp_77?AssignVariableOp_78?AssignVariableOp_79?AssignVariableOp_8?AssignVariableOp_80?AssignVariableOp_81?AssignVariableOp_82?AssignVariableOp_83?AssignVariableOp_84?AssignVariableOp_85?AssignVariableOp_86?AssignVariableOp_87?AssignVariableOp_88?AssignVariableOp_89?AssignVariableOp_9?AssignVariableOp_90?AssignVariableOp_91?AssignVariableOp_92?AssignVariableOp_93?AssignVariableOp_94?AssignVariableOp_95?AssignVariableOp_96?AssignVariableOp_97?AssignVariableOp_98?AssignVariableOp_99?C
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*?B
value?BB?BxB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-6/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-10/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-18/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-22/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-26/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-26/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*?
value?B?xB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*?
_output_shapes?
?::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*?
dtypes|
z2x	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOpAssignVariableOp#assignvariableop_layer1_conv_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_1AssignVariableOp&assignvariableop_1_layer1_conv_bn_betaIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_2AssignVariableOp-assignvariableop_2_layer1_conv_bn_moving_meanIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_3AssignVariableOp1assignvariableop_3_layer1_conv_bn_moving_varianceIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_4AssignVariableOp9assignvariableop_4_layer2_depthwise_conv_depthwise_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_5AssignVariableOp0assignvariableop_5_layer2_depthwise_conv_bn_betaIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_6AssignVariableOp7assignvariableop_6_layer2_depthwise_conv_bn_moving_meanIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_7AssignVariableOp;assignvariableop_7_layer2_depthwise_conv_bn_moving_varianceIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_8AssignVariableOp/assignvariableop_8_layer2_pointwise_conv_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_9AssignVariableOp0assignvariableop_9_layer2_pointwise_conv_bn_betaIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_10AssignVariableOp8assignvariableop_10_layer2_pointwise_conv_bn_moving_meanIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_11AssignVariableOp<assignvariableop_11_layer2_pointwise_conv_bn_moving_varianceIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_12AssignVariableOp:assignvariableop_12_layer3_depthwise_conv_depthwise_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_13AssignVariableOp1assignvariableop_13_layer3_depthwise_conv_bn_betaIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_14AssignVariableOp8assignvariableop_14_layer3_depthwise_conv_bn_moving_meanIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_15AssignVariableOp<assignvariableop_15_layer3_depthwise_conv_bn_moving_varianceIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_16AssignVariableOp0assignvariableop_16_layer3_pointwise_conv_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_17AssignVariableOp1assignvariableop_17_layer3_pointwise_conv_bn_betaIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_18AssignVariableOp8assignvariableop_18_layer3_pointwise_conv_bn_moving_meanIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_19AssignVariableOp<assignvariableop_19_layer3_pointwise_conv_bn_moving_varianceIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_20AssignVariableOp:assignvariableop_20_layer4_depthwise_conv_depthwise_kernelIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_21AssignVariableOp1assignvariableop_21_layer4_depthwise_conv_bn_betaIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_22AssignVariableOp8assignvariableop_22_layer4_depthwise_conv_bn_moving_meanIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_23AssignVariableOp<assignvariableop_23_layer4_depthwise_conv_bn_moving_varianceIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_24AssignVariableOp0assignvariableop_24_layer4_pointwise_conv_kernelIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_25AssignVariableOp1assignvariableop_25_layer4_pointwise_conv_bn_betaIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_26AssignVariableOp8assignvariableop_26_layer4_pointwise_conv_bn_moving_meanIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_27AssignVariableOp<assignvariableop_27_layer4_pointwise_conv_bn_moving_varianceIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_28AssignVariableOp:assignvariableop_28_layer5_depthwise_conv_depthwise_kernelIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_29AssignVariableOp1assignvariableop_29_layer5_depthwise_conv_bn_betaIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_30AssignVariableOp8assignvariableop_30_layer5_depthwise_conv_bn_moving_meanIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_31AssignVariableOp<assignvariableop_31_layer5_depthwise_conv_bn_moving_varianceIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_32AssignVariableOp0assignvariableop_32_layer5_pointwise_conv_kernelIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_33AssignVariableOp1assignvariableop_33_layer5_pointwise_conv_bn_betaIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_34AssignVariableOp8assignvariableop_34_layer5_pointwise_conv_bn_moving_meanIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_35AssignVariableOp<assignvariableop_35_layer5_pointwise_conv_bn_moving_varianceIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_36AssignVariableOp:assignvariableop_36_layer6_depthwise_conv_depthwise_kernelIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_37AssignVariableOp1assignvariableop_37_layer6_depthwise_conv_bn_betaIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_38AssignVariableOp8assignvariableop_38_layer6_depthwise_conv_bn_moving_meanIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_39AssignVariableOp<assignvariableop_39_layer6_depthwise_conv_bn_moving_varianceIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_40AssignVariableOp0assignvariableop_40_layer6_pointwise_conv_kernelIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_41AssignVariableOp1assignvariableop_41_layer6_pointwise_conv_bn_betaIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_42AssignVariableOp8assignvariableop_42_layer6_pointwise_conv_bn_moving_meanIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_43AssignVariableOp<assignvariableop_43_layer6_pointwise_conv_bn_moving_varianceIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_44AssignVariableOp:assignvariableop_44_layer7_depthwise_conv_depthwise_kernelIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_45AssignVariableOp1assignvariableop_45_layer7_depthwise_conv_bn_betaIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_46AssignVariableOp8assignvariableop_46_layer7_depthwise_conv_bn_moving_meanIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_47AssignVariableOp<assignvariableop_47_layer7_depthwise_conv_bn_moving_varianceIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_48AssignVariableOp0assignvariableop_48_layer7_pointwise_conv_kernelIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_49AssignVariableOp1assignvariableop_49_layer7_pointwise_conv_bn_betaIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_50AssignVariableOp8assignvariableop_50_layer7_pointwise_conv_bn_moving_meanIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_51AssignVariableOp<assignvariableop_51_layer7_pointwise_conv_bn_moving_varianceIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_52AssignVariableOp assignvariableop_52_dense_kernelIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_53AssignVariableOpassignvariableop_53_dense_biasIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0	*
_output_shapes
:?
AssignVariableOp_54AssignVariableOpassignvariableop_54_adam_iterIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_55AssignVariableOpassignvariableop_55_adam_beta_1Identity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_56AssignVariableOpassignvariableop_56_adam_beta_2Identity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_57AssignVariableOpassignvariableop_57_adam_decayIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_58AssignVariableOp&assignvariableop_58_adam_learning_rateIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_59AssignVariableOpassignvariableop_59_totalIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_60AssignVariableOpassignvariableop_60_countIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_61AssignVariableOpassignvariableop_61_total_1Identity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_62AssignVariableOpassignvariableop_62_count_1Identity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_63AssignVariableOp-assignvariableop_63_adam_layer1_conv_kernel_mIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_64AssignVariableOp.assignvariableop_64_adam_layer1_conv_bn_beta_mIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_65AssignVariableOpAassignvariableop_65_adam_layer2_depthwise_conv_depthwise_kernel_mIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_66AssignVariableOp8assignvariableop_66_adam_layer2_depthwise_conv_bn_beta_mIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_67AssignVariableOp7assignvariableop_67_adam_layer2_pointwise_conv_kernel_mIdentity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_68AssignVariableOp8assignvariableop_68_adam_layer2_pointwise_conv_bn_beta_mIdentity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_69AssignVariableOpAassignvariableop_69_adam_layer3_depthwise_conv_depthwise_kernel_mIdentity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_70AssignVariableOp8assignvariableop_70_adam_layer3_depthwise_conv_bn_beta_mIdentity_70:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_71AssignVariableOp7assignvariableop_71_adam_layer3_pointwise_conv_kernel_mIdentity_71:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_72AssignVariableOp8assignvariableop_72_adam_layer3_pointwise_conv_bn_beta_mIdentity_72:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_73AssignVariableOpAassignvariableop_73_adam_layer4_depthwise_conv_depthwise_kernel_mIdentity_73:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_74AssignVariableOp8assignvariableop_74_adam_layer4_depthwise_conv_bn_beta_mIdentity_74:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_75AssignVariableOp7assignvariableop_75_adam_layer4_pointwise_conv_kernel_mIdentity_75:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_76AssignVariableOp8assignvariableop_76_adam_layer4_pointwise_conv_bn_beta_mIdentity_76:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_77IdentityRestoreV2:tensors:77"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_77AssignVariableOpAassignvariableop_77_adam_layer5_depthwise_conv_depthwise_kernel_mIdentity_77:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_78IdentityRestoreV2:tensors:78"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_78AssignVariableOp8assignvariableop_78_adam_layer5_depthwise_conv_bn_beta_mIdentity_78:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_79IdentityRestoreV2:tensors:79"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_79AssignVariableOp7assignvariableop_79_adam_layer5_pointwise_conv_kernel_mIdentity_79:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_80IdentityRestoreV2:tensors:80"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_80AssignVariableOp8assignvariableop_80_adam_layer5_pointwise_conv_bn_beta_mIdentity_80:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_81IdentityRestoreV2:tensors:81"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_81AssignVariableOpAassignvariableop_81_adam_layer6_depthwise_conv_depthwise_kernel_mIdentity_81:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_82IdentityRestoreV2:tensors:82"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_82AssignVariableOp8assignvariableop_82_adam_layer6_depthwise_conv_bn_beta_mIdentity_82:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_83IdentityRestoreV2:tensors:83"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_83AssignVariableOp7assignvariableop_83_adam_layer6_pointwise_conv_kernel_mIdentity_83:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_84IdentityRestoreV2:tensors:84"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_84AssignVariableOp8assignvariableop_84_adam_layer6_pointwise_conv_bn_beta_mIdentity_84:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_85IdentityRestoreV2:tensors:85"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_85AssignVariableOpAassignvariableop_85_adam_layer7_depthwise_conv_depthwise_kernel_mIdentity_85:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_86IdentityRestoreV2:tensors:86"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_86AssignVariableOp8assignvariableop_86_adam_layer7_depthwise_conv_bn_beta_mIdentity_86:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_87IdentityRestoreV2:tensors:87"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_87AssignVariableOp7assignvariableop_87_adam_layer7_pointwise_conv_kernel_mIdentity_87:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_88IdentityRestoreV2:tensors:88"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_88AssignVariableOp8assignvariableop_88_adam_layer7_pointwise_conv_bn_beta_mIdentity_88:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_89IdentityRestoreV2:tensors:89"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_89AssignVariableOp'assignvariableop_89_adam_dense_kernel_mIdentity_89:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_90IdentityRestoreV2:tensors:90"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_90AssignVariableOp%assignvariableop_90_adam_dense_bias_mIdentity_90:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_91IdentityRestoreV2:tensors:91"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_91AssignVariableOp-assignvariableop_91_adam_layer1_conv_kernel_vIdentity_91:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_92IdentityRestoreV2:tensors:92"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_92AssignVariableOp.assignvariableop_92_adam_layer1_conv_bn_beta_vIdentity_92:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_93IdentityRestoreV2:tensors:93"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_93AssignVariableOpAassignvariableop_93_adam_layer2_depthwise_conv_depthwise_kernel_vIdentity_93:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_94IdentityRestoreV2:tensors:94"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_94AssignVariableOp8assignvariableop_94_adam_layer2_depthwise_conv_bn_beta_vIdentity_94:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_95IdentityRestoreV2:tensors:95"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_95AssignVariableOp7assignvariableop_95_adam_layer2_pointwise_conv_kernel_vIdentity_95:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_96IdentityRestoreV2:tensors:96"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_96AssignVariableOp8assignvariableop_96_adam_layer2_pointwise_conv_bn_beta_vIdentity_96:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_97IdentityRestoreV2:tensors:97"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_97AssignVariableOpAassignvariableop_97_adam_layer3_depthwise_conv_depthwise_kernel_vIdentity_97:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_98IdentityRestoreV2:tensors:98"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_98AssignVariableOp8assignvariableop_98_adam_layer3_depthwise_conv_bn_beta_vIdentity_98:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_99IdentityRestoreV2:tensors:99"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_99AssignVariableOp7assignvariableop_99_adam_layer3_pointwise_conv_kernel_vIdentity_99:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_100IdentityRestoreV2:tensors:100"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_100AssignVariableOp9assignvariableop_100_adam_layer3_pointwise_conv_bn_beta_vIdentity_100:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_101IdentityRestoreV2:tensors:101"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_101AssignVariableOpBassignvariableop_101_adam_layer4_depthwise_conv_depthwise_kernel_vIdentity_101:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_102IdentityRestoreV2:tensors:102"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_102AssignVariableOp9assignvariableop_102_adam_layer4_depthwise_conv_bn_beta_vIdentity_102:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_103IdentityRestoreV2:tensors:103"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_103AssignVariableOp8assignvariableop_103_adam_layer4_pointwise_conv_kernel_vIdentity_103:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_104IdentityRestoreV2:tensors:104"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_104AssignVariableOp9assignvariableop_104_adam_layer4_pointwise_conv_bn_beta_vIdentity_104:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_105IdentityRestoreV2:tensors:105"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_105AssignVariableOpBassignvariableop_105_adam_layer5_depthwise_conv_depthwise_kernel_vIdentity_105:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_106IdentityRestoreV2:tensors:106"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_106AssignVariableOp9assignvariableop_106_adam_layer5_depthwise_conv_bn_beta_vIdentity_106:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_107IdentityRestoreV2:tensors:107"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_107AssignVariableOp8assignvariableop_107_adam_layer5_pointwise_conv_kernel_vIdentity_107:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_108IdentityRestoreV2:tensors:108"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_108AssignVariableOp9assignvariableop_108_adam_layer5_pointwise_conv_bn_beta_vIdentity_108:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_109IdentityRestoreV2:tensors:109"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_109AssignVariableOpBassignvariableop_109_adam_layer6_depthwise_conv_depthwise_kernel_vIdentity_109:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_110IdentityRestoreV2:tensors:110"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_110AssignVariableOp9assignvariableop_110_adam_layer6_depthwise_conv_bn_beta_vIdentity_110:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_111IdentityRestoreV2:tensors:111"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_111AssignVariableOp8assignvariableop_111_adam_layer6_pointwise_conv_kernel_vIdentity_111:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_112IdentityRestoreV2:tensors:112"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_112AssignVariableOp9assignvariableop_112_adam_layer6_pointwise_conv_bn_beta_vIdentity_112:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_113IdentityRestoreV2:tensors:113"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_113AssignVariableOpBassignvariableop_113_adam_layer7_depthwise_conv_depthwise_kernel_vIdentity_113:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_114IdentityRestoreV2:tensors:114"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_114AssignVariableOp9assignvariableop_114_adam_layer7_depthwise_conv_bn_beta_vIdentity_114:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_115IdentityRestoreV2:tensors:115"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_115AssignVariableOp8assignvariableop_115_adam_layer7_pointwise_conv_kernel_vIdentity_115:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_116IdentityRestoreV2:tensors:116"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_116AssignVariableOp9assignvariableop_116_adam_layer7_pointwise_conv_bn_beta_vIdentity_116:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_117IdentityRestoreV2:tensors:117"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_117AssignVariableOp(assignvariableop_117_adam_dense_kernel_vIdentity_117:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_118IdentityRestoreV2:tensors:118"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_118AssignVariableOp&assignvariableop_118_adam_dense_bias_vIdentity_118:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ?
Identity_119Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99^NoOp"/device:CPU:0*
T0*
_output_shapes
: Y
Identity_120IdentityIdentity_119:output:0^NoOp_1*
T0*
_output_shapes
: ?
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99*"
_acd_function_control_output(*
_output_shapes
 "%
identity_120Identity_120:output:0*?
_input_shapes?
?: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102,
AssignVariableOp_100AssignVariableOp_1002,
AssignVariableOp_101AssignVariableOp_1012,
AssignVariableOp_102AssignVariableOp_1022,
AssignVariableOp_103AssignVariableOp_1032,
AssignVariableOp_104AssignVariableOp_1042,
AssignVariableOp_105AssignVariableOp_1052,
AssignVariableOp_106AssignVariableOp_1062,
AssignVariableOp_107AssignVariableOp_1072,
AssignVariableOp_108AssignVariableOp_1082,
AssignVariableOp_109AssignVariableOp_1092*
AssignVariableOp_11AssignVariableOp_112,
AssignVariableOp_110AssignVariableOp_1102,
AssignVariableOp_111AssignVariableOp_1112,
AssignVariableOp_112AssignVariableOp_1122,
AssignVariableOp_113AssignVariableOp_1132,
AssignVariableOp_114AssignVariableOp_1142,
AssignVariableOp_115AssignVariableOp_1152,
AssignVariableOp_116AssignVariableOp_1162,
AssignVariableOp_117AssignVariableOp_1172,
AssignVariableOp_118AssignVariableOp_1182*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_7AssignVariableOp_72*
AssignVariableOp_70AssignVariableOp_702*
AssignVariableOp_71AssignVariableOp_712*
AssignVariableOp_72AssignVariableOp_722*
AssignVariableOp_73AssignVariableOp_732*
AssignVariableOp_74AssignVariableOp_742*
AssignVariableOp_75AssignVariableOp_752*
AssignVariableOp_76AssignVariableOp_762*
AssignVariableOp_77AssignVariableOp_772*
AssignVariableOp_78AssignVariableOp_782*
AssignVariableOp_79AssignVariableOp_792(
AssignVariableOp_8AssignVariableOp_82*
AssignVariableOp_80AssignVariableOp_802*
AssignVariableOp_81AssignVariableOp_812*
AssignVariableOp_82AssignVariableOp_822*
AssignVariableOp_83AssignVariableOp_832*
AssignVariableOp_84AssignVariableOp_842*
AssignVariableOp_85AssignVariableOp_852*
AssignVariableOp_86AssignVariableOp_862*
AssignVariableOp_87AssignVariableOp_872*
AssignVariableOp_88AssignVariableOp_882*
AssignVariableOp_89AssignVariableOp_892(
AssignVariableOp_9AssignVariableOp_92*
AssignVariableOp_90AssignVariableOp_902*
AssignVariableOp_91AssignVariableOp_912*
AssignVariableOp_92AssignVariableOp_922*
AssignVariableOp_93AssignVariableOp_932*
AssignVariableOp_94AssignVariableOp_942*
AssignVariableOp_95AssignVariableOp_952*
AssignVariableOp_96AssignVariableOp_962*
AssignVariableOp_97AssignVariableOp_972*
AssignVariableOp_98AssignVariableOp_982*
AssignVariableOp_99AssignVariableOp_99:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?
?
7__inference_layer2/pointwise_conv_layer_call_fn_4850178

inputs!
unknown: @
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:?????????0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4847485w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:?????????0 @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:?????????0  : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:?????????0  
 
_user_specified_nameinputs
?
?
7__inference_layer7/pointwise_conv_layer_call_fn_4851028

inputs#
unknown:??
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4847765x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?!
?
/__inference_yamnet_frames_layer_call_fn_4848728
input_1!
unknown: 
	unknown_0
	unknown_1: 
	unknown_2: 
	unknown_3: #
	unknown_4: 
	unknown_5
	unknown_6: 
	unknown_7: 
	unknown_8: #
	unknown_9: @

unknown_10

unknown_11:@

unknown_12:@

unknown_13:@$

unknown_14:@

unknown_15

unknown_16:@

unknown_17:@

unknown_18:@%

unknown_19:@?

unknown_20

unknown_21:	?

unknown_22:	?

unknown_23:	?%

unknown_24:?

unknown_25

unknown_26:	?

unknown_27:	?

unknown_28:	?&

unknown_29:??

unknown_30

unknown_31:	?

unknown_32:	?

unknown_33:	?%

unknown_34:?

unknown_35

unknown_36:	?

unknown_37:	?

unknown_38:	?&

unknown_39:??

unknown_40

unknown_41:	?

unknown_42:	?

unknown_43:	?%

unknown_44:?

unknown_45

unknown_46:	?

unknown_47:	?

unknown_48:	?&

unknown_49:??

unknown_50

unknown_51:	?

unknown_52:	?

unknown_53:	?%

unknown_54:?

unknown_55

unknown_56:	?

unknown_57:	?

unknown_58:	?&

unknown_59:??

unknown_60

unknown_61:	?

unknown_62:	?

unknown_63:	?

unknown_64:	?


unknown_65:

identity??StatefulPartitionedCall?	
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43
unknown_44
unknown_45
unknown_46
unknown_47
unknown_48
unknown_49
unknown_50
unknown_51
unknown_52
unknown_53
unknown_54
unknown_55
unknown_56
unknown_57
unknown_58
unknown_59
unknown_60
unknown_61
unknown_62
unknown_63
unknown_64
unknown_65*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*>
_read_only_resource_inputs 
!$&)+.0358:=?BC*0
config_proto 

CPU

GPU2*0J 8? *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4848452o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:?????????`@
!
_user_specified_name	input_1: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?
?
?
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850568

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
?
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4850865

inputs:
conv2d_readvariableop_resource:??
identity??Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:??????????^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:??????????: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850331

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity??AssignNewValue?AssignNewValue_1?FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+???????????????????????????@:@:@:@:@:*
exponential_avg_factor%
?#<?
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+???????????????????????????@?
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+???????????????????????????@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+???????????????????????????@
 
_user_specified_nameinputs: 

_output_shapes
:@
?
?
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4847237

inputs	
scale&
readvariableop_resource:	?7
(fusedbatchnormv3_readvariableop_resource:	?9
*fusedbatchnormv3_readvariableop_1_resource:	?
identity??FusedBatchNormV3/ReadVariableOp?!FusedBatchNormV3/ReadVariableOp_1?ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,????????????????????????????:?:?:?:?:*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,?????????????????????????????
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,????????????????????????????:?: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,????????????????????????????
 
_user_specified_nameinputs:!

_output_shapes	
:?
?
X
<__inference_layer4/depthwise_conv/relu_layer_call_fn_4850506

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4847588i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
?
s
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4847783

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:??????????c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:??????????:X T
0
_output_shapes
:??????????
 
_user_specified_nameinputs
??
?B
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849860

inputsD
*layer1_conv_conv2d_readvariableop_resource: 
layer1_conv_bn_scale4
&layer1_conv_bn_readvariableop_resource: E
7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource: G
9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource: Q
7layer2_depthwise_conv_depthwise_readvariableop_resource: "
layer2_depthwise_conv_bn_scale>
0layer2_depthwise_conv_bn_readvariableop_resource: O
Alayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource: Q
Clayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource: N
4layer2_pointwise_conv_conv2d_readvariableop_resource: @"
layer2_pointwise_conv_bn_scale>
0layer2_pointwise_conv_bn_readvariableop_resource:@O
Alayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:@Q
Clayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:@Q
7layer3_depthwise_conv_depthwise_readvariableop_resource:@"
layer3_depthwise_conv_bn_scale>
0layer3_depthwise_conv_bn_readvariableop_resource:@O
Alayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:@Q
Clayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:@O
4layer3_pointwise_conv_conv2d_readvariableop_resource:@?"
layer3_pointwise_conv_bn_scale?
0layer3_pointwise_conv_bn_readvariableop_resource:	?P
Alayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer4_depthwise_conv_depthwise_readvariableop_resource:?"
layer4_depthwise_conv_bn_scale?
0layer4_depthwise_conv_bn_readvariableop_resource:	?P
Alayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer4_pointwise_conv_conv2d_readvariableop_resource:??"
layer4_pointwise_conv_bn_scale?
0layer4_pointwise_conv_bn_readvariableop_resource:	?P
Alayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer5_depthwise_conv_depthwise_readvariableop_resource:?"
layer5_depthwise_conv_bn_scale?
0layer5_depthwise_conv_bn_readvariableop_resource:	?P
Alayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer5_pointwise_conv_conv2d_readvariableop_resource:??"
layer5_pointwise_conv_bn_scale?
0layer5_pointwise_conv_bn_readvariableop_resource:	?P
Alayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer6_depthwise_conv_depthwise_readvariableop_resource:?"
layer6_depthwise_conv_bn_scale?
0layer6_depthwise_conv_bn_readvariableop_resource:	?P
Alayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer6_pointwise_conv_conv2d_readvariableop_resource:??"
layer6_pointwise_conv_bn_scale?
0layer6_pointwise_conv_bn_readvariableop_resource:	?P
Alayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?R
7layer7_depthwise_conv_depthwise_readvariableop_resource:?"
layer7_depthwise_conv_bn_scale?
0layer7_depthwise_conv_bn_readvariableop_resource:	?P
Alayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?P
4layer7_pointwise_conv_conv2d_readvariableop_resource:??"
layer7_pointwise_conv_bn_scale?
0layer7_pointwise_conv_bn_readvariableop_resource:	?P
Alayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	?R
Clayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	?7
$dense_matmul_readvariableop_resource:	?
3
%dense_biasadd_readvariableop_resource:

identity??dense/BiasAdd/ReadVariableOp?dense/MatMul/ReadVariableOp?!layer1/conv/Conv2D/ReadVariableOp?layer1/conv/bn/AssignNewValue?layer1/conv/bn/AssignNewValue_1?.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp?0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1?layer1/conv/bn/ReadVariableOp?'layer2/depthwise_conv/bn/AssignNewValue?)layer2/depthwise_conv/bn/AssignNewValue_1?8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer2/depthwise_conv/bn/ReadVariableOp?.layer2/depthwise_conv/depthwise/ReadVariableOp?+layer2/pointwise_conv/Conv2D/ReadVariableOp?'layer2/pointwise_conv/bn/AssignNewValue?)layer2/pointwise_conv/bn/AssignNewValue_1?8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer2/pointwise_conv/bn/ReadVariableOp?'layer3/depthwise_conv/bn/AssignNewValue?)layer3/depthwise_conv/bn/AssignNewValue_1?8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer3/depthwise_conv/bn/ReadVariableOp?.layer3/depthwise_conv/depthwise/ReadVariableOp?+layer3/pointwise_conv/Conv2D/ReadVariableOp?'layer3/pointwise_conv/bn/AssignNewValue?)layer3/pointwise_conv/bn/AssignNewValue_1?8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer3/pointwise_conv/bn/ReadVariableOp?'layer4/depthwise_conv/bn/AssignNewValue?)layer4/depthwise_conv/bn/AssignNewValue_1?8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer4/depthwise_conv/bn/ReadVariableOp?.layer4/depthwise_conv/depthwise/ReadVariableOp?+layer4/pointwise_conv/Conv2D/ReadVariableOp?'layer4/pointwise_conv/bn/AssignNewValue?)layer4/pointwise_conv/bn/AssignNewValue_1?8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer4/pointwise_conv/bn/ReadVariableOp?'layer5/depthwise_conv/bn/AssignNewValue?)layer5/depthwise_conv/bn/AssignNewValue_1?8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer5/depthwise_conv/bn/ReadVariableOp?.layer5/depthwise_conv/depthwise/ReadVariableOp?+layer5/pointwise_conv/Conv2D/ReadVariableOp?'layer5/pointwise_conv/bn/AssignNewValue?)layer5/pointwise_conv/bn/AssignNewValue_1?8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer5/pointwise_conv/bn/ReadVariableOp?'layer6/depthwise_conv/bn/AssignNewValue?)layer6/depthwise_conv/bn/AssignNewValue_1?8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer6/depthwise_conv/bn/ReadVariableOp?.layer6/depthwise_conv/depthwise/ReadVariableOp?+layer6/pointwise_conv/Conv2D/ReadVariableOp?'layer6/pointwise_conv/bn/AssignNewValue?)layer6/pointwise_conv/bn/AssignNewValue_1?8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer6/pointwise_conv/bn/ReadVariableOp?'layer7/depthwise_conv/bn/AssignNewValue?)layer7/depthwise_conv/bn/AssignNewValue_1?8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer7/depthwise_conv/bn/ReadVariableOp?.layer7/depthwise_conv/depthwise/ReadVariableOp?+layer7/pointwise_conv/Conv2D/ReadVariableOp?'layer7/pointwise_conv/bn/AssignNewValue?)layer7/pointwise_conv/bn/AssignNewValue_1?8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp?:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1?'layer7/pointwise_conv/bn/ReadVariableOp?
!layer1/conv/Conv2D/ReadVariableOpReadVariableOp*layer1_conv_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0?
layer1/conv/Conv2DConv2Dinputs)layer1/conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
?
layer1/conv/bn/ReadVariableOpReadVariableOp&layer1_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
.layer1/conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOp7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
layer1/conv/bn/FusedBatchNormV3FusedBatchNormV3layer1/conv/Conv2D:output:0layer1_conv_bn_scale%layer1/conv/bn/ReadVariableOp:value:06layer1/conv/bn/FusedBatchNormV3/ReadVariableOp:value:08layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0  : : : : :*
exponential_avg_factor%
?#<?
layer1/conv/bn/AssignNewValueAssignVariableOp7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource,layer1/conv/bn/FusedBatchNormV3:batch_mean:0/^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
layer1/conv/bn/AssignNewValue_1AssignVariableOp9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource0layer1/conv/bn/FusedBatchNormV3:batch_variance:01^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0w
layer1/relu/ReluRelu#layer1/conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0  ?
.layer2/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer2_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
: *
dtype0~
%layer2/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"             ~
-layer2/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer2/depthwise_conv/depthwiseDepthwiseConv2dNativelayer1/relu/Relu:activations:06layer2/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0  *
paddingSAME*
strides
?
'layer2/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer2_depthwise_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0?
:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
)layer2/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer2/depthwise_conv/depthwise:output:0layer2_depthwise_conv_bn_scale/layer2/depthwise_conv/bn/ReadVariableOp:value:0@layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0  : : : : :*
exponential_avg_factor%
?#<?
'layer2/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer2/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer2/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer2/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer2/depthwise_conv/relu/ReluRelu-layer2/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0  ?
+layer2/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer2_pointwise_conv_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0?
layer2/pointwise_conv/Conv2DConv2D-layer2/depthwise_conv/relu/Relu:activations:03layer2/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????0 @*
paddingSAME*
strides
?
'layer2/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer2_pointwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0?
8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
)layer2/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer2/pointwise_conv/Conv2D:output:0layer2_pointwise_conv_bn_scale/layer2/pointwise_conv/bn/ReadVariableOp:value:0@layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????0 @:@:@:@:@:*
exponential_avg_factor%
?#<?
'layer2/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer2/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer2/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer2/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer2/pointwise_conv/relu/ReluRelu-layer2/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????0 @?
.layer3/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer3_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
:@*
dtype0~
%layer3/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      @      ~
-layer3/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer3/depthwise_conv/depthwiseDepthwiseConv2dNative-layer2/pointwise_conv/relu/Relu:activations:06layer3/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:?????????@*
paddingSAME*
strides
?
'layer3/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer3_depthwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0?
8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0?
:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
)layer3/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer3/depthwise_conv/depthwise:output:0layer3_depthwise_conv_bn_scale/layer3/depthwise_conv/bn/ReadVariableOp:value:0@layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:?????????@:@:@:@:@:*
exponential_avg_factor%
?#<?
'layer3/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer3/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer3/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer3/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer3/depthwise_conv/relu/ReluRelu-layer3/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:?????????@?
+layer3/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer3_pointwise_conv_conv2d_readvariableop_resource*'
_output_shapes
:@?*
dtype0?
layer3/pointwise_conv/Conv2DConv2D-layer3/depthwise_conv/relu/Relu:activations:03layer3/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer3/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer3_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer3/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer3/pointwise_conv/Conv2D:output:0layer3_pointwise_conv_bn_scale/layer3/pointwise_conv/bn/ReadVariableOp:value:0@layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer3/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer3/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer3/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer3/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer3/pointwise_conv/relu/ReluRelu-layer3/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer4/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer4_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer4/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      ~
-layer4/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer4/depthwise_conv/depthwiseDepthwiseConv2dNative-layer3/pointwise_conv/relu/Relu:activations:06layer4/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer4/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer4_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer4/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer4/depthwise_conv/depthwise:output:0layer4_depthwise_conv_bn_scale/layer4/depthwise_conv/bn/ReadVariableOp:value:0@layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer4/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer4/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer4/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer4/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer4/depthwise_conv/relu/ReluRelu-layer4/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer4/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer4_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer4/pointwise_conv/Conv2DConv2D-layer4/depthwise_conv/relu/Relu:activations:03layer4/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer4/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer4_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer4/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer4/pointwise_conv/Conv2D:output:0layer4_pointwise_conv_bn_scale/layer4/pointwise_conv/bn/ReadVariableOp:value:0@layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer4/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer4/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer4/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer4/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer4/pointwise_conv/relu/ReluRelu-layer4/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer5/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer5_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer5/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      ?      ~
-layer5/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer5/depthwise_conv/depthwiseDepthwiseConv2dNative-layer4/pointwise_conv/relu/Relu:activations:06layer5/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer5/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer5_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer5/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer5/depthwise_conv/depthwise:output:0layer5_depthwise_conv_bn_scale/layer5/depthwise_conv/bn/ReadVariableOp:value:0@layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer5/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer5/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer5/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer5/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer5/depthwise_conv/relu/ReluRelu-layer5/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer5/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer5_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer5/pointwise_conv/Conv2DConv2D-layer5/depthwise_conv/relu/Relu:activations:03layer5/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer5/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer5_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer5/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer5/pointwise_conv/Conv2D:output:0layer5_pointwise_conv_bn_scale/layer5/pointwise_conv/bn/ReadVariableOp:value:0@layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer5/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer5/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer5/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer5/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer5/pointwise_conv/relu/ReluRelu-layer5/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer6/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer6_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer6/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer6/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer6/depthwise_conv/depthwiseDepthwiseConv2dNative-layer5/pointwise_conv/relu/Relu:activations:06layer6/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer6/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer6_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer6/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer6/depthwise_conv/depthwise:output:0layer6_depthwise_conv_bn_scale/layer6/depthwise_conv/bn/ReadVariableOp:value:0@layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer6/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer6/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer6/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer6/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer6/depthwise_conv/relu/ReluRelu-layer6/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer6/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer6_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer6/pointwise_conv/Conv2DConv2D-layer6/depthwise_conv/relu/Relu:activations:03layer6/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer6/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer6_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer6/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer6/pointwise_conv/Conv2D:output:0layer6_pointwise_conv_bn_scale/layer6/pointwise_conv/bn/ReadVariableOp:value:0@layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer6/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer6/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer6/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer6/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer6/pointwise_conv/relu/ReluRelu-layer6/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
.layer7/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer7_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:?*
dtype0~
%layer7/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer7/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      ?
layer7/depthwise_conv/depthwiseDepthwiseConv2dNative-layer6/pointwise_conv/relu/Relu:activations:06layer7/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer7/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer7_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer7/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer7/depthwise_conv/depthwise:output:0layer7_depthwise_conv_bn_scale/layer7/depthwise_conv/bn/ReadVariableOp:value:0@layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer7/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer7/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer7/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer7/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer7/depthwise_conv/relu/ReluRelu-layer7/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
+layer7/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer7_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:??*
dtype0?
layer7/pointwise_conv/Conv2DConv2D-layer7/depthwise_conv/relu/Relu:activations:03layer7/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:??????????*
paddingSAME*
strides
?
'layer7/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer7_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:?*
dtype0?
8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:?*
dtype0?
:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:?*
dtype0?
)layer7/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer7/pointwise_conv/Conv2D:output:0layer7_pointwise_conv_bn_scale/layer7/pointwise_conv/bn/ReadVariableOp:value:0@layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:??????????:?:?:?:?:*
exponential_avg_factor%
?#<?
'layer7/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer7/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0?
)layer7/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer7/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0?
layer7/pointwise_conv/relu/ReluRelu-layer7/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:???????????
/global_average_pooling2d/Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      ?
global_average_pooling2d/MeanMean-layer7/pointwise_conv/relu/Relu:activations:08global_average_pooling2d/Mean/reduction_indices:output:0*
T0*(
_output_shapes
:???????????
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	?
*
dtype0?
dense/MatMulMatMul&global_average_pooling2d/Mean:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0?
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
e
IdentityIdentitydense/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:?????????
?
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp"^layer1/conv/Conv2D/ReadVariableOp^layer1/conv/bn/AssignNewValue ^layer1/conv/bn/AssignNewValue_1/^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp1^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1^layer1/conv/bn/ReadVariableOp(^layer2/depthwise_conv/bn/AssignNewValue*^layer2/depthwise_conv/bn/AssignNewValue_19^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/depthwise_conv/bn/ReadVariableOp/^layer2/depthwise_conv/depthwise/ReadVariableOp,^layer2/pointwise_conv/Conv2D/ReadVariableOp(^layer2/pointwise_conv/bn/AssignNewValue*^layer2/pointwise_conv/bn/AssignNewValue_19^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/pointwise_conv/bn/ReadVariableOp(^layer3/depthwise_conv/bn/AssignNewValue*^layer3/depthwise_conv/bn/AssignNewValue_19^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/depthwise_conv/bn/ReadVariableOp/^layer3/depthwise_conv/depthwise/ReadVariableOp,^layer3/pointwise_conv/Conv2D/ReadVariableOp(^layer3/pointwise_conv/bn/AssignNewValue*^layer3/pointwise_conv/bn/AssignNewValue_19^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/pointwise_conv/bn/ReadVariableOp(^layer4/depthwise_conv/bn/AssignNewValue*^layer4/depthwise_conv/bn/AssignNewValue_19^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/depthwise_conv/bn/ReadVariableOp/^layer4/depthwise_conv/depthwise/ReadVariableOp,^layer4/pointwise_conv/Conv2D/ReadVariableOp(^layer4/pointwise_conv/bn/AssignNewValue*^layer4/pointwise_conv/bn/AssignNewValue_19^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/pointwise_conv/bn/ReadVariableOp(^layer5/depthwise_conv/bn/AssignNewValue*^layer5/depthwise_conv/bn/AssignNewValue_19^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/depthwise_conv/bn/ReadVariableOp/^layer5/depthwise_conv/depthwise/ReadVariableOp,^layer5/pointwise_conv/Conv2D/ReadVariableOp(^layer5/pointwise_conv/bn/AssignNewValue*^layer5/pointwise_conv/bn/AssignNewValue_19^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/pointwise_conv/bn/ReadVariableOp(^layer6/depthwise_conv/bn/AssignNewValue*^layer6/depthwise_conv/bn/AssignNewValue_19^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/depthwise_conv/bn/ReadVariableOp/^layer6/depthwise_conv/depthwise/ReadVariableOp,^layer6/pointwise_conv/Conv2D/ReadVariableOp(^layer6/pointwise_conv/bn/AssignNewValue*^layer6/pointwise_conv/bn/AssignNewValue_19^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/pointwise_conv/bn/ReadVariableOp(^layer7/depthwise_conv/bn/AssignNewValue*^layer7/depthwise_conv/bn/AssignNewValue_19^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/depthwise_conv/bn/ReadVariableOp/^layer7/depthwise_conv/depthwise/ReadVariableOp,^layer7/pointwise_conv/Conv2D/ReadVariableOp(^layer7/pointwise_conv/bn/AssignNewValue*^layer7/pointwise_conv/bn/AssignNewValue_19^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/pointwise_conv/bn/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes?
?:?????????`@: : : : : : : : : : : :@: : : : :@: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : :?: : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2F
!layer1/conv/Conv2D/ReadVariableOp!layer1/conv/Conv2D/ReadVariableOp2>
layer1/conv/bn/AssignNewValuelayer1/conv/bn/AssignNewValue2B
layer1/conv/bn/AssignNewValue_1layer1/conv/bn/AssignNewValue_12`
.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp2d
0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_10layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_12>
layer1/conv/bn/ReadVariableOplayer1/conv/bn/ReadVariableOp2R
'layer2/depthwise_conv/bn/AssignNewValue'layer2/depthwise_conv/bn/AssignNewValue2V
)layer2/depthwise_conv/bn/AssignNewValue_1)layer2/depthwise_conv/bn/AssignNewValue_12t
8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer2/depthwise_conv/bn/ReadVariableOp'layer2/depthwise_conv/bn/ReadVariableOp2`
.layer2/depthwise_conv/depthwise/ReadVariableOp.layer2/depthwise_conv/depthwise/ReadVariableOp2Z
+layer2/pointwise_conv/Conv2D/ReadVariableOp+layer2/pointwise_conv/Conv2D/ReadVariableOp2R
'layer2/pointwise_conv/bn/AssignNewValue'layer2/pointwise_conv/bn/AssignNewValue2V
)layer2/pointwise_conv/bn/AssignNewValue_1)layer2/pointwise_conv/bn/AssignNewValue_12t
8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer2/pointwise_conv/bn/ReadVariableOp'layer2/pointwise_conv/bn/ReadVariableOp2R
'layer3/depthwise_conv/bn/AssignNewValue'layer3/depthwise_conv/bn/AssignNewValue2V
)layer3/depthwise_conv/bn/AssignNewValue_1)layer3/depthwise_conv/bn/AssignNewValue_12t
8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer3/depthwise_conv/bn/ReadVariableOp'layer3/depthwise_conv/bn/ReadVariableOp2`
.layer3/depthwise_conv/depthwise/ReadVariableOp.layer3/depthwise_conv/depthwise/ReadVariableOp2Z
+layer3/pointwise_conv/Conv2D/ReadVariableOp+layer3/pointwise_conv/Conv2D/ReadVariableOp2R
'layer3/pointwise_conv/bn/AssignNewValue'layer3/pointwise_conv/bn/AssignNewValue2V
)layer3/pointwise_conv/bn/AssignNewValue_1)layer3/pointwise_conv/bn/AssignNewValue_12t
8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer3/pointwise_conv/bn/ReadVariableOp'layer3/pointwise_conv/bn/ReadVariableOp2R
'layer4/depthwise_conv/bn/AssignNewValue'layer4/depthwise_conv/bn/AssignNewValue2V
)layer4/depthwise_conv/bn/AssignNewValue_1)layer4/depthwise_conv/bn/AssignNewValue_12t
8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer4/depthwise_conv/bn/ReadVariableOp'layer4/depthwise_conv/bn/ReadVariableOp2`
.layer4/depthwise_conv/depthwise/ReadVariableOp.layer4/depthwise_conv/depthwise/ReadVariableOp2Z
+layer4/pointwise_conv/Conv2D/ReadVariableOp+layer4/pointwise_conv/Conv2D/ReadVariableOp2R
'layer4/pointwise_conv/bn/AssignNewValue'layer4/pointwise_conv/bn/AssignNewValue2V
)layer4/pointwise_conv/bn/AssignNewValue_1)layer4/pointwise_conv/bn/AssignNewValue_12t
8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer4/pointwise_conv/bn/ReadVariableOp'layer4/pointwise_conv/bn/ReadVariableOp2R
'layer5/depthwise_conv/bn/AssignNewValue'layer5/depthwise_conv/bn/AssignNewValue2V
)layer5/depthwise_conv/bn/AssignNewValue_1)layer5/depthwise_conv/bn/AssignNewValue_12t
8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer5/depthwise_conv/bn/ReadVariableOp'layer5/depthwise_conv/bn/ReadVariableOp2`
.layer5/depthwise_conv/depthwise/ReadVariableOp.layer5/depthwise_conv/depthwise/ReadVariableOp2Z
+layer5/pointwise_conv/Conv2D/ReadVariableOp+layer5/pointwise_conv/Conv2D/ReadVariableOp2R
'layer5/pointwise_conv/bn/AssignNewValue'layer5/pointwise_conv/bn/AssignNewValue2V
)layer5/pointwise_conv/bn/AssignNewValue_1)layer5/pointwise_conv/bn/AssignNewValue_12t
8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer5/pointwise_conv/bn/ReadVariableOp'layer5/pointwise_conv/bn/ReadVariableOp2R
'layer6/depthwise_conv/bn/AssignNewValue'layer6/depthwise_conv/bn/AssignNewValue2V
)layer6/depthwise_conv/bn/AssignNewValue_1)layer6/depthwise_conv/bn/AssignNewValue_12t
8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer6/depthwise_conv/bn/ReadVariableOp'layer6/depthwise_conv/bn/ReadVariableOp2`
.layer6/depthwise_conv/depthwise/ReadVariableOp.layer6/depthwise_conv/depthwise/ReadVariableOp2Z
+layer6/pointwise_conv/Conv2D/ReadVariableOp+layer6/pointwise_conv/Conv2D/ReadVariableOp2R
'layer6/pointwise_conv/bn/AssignNewValue'layer6/pointwise_conv/bn/AssignNewValue2V
)layer6/pointwise_conv/bn/AssignNewValue_1)layer6/pointwise_conv/bn/AssignNewValue_12t
8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer6/pointwise_conv/bn/ReadVariableOp'layer6/pointwise_conv/bn/ReadVariableOp2R
'layer7/depthwise_conv/bn/AssignNewValue'layer7/depthwise_conv/bn/AssignNewValue2V
)layer7/depthwise_conv/bn/AssignNewValue_1)layer7/depthwise_conv/bn/AssignNewValue_12t
8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer7/depthwise_conv/bn/ReadVariableOp'layer7/depthwise_conv/bn/ReadVariableOp2`
.layer7/depthwise_conv/depthwise/ReadVariableOp.layer7/depthwise_conv/depthwise/ReadVariableOp2Z
+layer7/pointwise_conv/Conv2D/ReadVariableOp+layer7/pointwise_conv/Conv2D/ReadVariableOp2R
'layer7/pointwise_conv/bn/AssignNewValue'layer7/pointwise_conv/bn/AssignNewValue2V
)layer7/pointwise_conv/bn/AssignNewValue_1)layer7/pointwise_conv/bn/AssignNewValue_12t
8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2x
:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12R
'layer7/pointwise_conv/bn/ReadVariableOp'layer7/pointwise_conv/bn/ReadVariableOp:W S
/
_output_shapes
:?????????`@
 
_user_specified_nameinputs: 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
:@: 

_output_shapes
:@:!

_output_shapes	
:?:!

_output_shapes	
:?:! 

_output_shapes	
:?:!%

_output_shapes	
:?:!*

_output_shapes	
:?:!/

_output_shapes	
:?:!4

_output_shapes	
:?:!9

_output_shapes	
:?:!>

_output_shapes	
:?"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
C
input_18
serving_default_input_1:0?????????`@9
dense0
StatefulPartitionedCall:0?????????
tensorflow/serving/predict:??
?
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer-6
layer_with_weights-4
layer-7
	layer_with_weights-5
	layer-8

layer-9
layer_with_weights-6
layer-10
layer_with_weights-7
layer-11
layer-12
layer_with_weights-8
layer-13
layer_with_weights-9
layer-14
layer-15
layer_with_weights-10
layer-16
layer_with_weights-11
layer-17
layer-18
layer_with_weights-12
layer-19
layer_with_weights-13
layer-20
layer-21
layer_with_weights-14
layer-22
layer_with_weights-15
layer-23
layer-24
layer_with_weights-16
layer-25
layer_with_weights-17
layer-26
layer-27
layer_with_weights-18
layer-28
layer_with_weights-19
layer-29
layer-30
 layer_with_weights-20
 layer-31
!layer_with_weights-21
!layer-32
"layer-33
#layer_with_weights-22
#layer-34
$layer_with_weights-23
$layer-35
%layer-36
&layer_with_weights-24
&layer-37
'layer_with_weights-25
'layer-38
(layer-39
)layer-40
*layer_with_weights-26
*layer-41
+	optimizer
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses
2_default_save_signature
3
signatures"
_tf_keras_network
"
_tf_keras_input_layer
?

4kernel
5	variables
6trainable_variables
7regularization_losses
8	keras_api
9__call__
*:&call_and_return_all_conditional_losses"
_tf_keras_layer
?
;axis
<beta
=moving_mean
>moving_variance
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses"
_tf_keras_layer
?
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses"
_tf_keras_layer
?
Kdepthwise_kernel
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses"
_tf_keras_layer
?
Raxis
Sbeta
Tmoving_mean
Umoving_variance
V	variables
Wtrainable_variables
Xregularization_losses
Y	keras_api
Z__call__
*[&call_and_return_all_conditional_losses"
_tf_keras_layer
?
\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses"
_tf_keras_layer
?

bkernel
c	variables
dtrainable_variables
eregularization_losses
f	keras_api
g__call__
*h&call_and_return_all_conditional_losses"
_tf_keras_layer
?
iaxis
jbeta
kmoving_mean
lmoving_variance
m	variables
ntrainable_variables
oregularization_losses
p	keras_api
q__call__
*r&call_and_return_all_conditional_losses"
_tf_keras_layer
?
s	variables
ttrainable_variables
uregularization_losses
v	keras_api
w__call__
*x&call_and_return_all_conditional_losses"
_tf_keras_layer
?
ydepthwise_kernel
z	variables
{trainable_variables
|regularization_losses
}	keras_api
~__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?depthwise_kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?kernel
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?axis
	?beta
?moving_mean
?moving_variance
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?kernel
	?bias
?	variables
?trainable_variables
?regularization_losses
?	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	?iter
?beta_1
?beta_2

?decay
?learning_rate4m?<m?Km?Sm?bm?jm?ym?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?	?m?4v?<v?Kv?Sv?bv?jv?yv?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?	?v?"
	optimizer
?
40
<1
=2
>3
K4
S5
T6
U7
b8
j9
k10
l11
y12
?13
?14
?15
?16
?17
?18
?19
?20
?21
?22
?23
?24
?25
?26
?27
?28
?29
?30
?31
?32
?33
?34
?35
?36
?37
?38
?39
?40
?41
?42
?43
?44
?45
?46
?47
?48
?49
?50
?51
?52
?53"
trackable_list_wrapper
?
40
<1
K2
S3
b4
j5
y6
?7
?8
?9
?10
?11
?12
?13
?14
?15
?16
?17
?18
?19
?20
?21
?22
?23
?24
?25
?26
?27"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
2_default_save_signature
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
?2?
/__inference_yamnet_frames_layer_call_fn_4847940
/__inference_yamnet_frames_layer_call_fn_4849231
/__inference_yamnet_frames_layer_call_fn_4849370
/__inference_yamnet_frames_layer_call_fn_4848728?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849615
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849860
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4848907
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849086?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?B?
"__inference__wrapped_model_4846596input_1"?
???
FullArgSpec
args? 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
-
?serving_default"
signature_map
,:* 2layer1/conv/kernel
'
40"
trackable_list_wrapper
'
40"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
5	variables
6trainable_variables
7regularization_losses
9__call__
*:&call_and_return_all_conditional_losses
&:"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_layer1/conv_layer_call_fn_4850008?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4850015?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
!: 2layer1/conv/bn/beta
*:(  (2layer1/conv/bn/moving_mean
.:,  (2layer1/conv/bn/moving_variance
5
<0
=1
>2"
trackable_list_wrapper
'
<0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses"
_generic_user_object
?2?
0__inference_layer1/conv/bn_layer_call_fn_4850028
0__inference_layer1/conv/bn_layer_call_fn_4850041?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4850058
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4850075?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses"
_generic_user_object
?2?
-__inference_layer1/relu_layer_call_fn_4850080?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4850085?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
@:> 2&layer2/depthwise_conv/depthwise_kernel
'
K0"
trackable_list_wrapper
'
K0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer2/depthwise_conv_layer_call_fn_4850092?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4850101?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
+:) 2layer2/depthwise_conv/bn/beta
4:2  (2$layer2/depthwise_conv/bn/moving_mean
8:6  (2(layer2/depthwise_conv/bn/moving_variance
5
S0
T1
U2"
trackable_list_wrapper
'
S0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
V	variables
Wtrainable_variables
Xregularization_losses
Z__call__
*[&call_and_return_all_conditional_losses
&["call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer2/depthwise_conv/bn_layer_call_fn_4850114
:__inference_layer2/depthwise_conv/bn_layer_call_fn_4850127?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850144
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850161?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer2/depthwise_conv/relu_layer_call_fn_4850166?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850171?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
6:4 @2layer2/pointwise_conv/kernel
'
b0"
trackable_list_wrapper
'
b0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
c	variables
dtrainable_variables
eregularization_losses
g__call__
*h&call_and_return_all_conditional_losses
&h"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer2/pointwise_conv_layer_call_fn_4850178?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4850185?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
+:)@2layer2/pointwise_conv/bn/beta
4:2@ (2$layer2/pointwise_conv/bn/moving_mean
8:6@ (2(layer2/pointwise_conv/bn/moving_variance
5
j0
k1
l2"
trackable_list_wrapper
'
j0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
m	variables
ntrainable_variables
oregularization_losses
q__call__
*r&call_and_return_all_conditional_losses
&r"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer2/pointwise_conv/bn_layer_call_fn_4850198
:__inference_layer2/pointwise_conv/bn_layer_call_fn_4850211?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850228
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850245?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
s	variables
ttrainable_variables
uregularization_losses
w__call__
*x&call_and_return_all_conditional_losses
&x"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer2/pointwise_conv/relu_layer_call_fn_4850250?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850255?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
@:>@2&layer3/depthwise_conv/depthwise_kernel
'
y0"
trackable_list_wrapper
'
y0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
z	variables
{trainable_variables
|regularization_losses
~__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer3/depthwise_conv_layer_call_fn_4850262?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4850271?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
+:)@2layer3/depthwise_conv/bn/beta
4:2@ (2$layer3/depthwise_conv/bn/moving_mean
8:6@ (2(layer3/depthwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer3/depthwise_conv/bn_layer_call_fn_4850284
:__inference_layer3/depthwise_conv/bn_layer_call_fn_4850297?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850314
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850331?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer3/depthwise_conv/relu_layer_call_fn_4850336?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850341?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
7:5@?2layer3/pointwise_conv/kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer3/pointwise_conv_layer_call_fn_4850348?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4850355?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer3/pointwise_conv/bn/beta
5:3? (2$layer3/pointwise_conv/bn/moving_mean
9:7? (2(layer3/pointwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer3/pointwise_conv/bn_layer_call_fn_4850368
:__inference_layer3/pointwise_conv/bn_layer_call_fn_4850381?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850398
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850415?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer3/pointwise_conv/relu_layer_call_fn_4850420?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850425?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
A:??2&layer4/depthwise_conv/depthwise_kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer4/depthwise_conv_layer_call_fn_4850432?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4850441?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer4/depthwise_conv/bn/beta
5:3? (2$layer4/depthwise_conv/bn/moving_mean
9:7? (2(layer4/depthwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer4/depthwise_conv/bn_layer_call_fn_4850454
:__inference_layer4/depthwise_conv/bn_layer_call_fn_4850467?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850484
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850501?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer4/depthwise_conv/relu_layer_call_fn_4850506?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850511?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
8:6??2layer4/pointwise_conv/kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer4/pointwise_conv_layer_call_fn_4850518?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4850525?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer4/pointwise_conv/bn/beta
5:3? (2$layer4/pointwise_conv/bn/moving_mean
9:7? (2(layer4/pointwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer4/pointwise_conv/bn_layer_call_fn_4850538
:__inference_layer4/pointwise_conv/bn_layer_call_fn_4850551?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850568
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850585?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer4/pointwise_conv/relu_layer_call_fn_4850590?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850595?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
A:??2&layer5/depthwise_conv/depthwise_kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer5/depthwise_conv_layer_call_fn_4850602?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4850611?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer5/depthwise_conv/bn/beta
5:3? (2$layer5/depthwise_conv/bn/moving_mean
9:7? (2(layer5/depthwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer5/depthwise_conv/bn_layer_call_fn_4850624
:__inference_layer5/depthwise_conv/bn_layer_call_fn_4850637?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850654
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850671?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer5/depthwise_conv/relu_layer_call_fn_4850676?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850681?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
8:6??2layer5/pointwise_conv/kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer5/pointwise_conv_layer_call_fn_4850688?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4850695?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer5/pointwise_conv/bn/beta
5:3? (2$layer5/pointwise_conv/bn/moving_mean
9:7? (2(layer5/pointwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer5/pointwise_conv/bn_layer_call_fn_4850708
:__inference_layer5/pointwise_conv/bn_layer_call_fn_4850721?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850738
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850755?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer5/pointwise_conv/relu_layer_call_fn_4850760?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850765?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
A:??2&layer6/depthwise_conv/depthwise_kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer6/depthwise_conv_layer_call_fn_4850772?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4850781?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer6/depthwise_conv/bn/beta
5:3? (2$layer6/depthwise_conv/bn/moving_mean
9:7? (2(layer6/depthwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer6/depthwise_conv/bn_layer_call_fn_4850794
:__inference_layer6/depthwise_conv/bn_layer_call_fn_4850807?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850824
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850841?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer6/depthwise_conv/relu_layer_call_fn_4850846?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850851?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
8:6??2layer6/pointwise_conv/kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer6/pointwise_conv_layer_call_fn_4850858?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4850865?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer6/pointwise_conv/bn/beta
5:3? (2$layer6/pointwise_conv/bn/moving_mean
9:7? (2(layer6/pointwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer6/pointwise_conv/bn_layer_call_fn_4850878
:__inference_layer6/pointwise_conv/bn_layer_call_fn_4850891?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850908
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850925?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer6/pointwise_conv/relu_layer_call_fn_4850930?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850935?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
A:??2&layer7/depthwise_conv/depthwise_kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer7/depthwise_conv_layer_call_fn_4850942?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4850951?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer7/depthwise_conv/bn/beta
5:3? (2$layer7/depthwise_conv/bn/moving_mean
9:7? (2(layer7/depthwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer7/depthwise_conv/bn_layer_call_fn_4850964
:__inference_layer7/depthwise_conv/bn_layer_call_fn_4850977?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850994
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4851011?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer7/depthwise_conv/relu_layer_call_fn_4851016?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4851021?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
8:6??2layer7/pointwise_conv/kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
7__inference_layer7/pointwise_conv_layer_call_fn_4851028?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4851035?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
,:*?2layer7/pointwise_conv/bn/beta
5:3? (2$layer7/pointwise_conv/bn/moving_mean
9:7? (2(layer7/pointwise_conv/bn/moving_variance
8
?0
?1
?2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_layer7/pointwise_conv/bn_layer_call_fn_4851048
:__inference_layer7/pointwise_conv/bn_layer_call_fn_4851061?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4851078
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4851095?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
<__inference_layer7/pointwise_conv/relu_layer_call_fn_4851100?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4851105?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
:__inference_global_average_pooling2d_layer_call_fn_4851110?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4851116?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
:	?
2dense/kernel
:
2
dense/bias
0
?0
?1"
trackable_list_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?non_trainable_variables
?layers
?metrics
 ?layer_regularization_losses
?layer_metrics
?	variables
?trainable_variables
?regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?2?
'__inference_dense_layer_call_fn_4851125?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
B__inference_dense_layer_call_and_return_conditional_losses_4851135?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
?
=0
>1
T2
U3
k4
l5
?6
?7
?8
?9
?10
?11
?12
?13
?14
?15
?16
?17
?18
?19
?20
?21
?22
?23
?24
?25"
trackable_list_wrapper
?
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
 31
!32
"33
#34
$35
%36
&37
'38
(39
)40
*41"
trackable_list_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
?B?
%__inference_signature_wrapper_4850001input_1"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
T0
U1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
k0
l1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
R

?total

?count
?	variables
?	keras_api"
_tf_keras_metric
c

?total

?count
?
_fn_kwargs
?	variables
?	keras_api"
_tf_keras_metric
:  (2total
:  (2count
0
?0
?1"
trackable_list_wrapper
.
?	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
?0
?1"
trackable_list_wrapper
.
?	variables"
_generic_user_object
1:/ 2Adam/layer1/conv/kernel/m
&:$ 2Adam/layer1/conv/bn/beta/m
E:C 2-Adam/layer2/depthwise_conv/depthwise_kernel/m
0:. 2$Adam/layer2/depthwise_conv/bn/beta/m
;:9 @2#Adam/layer2/pointwise_conv/kernel/m
0:.@2$Adam/layer2/pointwise_conv/bn/beta/m
E:C@2-Adam/layer3/depthwise_conv/depthwise_kernel/m
0:.@2$Adam/layer3/depthwise_conv/bn/beta/m
<::@?2#Adam/layer3/pointwise_conv/kernel/m
1:/?2$Adam/layer3/pointwise_conv/bn/beta/m
F:D?2-Adam/layer4/depthwise_conv/depthwise_kernel/m
1:/?2$Adam/layer4/depthwise_conv/bn/beta/m
=:;??2#Adam/layer4/pointwise_conv/kernel/m
1:/?2$Adam/layer4/pointwise_conv/bn/beta/m
F:D?2-Adam/layer5/depthwise_conv/depthwise_kernel/m
1:/?2$Adam/layer5/depthwise_conv/bn/beta/m
=:;??2#Adam/layer5/pointwise_conv/kernel/m
1:/?2$Adam/layer5/pointwise_conv/bn/beta/m
F:D?2-Adam/layer6/depthwise_conv/depthwise_kernel/m
1:/?2$Adam/layer6/depthwise_conv/bn/beta/m
=:;??2#Adam/layer6/pointwise_conv/kernel/m
1:/?2$Adam/layer6/pointwise_conv/bn/beta/m
F:D?2-Adam/layer7/depthwise_conv/depthwise_kernel/m
1:/?2$Adam/layer7/depthwise_conv/bn/beta/m
=:;??2#Adam/layer7/pointwise_conv/kernel/m
1:/?2$Adam/layer7/pointwise_conv/bn/beta/m
$:"	?
2Adam/dense/kernel/m
:
2Adam/dense/bias/m
1:/ 2Adam/layer1/conv/kernel/v
&:$ 2Adam/layer1/conv/bn/beta/v
E:C 2-Adam/layer2/depthwise_conv/depthwise_kernel/v
0:. 2$Adam/layer2/depthwise_conv/bn/beta/v
;:9 @2#Adam/layer2/pointwise_conv/kernel/v
0:.@2$Adam/layer2/pointwise_conv/bn/beta/v
E:C@2-Adam/layer3/depthwise_conv/depthwise_kernel/v
0:.@2$Adam/layer3/depthwise_conv/bn/beta/v
<::@?2#Adam/layer3/pointwise_conv/kernel/v
1:/?2$Adam/layer3/pointwise_conv/bn/beta/v
F:D?2-Adam/layer4/depthwise_conv/depthwise_kernel/v
1:/?2$Adam/layer4/depthwise_conv/bn/beta/v
=:;??2#Adam/layer4/pointwise_conv/kernel/v
1:/?2$Adam/layer4/pointwise_conv/bn/beta/v
F:D?2-Adam/layer5/depthwise_conv/depthwise_kernel/v
1:/?2$Adam/layer5/depthwise_conv/bn/beta/v
=:;??2#Adam/layer5/pointwise_conv/kernel/v
1:/?2$Adam/layer5/pointwise_conv/bn/beta/v
F:D?2-Adam/layer6/depthwise_conv/depthwise_kernel/v
1:/?2$Adam/layer6/depthwise_conv/bn/beta/v
=:;??2#Adam/layer6/pointwise_conv/kernel/v
1:/?2$Adam/layer6/pointwise_conv/bn/beta/v
F:D?2-Adam/layer7/depthwise_conv/depthwise_kernel/v
1:/?2$Adam/layer7/depthwise_conv/bn/beta/v
=:;??2#Adam/layer7/pointwise_conv/kernel/v
1:/?2$Adam/layer7/pointwise_conv/bn/beta/v
$:"	?
2Adam/dense/kernel/v
:
2Adam/dense/bias/v
	J
Const
J	
Const_1
J	
Const_2
J	
Const_3
J	
Const_4
J	
Const_5
J	
Const_6
J	
Const_7
J	
Const_8
J	
Const_9
J

Const_10
J

Const_11
J

Const_12?
"__inference__wrapped_model_4846596?y4?<=>K?STUb?jkly???????????????????????????????????????????????????8?5
.?+
)?&
input_1?????????`@
? "-?*
(
dense?
dense?????????
?
B__inference_dense_layer_call_and_return_conditional_losses_4851135_??0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????

? }
'__inference_dense_layer_call_fn_4851125R??0?-
&?#
!?
inputs??????????
? "??????????
?
U__inference_global_average_pooling2d_layer_call_and_return_conditional_losses_4851116?R?O
H?E
C?@
inputs4????????????????????????????????????
? ".?+
$?!
0??????????????????
? ?
:__inference_global_average_pooling2d_layer_call_fn_4851110wR?O
H?E
C?@
inputs4????????????????????????????????????
? "!????????????????????
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4850058??<=>M?J
C?@
:?7
inputs+??????????????????????????? 
p 
? "??<
5?2
0+??????????????????????????? 
? ?
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_4850075??<=>M?J
C?@
:?7
inputs+??????????????????????????? 
p
? "??<
5?2
0+??????????????????????????? 
? ?
0__inference_layer1/conv/bn_layer_call_fn_4850028??<=>M?J
C?@
:?7
inputs+??????????????????????????? 
p 
? "2?/+??????????????????????????? ?
0__inference_layer1/conv/bn_layer_call_fn_4850041??<=>M?J
C?@
:?7
inputs+??????????????????????????? 
p
? "2?/+??????????????????????????? ?
H__inference_layer1/conv_layer_call_and_return_conditional_losses_4850015k47?4
-?*
(?%
inputs?????????`@
? "-?*
#? 
0?????????0  
? ?
-__inference_layer1/conv_layer_call_fn_4850008^47?4
-?*
(?%
inputs?????????`@
? " ??????????0  ?
H__inference_layer1/relu_layer_call_and_return_conditional_losses_4850085h7?4
-?*
(?%
inputs?????????0  
? "-?*
#? 
0?????????0  
? ?
-__inference_layer1/relu_layer_call_fn_4850080[7?4
-?*
(?%
inputs?????????0  
? " ??????????0  ?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850144??STUM?J
C?@
:?7
inputs+??????????????????????????? 
p 
? "??<
5?2
0+??????????????????????????? 
? ?
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850161??STUM?J
C?@
:?7
inputs+??????????????????????????? 
p
? "??<
5?2
0+??????????????????????????? 
? ?
:__inference_layer2/depthwise_conv/bn_layer_call_fn_4850114??STUM?J
C?@
:?7
inputs+??????????????????????????? 
p 
? "2?/+??????????????????????????? ?
:__inference_layer2/depthwise_conv/bn_layer_call_fn_4850127??STUM?J
C?@
:?7
inputs+??????????????????????????? 
p
? "2?/+??????????????????????????? ?
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850171h7?4
-?*
(?%
inputs?????????0  
? "-?*
#? 
0?????????0  
? ?
<__inference_layer2/depthwise_conv/relu_layer_call_fn_4850166[7?4
-?*
(?%
inputs?????????0  
? " ??????????0  ?
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_4850101kK7?4
-?*
(?%
inputs?????????0  
? "-?*
#? 
0?????????0  
? ?
7__inference_layer2/depthwise_conv_layer_call_fn_4850092^K7?4
-?*
(?%
inputs?????????0  
? " ??????????0  ?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850228??jklM?J
C?@
:?7
inputs+???????????????????????????@
p 
? "??<
5?2
0+???????????????????????????@
? ?
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850245??jklM?J
C?@
:?7
inputs+???????????????????????????@
p
? "??<
5?2
0+???????????????????????????@
? ?
:__inference_layer2/pointwise_conv/bn_layer_call_fn_4850198??jklM?J
C?@
:?7
inputs+???????????????????????????@
p 
? "2?/+???????????????????????????@?
:__inference_layer2/pointwise_conv/bn_layer_call_fn_4850211??jklM?J
C?@
:?7
inputs+???????????????????????????@
p
? "2?/+???????????????????????????@?
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850255h7?4
-?*
(?%
inputs?????????0 @
? "-?*
#? 
0?????????0 @
? ?
<__inference_layer2/pointwise_conv/relu_layer_call_fn_4850250[7?4
-?*
(?%
inputs?????????0 @
? " ??????????0 @?
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_4850185kb7?4
-?*
(?%
inputs?????????0  
? "-?*
#? 
0?????????0 @
? ?
7__inference_layer2/pointwise_conv_layer_call_fn_4850178^b7?4
-?*
(?%
inputs?????????0  
? " ??????????0 @?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850314?????M?J
C?@
:?7
inputs+???????????????????????????@
p 
? "??<
5?2
0+???????????????????????????@
? ?
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850331?????M?J
C?@
:?7
inputs+???????????????????????????@
p
? "??<
5?2
0+???????????????????????????@
? ?
:__inference_layer3/depthwise_conv/bn_layer_call_fn_4850284?????M?J
C?@
:?7
inputs+???????????????????????????@
p 
? "2?/+???????????????????????????@?
:__inference_layer3/depthwise_conv/bn_layer_call_fn_4850297?????M?J
C?@
:?7
inputs+???????????????????????????@
p
? "2?/+???????????????????????????@?
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850341h7?4
-?*
(?%
inputs?????????@
? "-?*
#? 
0?????????@
? ?
<__inference_layer3/depthwise_conv/relu_layer_call_fn_4850336[7?4
-?*
(?%
inputs?????????@
? " ??????????@?
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_4850271ky7?4
-?*
(?%
inputs?????????0 @
? "-?*
#? 
0?????????@
? ?
7__inference_layer3/depthwise_conv_layer_call_fn_4850262^y7?4
-?*
(?%
inputs?????????0 @
? " ??????????@?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850398?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850415?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer3/pointwise_conv/bn_layer_call_fn_4850368?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer3/pointwise_conv/bn_layer_call_fn_4850381?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850425j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer3/pointwise_conv/relu_layer_call_fn_4850420]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_4850355m?7?4
-?*
(?%
inputs?????????@
? ".?+
$?!
0??????????
? ?
7__inference_layer3/pointwise_conv_layer_call_fn_4850348`?7?4
-?*
(?%
inputs?????????@
? "!????????????
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850484?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850501?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer4/depthwise_conv/bn_layer_call_fn_4850454?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer4/depthwise_conv/bn_layer_call_fn_4850467?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850511j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer4/depthwise_conv/relu_layer_call_fn_4850506]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_4850441n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer4/depthwise_conv_layer_call_fn_4850432a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850568?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850585?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer4/pointwise_conv/bn_layer_call_fn_4850538?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer4/pointwise_conv/bn_layer_call_fn_4850551?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850595j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer4/pointwise_conv/relu_layer_call_fn_4850590]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_4850525n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer4/pointwise_conv_layer_call_fn_4850518a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850654?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850671?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer5/depthwise_conv/bn_layer_call_fn_4850624?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer5/depthwise_conv/bn_layer_call_fn_4850637?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850681j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer5/depthwise_conv/relu_layer_call_fn_4850676]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_4850611n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer5/depthwise_conv_layer_call_fn_4850602a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850738?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850755?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer5/pointwise_conv/bn_layer_call_fn_4850708?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer5/pointwise_conv/bn_layer_call_fn_4850721?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850765j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer5/pointwise_conv/relu_layer_call_fn_4850760]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_4850695n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer5/pointwise_conv_layer_call_fn_4850688a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850824?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850841?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer6/depthwise_conv/bn_layer_call_fn_4850794?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer6/depthwise_conv/bn_layer_call_fn_4850807?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_4850851j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer6/depthwise_conv/relu_layer_call_fn_4850846]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_4850781n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer6/depthwise_conv_layer_call_fn_4850772a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850908?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_4850925?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer6/pointwise_conv/bn_layer_call_fn_4850878?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer6/pointwise_conv/bn_layer_call_fn_4850891?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_4850935j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer6/pointwise_conv/relu_layer_call_fn_4850930]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_4850865n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer6/pointwise_conv_layer_call_fn_4850858a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4850994?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_4851011?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer7/depthwise_conv/bn_layer_call_fn_4850964?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer7/depthwise_conv/bn_layer_call_fn_4850977?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_4851021j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer7/depthwise_conv/relu_layer_call_fn_4851016]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_4850951n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer7/depthwise_conv_layer_call_fn_4850942a?8?5
.?+
)?&
inputs??????????
? "!????????????
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4851078?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "@?=
6?3
0,????????????????????????????
? ?
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_4851095?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "@?=
6?3
0,????????????????????????????
? ?
:__inference_layer7/pointwise_conv/bn_layer_call_fn_4851048?????N?K
D?A
;?8
inputs,????????????????????????????
p 
? "3?0,?????????????????????????????
:__inference_layer7/pointwise_conv/bn_layer_call_fn_4851061?????N?K
D?A
;?8
inputs,????????????????????????????
p
? "3?0,?????????????????????????????
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_4851105j8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
<__inference_layer7/pointwise_conv/relu_layer_call_fn_4851100]8?5
.?+
)?&
inputs??????????
? "!????????????
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_4851035n?8?5
.?+
)?&
inputs??????????
? ".?+
$?!
0??????????
? ?
7__inference_layer7/pointwise_conv_layer_call_fn_4851028a?8?5
.?+
)?&
inputs??????????
? "!????????????
%__inference_signature_wrapper_4850001?y4?<=>K?STUb?jkly???????????????????????????????????????????????????C?@
? 
9?6
4
input_1)?&
input_1?????????`@"-?*
(
dense?
dense?????????
?
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4848907?y4?<=>K?STUb?jkly???????????????????????????????????????????????????@?=
6?3
)?&
input_1?????????`@
p 

 
? "%?"
?
0?????????

? ?
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849086?y4?<=>K?STUb?jkly???????????????????????????????????????????????????@?=
6?3
)?&
input_1?????????`@
p

 
? "%?"
?
0?????????

? ?
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849615?y4?<=>K?STUb?jkly?????????????????????????????????????????????????????<
5?2
(?%
inputs?????????`@
p 

 
? "%?"
?
0?????????

? ?
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_4849860?y4?<=>K?STUb?jkly?????????????????????????????????????????????????????<
5?2
(?%
inputs?????????`@
p

 
? "%?"
?
0?????????

? ?
/__inference_yamnet_frames_layer_call_fn_4847940?y4?<=>K?STUb?jkly???????????????????????????????????????????????????@?=
6?3
)?&
input_1?????????`@
p 

 
? "??????????
?
/__inference_yamnet_frames_layer_call_fn_4848728?y4?<=>K?STUb?jkly???????????????????????????????????????????????????@?=
6?3
)?&
input_1?????????`@
p

 
? "??????????
?
/__inference_yamnet_frames_layer_call_fn_4849231?y4?<=>K?STUb?jkly?????????????????????????????????????????????????????<
5?2
(?%
inputs?????????`@
p 

 
? "??????????
?
/__inference_yamnet_frames_layer_call_fn_4849370?y4?<=>K?STUb?jkly?????????????????????????????????????????????????????<
5?2
(?%
inputs?????????`@
p

 
? "??????????
