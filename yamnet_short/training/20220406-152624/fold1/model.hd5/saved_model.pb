µç.
Û
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
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

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

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
ú
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
epsilonfloat%·Ñ8"&
exponential_avg_factorfloat%  ?";
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

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
delete_old_dirsbool(
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
dtypetype
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
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
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
Á
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
executor_typestring ¨
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

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.8.02v2.8.0-rc1-32-g3f878cff5b68áú(

layer1/conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_namelayer1/conv/kernel

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

layer1/conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_namelayer1/conv/bn/moving_mean

.layer1/conv/bn/moving_mean/Read/ReadVariableOpReadVariableOplayer1/conv/bn/moving_mean*
_output_shapes
: *
dtype0

layer1/conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape: */
shared_name layer1/conv/bn/moving_variance

2layer1/conv/bn/moving_variance/Read/ReadVariableOpReadVariableOplayer1/conv/bn/moving_variance*
_output_shapes
: *
dtype0
°
&layer2/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *7
shared_name(&layer2/depthwise_conv/depthwise_kernel
İ
:layer2/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer2/depthwise_conv/depthwise_kernel*&
_output_shapes
: *
dtype0

layer2/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *.
shared_namelayer2/depthwise_conv/bn/beta

1layer2/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer2/depthwise_conv/bn/beta*
_output_shapes
: *
dtype0
 
$layer2/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$layer2/depthwise_conv/bn/moving_mean

8layer2/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer2/depthwise_conv/bn/moving_mean*
_output_shapes
: *
dtype0
¨
(layer2/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape: *9
shared_name*(layer2/depthwise_conv/bn/moving_variance
Ħ
<layer2/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer2/depthwise_conv/bn/moving_variance*
_output_shapes
: *
dtype0

layer2/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*-
shared_namelayer2/pointwise_conv/kernel

0layer2/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer2/pointwise_conv/kernel*&
_output_shapes
: @*
dtype0

layer2/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*.
shared_namelayer2/pointwise_conv/bn/beta

1layer2/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer2/pointwise_conv/bn/beta*
_output_shapes
:@*
dtype0
 
$layer2/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$layer2/pointwise_conv/bn/moving_mean

8layer2/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer2/pointwise_conv/bn/moving_mean*
_output_shapes
:@*
dtype0
¨
(layer2/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*9
shared_name*(layer2/pointwise_conv/bn/moving_variance
Ħ
<layer2/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer2/pointwise_conv/bn/moving_variance*
_output_shapes
:@*
dtype0
°
&layer3/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*7
shared_name(&layer3/depthwise_conv/depthwise_kernel
İ
:layer3/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer3/depthwise_conv/depthwise_kernel*&
_output_shapes
:@*
dtype0

layer3/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*.
shared_namelayer3/depthwise_conv/bn/beta

1layer3/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer3/depthwise_conv/bn/beta*
_output_shapes
:@*
dtype0
 
$layer3/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$layer3/depthwise_conv/bn/moving_mean

8layer3/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer3/depthwise_conv/bn/moving_mean*
_output_shapes
:@*
dtype0
¨
(layer3/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*9
shared_name*(layer3/depthwise_conv/bn/moving_variance
Ħ
<layer3/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer3/depthwise_conv/bn/moving_variance*
_output_shapes
:@*
dtype0

layer3/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*-
shared_namelayer3/pointwise_conv/kernel

0layer3/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer3/pointwise_conv/kernel*'
_output_shapes
:@*
dtype0

layer3/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer3/pointwise_conv/bn/beta

1layer3/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer3/pointwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer3/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer3/pointwise_conv/bn/moving_mean

8layer3/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer3/pointwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer3/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer3/pointwise_conv/bn/moving_variance
˘
<layer3/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer3/pointwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0
ħ
&layer4/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&layer4/depthwise_conv/depthwise_kernel
Ş
:layer4/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer4/depthwise_conv/depthwise_kernel*'
_output_shapes
:*
dtype0

layer4/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer4/depthwise_conv/bn/beta

1layer4/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer4/depthwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer4/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer4/depthwise_conv/bn/moving_mean

8layer4/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer4/depthwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer4/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer4/depthwise_conv/bn/moving_variance
˘
<layer4/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer4/depthwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0

layer4/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_namelayer4/pointwise_conv/kernel

0layer4/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer4/pointwise_conv/kernel*(
_output_shapes
:*
dtype0

layer4/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer4/pointwise_conv/bn/beta

1layer4/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer4/pointwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer4/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer4/pointwise_conv/bn/moving_mean

8layer4/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer4/pointwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer4/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer4/pointwise_conv/bn/moving_variance
˘
<layer4/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer4/pointwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0
ħ
&layer5/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&layer5/depthwise_conv/depthwise_kernel
Ş
:layer5/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer5/depthwise_conv/depthwise_kernel*'
_output_shapes
:*
dtype0

layer5/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer5/depthwise_conv/bn/beta

1layer5/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer5/depthwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer5/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer5/depthwise_conv/bn/moving_mean

8layer5/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer5/depthwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer5/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer5/depthwise_conv/bn/moving_variance
˘
<layer5/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer5/depthwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0

layer5/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_namelayer5/pointwise_conv/kernel

0layer5/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer5/pointwise_conv/kernel*(
_output_shapes
:*
dtype0

layer5/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer5/pointwise_conv/bn/beta

1layer5/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer5/pointwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer5/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer5/pointwise_conv/bn/moving_mean

8layer5/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer5/pointwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer5/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer5/pointwise_conv/bn/moving_variance
˘
<layer5/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer5/pointwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0
ħ
&layer6/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&layer6/depthwise_conv/depthwise_kernel
Ş
:layer6/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer6/depthwise_conv/depthwise_kernel*'
_output_shapes
:*
dtype0

layer6/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer6/depthwise_conv/bn/beta

1layer6/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer6/depthwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer6/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer6/depthwise_conv/bn/moving_mean

8layer6/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer6/depthwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer6/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer6/depthwise_conv/bn/moving_variance
˘
<layer6/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer6/depthwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0

layer6/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_namelayer6/pointwise_conv/kernel

0layer6/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer6/pointwise_conv/kernel*(
_output_shapes
:*
dtype0

layer6/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer6/pointwise_conv/bn/beta

1layer6/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer6/pointwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer6/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer6/pointwise_conv/bn/moving_mean

8layer6/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer6/pointwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer6/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer6/pointwise_conv/bn/moving_variance
˘
<layer6/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer6/pointwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0
ħ
&layer7/depthwise_conv/depthwise_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&layer7/depthwise_conv/depthwise_kernel
Ş
:layer7/depthwise_conv/depthwise_kernel/Read/ReadVariableOpReadVariableOp&layer7/depthwise_conv/depthwise_kernel*'
_output_shapes
:*
dtype0

layer7/depthwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer7/depthwise_conv/bn/beta

1layer7/depthwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer7/depthwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer7/depthwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer7/depthwise_conv/bn/moving_mean

8layer7/depthwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer7/depthwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer7/depthwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer7/depthwise_conv/bn/moving_variance
˘
<layer7/depthwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer7/depthwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0

layer7/pointwise_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_namelayer7/pointwise_conv/kernel

0layer7/pointwise_conv/kernel/Read/ReadVariableOpReadVariableOplayer7/pointwise_conv/kernel*(
_output_shapes
:*
dtype0

layer7/pointwise_conv/bn/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_namelayer7/pointwise_conv/bn/beta

1layer7/pointwise_conv/bn/beta/Read/ReadVariableOpReadVariableOplayer7/pointwise_conv/bn/beta*
_output_shapes	
:*
dtype0
Ħ
$layer7/pointwise_conv/bn/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$layer7/pointwise_conv/bn/moving_mean

8layer7/pointwise_conv/bn/moving_mean/Read/ReadVariableOpReadVariableOp$layer7/pointwise_conv/bn/moving_mean*
_output_shapes	
:*
dtype0
İ
(layer7/pointwise_conv/bn/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(layer7/pointwise_conv/bn/moving_variance
˘
<layer7/pointwise_conv/bn/moving_variance/Read/ReadVariableOpReadVariableOp(layer7/pointwise_conv/bn/moving_variance*
_output_shapes	
:*
dtype0
y
dense_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	
*
shared_namedense_6/kernel
r
"dense_6/kernel/Read/ReadVariableOpReadVariableOpdense_6/kernel*
_output_shapes
:	
*
dtype0
p
dense_6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_6/bias
i
 dense_6/bias/Read/ReadVariableOpReadVariableOpdense_6/bias*
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

Adam/layer1/conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_nameAdam/layer1/conv/kernel/m

-Adam/layer1/conv/kernel/m/Read/ReadVariableOpReadVariableOpAdam/layer1/conv/kernel/m*&
_output_shapes
: *
dtype0

Adam/layer1/conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_nameAdam/layer1/conv/bn/beta/m

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
·
AAdam/layer2/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer2/depthwise_conv/depthwise_kernel/m*&
_output_shapes
: *
dtype0
 
$Adam/layer2/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$Adam/layer2/depthwise_conv/bn/beta/m

8Adam/layer2/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer2/depthwise_conv/bn/beta/m*
_output_shapes
: *
dtype0
Ş
#Adam/layer2/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*4
shared_name%#Adam/layer2/pointwise_conv/kernel/m
£
7Adam/layer2/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer2/pointwise_conv/kernel/m*&
_output_shapes
: @*
dtype0
 
$Adam/layer2/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer2/pointwise_conv/bn/beta/m

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
·
AAdam/layer3/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer3/depthwise_conv/depthwise_kernel/m*&
_output_shapes
:@*
dtype0
 
$Adam/layer3/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer3/depthwise_conv/bn/beta/m

8Adam/layer3/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer3/depthwise_conv/bn/beta/m*
_output_shapes
:@*
dtype0
Ğ
#Adam/layer3/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Adam/layer3/pointwise_conv/kernel/m
¤
7Adam/layer3/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer3/pointwise_conv/kernel/m*'
_output_shapes
:@*
dtype0
Ħ
$Adam/layer3/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer3/pointwise_conv/bn/beta/m

8Adam/layer3/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer3/pointwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
ż
-Adam/layer4/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer4/depthwise_conv/depthwise_kernel/m
¸
AAdam/layer4/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer4/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer4/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer4/depthwise_conv/bn/beta/m

8Adam/layer4/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer4/depthwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer4/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer4/pointwise_conv/kernel/m
?
7Adam/layer4/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer4/pointwise_conv/kernel/m*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer4/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer4/pointwise_conv/bn/beta/m

8Adam/layer4/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer4/pointwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
ż
-Adam/layer5/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer5/depthwise_conv/depthwise_kernel/m
¸
AAdam/layer5/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer5/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer5/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer5/depthwise_conv/bn/beta/m

8Adam/layer5/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer5/depthwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer5/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer5/pointwise_conv/kernel/m
?
7Adam/layer5/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer5/pointwise_conv/kernel/m*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer5/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer5/pointwise_conv/bn/beta/m

8Adam/layer5/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer5/pointwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
ż
-Adam/layer6/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer6/depthwise_conv/depthwise_kernel/m
¸
AAdam/layer6/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer6/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer6/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer6/depthwise_conv/bn/beta/m

8Adam/layer6/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer6/depthwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer6/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer6/pointwise_conv/kernel/m
?
7Adam/layer6/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer6/pointwise_conv/kernel/m*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer6/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer6/pointwise_conv/bn/beta/m

8Adam/layer6/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer6/pointwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
ż
-Adam/layer7/depthwise_conv/depthwise_kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer7/depthwise_conv/depthwise_kernel/m
¸
AAdam/layer7/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOpReadVariableOp-Adam/layer7/depthwise_conv/depthwise_kernel/m*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer7/depthwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer7/depthwise_conv/bn/beta/m

8Adam/layer7/depthwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer7/depthwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer7/pointwise_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer7/pointwise_conv/kernel/m
?
7Adam/layer7/pointwise_conv/kernel/m/Read/ReadVariableOpReadVariableOp#Adam/layer7/pointwise_conv/kernel/m*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer7/pointwise_conv/bn/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer7/pointwise_conv/bn/beta/m

8Adam/layer7/pointwise_conv/bn/beta/m/Read/ReadVariableOpReadVariableOp$Adam/layer7/pointwise_conv/bn/beta/m*
_output_shapes	
:*
dtype0

Adam/dense_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	
*&
shared_nameAdam/dense_6/kernel/m

)Adam/dense_6/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_6/kernel/m*
_output_shapes
:	
*
dtype0
~
Adam/dense_6/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/dense_6/bias/m
w
'Adam/dense_6/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_6/bias/m*
_output_shapes
:
*
dtype0

Adam/layer1/conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_nameAdam/layer1/conv/kernel/v

-Adam/layer1/conv/kernel/v/Read/ReadVariableOpReadVariableOpAdam/layer1/conv/kernel/v*&
_output_shapes
: *
dtype0

Adam/layer1/conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_nameAdam/layer1/conv/bn/beta/v

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
·
AAdam/layer2/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer2/depthwise_conv/depthwise_kernel/v*&
_output_shapes
: *
dtype0
 
$Adam/layer2/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$Adam/layer2/depthwise_conv/bn/beta/v

8Adam/layer2/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer2/depthwise_conv/bn/beta/v*
_output_shapes
: *
dtype0
Ş
#Adam/layer2/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*4
shared_name%#Adam/layer2/pointwise_conv/kernel/v
£
7Adam/layer2/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer2/pointwise_conv/kernel/v*&
_output_shapes
: @*
dtype0
 
$Adam/layer2/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer2/pointwise_conv/bn/beta/v

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
·
AAdam/layer3/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer3/depthwise_conv/depthwise_kernel/v*&
_output_shapes
:@*
dtype0
 
$Adam/layer3/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*5
shared_name&$Adam/layer3/depthwise_conv/bn/beta/v

8Adam/layer3/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer3/depthwise_conv/bn/beta/v*
_output_shapes
:@*
dtype0
Ğ
#Adam/layer3/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Adam/layer3/pointwise_conv/kernel/v
¤
7Adam/layer3/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer3/pointwise_conv/kernel/v*'
_output_shapes
:@*
dtype0
Ħ
$Adam/layer3/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer3/pointwise_conv/bn/beta/v

8Adam/layer3/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer3/pointwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
ż
-Adam/layer4/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer4/depthwise_conv/depthwise_kernel/v
¸
AAdam/layer4/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer4/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer4/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer4/depthwise_conv/bn/beta/v

8Adam/layer4/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer4/depthwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer4/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer4/pointwise_conv/kernel/v
?
7Adam/layer4/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer4/pointwise_conv/kernel/v*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer4/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer4/pointwise_conv/bn/beta/v

8Adam/layer4/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer4/pointwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
ż
-Adam/layer5/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer5/depthwise_conv/depthwise_kernel/v
¸
AAdam/layer5/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer5/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer5/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer5/depthwise_conv/bn/beta/v

8Adam/layer5/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer5/depthwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer5/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer5/pointwise_conv/kernel/v
?
7Adam/layer5/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer5/pointwise_conv/kernel/v*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer5/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer5/pointwise_conv/bn/beta/v

8Adam/layer5/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer5/pointwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
ż
-Adam/layer6/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer6/depthwise_conv/depthwise_kernel/v
¸
AAdam/layer6/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer6/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer6/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer6/depthwise_conv/bn/beta/v

8Adam/layer6/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer6/depthwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer6/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer6/pointwise_conv/kernel/v
?
7Adam/layer6/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer6/pointwise_conv/kernel/v*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer6/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer6/pointwise_conv/bn/beta/v

8Adam/layer6/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer6/pointwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
ż
-Adam/layer7/depthwise_conv/depthwise_kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/layer7/depthwise_conv/depthwise_kernel/v
¸
AAdam/layer7/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOpReadVariableOp-Adam/layer7/depthwise_conv/depthwise_kernel/v*'
_output_shapes
:*
dtype0
Ħ
$Adam/layer7/depthwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer7/depthwise_conv/bn/beta/v

8Adam/layer7/depthwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer7/depthwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0
Ĵ
#Adam/layer7/pointwise_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#Adam/layer7/pointwise_conv/kernel/v
?
7Adam/layer7/pointwise_conv/kernel/v/Read/ReadVariableOpReadVariableOp#Adam/layer7/pointwise_conv/kernel/v*(
_output_shapes
:*
dtype0
Ħ
$Adam/layer7/pointwise_conv/bn/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*5
shared_name&$Adam/layer7/pointwise_conv/bn/beta/v

8Adam/layer7/pointwise_conv/bn/beta/v/Read/ReadVariableOpReadVariableOp$Adam/layer7/pointwise_conv/bn/beta/v*
_output_shapes	
:*
dtype0

Adam/dense_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	
*&
shared_nameAdam/dense_6/kernel/v

)Adam/dense_6/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_6/kernel/v*
_output_shapes
:	
*
dtype0
~
Adam/dense_6/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/dense_6/bias/v
w
'Adam/dense_6/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_6/bias/v*
_output_shapes
:
*
dtype0
R
ConstConst*
_output_shapes
: *
dtype0*
valueB *  ?
T
Const_1Const*
_output_shapes
: *
dtype0*
valueB *  ?
T
Const_2Const*
_output_shapes
:@*
dtype0*
valueB@*  ?
T
Const_3Const*
_output_shapes
:@*
dtype0*
valueB@*  ?
V
Const_4Const*
_output_shapes	
:*
dtype0*
valueB*  ?
V
Const_5Const*
_output_shapes	
:*
dtype0*
valueB*  ?
V
Const_6Const*
_output_shapes	
:*
dtype0*
valueB*  ?
V
Const_7Const*
_output_shapes	
:*
dtype0*
valueB*  ?
V
Const_8Const*
_output_shapes	
:*
dtype0*
valueB*  ?
V
Const_9Const*
_output_shapes	
:*
dtype0*
valueB*  ?
W
Const_10Const*
_output_shapes	
:*
dtype0*
valueB*  ?
W
Const_11Const*
_output_shapes	
:*
dtype0*
valueB*  ?
W
Const_12Const*
_output_shapes	
:*
dtype0*
valueB*  ?

NoOpNoOp
Ñ?
Const_13Const"/device:CPU:0*
_output_shapes
: *
dtype0*?
valueŭÂBùÂ BñÂ
Ŭ
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


4kernel
5	variables
6trainable_variables
7regularization_losses
8	keras_api
9__call__
*:&call_and_return_all_conditional_losses*
Ê
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

E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses* 
Ĥ
Kdepthwise_kernel
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses*
Ê
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

\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses* 


bkernel
c	variables
dtrainable_variables
eregularization_losses
f	keras_api
g__call__
*h&call_and_return_all_conditional_losses*
Ê
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

s	variables
ttrainable_variables
uregularization_losses
v	keras_api
w__call__
*x&call_and_return_all_conditional_losses* 
Ĥ
ydepthwise_kernel
z	variables
{trainable_variables
|regularization_losses
}	keras_api
~__call__
*&call_and_return_all_conditional_losses*
Ô
	axis
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses*

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses* 
£
kernel
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses*
Ô
	axis
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+ &call_and_return_all_conditional_losses*

Ħ	variables
˘trainable_variables
£regularization_losses
¤	keras_api
?__call__
+Ĥ&call_and_return_all_conditional_losses* 
­
§depthwise_kernel
¨	variables
İtrainable_variables
Şregularization_losses
Ğ	keras_api
Ĵ__call__
+­&call_and_return_all_conditional_losses*
Ô
	?axis
	Żbeta
°moving_mean
ħmoving_variance
²	variables
³trainable_variables
´regularization_losses
µ	keras_api
ĥ__call__
+·&call_and_return_all_conditional_losses*

¸	variables
ıtrainable_variables
şregularization_losses
ğ	keras_api
ĵ__call__
+½&call_and_return_all_conditional_losses* 
£
?kernel
ż	variables
Àtrainable_variables
Áregularization_losses
Â	keras_api
?__call__
+Ä&call_and_return_all_conditional_losses*
Ô
	Ċaxis
	Ĉbeta
Çmoving_mean
Èmoving_variance
É	variables
Êtrainable_variables
Ëregularization_losses
Ì	keras_api
Í__call__
+Î&call_and_return_all_conditional_losses*

Ï	variables
?trainable_variables
Ñregularization_losses
Ò	keras_api
Ó__call__
+Ô&call_and_return_all_conditional_losses* 
­
Ġdepthwise_kernel
Ö	variables
×trainable_variables
Ĝregularization_losses
Ù	keras_api
Ú__call__
+Û&call_and_return_all_conditional_losses*
Ô
	Üaxis
	Ŭbeta
Ŝmoving_mean
ßmoving_variance
à	variables
átrainable_variables
âregularization_losses
?	keras_api
ä__call__
+ċ&call_and_return_all_conditional_losses*

ĉ	variables
çtrainable_variables
èregularization_losses
é	keras_api
ê__call__
+ë&call_and_return_all_conditional_losses* 
£
ìkernel
í	variables
îtrainable_variables
ïregularization_losses
?	keras_api
ñ__call__
+ò&call_and_return_all_conditional_losses*
Ô
	óaxis
	ôbeta
ġmoving_mean
ömoving_variance
÷	variables
ĝtrainable_variables
ùregularization_losses
ú	keras_api
û__call__
+ü&call_and_return_all_conditional_losses*

ŭ	variables
ŝtrainable_variables
˙regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses* 
­
depthwise_kernel
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses*
Ô
	axis
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses*

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses* 
£
kernel
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+ &call_and_return_all_conditional_losses*
Ô
	Ħaxis
	˘beta
£moving_mean
¤moving_variance
?	variables
Ĥtrainable_variables
§regularization_losses
¨	keras_api
İ__call__
+Ş&call_and_return_all_conditional_losses*

Ğ	variables
Ĵtrainable_variables
­regularization_losses
?	keras_api
Ż__call__
+°&call_and_return_all_conditional_losses* 
­
ħdepthwise_kernel
²	variables
³trainable_variables
´regularization_losses
µ	keras_api
ĥ__call__
+·&call_and_return_all_conditional_losses*
Ô
	¸axis
	ıbeta
şmoving_mean
ğmoving_variance
ĵ	variables
½trainable_variables
?regularization_losses
ż	keras_api
À__call__
+Á&call_and_return_all_conditional_losses*

Â	variables
?trainable_variables
Äregularization_losses
Ċ	keras_api
Ĉ__call__
+Ç&call_and_return_all_conditional_losses* 
£
Èkernel
É	variables
Êtrainable_variables
Ëregularization_losses
Ì	keras_api
Í__call__
+Î&call_and_return_all_conditional_losses*
Ô
	Ïaxis
	?beta
Ñmoving_mean
Òmoving_variance
Ó	variables
Ôtrainable_variables
Ġregularization_losses
Ö	keras_api
×__call__
+Ĝ&call_and_return_all_conditional_losses*

Ù	variables
Útrainable_variables
Ûregularization_losses
Ü	keras_api
Ŭ__call__
+Ŝ&call_and_return_all_conditional_losses* 

ß	variables
àtrainable_variables
áregularization_losses
â	keras_api
?__call__
+ä&call_and_return_all_conditional_losses* 
?
ċkernel
	ĉbias
ç	variables
ètrainable_variables
éregularization_losses
ê	keras_api
ë__call__
+ì&call_and_return_all_conditional_losses*
£
	íiter
îbeta_1
ïbeta_2

?decay
ñlearning_rate4m?<mÑKmÒSmÓbmÔjmĠymÖ	m×	mĜ	mÙ	§mÚ	ŻmÛ	?mÜ	ĈmŬ	ĠmŜ	Ŭmß	ìmà	ômá	mâ	m?	mä	˘mċ	ħmĉ	ımç	Èmè	?mé	ċmê	ĉmë4vì<víKvîSvïbv?jvñyvò	vó	vô	vġ	§vö	Żv÷	?vĝ	Ĉvù	Ġvú	Ŭvû	ìvü	ôvŭ	vŝ	v˙	v	˘v	ħv	ıv	Èv	?v	ċv	ĉv*
Ó
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
13
14
15
16
17
18
19
§20
Ż21
°22
ħ23
?24
Ĉ25
Ç26
È27
Ġ28
Ŭ29
Ŝ30
ß31
ì32
ô33
ġ34
ö35
36
37
38
39
40
˘41
£42
¤43
ħ44
ı45
ş46
ğ47
È48
?49
Ñ50
Ò51
ċ52
ĉ53*
ï
40
<1
K2
S3
b4
j5
y6
7
8
9
§10
Ż11
?12
Ĉ13
Ġ14
Ŭ15
ì16
ô17
18
19
20
˘21
ħ22
ı23
È24
?25
ċ26
ĉ27*
* 
µ
ònon_trainable_variables
ólayers
ômetrics
 ġlayer_regularization_losses
ölayer_metrics
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
÷serving_default* 
b\
VARIABLE_VALUElayer1/conv/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*

40*

40*
* 

ĝnon_trainable_variables
ùlayers
úmetrics
 ûlayer_regularization_losses
ülayer_metrics
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

ŭnon_trainable_variables
ŝlayers
˙metrics
 layer_regularization_losses
layer_metrics
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

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses* 
* 
* 
z
VARIABLE_VALUE&layer2/depthwise_conv/depthwise_kernel@layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

K0*

K0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
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
{
VARIABLE_VALUE(layer2/depthwise_conv/bn/moving_variance?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

S0
T1
U2*

S0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
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

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
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

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
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
{
VARIABLE_VALUE(layer2/pointwise_conv/bn/moving_variance?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

j0
k1
l2*

j0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
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

 non_trainable_variables
Ħlayers
˘metrics
 £layer_regularization_losses
¤layer_metrics
s	variables
ttrainable_variables
uregularization_losses
w__call__
*x&call_and_return_all_conditional_losses
&x"call_and_return_conditional_losses* 
* 
* 
z
VARIABLE_VALUE&layer3/depthwise_conv/depthwise_kernel@layer_with_weights-6/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

y0*

y0*
* 

?non_trainable_variables
Ĥlayers
§metrics
 ¨layer_regularization_losses
İlayer_metrics
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
{
VARIABLE_VALUE(layer3/depthwise_conv/bn/moving_variance?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

0
1
2*

0*
* 

Şnon_trainable_variables
Ğlayers
Ĵmetrics
 ­layer_regularization_losses
?layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

Żnon_trainable_variables
°layers
ħmetrics
 ²layer_regularization_losses
³layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 
* 
* 
lf
VARIABLE_VALUElayer3/pointwise_conv/kernel6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE*

0*

0*
* 

´non_trainable_variables
µlayers
ĥmetrics
 ·layer_regularization_losses
¸layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
ke
VARIABLE_VALUElayer3/pointwise_conv/bn/beta4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE$layer3/pointwise_conv/bn/moving_mean;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUE(layer3/pointwise_conv/bn/moving_variance?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

0
1
2*

0*
* 

ınon_trainable_variables
şlayers
ğmetrics
 ĵlayer_regularization_losses
½layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+ &call_and_return_all_conditional_losses
' "call_and_return_conditional_losses*
* 
* 
* 
* 
* 

?non_trainable_variables
żlayers
Àmetrics
 Álayer_regularization_losses
Âlayer_metrics
Ħ	variables
˘trainable_variables
£regularization_losses
?__call__
+Ĥ&call_and_return_all_conditional_losses
'Ĥ"call_and_return_conditional_losses* 
* 
* 
{
VARIABLE_VALUE&layer4/depthwise_conv/depthwise_kernelAlayer_with_weights-10/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

§0*

§0*
* 

?non_trainable_variables
Älayers
Ċmetrics
 Ĉlayer_regularization_losses
Çlayer_metrics
¨	variables
İtrainable_variables
Şregularization_losses
Ĵ__call__
+­&call_and_return_all_conditional_losses
'­"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer4/depthwise_conv/bn/beta5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer4/depthwise_conv/bn/moving_mean<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer4/depthwise_conv/bn/moving_variance@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

Ż0
°1
ħ2*

Ż0*
* 

Ènon_trainable_variables
Élayers
Êmetrics
 Ëlayer_regularization_losses
Ìlayer_metrics
²	variables
³trainable_variables
´regularization_losses
ĥ__call__
+·&call_and_return_all_conditional_losses
'·"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

Ínon_trainable_variables
Îlayers
Ïmetrics
 ?layer_regularization_losses
Ñlayer_metrics
¸	variables
ıtrainable_variables
şregularization_losses
ĵ__call__
+½&call_and_return_all_conditional_losses
'½"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer4/pointwise_conv/kernel7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUE*

?0*

?0*
* 

Ònon_trainable_variables
Ólayers
Ômetrics
 Ġlayer_regularization_losses
Ölayer_metrics
ż	variables
Àtrainable_variables
Áregularization_losses
?__call__
+Ä&call_and_return_all_conditional_losses
'Ä"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer4/pointwise_conv/bn/beta5layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer4/pointwise_conv/bn/moving_mean<layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer4/pointwise_conv/bn/moving_variance@layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

Ĉ0
Ç1
È2*

Ĉ0*
* 

×non_trainable_variables
Ĝlayers
Ùmetrics
 Úlayer_regularization_losses
Ûlayer_metrics
É	variables
Êtrainable_variables
Ëregularization_losses
Í__call__
+Î&call_and_return_all_conditional_losses
'Î"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

Ünon_trainable_variables
Ŭlayers
Ŝmetrics
 ßlayer_regularization_losses
àlayer_metrics
Ï	variables
?trainable_variables
Ñregularization_losses
Ó__call__
+Ô&call_and_return_all_conditional_losses
'Ô"call_and_return_conditional_losses* 
* 
* 
{
VARIABLE_VALUE&layer5/depthwise_conv/depthwise_kernelAlayer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

Ġ0*

Ġ0*
* 

ánon_trainable_variables
âlayers
?metrics
 älayer_regularization_losses
ċlayer_metrics
Ö	variables
×trainable_variables
Ĝregularization_losses
Ú__call__
+Û&call_and_return_all_conditional_losses
'Û"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer5/depthwise_conv/bn/beta5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer5/depthwise_conv/bn/moving_mean<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer5/depthwise_conv/bn/moving_variance@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

Ŭ0
Ŝ1
ß2*

Ŭ0*
* 

ĉnon_trainable_variables
çlayers
èmetrics
 élayer_regularization_losses
êlayer_metrics
à	variables
átrainable_variables
âregularization_losses
ä__call__
+ċ&call_and_return_all_conditional_losses
'ċ"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

ënon_trainable_variables
ìlayers
ímetrics
 îlayer_regularization_losses
ïlayer_metrics
ĉ	variables
çtrainable_variables
èregularization_losses
ê__call__
+ë&call_and_return_all_conditional_losses
'ë"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer5/pointwise_conv/kernel7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUE*

ì0*

ì0*
* 

?non_trainable_variables
ñlayers
òmetrics
 ólayer_regularization_losses
ôlayer_metrics
í	variables
îtrainable_variables
ïregularization_losses
ñ__call__
+ò&call_and_return_all_conditional_losses
'ò"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer5/pointwise_conv/bn/beta5layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer5/pointwise_conv/bn/moving_mean<layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer5/pointwise_conv/bn/moving_variance@layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

ô0
ġ1
ö2*

ô0*
* 

ġnon_trainable_variables
ölayers
÷metrics
 ĝlayer_regularization_losses
ùlayer_metrics
÷	variables
ĝtrainable_variables
ùregularization_losses
û__call__
+ü&call_and_return_all_conditional_losses
'ü"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

únon_trainable_variables
ûlayers
ümetrics
 ŭlayer_regularization_losses
ŝlayer_metrics
ŭ	variables
ŝtrainable_variables
˙regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 
* 
* 
{
VARIABLE_VALUE&layer6/depthwise_conv/depthwise_kernelAlayer_with_weights-18/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

0*

0*
* 

˙non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer6/depthwise_conv/bn/beta5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer6/depthwise_conv/bn/moving_mean<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer6/depthwise_conv/bn/moving_variance@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

0
1
2*

0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer6/pointwise_conv/kernel7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUE*

0*

0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+ &call_and_return_all_conditional_losses
' "call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer6/pointwise_conv/bn/beta5layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer6/pointwise_conv/bn/moving_mean<layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer6/pointwise_conv/bn/moving_variance@layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

˘0
£1
¤2*

˘0*
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
?	variables
Ĥtrainable_variables
§regularization_losses
İ__call__
+Ş&call_and_return_all_conditional_losses
'Ş"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ğ	variables
Ĵtrainable_variables
­regularization_losses
Ż__call__
+°&call_and_return_all_conditional_losses
'°"call_and_return_conditional_losses* 
* 
* 
{
VARIABLE_VALUE&layer7/depthwise_conv/depthwise_kernelAlayer_with_weights-22/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUE*

ħ0*

ħ0*
* 

non_trainable_variables
layers
metrics
  layer_regularization_losses
Ħlayer_metrics
²	variables
³trainable_variables
´regularization_losses
ĥ__call__
+·&call_and_return_all_conditional_losses
'·"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer7/depthwise_conv/bn/beta5layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer7/depthwise_conv/bn/moving_mean<layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer7/depthwise_conv/bn/moving_variance@layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

ı0
ş1
ğ2*

ı0*
* 

˘non_trainable_variables
£layers
¤metrics
 ?layer_regularization_losses
Ĥlayer_metrics
ĵ	variables
½trainable_variables
?regularization_losses
À__call__
+Á&call_and_return_all_conditional_losses
'Á"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

§non_trainable_variables
¨layers
İmetrics
 Şlayer_regularization_losses
Ğlayer_metrics
Â	variables
?trainable_variables
Äregularization_losses
Ĉ__call__
+Ç&call_and_return_all_conditional_losses
'Ç"call_and_return_conditional_losses* 
* 
* 
mg
VARIABLE_VALUElayer7/pointwise_conv/kernel7layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUE*

È0*

È0*
* 

Ĵnon_trainable_variables
­layers
?metrics
 Żlayer_regularization_losses
°layer_metrics
É	variables
Êtrainable_variables
Ëregularization_losses
Í__call__
+Î&call_and_return_all_conditional_losses
'Î"call_and_return_conditional_losses*
* 
* 
* 
lf
VARIABLE_VALUElayer7/pointwise_conv/bn/beta5layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUE*
zt
VARIABLE_VALUE$layer7/pointwise_conv/bn/moving_mean<layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUE(layer7/pointwise_conv/bn/moving_variance@layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUE*

?0
Ñ1
Ò2*

?0*
* 

ħnon_trainable_variables
²layers
³metrics
 ´layer_regularization_losses
µlayer_metrics
Ó	variables
Ôtrainable_variables
Ġregularization_losses
×__call__
+Ĝ&call_and_return_all_conditional_losses
'Ĝ"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

ĥnon_trainable_variables
·layers
¸metrics
 ılayer_regularization_losses
şlayer_metrics
Ù	variables
Útrainable_variables
Ûregularization_losses
Ŭ__call__
+Ŝ&call_and_return_all_conditional_losses
'Ŝ"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 

ğnon_trainable_variables
ĵlayers
½metrics
 ?layer_regularization_losses
żlayer_metrics
ß	variables
àtrainable_variables
áregularization_losses
?__call__
+ä&call_and_return_all_conditional_losses
'ä"call_and_return_conditional_losses* 
* 
* 
_Y
VARIABLE_VALUEdense_6/kernel7layer_with_weights-26/kernel/.ATTRIBUTES/VARIABLE_VALUE*
[U
VARIABLE_VALUEdense_6/bias5layer_with_weights-26/bias/.ATTRIBUTES/VARIABLE_VALUE*

ċ0
ĉ1*

ċ0
ĉ1*
* 

Ànon_trainable_variables
Álayers
Âmetrics
 ?layer_regularization_losses
Älayer_metrics
ç	variables
ètrainable_variables
éregularization_losses
ë__call__
+ì&call_and_return_all_conditional_losses
'ì"call_and_return_conditional_losses*
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
Ŝ
=0
>1
T2
U3
k4
l5
6
7
8
9
°10
ħ11
Ç12
È13
Ŝ14
ß15
ġ16
ö17
18
19
£20
¤21
ş22
ğ23
Ñ24
Ò25*
Ê
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
Ċ0
Ĉ1*
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
0
1*
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
0
1*
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
°0
ħ1*
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
Ç0
È1*
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
Ŝ0
ß1*
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
ġ0
ö1*
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
0
1*
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
£0
¤1*
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
ş0
ğ1*
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
Ñ0
Ò1*
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

Çtotal

Ècount
É	variables
Ê	keras_api*
M

Ëtotal

Ìcount
Í
_fn_kwargs
Î	variables
Ï	keras_api*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

Ç0
È1*

É	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 

Ë0
Ì1*

Î	variables*

VARIABLE_VALUEAdam/layer1/conv/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUEAdam/layer1/conv/bn/beta/mPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
¤
VARIABLE_VALUE-Adam/layer2/depthwise_conv/depthwise_kernel/m\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer2/depthwise_conv/bn/beta/mPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer2/pointwise_conv/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer2/pointwise_conv/bn/beta/mPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
¤
VARIABLE_VALUE-Adam/layer3/depthwise_conv/depthwise_kernel/m\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer3/depthwise_conv/bn/beta/mPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer3/pointwise_conv/kernel/mRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer3/pointwise_conv/bn/beta/mPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer4/depthwise_conv/depthwise_kernel/m]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer4/depthwise_conv/bn/beta/mQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer4/pointwise_conv/kernel/mSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer4/pointwise_conv/bn/beta/mQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer5/depthwise_conv/depthwise_kernel/m]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer5/depthwise_conv/bn/beta/mQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer5/pointwise_conv/kernel/mSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer5/pointwise_conv/bn/beta/mQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer6/depthwise_conv/depthwise_kernel/m]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer6/depthwise_conv/bn/beta/mQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer6/pointwise_conv/kernel/mSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer6/pointwise_conv/bn/beta/mQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer7/depthwise_conv/depthwise_kernel/m]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer7/depthwise_conv/bn/beta/mQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer7/pointwise_conv/kernel/mSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer7/pointwise_conv/bn/beta/mQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUEAdam/dense_6/kernel/mSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/dense_6/bias/mQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUEAdam/layer1/conv/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~
VARIABLE_VALUEAdam/layer1/conv/bn/beta/vPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
¤
VARIABLE_VALUE-Adam/layer2/depthwise_conv/depthwise_kernel/v\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer2/depthwise_conv/bn/beta/vPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer2/pointwise_conv/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer2/pointwise_conv/bn/beta/vPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
¤
VARIABLE_VALUE-Adam/layer3/depthwise_conv/depthwise_kernel/v\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer3/depthwise_conv/bn/beta/vPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer3/pointwise_conv/kernel/vRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer3/pointwise_conv/bn/beta/vPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer4/depthwise_conv/depthwise_kernel/v]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer4/depthwise_conv/bn/beta/vQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer4/pointwise_conv/kernel/vSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer4/pointwise_conv/bn/beta/vQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer5/depthwise_conv/depthwise_kernel/v]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer5/depthwise_conv/bn/beta/vQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer5/pointwise_conv/kernel/vSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer5/pointwise_conv/bn/beta/vQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer6/depthwise_conv/depthwise_kernel/v]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer6/depthwise_conv/bn/beta/vQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer6/pointwise_conv/kernel/vSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer6/pointwise_conv/bn/beta/vQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
?
VARIABLE_VALUE-Adam/layer7/depthwise_conv/depthwise_kernel/v]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer7/depthwise_conv/bn/beta/vQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE#Adam/layer7/pointwise_conv/kernel/vSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE$Adam/layer7/pointwise_conv/bn/beta/vQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|
VARIABLE_VALUEAdam/dense_6/kernel/vSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/dense_6/bias/vQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

serving_default_input_7Placeholder*/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@*
dtype0*$
shape:˙˙˙˙˙˙˙˙˙`@

StatefulPartitionedCallStatefulPartitionedCallserving_default_input_7layer1/conv/kernelConstlayer1/conv/bn/betalayer1/conv/bn/moving_meanlayer1/conv/bn/moving_variance&layer2/depthwise_conv/depthwise_kernelConst_1layer2/depthwise_conv/bn/beta$layer2/depthwise_conv/bn/moving_mean(layer2/depthwise_conv/bn/moving_variancelayer2/pointwise_conv/kernelConst_2layer2/pointwise_conv/bn/beta$layer2/pointwise_conv/bn/moving_mean(layer2/pointwise_conv/bn/moving_variance&layer3/depthwise_conv/depthwise_kernelConst_3layer3/depthwise_conv/bn/beta$layer3/depthwise_conv/bn/moving_mean(layer3/depthwise_conv/bn/moving_variancelayer3/pointwise_conv/kernelConst_4layer3/pointwise_conv/bn/beta$layer3/pointwise_conv/bn/moving_mean(layer3/pointwise_conv/bn/moving_variance&layer4/depthwise_conv/depthwise_kernelConst_5layer4/depthwise_conv/bn/beta$layer4/depthwise_conv/bn/moving_mean(layer4/depthwise_conv/bn/moving_variancelayer4/pointwise_conv/kernelConst_6layer4/pointwise_conv/bn/beta$layer4/pointwise_conv/bn/moving_mean(layer4/pointwise_conv/bn/moving_variance&layer5/depthwise_conv/depthwise_kernelConst_7layer5/depthwise_conv/bn/beta$layer5/depthwise_conv/bn/moving_mean(layer5/depthwise_conv/bn/moving_variancelayer5/pointwise_conv/kernelConst_8layer5/pointwise_conv/bn/beta$layer5/pointwise_conv/bn/moving_mean(layer5/pointwise_conv/bn/moving_variance&layer6/depthwise_conv/depthwise_kernelConst_9layer6/depthwise_conv/bn/beta$layer6/depthwise_conv/bn/moving_mean(layer6/depthwise_conv/bn/moving_variancelayer6/pointwise_conv/kernelConst_10layer6/pointwise_conv/bn/beta$layer6/pointwise_conv/bn/moving_mean(layer6/pointwise_conv/bn/moving_variance&layer7/depthwise_conv/depthwise_kernelConst_11layer7/depthwise_conv/bn/beta$layer7/depthwise_conv/bn/moving_mean(layer7/depthwise_conv/bn/moving_variancelayer7/pointwise_conv/kernelConst_12layer7/pointwise_conv/bn/beta$layer7/pointwise_conv/bn/moving_mean(layer7/pointwise_conv/bn/moving_variancedense_6/kerneldense_6/bias*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8 *.
f)R'
%__inference_signature_wrapper_2087674
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ì5
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename&layer1/conv/kernel/Read/ReadVariableOp'layer1/conv/bn/beta/Read/ReadVariableOp.layer1/conv/bn/moving_mean/Read/ReadVariableOp2layer1/conv/bn/moving_variance/Read/ReadVariableOp:layer2/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer2/depthwise_conv/bn/beta/Read/ReadVariableOp8layer2/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer2/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer2/pointwise_conv/kernel/Read/ReadVariableOp1layer2/pointwise_conv/bn/beta/Read/ReadVariableOp8layer2/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer2/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer3/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer3/depthwise_conv/bn/beta/Read/ReadVariableOp8layer3/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer3/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer3/pointwise_conv/kernel/Read/ReadVariableOp1layer3/pointwise_conv/bn/beta/Read/ReadVariableOp8layer3/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer3/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer4/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer4/depthwise_conv/bn/beta/Read/ReadVariableOp8layer4/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer4/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer4/pointwise_conv/kernel/Read/ReadVariableOp1layer4/pointwise_conv/bn/beta/Read/ReadVariableOp8layer4/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer4/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer5/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer5/depthwise_conv/bn/beta/Read/ReadVariableOp8layer5/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer5/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer5/pointwise_conv/kernel/Read/ReadVariableOp1layer5/pointwise_conv/bn/beta/Read/ReadVariableOp8layer5/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer5/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer6/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer6/depthwise_conv/bn/beta/Read/ReadVariableOp8layer6/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer6/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer6/pointwise_conv/kernel/Read/ReadVariableOp1layer6/pointwise_conv/bn/beta/Read/ReadVariableOp8layer6/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer6/pointwise_conv/bn/moving_variance/Read/ReadVariableOp:layer7/depthwise_conv/depthwise_kernel/Read/ReadVariableOp1layer7/depthwise_conv/bn/beta/Read/ReadVariableOp8layer7/depthwise_conv/bn/moving_mean/Read/ReadVariableOp<layer7/depthwise_conv/bn/moving_variance/Read/ReadVariableOp0layer7/pointwise_conv/kernel/Read/ReadVariableOp1layer7/pointwise_conv/bn/beta/Read/ReadVariableOp8layer7/pointwise_conv/bn/moving_mean/Read/ReadVariableOp<layer7/pointwise_conv/bn/moving_variance/Read/ReadVariableOp"dense_6/kernel/Read/ReadVariableOp dense_6/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp-Adam/layer1/conv/kernel/m/Read/ReadVariableOp.Adam/layer1/conv/bn/beta/m/Read/ReadVariableOpAAdam/layer2/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer2/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer2/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer2/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer3/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer3/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer3/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer3/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer4/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer4/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer4/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer4/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer5/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer5/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer5/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer5/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer6/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer6/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer6/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer6/pointwise_conv/bn/beta/m/Read/ReadVariableOpAAdam/layer7/depthwise_conv/depthwise_kernel/m/Read/ReadVariableOp8Adam/layer7/depthwise_conv/bn/beta/m/Read/ReadVariableOp7Adam/layer7/pointwise_conv/kernel/m/Read/ReadVariableOp8Adam/layer7/pointwise_conv/bn/beta/m/Read/ReadVariableOp)Adam/dense_6/kernel/m/Read/ReadVariableOp'Adam/dense_6/bias/m/Read/ReadVariableOp-Adam/layer1/conv/kernel/v/Read/ReadVariableOp.Adam/layer1/conv/bn/beta/v/Read/ReadVariableOpAAdam/layer2/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer2/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer2/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer2/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer3/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer3/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer3/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer3/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer4/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer4/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer4/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer4/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer5/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer5/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer5/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer5/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer6/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer6/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer6/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer6/pointwise_conv/bn/beta/v/Read/ReadVariableOpAAdam/layer7/depthwise_conv/depthwise_kernel/v/Read/ReadVariableOp8Adam/layer7/depthwise_conv/bn/beta/v/Read/ReadVariableOp7Adam/layer7/pointwise_conv/kernel/v/Read/ReadVariableOp8Adam/layer7/pointwise_conv/bn/beta/v/Read/ReadVariableOp)Adam/dense_6/kernel/v/Read/ReadVariableOp'Adam/dense_6/bias/v/Read/ReadVariableOpConst_13*
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
GPU2*0J 8 *)
f$R"
 __inference__traced_save_2089201
#
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamelayer1/conv/kernellayer1/conv/bn/betalayer1/conv/bn/moving_meanlayer1/conv/bn/moving_variance&layer2/depthwise_conv/depthwise_kernellayer2/depthwise_conv/bn/beta$layer2/depthwise_conv/bn/moving_mean(layer2/depthwise_conv/bn/moving_variancelayer2/pointwise_conv/kernellayer2/pointwise_conv/bn/beta$layer2/pointwise_conv/bn/moving_mean(layer2/pointwise_conv/bn/moving_variance&layer3/depthwise_conv/depthwise_kernellayer3/depthwise_conv/bn/beta$layer3/depthwise_conv/bn/moving_mean(layer3/depthwise_conv/bn/moving_variancelayer3/pointwise_conv/kernellayer3/pointwise_conv/bn/beta$layer3/pointwise_conv/bn/moving_mean(layer3/pointwise_conv/bn/moving_variance&layer4/depthwise_conv/depthwise_kernellayer4/depthwise_conv/bn/beta$layer4/depthwise_conv/bn/moving_mean(layer4/depthwise_conv/bn/moving_variancelayer4/pointwise_conv/kernellayer4/pointwise_conv/bn/beta$layer4/pointwise_conv/bn/moving_mean(layer4/pointwise_conv/bn/moving_variance&layer5/depthwise_conv/depthwise_kernellayer5/depthwise_conv/bn/beta$layer5/depthwise_conv/bn/moving_mean(layer5/depthwise_conv/bn/moving_variancelayer5/pointwise_conv/kernellayer5/pointwise_conv/bn/beta$layer5/pointwise_conv/bn/moving_mean(layer5/pointwise_conv/bn/moving_variance&layer6/depthwise_conv/depthwise_kernellayer6/depthwise_conv/bn/beta$layer6/depthwise_conv/bn/moving_mean(layer6/depthwise_conv/bn/moving_variancelayer6/pointwise_conv/kernellayer6/pointwise_conv/bn/beta$layer6/pointwise_conv/bn/moving_mean(layer6/pointwise_conv/bn/moving_variance&layer7/depthwise_conv/depthwise_kernellayer7/depthwise_conv/bn/beta$layer7/depthwise_conv/bn/moving_mean(layer7/depthwise_conv/bn/moving_variancelayer7/pointwise_conv/kernellayer7/pointwise_conv/bn/beta$layer7/pointwise_conv/bn/moving_mean(layer7/pointwise_conv/bn/moving_variancedense_6/kerneldense_6/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/layer1/conv/kernel/mAdam/layer1/conv/bn/beta/m-Adam/layer2/depthwise_conv/depthwise_kernel/m$Adam/layer2/depthwise_conv/bn/beta/m#Adam/layer2/pointwise_conv/kernel/m$Adam/layer2/pointwise_conv/bn/beta/m-Adam/layer3/depthwise_conv/depthwise_kernel/m$Adam/layer3/depthwise_conv/bn/beta/m#Adam/layer3/pointwise_conv/kernel/m$Adam/layer3/pointwise_conv/bn/beta/m-Adam/layer4/depthwise_conv/depthwise_kernel/m$Adam/layer4/depthwise_conv/bn/beta/m#Adam/layer4/pointwise_conv/kernel/m$Adam/layer4/pointwise_conv/bn/beta/m-Adam/layer5/depthwise_conv/depthwise_kernel/m$Adam/layer5/depthwise_conv/bn/beta/m#Adam/layer5/pointwise_conv/kernel/m$Adam/layer5/pointwise_conv/bn/beta/m-Adam/layer6/depthwise_conv/depthwise_kernel/m$Adam/layer6/depthwise_conv/bn/beta/m#Adam/layer6/pointwise_conv/kernel/m$Adam/layer6/pointwise_conv/bn/beta/m-Adam/layer7/depthwise_conv/depthwise_kernel/m$Adam/layer7/depthwise_conv/bn/beta/m#Adam/layer7/pointwise_conv/kernel/m$Adam/layer7/pointwise_conv/bn/beta/mAdam/dense_6/kernel/mAdam/dense_6/bias/mAdam/layer1/conv/kernel/vAdam/layer1/conv/bn/beta/v-Adam/layer2/depthwise_conv/depthwise_kernel/v$Adam/layer2/depthwise_conv/bn/beta/v#Adam/layer2/pointwise_conv/kernel/v$Adam/layer2/pointwise_conv/bn/beta/v-Adam/layer3/depthwise_conv/depthwise_kernel/v$Adam/layer3/depthwise_conv/bn/beta/v#Adam/layer3/pointwise_conv/kernel/v$Adam/layer3/pointwise_conv/bn/beta/v-Adam/layer4/depthwise_conv/depthwise_kernel/v$Adam/layer4/depthwise_conv/bn/beta/v#Adam/layer4/pointwise_conv/kernel/v$Adam/layer4/pointwise_conv/bn/beta/v-Adam/layer5/depthwise_conv/depthwise_kernel/v$Adam/layer5/depthwise_conv/bn/beta/v#Adam/layer5/pointwise_conv/kernel/v$Adam/layer5/pointwise_conv/bn/beta/v-Adam/layer6/depthwise_conv/depthwise_kernel/v$Adam/layer6/depthwise_conv/bn/beta/v#Adam/layer6/pointwise_conv/kernel/v$Adam/layer6/pointwise_conv/bn/beta/v-Adam/layer7/depthwise_conv/depthwise_kernel/v$Adam/layer7/depthwise_conv/bn/beta/v#Adam/layer7/pointwise_conv/kernel/v$Adam/layer7/pointwise_conv/bn/beta/vAdam/dense_6/kernel/vAdam/dense_6/bias/v*
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
GPU2*0J 8 *,
f'R%
#__inference__traced_restore_2089568Ô#
´
Ċ
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2085270

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084724

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084568

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
íŻ
:
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2087288

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
4layer3_pointwise_conv_conv2d_readvariableop_resource:@"
layer3_pointwise_conv_bn_scale?
0layer3_pointwise_conv_bn_readvariableop_resource:	P
Alayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer4_depthwise_conv_depthwise_readvariableop_resource:"
layer4_depthwise_conv_bn_scale?
0layer4_depthwise_conv_bn_readvariableop_resource:	P
Alayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer4_pointwise_conv_conv2d_readvariableop_resource:"
layer4_pointwise_conv_bn_scale?
0layer4_pointwise_conv_bn_readvariableop_resource:	P
Alayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer5_depthwise_conv_depthwise_readvariableop_resource:"
layer5_depthwise_conv_bn_scale?
0layer5_depthwise_conv_bn_readvariableop_resource:	P
Alayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer5_pointwise_conv_conv2d_readvariableop_resource:"
layer5_pointwise_conv_bn_scale?
0layer5_pointwise_conv_bn_readvariableop_resource:	P
Alayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer6_depthwise_conv_depthwise_readvariableop_resource:"
layer6_depthwise_conv_bn_scale?
0layer6_depthwise_conv_bn_readvariableop_resource:	P
Alayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer6_pointwise_conv_conv2d_readvariableop_resource:"
layer6_pointwise_conv_bn_scale?
0layer6_pointwise_conv_bn_readvariableop_resource:	P
Alayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer7_depthwise_conv_depthwise_readvariableop_resource:"
layer7_depthwise_conv_bn_scale?
0layer7_depthwise_conv_bn_readvariableop_resource:	P
Alayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer7_pointwise_conv_conv2d_readvariableop_resource:"
layer7_pointwise_conv_bn_scale?
0layer7_pointwise_conv_bn_readvariableop_resource:	P
Alayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	9
&dense_6_matmul_readvariableop_resource:	
5
'dense_6_biasadd_readvariableop_resource:

identity˘dense_6/BiasAdd/ReadVariableOp˘dense_6/MatMul/ReadVariableOp˘!layer1/conv/Conv2D/ReadVariableOp˘.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp˘0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1˘layer1/conv/bn/ReadVariableOp˘8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer2/depthwise_conv/bn/ReadVariableOp˘.layer2/depthwise_conv/depthwise/ReadVariableOp˘+layer2/pointwise_conv/Conv2D/ReadVariableOp˘8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer2/pointwise_conv/bn/ReadVariableOp˘8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer3/depthwise_conv/bn/ReadVariableOp˘.layer3/depthwise_conv/depthwise/ReadVariableOp˘+layer3/pointwise_conv/Conv2D/ReadVariableOp˘8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer3/pointwise_conv/bn/ReadVariableOp˘8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer4/depthwise_conv/bn/ReadVariableOp˘.layer4/depthwise_conv/depthwise/ReadVariableOp˘+layer4/pointwise_conv/Conv2D/ReadVariableOp˘8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer4/pointwise_conv/bn/ReadVariableOp˘8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer5/depthwise_conv/bn/ReadVariableOp˘.layer5/depthwise_conv/depthwise/ReadVariableOp˘+layer5/pointwise_conv/Conv2D/ReadVariableOp˘8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer5/pointwise_conv/bn/ReadVariableOp˘8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer6/depthwise_conv/bn/ReadVariableOp˘.layer6/depthwise_conv/depthwise/ReadVariableOp˘+layer6/pointwise_conv/Conv2D/ReadVariableOp˘8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer6/pointwise_conv/bn/ReadVariableOp˘8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer7/depthwise_conv/bn/ReadVariableOp˘.layer7/depthwise_conv/depthwise/ReadVariableOp˘+layer7/pointwise_conv/Conv2D/ReadVariableOp˘8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer7/pointwise_conv/bn/ReadVariableOp
!layer1/conv/Conv2D/ReadVariableOpReadVariableOp*layer1_conv_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0ħ
layer1/conv/Conv2DConv2Dinputs)layer1/conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides

layer1/conv/bn/ReadVariableOpReadVariableOp&layer1_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0˘
.layer1/conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOp7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0Ĥ
0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0ñ
layer1/conv/bn/FusedBatchNormV3FusedBatchNormV3layer1/conv/Conv2D:output:0layer1_conv_bn_scale%layer1/conv/bn/ReadVariableOp:value:06layer1/conv/bn/FusedBatchNormV3/ReadVariableOp:value:08layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0  : : : : :*
is_training( w
layer1/relu/ReluRelu#layer1/conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  ?
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
valueB"      ò
layer2/depthwise_conv/depthwiseDepthwiseConv2dNativelayer1/relu/Relu:activations:06layer2/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides

'layer2/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer2_depthwise_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0ĥ
8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0ş
:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0°
)layer2/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer2/depthwise_conv/depthwise:output:0layer2_depthwise_conv_bn_scale/layer2/depthwise_conv/bn/ReadVariableOp:value:0@layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0  : : : : :*
is_training( 
layer2/depthwise_conv/relu/ReluRelu-layer2/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  ¨
+layer2/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer2_pointwise_conv_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0ì
layer2/pointwise_conv/Conv2DConv2D-layer2/depthwise_conv/relu/Relu:activations:03layer2/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*
paddingSAME*
strides

'layer2/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer2_pointwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0ĥ
8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0ş
:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0­
)layer2/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer2/pointwise_conv/Conv2D:output:0layer2_pointwise_conv_bn_scale/layer2/pointwise_conv/bn/ReadVariableOp:value:0@layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0 @:@:@:@:@:*
is_training( 
layer2/pointwise_conv/relu/ReluRelu-layer2/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @?
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
valueB"      
layer3/depthwise_conv/depthwiseDepthwiseConv2dNative-layer2/pointwise_conv/relu/Relu:activations:06layer3/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
paddingSAME*
strides

'layer3/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer3_depthwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0ĥ
8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0ş
:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0°
)layer3/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer3/depthwise_conv/depthwise:output:0layer3_depthwise_conv_bn_scale/layer3/depthwise_conv/bn/ReadVariableOp:value:0@layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
is_training( 
layer3/depthwise_conv/relu/ReluRelu-layer3/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@İ
+layer3/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer3_pointwise_conv_conv2d_readvariableop_resource*'
_output_shapes
:@*
dtype0í
layer3/pointwise_conv/Conv2DConv2D-layer3/depthwise_conv/relu/Relu:activations:03layer3/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer3/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer3_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0²
)layer3/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer3/pointwise_conv/Conv2D:output:0layer3_pointwise_conv_bn_scale/layer3/pointwise_conv/bn/ReadVariableOp:value:0@layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer3/pointwise_conv/relu/ReluRelu-layer3/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer4/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer4_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0~
%layer4/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer4/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      
layer4/depthwise_conv/depthwiseDepthwiseConv2dNative-layer3/pointwise_conv/relu/Relu:activations:06layer4/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer4/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer4_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0µ
)layer4/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer4/depthwise_conv/depthwise:output:0layer4_depthwise_conv_bn_scale/layer4/depthwise_conv/bn/ReadVariableOp:value:0@layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer4/depthwise_conv/relu/ReluRelu-layer4/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer4/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer4_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer4/pointwise_conv/Conv2DConv2D-layer4/depthwise_conv/relu/Relu:activations:03layer4/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer4/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer4_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0²
)layer4/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer4/pointwise_conv/Conv2D:output:0layer4_pointwise_conv_bn_scale/layer4/pointwise_conv/bn/ReadVariableOp:value:0@layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer4/pointwise_conv/relu/ReluRelu-layer4/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer5/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer5_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0~
%layer5/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer5/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      
layer5/depthwise_conv/depthwiseDepthwiseConv2dNative-layer4/pointwise_conv/relu/Relu:activations:06layer5/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer5/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer5_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0µ
)layer5/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer5/depthwise_conv/depthwise:output:0layer5_depthwise_conv_bn_scale/layer5/depthwise_conv/bn/ReadVariableOp:value:0@layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer5/depthwise_conv/relu/ReluRelu-layer5/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer5/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer5_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer5/pointwise_conv/Conv2DConv2D-layer5/depthwise_conv/relu/Relu:activations:03layer5/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer5/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer5_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0²
)layer5/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer5/pointwise_conv/Conv2D:output:0layer5_pointwise_conv_bn_scale/layer5/pointwise_conv/bn/ReadVariableOp:value:0@layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer5/pointwise_conv/relu/ReluRelu-layer5/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer6/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer6_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      
layer6/depthwise_conv/depthwiseDepthwiseConv2dNative-layer5/pointwise_conv/relu/Relu:activations:06layer6/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer6/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer6_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0µ
)layer6/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer6/depthwise_conv/depthwise:output:0layer6_depthwise_conv_bn_scale/layer6/depthwise_conv/bn/ReadVariableOp:value:0@layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer6/depthwise_conv/relu/ReluRelu-layer6/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer6/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer6_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer6/pointwise_conv/Conv2DConv2D-layer6/depthwise_conv/relu/Relu:activations:03layer6/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer6/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer6_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0²
)layer6/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer6/pointwise_conv/Conv2D:output:0layer6_pointwise_conv_bn_scale/layer6/pointwise_conv/bn/ReadVariableOp:value:0@layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer6/pointwise_conv/relu/ReluRelu-layer6/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer7/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer7_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      
layer7/depthwise_conv/depthwiseDepthwiseConv2dNative-layer6/pointwise_conv/relu/Relu:activations:06layer7/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer7/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer7_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0µ
)layer7/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer7/depthwise_conv/depthwise:output:0layer7_depthwise_conv_bn_scale/layer7/depthwise_conv/bn/ReadVariableOp:value:0@layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer7/depthwise_conv/relu/ReluRelu-layer7/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer7/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer7_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer7/pointwise_conv/Conv2DConv2D-layer7/depthwise_conv/relu/Relu:activations:03layer7/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer7/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer7_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0²
)layer7/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer7/pointwise_conv/Conv2D:output:0layer7_pointwise_conv_bn_scale/layer7/pointwise_conv/bn/ReadVariableOp:value:0@layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( 
layer7/pointwise_conv/relu/ReluRelu-layer7/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙
1global_average_pooling2d_6/Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      Ċ
global_average_pooling2d_6/MeanMean-layer7/pointwise_conv/relu/Relu:activations:0:global_average_pooling2d_6/Mean/reduction_indices:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes
:	
*
dtype0
dense_6/MatMulMatMul(global_average_pooling2d_6/Mean:output:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
g
IdentityIdentitydense_6/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

NoOpNoOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOp"^layer1/conv/Conv2D/ReadVariableOp/^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp1^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1^layer1/conv/bn/ReadVariableOp9^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/depthwise_conv/bn/ReadVariableOp/^layer2/depthwise_conv/depthwise/ReadVariableOp,^layer2/pointwise_conv/Conv2D/ReadVariableOp9^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/pointwise_conv/bn/ReadVariableOp9^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/depthwise_conv/bn/ReadVariableOp/^layer3/depthwise_conv/depthwise/ReadVariableOp,^layer3/pointwise_conv/Conv2D/ReadVariableOp9^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/pointwise_conv/bn/ReadVariableOp9^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/depthwise_conv/bn/ReadVariableOp/^layer4/depthwise_conv/depthwise/ReadVariableOp,^layer4/pointwise_conv/Conv2D/ReadVariableOp9^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/pointwise_conv/bn/ReadVariableOp9^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/depthwise_conv/bn/ReadVariableOp/^layer5/depthwise_conv/depthwise/ReadVariableOp,^layer5/pointwise_conv/Conv2D/ReadVariableOp9^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/pointwise_conv/bn/ReadVariableOp9^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/depthwise_conv/bn/ReadVariableOp/^layer6/depthwise_conv/depthwise/ReadVariableOp,^layer6/pointwise_conv/Conv2D/ReadVariableOp9^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/pointwise_conv/bn/ReadVariableOp9^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/depthwise_conv/bn/ReadVariableOp/^layer7/depthwise_conv/depthwise/ReadVariableOp,^layer7/pointwise_conv/Conv2D/ReadVariableOp9^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/pointwise_conv/bn/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2F
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
:˙˙˙˙˙˙˙˙˙`@
 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:

ò
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084786

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ê
X
<__inference_layer6/pointwise_conv/relu_layer_call_fn_2088603

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085400i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084940

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
µ!
ñ
/__inference_yamnet_frames_layer_call_fn_2085613
input_7!
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

unknown_19:@

unknown_20

unknown_21:	

unknown_22:	

unknown_23:	%

unknown_24:

unknown_25

unknown_26:	

unknown_27:	

unknown_28:	&

unknown_29:

unknown_30

unknown_31:	

unknown_32:	

unknown_33:	%

unknown_34:

unknown_35

unknown_36:	

unknown_37:	

unknown_38:	&

unknown_39:

unknown_40

unknown_41:	

unknown_42:	

unknown_43:	%

unknown_44:

unknown_45

unknown_46:	

unknown_47:	

unknown_48:	&

unknown_49:

unknown_50

unknown_51:	

unknown_52:	

unknown_53:	%

unknown_54:

unknown_55

unknown_56:	

unknown_57:	

unknown_58:	&

unknown_59:

unknown_60

unknown_61:	

unknown_62:	

unknown_63:	

unknown_64:	


unknown_65:

identity˘StatefulPartitionedCallÛ	
StatefulPartitionedCallStatefulPartitionedCallinput_7unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
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
:˙˙˙˙˙˙˙˙˙
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8 *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2085476o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
!
_user_specified_name	input_7: 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
á

7__inference_layer2/depthwise_conv_layer_call_fn_2087765

inputs!
unknown: 
identity˘StatefulPartitionedCallċ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2085131w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0  : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
·	
Ë
:__inference_layer2/depthwise_conv/bn_layer_call_fn_2087787

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity˘StatefulPartitionedCall 
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084352
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
°
Ä
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2085214

inputs9
conv2d_readvariableop_resource:@
identity˘Conv2D/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:@*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
á

7__inference_layer2/pointwise_conv_layer_call_fn_2087851

inputs!
unknown: @
identity˘StatefulPartitionedCallċ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2085158w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0  : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs


U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088344

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
s
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088098

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2085002

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
Ħ	
Á
0__inference_layer1/conv/bn_layer_call_fn_2087714

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084320
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
µ	
Ë
:__inference_layer2/pointwise_conv/bn_layer_call_fn_2087884

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084444
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
˙
ï
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087817

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
ĉ
X
<__inference_layer2/depthwise_conv/relu_layer_call_fn_2087839

inputs
identityÍ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085149h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0  :W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs


U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088598

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ĉ

7__inference_layer5/depthwise_conv_layer_call_fn_2088275

inputs"
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2085299x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
?	
Î
:__inference_layer6/depthwise_conv/bn_layer_call_fn_2088480

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084878
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
?	
Î
:__inference_layer7/pointwise_conv/bn_layer_call_fn_2088734

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085064
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´	
Ê
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2085411

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085429

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
¸
s
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2085085

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
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙^
IdentityIdentityMean:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:r n
J
_output_shapes8
6:4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ì
d
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2085120

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0  :W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs

ò
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088327

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´	
Ê
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2088454

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
êà
Ú#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2085476

inputs-
layer1_conv_2085103: 
layer1_conv_bn_2085106$
layer1_conv_bn_2085108: $
layer1_conv_bn_2085110: $
layer1_conv_bn_2085112: 7
layer2_depthwise_conv_2085132: $
 layer2_depthwise_conv_bn_2085135.
 layer2_depthwise_conv_bn_2085137: .
 layer2_depthwise_conv_bn_2085139: .
 layer2_depthwise_conv_bn_2085141: 7
layer2_pointwise_conv_2085159: @$
 layer2_pointwise_conv_bn_2085162.
 layer2_pointwise_conv_bn_2085164:@.
 layer2_pointwise_conv_bn_2085166:@.
 layer2_pointwise_conv_bn_2085168:@7
layer3_depthwise_conv_2085188:@$
 layer3_depthwise_conv_bn_2085191.
 layer3_depthwise_conv_bn_2085193:@.
 layer3_depthwise_conv_bn_2085195:@.
 layer3_depthwise_conv_bn_2085197:@8
layer3_pointwise_conv_2085215:@$
 layer3_pointwise_conv_bn_2085218/
 layer3_pointwise_conv_bn_2085220:	/
 layer3_pointwise_conv_bn_2085222:	/
 layer3_pointwise_conv_bn_2085224:	8
layer4_depthwise_conv_2085244:$
 layer4_depthwise_conv_bn_2085247/
 layer4_depthwise_conv_bn_2085249:	/
 layer4_depthwise_conv_bn_2085251:	/
 layer4_depthwise_conv_bn_2085253:	9
layer4_pointwise_conv_2085271:$
 layer4_pointwise_conv_bn_2085274/
 layer4_pointwise_conv_bn_2085276:	/
 layer4_pointwise_conv_bn_2085278:	/
 layer4_pointwise_conv_bn_2085280:	8
layer5_depthwise_conv_2085300:$
 layer5_depthwise_conv_bn_2085303/
 layer5_depthwise_conv_bn_2085305:	/
 layer5_depthwise_conv_bn_2085307:	/
 layer5_depthwise_conv_bn_2085309:	9
layer5_pointwise_conv_2085327:$
 layer5_pointwise_conv_bn_2085330/
 layer5_pointwise_conv_bn_2085332:	/
 layer5_pointwise_conv_bn_2085334:	/
 layer5_pointwise_conv_bn_2085336:	8
layer6_depthwise_conv_2085356:$
 layer6_depthwise_conv_bn_2085359/
 layer6_depthwise_conv_bn_2085361:	/
 layer6_depthwise_conv_bn_2085363:	/
 layer6_depthwise_conv_bn_2085365:	9
layer6_pointwise_conv_2085383:$
 layer6_pointwise_conv_bn_2085386/
 layer6_pointwise_conv_bn_2085388:	/
 layer6_pointwise_conv_bn_2085390:	/
 layer6_pointwise_conv_bn_2085392:	8
layer7_depthwise_conv_2085412:$
 layer7_depthwise_conv_bn_2085415/
 layer7_depthwise_conv_bn_2085417:	/
 layer7_depthwise_conv_bn_2085419:	/
 layer7_depthwise_conv_bn_2085421:	9
layer7_pointwise_conv_2085439:$
 layer7_pointwise_conv_bn_2085442/
 layer7_pointwise_conv_bn_2085444:	/
 layer7_pointwise_conv_bn_2085446:	/
 layer7_pointwise_conv_bn_2085448:	"
dense_6_2085470:	

dense_6_2085472:

identity˘dense_6/StatefulPartitionedCall˘#layer1/conv/StatefulPartitionedCall˘&layer1/conv/bn/StatefulPartitionedCall˘-layer2/depthwise_conv/StatefulPartitionedCall˘0layer2/depthwise_conv/bn/StatefulPartitionedCall˘-layer2/pointwise_conv/StatefulPartitionedCall˘0layer2/pointwise_conv/bn/StatefulPartitionedCall˘-layer3/depthwise_conv/StatefulPartitionedCall˘0layer3/depthwise_conv/bn/StatefulPartitionedCall˘-layer3/pointwise_conv/StatefulPartitionedCall˘0layer3/pointwise_conv/bn/StatefulPartitionedCall˘-layer4/depthwise_conv/StatefulPartitionedCall˘0layer4/depthwise_conv/bn/StatefulPartitionedCall˘-layer4/pointwise_conv/StatefulPartitionedCall˘0layer4/pointwise_conv/bn/StatefulPartitionedCall˘-layer5/depthwise_conv/StatefulPartitionedCall˘0layer5/depthwise_conv/bn/StatefulPartitionedCall˘-layer5/pointwise_conv/StatefulPartitionedCall˘0layer5/pointwise_conv/bn/StatefulPartitionedCall˘-layer6/depthwise_conv/StatefulPartitionedCall˘0layer6/depthwise_conv/bn/StatefulPartitionedCall˘-layer6/pointwise_conv/StatefulPartitionedCall˘0layer6/pointwise_conv/bn/StatefulPartitionedCall˘-layer7/depthwise_conv/StatefulPartitionedCall˘0layer7/depthwise_conv/bn/StatefulPartitionedCall˘-layer7/pointwise_conv/StatefulPartitionedCall˘0layer7/pointwise_conv/bn/StatefulPartitionedCalló
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinputslayer1_conv_2085103*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2085102ï
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_2085106layer1_conv_bn_2085108layer1_conv_bn_2085110layer1_conv_bn_2085112*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084290ó
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2085120Ż
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_2085132*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2085131µ
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_2085135 layer2_depthwise_conv_bn_2085137 layer2_depthwise_conv_bn_2085139 layer2_depthwise_conv_bn_2085141*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084352
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085149?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_2085159*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2085158µ
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_2085162 layer2_pointwise_conv_bn_2085164 layer2_pointwise_conv_bn_2085166 layer2_pointwise_conv_bn_2085168*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084414
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085176?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_2085188*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2085187µ
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_2085191 layer3_depthwise_conv_bn_2085193 layer3_depthwise_conv_bn_2085195 layer3_depthwise_conv_bn_2085197*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084476
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085205ż
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_2085215*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2085214ĥ
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_2085218 layer3_pointwise_conv_bn_2085220 layer3_pointwise_conv_bn_2085222 layer3_pointwise_conv_bn_2085224*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084538
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085232ż
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_2085244*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2085243ĥ
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_2085247 layer4_depthwise_conv_bn_2085249 layer4_depthwise_conv_bn_2085251 layer4_depthwise_conv_bn_2085253*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084600
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085261ż
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_2085271*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2085270ĥ
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_2085274 layer4_pointwise_conv_bn_2085276 layer4_pointwise_conv_bn_2085278 layer4_pointwise_conv_bn_2085280*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084662
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085288ż
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_2085300*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2085299ĥ
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_2085303 layer5_depthwise_conv_bn_2085305 layer5_depthwise_conv_bn_2085307 layer5_depthwise_conv_bn_2085309*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084724
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085317ż
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_2085327*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2085326ĥ
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_2085330 layer5_pointwise_conv_bn_2085332 layer5_pointwise_conv_bn_2085334 layer5_pointwise_conv_bn_2085336*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084786
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085344ż
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_2085356*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2085355ĥ
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_2085359 layer6_depthwise_conv_bn_2085361 layer6_depthwise_conv_bn_2085363 layer6_depthwise_conv_bn_2085365*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084848
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085373ż
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_2085383*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2085382ĥ
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_2085386 layer6_pointwise_conv_bn_2085388 layer6_pointwise_conv_bn_2085390 layer6_pointwise_conv_bn_2085392*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084910
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085400ż
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_2085412*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2085411ĥ
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_2085415 layer7_depthwise_conv_bn_2085417 layer7_depthwise_conv_bn_2085419 layer7_depthwise_conv_bn_2085421*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084972
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085429ż
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_2085439*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2085438ĥ
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_2085442 layer7_pointwise_conv_bn_2085444 layer7_pointwise_conv_bn_2085446 layer7_pointwise_conv_bn_2085448*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085034
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085456
*global_average_pooling2d_6/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2085085
dense_6/StatefulPartitionedCallStatefulPartitionedCall3global_average_pooling2d_6/PartitionedCall:output:0dense_6_2085470dense_6_2085472*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_dense_6_layer_call_and_return_conditional_losses_2085469w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Û

NoOpNoOp ^dense_6/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2J
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
:˙˙˙˙˙˙˙˙˙`@
 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
˙
s
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085456

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084600

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
á

7__inference_layer3/depthwise_conv_layer_call_fn_2087935

inputs!
unknown:@
identity˘StatefulPartitionedCallċ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2085187w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0 @: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @
 
_user_specified_nameinputs


U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084692

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ç

7__inference_layer6/pointwise_conv_layer_call_fn_2088531

inputs#
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2085382x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
µ	
Ë
:__inference_layer3/depthwise_conv/bn_layer_call_fn_2087970

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084506
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
?	
Î
:__inference_layer3/pointwise_conv/bn_layer_call_fn_2088054

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084568
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
?	
Î
:__inference_layer5/pointwise_conv/bn_layer_call_fn_2088394

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084816
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084320

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
?	
Î
:__inference_layer6/pointwise_conv/bn_layer_call_fn_2088564

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084940
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ê
X
<__inference_layer7/pointwise_conv/relu_layer_call_fn_2088773

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085456i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
?	
É
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2087774

inputs;
!depthwise_readvariableop_resource: 
identity˘depthwise/ReadVariableOp
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
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0  : 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
È

)__inference_dense_6_layer_call_fn_2088798

inputs
unknown:	

	unknown_0:

identity˘StatefulPartitionedCallÜ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_dense_6_layer_call_and_return_conditional_losses_2085469o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ġó
úX
#__inference__traced_restore_2089568
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
0assignvariableop_16_layer3_pointwise_conv_kernel:@@
1assignvariableop_17_layer3_pointwise_conv_bn_beta:	G
8assignvariableop_18_layer3_pointwise_conv_bn_moving_mean:	K
<assignvariableop_19_layer3_pointwise_conv_bn_moving_variance:	U
:assignvariableop_20_layer4_depthwise_conv_depthwise_kernel:@
1assignvariableop_21_layer4_depthwise_conv_bn_beta:	G
8assignvariableop_22_layer4_depthwise_conv_bn_moving_mean:	K
<assignvariableop_23_layer4_depthwise_conv_bn_moving_variance:	L
0assignvariableop_24_layer4_pointwise_conv_kernel:@
1assignvariableop_25_layer4_pointwise_conv_bn_beta:	G
8assignvariableop_26_layer4_pointwise_conv_bn_moving_mean:	K
<assignvariableop_27_layer4_pointwise_conv_bn_moving_variance:	U
:assignvariableop_28_layer5_depthwise_conv_depthwise_kernel:@
1assignvariableop_29_layer5_depthwise_conv_bn_beta:	G
8assignvariableop_30_layer5_depthwise_conv_bn_moving_mean:	K
<assignvariableop_31_layer5_depthwise_conv_bn_moving_variance:	L
0assignvariableop_32_layer5_pointwise_conv_kernel:@
1assignvariableop_33_layer5_pointwise_conv_bn_beta:	G
8assignvariableop_34_layer5_pointwise_conv_bn_moving_mean:	K
<assignvariableop_35_layer5_pointwise_conv_bn_moving_variance:	U
:assignvariableop_36_layer6_depthwise_conv_depthwise_kernel:@
1assignvariableop_37_layer6_depthwise_conv_bn_beta:	G
8assignvariableop_38_layer6_depthwise_conv_bn_moving_mean:	K
<assignvariableop_39_layer6_depthwise_conv_bn_moving_variance:	L
0assignvariableop_40_layer6_pointwise_conv_kernel:@
1assignvariableop_41_layer6_pointwise_conv_bn_beta:	G
8assignvariableop_42_layer6_pointwise_conv_bn_moving_mean:	K
<assignvariableop_43_layer6_pointwise_conv_bn_moving_variance:	U
:assignvariableop_44_layer7_depthwise_conv_depthwise_kernel:@
1assignvariableop_45_layer7_depthwise_conv_bn_beta:	G
8assignvariableop_46_layer7_depthwise_conv_bn_moving_mean:	K
<assignvariableop_47_layer7_depthwise_conv_bn_moving_variance:	L
0assignvariableop_48_layer7_pointwise_conv_kernel:@
1assignvariableop_49_layer7_pointwise_conv_bn_beta:	G
8assignvariableop_50_layer7_pointwise_conv_bn_moving_mean:	K
<assignvariableop_51_layer7_pointwise_conv_bn_moving_variance:	5
"assignvariableop_52_dense_6_kernel:	
.
 assignvariableop_53_dense_6_bias:
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
7assignvariableop_71_adam_layer3_pointwise_conv_kernel_m:@G
8assignvariableop_72_adam_layer3_pointwise_conv_bn_beta_m:	\
Aassignvariableop_73_adam_layer4_depthwise_conv_depthwise_kernel_m:G
8assignvariableop_74_adam_layer4_depthwise_conv_bn_beta_m:	S
7assignvariableop_75_adam_layer4_pointwise_conv_kernel_m:G
8assignvariableop_76_adam_layer4_pointwise_conv_bn_beta_m:	\
Aassignvariableop_77_adam_layer5_depthwise_conv_depthwise_kernel_m:G
8assignvariableop_78_adam_layer5_depthwise_conv_bn_beta_m:	S
7assignvariableop_79_adam_layer5_pointwise_conv_kernel_m:G
8assignvariableop_80_adam_layer5_pointwise_conv_bn_beta_m:	\
Aassignvariableop_81_adam_layer6_depthwise_conv_depthwise_kernel_m:G
8assignvariableop_82_adam_layer6_depthwise_conv_bn_beta_m:	S
7assignvariableop_83_adam_layer6_pointwise_conv_kernel_m:G
8assignvariableop_84_adam_layer6_pointwise_conv_bn_beta_m:	\
Aassignvariableop_85_adam_layer7_depthwise_conv_depthwise_kernel_m:G
8assignvariableop_86_adam_layer7_depthwise_conv_bn_beta_m:	S
7assignvariableop_87_adam_layer7_pointwise_conv_kernel_m:G
8assignvariableop_88_adam_layer7_pointwise_conv_bn_beta_m:	<
)assignvariableop_89_adam_dense_6_kernel_m:	
5
'assignvariableop_90_adam_dense_6_bias_m:
G
-assignvariableop_91_adam_layer1_conv_kernel_v: <
.assignvariableop_92_adam_layer1_conv_bn_beta_v: [
Aassignvariableop_93_adam_layer2_depthwise_conv_depthwise_kernel_v: F
8assignvariableop_94_adam_layer2_depthwise_conv_bn_beta_v: Q
7assignvariableop_95_adam_layer2_pointwise_conv_kernel_v: @F
8assignvariableop_96_adam_layer2_pointwise_conv_bn_beta_v:@[
Aassignvariableop_97_adam_layer3_depthwise_conv_depthwise_kernel_v:@F
8assignvariableop_98_adam_layer3_depthwise_conv_bn_beta_v:@R
7assignvariableop_99_adam_layer3_pointwise_conv_kernel_v:@H
9assignvariableop_100_adam_layer3_pointwise_conv_bn_beta_v:	]
Bassignvariableop_101_adam_layer4_depthwise_conv_depthwise_kernel_v:H
9assignvariableop_102_adam_layer4_depthwise_conv_bn_beta_v:	T
8assignvariableop_103_adam_layer4_pointwise_conv_kernel_v:H
9assignvariableop_104_adam_layer4_pointwise_conv_bn_beta_v:	]
Bassignvariableop_105_adam_layer5_depthwise_conv_depthwise_kernel_v:H
9assignvariableop_106_adam_layer5_depthwise_conv_bn_beta_v:	T
8assignvariableop_107_adam_layer5_pointwise_conv_kernel_v:H
9assignvariableop_108_adam_layer5_pointwise_conv_bn_beta_v:	]
Bassignvariableop_109_adam_layer6_depthwise_conv_depthwise_kernel_v:H
9assignvariableop_110_adam_layer6_depthwise_conv_bn_beta_v:	T
8assignvariableop_111_adam_layer6_pointwise_conv_kernel_v:H
9assignvariableop_112_adam_layer6_pointwise_conv_bn_beta_v:	]
Bassignvariableop_113_adam_layer7_depthwise_conv_depthwise_kernel_v:H
9assignvariableop_114_adam_layer7_depthwise_conv_bn_beta_v:	T
8assignvariableop_115_adam_layer7_pointwise_conv_kernel_v:H
9assignvariableop_116_adam_layer7_pointwise_conv_bn_beta_v:	=
*assignvariableop_117_adam_dense_6_kernel_v:	
6
(assignvariableop_118_adam_dense_6_bias_v:

identity_120˘AssignVariableOp˘AssignVariableOp_1˘AssignVariableOp_10˘AssignVariableOp_100˘AssignVariableOp_101˘AssignVariableOp_102˘AssignVariableOp_103˘AssignVariableOp_104˘AssignVariableOp_105˘AssignVariableOp_106˘AssignVariableOp_107˘AssignVariableOp_108˘AssignVariableOp_109˘AssignVariableOp_11˘AssignVariableOp_110˘AssignVariableOp_111˘AssignVariableOp_112˘AssignVariableOp_113˘AssignVariableOp_114˘AssignVariableOp_115˘AssignVariableOp_116˘AssignVariableOp_117˘AssignVariableOp_118˘AssignVariableOp_12˘AssignVariableOp_13˘AssignVariableOp_14˘AssignVariableOp_15˘AssignVariableOp_16˘AssignVariableOp_17˘AssignVariableOp_18˘AssignVariableOp_19˘AssignVariableOp_2˘AssignVariableOp_20˘AssignVariableOp_21˘AssignVariableOp_22˘AssignVariableOp_23˘AssignVariableOp_24˘AssignVariableOp_25˘AssignVariableOp_26˘AssignVariableOp_27˘AssignVariableOp_28˘AssignVariableOp_29˘AssignVariableOp_3˘AssignVariableOp_30˘AssignVariableOp_31˘AssignVariableOp_32˘AssignVariableOp_33˘AssignVariableOp_34˘AssignVariableOp_35˘AssignVariableOp_36˘AssignVariableOp_37˘AssignVariableOp_38˘AssignVariableOp_39˘AssignVariableOp_4˘AssignVariableOp_40˘AssignVariableOp_41˘AssignVariableOp_42˘AssignVariableOp_43˘AssignVariableOp_44˘AssignVariableOp_45˘AssignVariableOp_46˘AssignVariableOp_47˘AssignVariableOp_48˘AssignVariableOp_49˘AssignVariableOp_5˘AssignVariableOp_50˘AssignVariableOp_51˘AssignVariableOp_52˘AssignVariableOp_53˘AssignVariableOp_54˘AssignVariableOp_55˘AssignVariableOp_56˘AssignVariableOp_57˘AssignVariableOp_58˘AssignVariableOp_59˘AssignVariableOp_6˘AssignVariableOp_60˘AssignVariableOp_61˘AssignVariableOp_62˘AssignVariableOp_63˘AssignVariableOp_64˘AssignVariableOp_65˘AssignVariableOp_66˘AssignVariableOp_67˘AssignVariableOp_68˘AssignVariableOp_69˘AssignVariableOp_7˘AssignVariableOp_70˘AssignVariableOp_71˘AssignVariableOp_72˘AssignVariableOp_73˘AssignVariableOp_74˘AssignVariableOp_75˘AssignVariableOp_76˘AssignVariableOp_77˘AssignVariableOp_78˘AssignVariableOp_79˘AssignVariableOp_8˘AssignVariableOp_80˘AssignVariableOp_81˘AssignVariableOp_82˘AssignVariableOp_83˘AssignVariableOp_84˘AssignVariableOp_85˘AssignVariableOp_86˘AssignVariableOp_87˘AssignVariableOp_88˘AssignVariableOp_89˘AssignVariableOp_9˘AssignVariableOp_90˘AssignVariableOp_91˘AssignVariableOp_92˘AssignVariableOp_93˘AssignVariableOp_94˘AssignVariableOp_95˘AssignVariableOp_96˘AssignVariableOp_97˘AssignVariableOp_98˘AssignVariableOp_99ÖC
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*üB
valueòBBïBxB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-6/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-10/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-18/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-22/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-26/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-26/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*
valueûBĝxB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ú
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*ö
_output_shapes?
à::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*
dtypes|
z2x	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOpAssignVariableOp#assignvariableop_layer1_conv_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOp&assignvariableop_1_layer1_conv_bn_betaIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOp-assignvariableop_2_layer1_conv_bn_moving_meanIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_3AssignVariableOp1assignvariableop_3_layer1_conv_bn_moving_varianceIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_4AssignVariableOp9assignvariableop_4_layer2_depthwise_conv_depthwise_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_5AssignVariableOp0assignvariableop_5_layer2_depthwise_conv_bn_betaIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:Ĥ
AssignVariableOp_6AssignVariableOp7assignvariableop_6_layer2_depthwise_conv_bn_moving_meanIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:Ş
AssignVariableOp_7AssignVariableOp;assignvariableop_7_layer2_depthwise_conv_bn_moving_varianceIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_8AssignVariableOp/assignvariableop_8_layer2_pointwise_conv_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_9AssignVariableOp0assignvariableop_9_layer2_pointwise_conv_bn_betaIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_10AssignVariableOp8assignvariableop_10_layer2_pointwise_conv_bn_moving_meanIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_11AssignVariableOp<assignvariableop_11_layer2_pointwise_conv_bn_moving_varianceIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_12AssignVariableOp:assignvariableop_12_layer3_depthwise_conv_depthwise_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_13AssignVariableOp1assignvariableop_13_layer3_depthwise_conv_bn_betaIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_14AssignVariableOp8assignvariableop_14_layer3_depthwise_conv_bn_moving_meanIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_15AssignVariableOp<assignvariableop_15_layer3_depthwise_conv_bn_moving_varianceIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:Ħ
AssignVariableOp_16AssignVariableOp0assignvariableop_16_layer3_pointwise_conv_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_17AssignVariableOp1assignvariableop_17_layer3_pointwise_conv_bn_betaIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_18AssignVariableOp8assignvariableop_18_layer3_pointwise_conv_bn_moving_meanIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_19AssignVariableOp<assignvariableop_19_layer3_pointwise_conv_bn_moving_varianceIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_20AssignVariableOp:assignvariableop_20_layer4_depthwise_conv_depthwise_kernelIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_21AssignVariableOp1assignvariableop_21_layer4_depthwise_conv_bn_betaIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_22AssignVariableOp8assignvariableop_22_layer4_depthwise_conv_bn_moving_meanIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_23AssignVariableOp<assignvariableop_23_layer4_depthwise_conv_bn_moving_varianceIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Ħ
AssignVariableOp_24AssignVariableOp0assignvariableop_24_layer4_pointwise_conv_kernelIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_25AssignVariableOp1assignvariableop_25_layer4_pointwise_conv_bn_betaIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_26AssignVariableOp8assignvariableop_26_layer4_pointwise_conv_bn_moving_meanIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_27AssignVariableOp<assignvariableop_27_layer4_pointwise_conv_bn_moving_varianceIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_28AssignVariableOp:assignvariableop_28_layer5_depthwise_conv_depthwise_kernelIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_29AssignVariableOp1assignvariableop_29_layer5_depthwise_conv_bn_betaIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_30AssignVariableOp8assignvariableop_30_layer5_depthwise_conv_bn_moving_meanIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_31AssignVariableOp<assignvariableop_31_layer5_depthwise_conv_bn_moving_varianceIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:Ħ
AssignVariableOp_32AssignVariableOp0assignvariableop_32_layer5_pointwise_conv_kernelIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_33AssignVariableOp1assignvariableop_33_layer5_pointwise_conv_bn_betaIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_34AssignVariableOp8assignvariableop_34_layer5_pointwise_conv_bn_moving_meanIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_35AssignVariableOp<assignvariableop_35_layer5_pointwise_conv_bn_moving_varianceIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_36AssignVariableOp:assignvariableop_36_layer6_depthwise_conv_depthwise_kernelIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_37AssignVariableOp1assignvariableop_37_layer6_depthwise_conv_bn_betaIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_38AssignVariableOp8assignvariableop_38_layer6_depthwise_conv_bn_moving_meanIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_39AssignVariableOp<assignvariableop_39_layer6_depthwise_conv_bn_moving_varianceIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:Ħ
AssignVariableOp_40AssignVariableOp0assignvariableop_40_layer6_pointwise_conv_kernelIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_41AssignVariableOp1assignvariableop_41_layer6_pointwise_conv_bn_betaIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_42AssignVariableOp8assignvariableop_42_layer6_pointwise_conv_bn_moving_meanIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_43AssignVariableOp<assignvariableop_43_layer6_pointwise_conv_bn_moving_varianceIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_44AssignVariableOp:assignvariableop_44_layer7_depthwise_conv_depthwise_kernelIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_45AssignVariableOp1assignvariableop_45_layer7_depthwise_conv_bn_betaIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_46AssignVariableOp8assignvariableop_46_layer7_depthwise_conv_bn_moving_meanIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_47AssignVariableOp<assignvariableop_47_layer7_depthwise_conv_bn_moving_varianceIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:Ħ
AssignVariableOp_48AssignVariableOp0assignvariableop_48_layer7_pointwise_conv_kernelIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:˘
AssignVariableOp_49AssignVariableOp1assignvariableop_49_layer7_pointwise_conv_bn_betaIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_50AssignVariableOp8assignvariableop_50_layer7_pointwise_conv_bn_moving_meanIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_51AssignVariableOp<assignvariableop_51_layer7_pointwise_conv_bn_moving_varianceIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_52AssignVariableOp"assignvariableop_52_dense_6_kernelIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_53AssignVariableOp assignvariableop_53_dense_6_biasIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_54AssignVariableOpassignvariableop_54_adam_iterIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_55AssignVariableOpassignvariableop_55_adam_beta_1Identity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_56AssignVariableOpassignvariableop_56_adam_beta_2Identity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_57AssignVariableOpassignvariableop_57_adam_decayIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_58AssignVariableOp&assignvariableop_58_adam_learning_rateIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_59AssignVariableOpassignvariableop_59_totalIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_60AssignVariableOpassignvariableop_60_countIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_61AssignVariableOpassignvariableop_61_total_1Identity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_62AssignVariableOpassignvariableop_62_count_1Identity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_63AssignVariableOp-assignvariableop_63_adam_layer1_conv_kernel_mIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_64AssignVariableOp.assignvariableop_64_adam_layer1_conv_bn_beta_mIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_65AssignVariableOpAassignvariableop_65_adam_layer2_depthwise_conv_depthwise_kernel_mIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_66AssignVariableOp8assignvariableop_66_adam_layer2_depthwise_conv_bn_beta_mIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_67AssignVariableOp7assignvariableop_67_adam_layer2_pointwise_conv_kernel_mIdentity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_68AssignVariableOp8assignvariableop_68_adam_layer2_pointwise_conv_bn_beta_mIdentity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_69AssignVariableOpAassignvariableop_69_adam_layer3_depthwise_conv_depthwise_kernel_mIdentity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_70AssignVariableOp8assignvariableop_70_adam_layer3_depthwise_conv_bn_beta_mIdentity_70:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_71AssignVariableOp7assignvariableop_71_adam_layer3_pointwise_conv_kernel_mIdentity_71:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_72AssignVariableOp8assignvariableop_72_adam_layer3_pointwise_conv_bn_beta_mIdentity_72:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_73AssignVariableOpAassignvariableop_73_adam_layer4_depthwise_conv_depthwise_kernel_mIdentity_73:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_74AssignVariableOp8assignvariableop_74_adam_layer4_depthwise_conv_bn_beta_mIdentity_74:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_75AssignVariableOp7assignvariableop_75_adam_layer4_pointwise_conv_kernel_mIdentity_75:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_76AssignVariableOp8assignvariableop_76_adam_layer4_pointwise_conv_bn_beta_mIdentity_76:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_77IdentityRestoreV2:tensors:77"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_77AssignVariableOpAassignvariableop_77_adam_layer5_depthwise_conv_depthwise_kernel_mIdentity_77:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_78IdentityRestoreV2:tensors:78"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_78AssignVariableOp8assignvariableop_78_adam_layer5_depthwise_conv_bn_beta_mIdentity_78:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_79IdentityRestoreV2:tensors:79"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_79AssignVariableOp7assignvariableop_79_adam_layer5_pointwise_conv_kernel_mIdentity_79:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_80IdentityRestoreV2:tensors:80"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_80AssignVariableOp8assignvariableop_80_adam_layer5_pointwise_conv_bn_beta_mIdentity_80:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_81IdentityRestoreV2:tensors:81"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_81AssignVariableOpAassignvariableop_81_adam_layer6_depthwise_conv_depthwise_kernel_mIdentity_81:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_82IdentityRestoreV2:tensors:82"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_82AssignVariableOp8assignvariableop_82_adam_layer6_depthwise_conv_bn_beta_mIdentity_82:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_83IdentityRestoreV2:tensors:83"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_83AssignVariableOp7assignvariableop_83_adam_layer6_pointwise_conv_kernel_mIdentity_83:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_84IdentityRestoreV2:tensors:84"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_84AssignVariableOp8assignvariableop_84_adam_layer6_pointwise_conv_bn_beta_mIdentity_84:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_85IdentityRestoreV2:tensors:85"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_85AssignVariableOpAassignvariableop_85_adam_layer7_depthwise_conv_depthwise_kernel_mIdentity_85:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_86IdentityRestoreV2:tensors:86"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_86AssignVariableOp8assignvariableop_86_adam_layer7_depthwise_conv_bn_beta_mIdentity_86:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_87IdentityRestoreV2:tensors:87"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_87AssignVariableOp7assignvariableop_87_adam_layer7_pointwise_conv_kernel_mIdentity_87:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_88IdentityRestoreV2:tensors:88"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_88AssignVariableOp8assignvariableop_88_adam_layer7_pointwise_conv_bn_beta_mIdentity_88:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_89IdentityRestoreV2:tensors:89"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_89AssignVariableOp)assignvariableop_89_adam_dense_6_kernel_mIdentity_89:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_90IdentityRestoreV2:tensors:90"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_90AssignVariableOp'assignvariableop_90_adam_dense_6_bias_mIdentity_90:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_91IdentityRestoreV2:tensors:91"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_91AssignVariableOp-assignvariableop_91_adam_layer1_conv_kernel_vIdentity_91:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_92IdentityRestoreV2:tensors:92"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_92AssignVariableOp.assignvariableop_92_adam_layer1_conv_bn_beta_vIdentity_92:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_93IdentityRestoreV2:tensors:93"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_93AssignVariableOpAassignvariableop_93_adam_layer2_depthwise_conv_depthwise_kernel_vIdentity_93:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_94IdentityRestoreV2:tensors:94"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_94AssignVariableOp8assignvariableop_94_adam_layer2_depthwise_conv_bn_beta_vIdentity_94:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_95IdentityRestoreV2:tensors:95"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_95AssignVariableOp7assignvariableop_95_adam_layer2_pointwise_conv_kernel_vIdentity_95:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_96IdentityRestoreV2:tensors:96"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_96AssignVariableOp8assignvariableop_96_adam_layer2_pointwise_conv_bn_beta_vIdentity_96:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_97IdentityRestoreV2:tensors:97"/device:CPU:0*
T0*
_output_shapes
:²
AssignVariableOp_97AssignVariableOpAassignvariableop_97_adam_layer3_depthwise_conv_depthwise_kernel_vIdentity_97:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_98IdentityRestoreV2:tensors:98"/device:CPU:0*
T0*
_output_shapes
:İ
AssignVariableOp_98AssignVariableOp8assignvariableop_98_adam_layer3_depthwise_conv_bn_beta_vIdentity_98:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_99IdentityRestoreV2:tensors:99"/device:CPU:0*
T0*
_output_shapes
:¨
AssignVariableOp_99AssignVariableOp7assignvariableop_99_adam_layer3_pointwise_conv_kernel_vIdentity_99:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_100IdentityRestoreV2:tensors:100"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_100AssignVariableOp9assignvariableop_100_adam_layer3_pointwise_conv_bn_beta_vIdentity_100:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_101IdentityRestoreV2:tensors:101"/device:CPU:0*
T0*
_output_shapes
:µ
AssignVariableOp_101AssignVariableOpBassignvariableop_101_adam_layer4_depthwise_conv_depthwise_kernel_vIdentity_101:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_102IdentityRestoreV2:tensors:102"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_102AssignVariableOp9assignvariableop_102_adam_layer4_depthwise_conv_bn_beta_vIdentity_102:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_103IdentityRestoreV2:tensors:103"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_103AssignVariableOp8assignvariableop_103_adam_layer4_pointwise_conv_kernel_vIdentity_103:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_104IdentityRestoreV2:tensors:104"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_104AssignVariableOp9assignvariableop_104_adam_layer4_pointwise_conv_bn_beta_vIdentity_104:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_105IdentityRestoreV2:tensors:105"/device:CPU:0*
T0*
_output_shapes
:µ
AssignVariableOp_105AssignVariableOpBassignvariableop_105_adam_layer5_depthwise_conv_depthwise_kernel_vIdentity_105:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_106IdentityRestoreV2:tensors:106"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_106AssignVariableOp9assignvariableop_106_adam_layer5_depthwise_conv_bn_beta_vIdentity_106:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_107IdentityRestoreV2:tensors:107"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_107AssignVariableOp8assignvariableop_107_adam_layer5_pointwise_conv_kernel_vIdentity_107:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_108IdentityRestoreV2:tensors:108"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_108AssignVariableOp9assignvariableop_108_adam_layer5_pointwise_conv_bn_beta_vIdentity_108:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_109IdentityRestoreV2:tensors:109"/device:CPU:0*
T0*
_output_shapes
:µ
AssignVariableOp_109AssignVariableOpBassignvariableop_109_adam_layer6_depthwise_conv_depthwise_kernel_vIdentity_109:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_110IdentityRestoreV2:tensors:110"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_110AssignVariableOp9assignvariableop_110_adam_layer6_depthwise_conv_bn_beta_vIdentity_110:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_111IdentityRestoreV2:tensors:111"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_111AssignVariableOp8assignvariableop_111_adam_layer6_pointwise_conv_kernel_vIdentity_111:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_112IdentityRestoreV2:tensors:112"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_112AssignVariableOp9assignvariableop_112_adam_layer6_pointwise_conv_bn_beta_vIdentity_112:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_113IdentityRestoreV2:tensors:113"/device:CPU:0*
T0*
_output_shapes
:µ
AssignVariableOp_113AssignVariableOpBassignvariableop_113_adam_layer7_depthwise_conv_depthwise_kernel_vIdentity_113:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_114IdentityRestoreV2:tensors:114"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_114AssignVariableOp9assignvariableop_114_adam_layer7_depthwise_conv_bn_beta_vIdentity_114:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_115IdentityRestoreV2:tensors:115"/device:CPU:0*
T0*
_output_shapes
:Ğ
AssignVariableOp_115AssignVariableOp8assignvariableop_115_adam_layer7_pointwise_conv_kernel_vIdentity_115:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_116IdentityRestoreV2:tensors:116"/device:CPU:0*
T0*
_output_shapes
:Ĵ
AssignVariableOp_116AssignVariableOp9assignvariableop_116_adam_layer7_pointwise_conv_bn_beta_vIdentity_116:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_117IdentityRestoreV2:tensors:117"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_117AssignVariableOp*assignvariableop_117_adam_dense_6_kernel_vIdentity_117:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_118IdentityRestoreV2:tensors:118"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_118AssignVariableOp(assignvariableop_118_adam_dense_6_bias_vIdentity_118:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 
Identity_119Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99^NoOp"/device:CPU:0*
T0*
_output_shapes
: Y
Identity_120IdentityIdentity_119:output:0^NoOp_1*
T0*
_output_shapes
: 
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99*"
_acd_function_control_output(*
_output_shapes
 "%
identity_120Identity_120:output:0*
_input_shapesó
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
˙
s
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085344

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
´	
Ê
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2085355

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
íà
Û#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086580
input_7-
layer1_conv_2086404: 
layer1_conv_bn_2086407$
layer1_conv_bn_2086409: $
layer1_conv_bn_2086411: $
layer1_conv_bn_2086413: 7
layer2_depthwise_conv_2086417: $
 layer2_depthwise_conv_bn_2086420.
 layer2_depthwise_conv_bn_2086422: .
 layer2_depthwise_conv_bn_2086424: .
 layer2_depthwise_conv_bn_2086426: 7
layer2_pointwise_conv_2086430: @$
 layer2_pointwise_conv_bn_2086433.
 layer2_pointwise_conv_bn_2086435:@.
 layer2_pointwise_conv_bn_2086437:@.
 layer2_pointwise_conv_bn_2086439:@7
layer3_depthwise_conv_2086443:@$
 layer3_depthwise_conv_bn_2086446.
 layer3_depthwise_conv_bn_2086448:@.
 layer3_depthwise_conv_bn_2086450:@.
 layer3_depthwise_conv_bn_2086452:@8
layer3_pointwise_conv_2086456:@$
 layer3_pointwise_conv_bn_2086459/
 layer3_pointwise_conv_bn_2086461:	/
 layer3_pointwise_conv_bn_2086463:	/
 layer3_pointwise_conv_bn_2086465:	8
layer4_depthwise_conv_2086469:$
 layer4_depthwise_conv_bn_2086472/
 layer4_depthwise_conv_bn_2086474:	/
 layer4_depthwise_conv_bn_2086476:	/
 layer4_depthwise_conv_bn_2086478:	9
layer4_pointwise_conv_2086482:$
 layer4_pointwise_conv_bn_2086485/
 layer4_pointwise_conv_bn_2086487:	/
 layer4_pointwise_conv_bn_2086489:	/
 layer4_pointwise_conv_bn_2086491:	8
layer5_depthwise_conv_2086495:$
 layer5_depthwise_conv_bn_2086498/
 layer5_depthwise_conv_bn_2086500:	/
 layer5_depthwise_conv_bn_2086502:	/
 layer5_depthwise_conv_bn_2086504:	9
layer5_pointwise_conv_2086508:$
 layer5_pointwise_conv_bn_2086511/
 layer5_pointwise_conv_bn_2086513:	/
 layer5_pointwise_conv_bn_2086515:	/
 layer5_pointwise_conv_bn_2086517:	8
layer6_depthwise_conv_2086521:$
 layer6_depthwise_conv_bn_2086524/
 layer6_depthwise_conv_bn_2086526:	/
 layer6_depthwise_conv_bn_2086528:	/
 layer6_depthwise_conv_bn_2086530:	9
layer6_pointwise_conv_2086534:$
 layer6_pointwise_conv_bn_2086537/
 layer6_pointwise_conv_bn_2086539:	/
 layer6_pointwise_conv_bn_2086541:	/
 layer6_pointwise_conv_bn_2086543:	8
layer7_depthwise_conv_2086547:$
 layer7_depthwise_conv_bn_2086550/
 layer7_depthwise_conv_bn_2086552:	/
 layer7_depthwise_conv_bn_2086554:	/
 layer7_depthwise_conv_bn_2086556:	9
layer7_pointwise_conv_2086560:$
 layer7_pointwise_conv_bn_2086563/
 layer7_pointwise_conv_bn_2086565:	/
 layer7_pointwise_conv_bn_2086567:	/
 layer7_pointwise_conv_bn_2086569:	"
dense_6_2086574:	

dense_6_2086576:

identity˘dense_6/StatefulPartitionedCall˘#layer1/conv/StatefulPartitionedCall˘&layer1/conv/bn/StatefulPartitionedCall˘-layer2/depthwise_conv/StatefulPartitionedCall˘0layer2/depthwise_conv/bn/StatefulPartitionedCall˘-layer2/pointwise_conv/StatefulPartitionedCall˘0layer2/pointwise_conv/bn/StatefulPartitionedCall˘-layer3/depthwise_conv/StatefulPartitionedCall˘0layer3/depthwise_conv/bn/StatefulPartitionedCall˘-layer3/pointwise_conv/StatefulPartitionedCall˘0layer3/pointwise_conv/bn/StatefulPartitionedCall˘-layer4/depthwise_conv/StatefulPartitionedCall˘0layer4/depthwise_conv/bn/StatefulPartitionedCall˘-layer4/pointwise_conv/StatefulPartitionedCall˘0layer4/pointwise_conv/bn/StatefulPartitionedCall˘-layer5/depthwise_conv/StatefulPartitionedCall˘0layer5/depthwise_conv/bn/StatefulPartitionedCall˘-layer5/pointwise_conv/StatefulPartitionedCall˘0layer5/pointwise_conv/bn/StatefulPartitionedCall˘-layer6/depthwise_conv/StatefulPartitionedCall˘0layer6/depthwise_conv/bn/StatefulPartitionedCall˘-layer6/pointwise_conv/StatefulPartitionedCall˘0layer6/pointwise_conv/bn/StatefulPartitionedCall˘-layer7/depthwise_conv/StatefulPartitionedCall˘0layer7/depthwise_conv/bn/StatefulPartitionedCall˘-layer7/pointwise_conv/StatefulPartitionedCall˘0layer7/pointwise_conv/bn/StatefulPartitionedCallô
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinput_7layer1_conv_2086404*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2085102ï
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_2086407layer1_conv_bn_2086409layer1_conv_bn_2086411layer1_conv_bn_2086413*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084290ó
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2085120Ż
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_2086417*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2085131µ
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_2086420 layer2_depthwise_conv_bn_2086422 layer2_depthwise_conv_bn_2086424 layer2_depthwise_conv_bn_2086426*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084352
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085149?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_2086430*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2085158µ
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_2086433 layer2_pointwise_conv_bn_2086435 layer2_pointwise_conv_bn_2086437 layer2_pointwise_conv_bn_2086439*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084414
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085176?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_2086443*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2085187µ
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_2086446 layer3_depthwise_conv_bn_2086448 layer3_depthwise_conv_bn_2086450 layer3_depthwise_conv_bn_2086452*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084476
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085205ż
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_2086456*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2085214ĥ
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_2086459 layer3_pointwise_conv_bn_2086461 layer3_pointwise_conv_bn_2086463 layer3_pointwise_conv_bn_2086465*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084538
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085232ż
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_2086469*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2085243ĥ
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_2086472 layer4_depthwise_conv_bn_2086474 layer4_depthwise_conv_bn_2086476 layer4_depthwise_conv_bn_2086478*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084600
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085261ż
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_2086482*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2085270ĥ
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_2086485 layer4_pointwise_conv_bn_2086487 layer4_pointwise_conv_bn_2086489 layer4_pointwise_conv_bn_2086491*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084662
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085288ż
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_2086495*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2085299ĥ
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_2086498 layer5_depthwise_conv_bn_2086500 layer5_depthwise_conv_bn_2086502 layer5_depthwise_conv_bn_2086504*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084724
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085317ż
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_2086508*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2085326ĥ
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_2086511 layer5_pointwise_conv_bn_2086513 layer5_pointwise_conv_bn_2086515 layer5_pointwise_conv_bn_2086517*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084786
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085344ż
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_2086521*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2085355ĥ
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_2086524 layer6_depthwise_conv_bn_2086526 layer6_depthwise_conv_bn_2086528 layer6_depthwise_conv_bn_2086530*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084848
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085373ż
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_2086534*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2085382ĥ
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_2086537 layer6_pointwise_conv_bn_2086539 layer6_pointwise_conv_bn_2086541 layer6_pointwise_conv_bn_2086543*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084910
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085400ż
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_2086547*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2085411ĥ
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_2086550 layer7_depthwise_conv_bn_2086552 layer7_depthwise_conv_bn_2086554 layer7_depthwise_conv_bn_2086556*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084972
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085429ż
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_2086560*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2085438ĥ
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_2086563 layer7_pointwise_conv_bn_2086565 layer7_pointwise_conv_bn_2086567 layer7_pointwise_conv_bn_2086569*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085034
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085456
*global_average_pooling2d_6/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2085085
dense_6/StatefulPartitionedCallStatefulPartitionedCall3global_average_pooling2d_6/PartitionedCall:output:0dense_6_2086574dense_6_2086576*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_dense_6_layer_call_and_return_conditional_losses_2085469w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Û

NoOpNoOp ^dense_6/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2J
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
:˙˙˙˙˙˙˙˙˙`@
!
_user_specified_name	input_7: 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
?à
Ú#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086125

inputs-
layer1_conv_2085949: 
layer1_conv_bn_2085952$
layer1_conv_bn_2085954: $
layer1_conv_bn_2085956: $
layer1_conv_bn_2085958: 7
layer2_depthwise_conv_2085962: $
 layer2_depthwise_conv_bn_2085965.
 layer2_depthwise_conv_bn_2085967: .
 layer2_depthwise_conv_bn_2085969: .
 layer2_depthwise_conv_bn_2085971: 7
layer2_pointwise_conv_2085975: @$
 layer2_pointwise_conv_bn_2085978.
 layer2_pointwise_conv_bn_2085980:@.
 layer2_pointwise_conv_bn_2085982:@.
 layer2_pointwise_conv_bn_2085984:@7
layer3_depthwise_conv_2085988:@$
 layer3_depthwise_conv_bn_2085991.
 layer3_depthwise_conv_bn_2085993:@.
 layer3_depthwise_conv_bn_2085995:@.
 layer3_depthwise_conv_bn_2085997:@8
layer3_pointwise_conv_2086001:@$
 layer3_pointwise_conv_bn_2086004/
 layer3_pointwise_conv_bn_2086006:	/
 layer3_pointwise_conv_bn_2086008:	/
 layer3_pointwise_conv_bn_2086010:	8
layer4_depthwise_conv_2086014:$
 layer4_depthwise_conv_bn_2086017/
 layer4_depthwise_conv_bn_2086019:	/
 layer4_depthwise_conv_bn_2086021:	/
 layer4_depthwise_conv_bn_2086023:	9
layer4_pointwise_conv_2086027:$
 layer4_pointwise_conv_bn_2086030/
 layer4_pointwise_conv_bn_2086032:	/
 layer4_pointwise_conv_bn_2086034:	/
 layer4_pointwise_conv_bn_2086036:	8
layer5_depthwise_conv_2086040:$
 layer5_depthwise_conv_bn_2086043/
 layer5_depthwise_conv_bn_2086045:	/
 layer5_depthwise_conv_bn_2086047:	/
 layer5_depthwise_conv_bn_2086049:	9
layer5_pointwise_conv_2086053:$
 layer5_pointwise_conv_bn_2086056/
 layer5_pointwise_conv_bn_2086058:	/
 layer5_pointwise_conv_bn_2086060:	/
 layer5_pointwise_conv_bn_2086062:	8
layer6_depthwise_conv_2086066:$
 layer6_depthwise_conv_bn_2086069/
 layer6_depthwise_conv_bn_2086071:	/
 layer6_depthwise_conv_bn_2086073:	/
 layer6_depthwise_conv_bn_2086075:	9
layer6_pointwise_conv_2086079:$
 layer6_pointwise_conv_bn_2086082/
 layer6_pointwise_conv_bn_2086084:	/
 layer6_pointwise_conv_bn_2086086:	/
 layer6_pointwise_conv_bn_2086088:	8
layer7_depthwise_conv_2086092:$
 layer7_depthwise_conv_bn_2086095/
 layer7_depthwise_conv_bn_2086097:	/
 layer7_depthwise_conv_bn_2086099:	/
 layer7_depthwise_conv_bn_2086101:	9
layer7_pointwise_conv_2086105:$
 layer7_pointwise_conv_bn_2086108/
 layer7_pointwise_conv_bn_2086110:	/
 layer7_pointwise_conv_bn_2086112:	/
 layer7_pointwise_conv_bn_2086114:	"
dense_6_2086119:	

dense_6_2086121:

identity˘dense_6/StatefulPartitionedCall˘#layer1/conv/StatefulPartitionedCall˘&layer1/conv/bn/StatefulPartitionedCall˘-layer2/depthwise_conv/StatefulPartitionedCall˘0layer2/depthwise_conv/bn/StatefulPartitionedCall˘-layer2/pointwise_conv/StatefulPartitionedCall˘0layer2/pointwise_conv/bn/StatefulPartitionedCall˘-layer3/depthwise_conv/StatefulPartitionedCall˘0layer3/depthwise_conv/bn/StatefulPartitionedCall˘-layer3/pointwise_conv/StatefulPartitionedCall˘0layer3/pointwise_conv/bn/StatefulPartitionedCall˘-layer4/depthwise_conv/StatefulPartitionedCall˘0layer4/depthwise_conv/bn/StatefulPartitionedCall˘-layer4/pointwise_conv/StatefulPartitionedCall˘0layer4/pointwise_conv/bn/StatefulPartitionedCall˘-layer5/depthwise_conv/StatefulPartitionedCall˘0layer5/depthwise_conv/bn/StatefulPartitionedCall˘-layer5/pointwise_conv/StatefulPartitionedCall˘0layer5/pointwise_conv/bn/StatefulPartitionedCall˘-layer6/depthwise_conv/StatefulPartitionedCall˘0layer6/depthwise_conv/bn/StatefulPartitionedCall˘-layer6/pointwise_conv/StatefulPartitionedCall˘0layer6/pointwise_conv/bn/StatefulPartitionedCall˘-layer7/depthwise_conv/StatefulPartitionedCall˘0layer7/depthwise_conv/bn/StatefulPartitionedCall˘-layer7/pointwise_conv/StatefulPartitionedCall˘0layer7/pointwise_conv/bn/StatefulPartitionedCalló
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinputslayer1_conv_2085949*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2085102í
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_2085952layer1_conv_bn_2085954layer1_conv_bn_2085956layer1_conv_bn_2085958*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084320ó
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2085120Ż
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_2085962*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2085131³
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_2085965 layer2_depthwise_conv_bn_2085967 layer2_depthwise_conv_bn_2085969 layer2_depthwise_conv_bn_2085971*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084382
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085149?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_2085975*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2085158³
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_2085978 layer2_pointwise_conv_bn_2085980 layer2_pointwise_conv_bn_2085982 layer2_pointwise_conv_bn_2085984*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084444
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085176?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_2085988*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2085187³
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_2085991 layer3_depthwise_conv_bn_2085993 layer3_depthwise_conv_bn_2085995 layer3_depthwise_conv_bn_2085997*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084506
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085205ż
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_2086001*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2085214´
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_2086004 layer3_pointwise_conv_bn_2086006 layer3_pointwise_conv_bn_2086008 layer3_pointwise_conv_bn_2086010*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084568
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085232ż
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_2086014*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2085243´
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_2086017 layer4_depthwise_conv_bn_2086019 layer4_depthwise_conv_bn_2086021 layer4_depthwise_conv_bn_2086023*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084630
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085261ż
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_2086027*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2085270´
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_2086030 layer4_pointwise_conv_bn_2086032 layer4_pointwise_conv_bn_2086034 layer4_pointwise_conv_bn_2086036*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084692
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085288ż
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_2086040*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2085299´
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_2086043 layer5_depthwise_conv_bn_2086045 layer5_depthwise_conv_bn_2086047 layer5_depthwise_conv_bn_2086049*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084754
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085317ż
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_2086053*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2085326´
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_2086056 layer5_pointwise_conv_bn_2086058 layer5_pointwise_conv_bn_2086060 layer5_pointwise_conv_bn_2086062*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084816
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085344ż
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_2086066*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2085355´
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_2086069 layer6_depthwise_conv_bn_2086071 layer6_depthwise_conv_bn_2086073 layer6_depthwise_conv_bn_2086075*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084878
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085373ż
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_2086079*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2085382´
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_2086082 layer6_pointwise_conv_bn_2086084 layer6_pointwise_conv_bn_2086086 layer6_pointwise_conv_bn_2086088*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084940
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085400ż
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_2086092*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2085411´
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_2086095 layer7_depthwise_conv_bn_2086097 layer7_depthwise_conv_bn_2086099 layer7_depthwise_conv_bn_2086101*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2085002
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085429ż
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_2086105*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2085438´
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_2086108 layer7_pointwise_conv_bn_2086110 layer7_pointwise_conv_bn_2086112 layer7_pointwise_conv_bn_2086114*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085064
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085456
*global_average_pooling2d_6/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2085085
dense_6/StatefulPartitionedCallStatefulPartitionedCall3global_average_pooling2d_6/PartitionedCall:output:0dense_6_2086119dense_6_2086121*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_dense_6_layer_call_and_return_conditional_losses_2085469w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Û

NoOpNoOp ^dense_6/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2J
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
:˙˙˙˙˙˙˙˙˙`@
 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
?	
Î
:__inference_layer5/depthwise_conv/bn_layer_call_fn_2088310

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084754
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ç

7__inference_layer7/pointwise_conv_layer_call_fn_2088701

inputs#
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2085438x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
´	
Ê
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2088114

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
À	
Î
:__inference_layer3/pointwise_conv/bn_layer_call_fn_2088041

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084538
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
Öì
G
"__inference__wrapped_model_2084269
input_7R
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
Byamnet_frames_layer3_pointwise_conv_conv2d_readvariableop_resource:@0
,yamnet_frames_layer3_pointwise_conv_bn_scaleM
>yamnet_frames_layer3_pointwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	`
Eyamnet_frames_layer4_depthwise_conv_depthwise_readvariableop_resource:0
,yamnet_frames_layer4_depthwise_conv_bn_scaleM
>yamnet_frames_layer4_depthwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	^
Byamnet_frames_layer4_pointwise_conv_conv2d_readvariableop_resource:0
,yamnet_frames_layer4_pointwise_conv_bn_scaleM
>yamnet_frames_layer4_pointwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	`
Eyamnet_frames_layer5_depthwise_conv_depthwise_readvariableop_resource:0
,yamnet_frames_layer5_depthwise_conv_bn_scaleM
>yamnet_frames_layer5_depthwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	^
Byamnet_frames_layer5_pointwise_conv_conv2d_readvariableop_resource:0
,yamnet_frames_layer5_pointwise_conv_bn_scaleM
>yamnet_frames_layer5_pointwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	`
Eyamnet_frames_layer6_depthwise_conv_depthwise_readvariableop_resource:0
,yamnet_frames_layer6_depthwise_conv_bn_scaleM
>yamnet_frames_layer6_depthwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	^
Byamnet_frames_layer6_pointwise_conv_conv2d_readvariableop_resource:0
,yamnet_frames_layer6_pointwise_conv_bn_scaleM
>yamnet_frames_layer6_pointwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	`
Eyamnet_frames_layer7_depthwise_conv_depthwise_readvariableop_resource:0
,yamnet_frames_layer7_depthwise_conv_bn_scaleM
>yamnet_frames_layer7_depthwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	^
Byamnet_frames_layer7_pointwise_conv_conv2d_readvariableop_resource:0
,yamnet_frames_layer7_pointwise_conv_bn_scaleM
>yamnet_frames_layer7_pointwise_conv_bn_readvariableop_resource:	^
Oyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	`
Qyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	G
4yamnet_frames_dense_6_matmul_readvariableop_resource:	
C
5yamnet_frames_dense_6_biasadd_readvariableop_resource:

identity˘,yamnet_frames/dense_6/BiasAdd/ReadVariableOp˘+yamnet_frames/dense_6/MatMul/ReadVariableOp˘/yamnet_frames/layer1/conv/Conv2D/ReadVariableOp˘<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp˘>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1˘+yamnet_frames/layer1/conv/bn/ReadVariableOp˘Fyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp˘<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp˘9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp˘Fyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp˘Fyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp˘<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp˘9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp˘Fyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp˘Fyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp˘<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp˘9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp˘Fyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp˘Fyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp˘<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp˘9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp˘Fyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp˘Fyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp˘<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp˘9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp˘Fyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp˘Fyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp˘<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp˘9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp˘Fyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp°
/yamnet_frames/layer1/conv/Conv2D/ReadVariableOpReadVariableOp8yamnet_frames_layer1_conv_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0Î
 yamnet_frames/layer1/conv/Conv2DConv2Dinput_77yamnet_frames/layer1/conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides

+yamnet_frames/layer1/conv/bn/ReadVariableOpReadVariableOp4yamnet_frames_layer1_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0?
<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpEyamnet_frames_layer1_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0Â
>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpGyamnet_frames_layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0Ċ
-yamnet_frames/layer1/conv/bn/FusedBatchNormV3FusedBatchNormV3)yamnet_frames/layer1/conv/Conv2D:output:0"yamnet_frames_layer1_conv_bn_scale3yamnet_frames/layer1/conv/bn/ReadVariableOp:value:0Dyamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Fyamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0  : : : : :*
is_training( 
yamnet_frames/layer1/relu/ReluRelu1yamnet_frames/layer1/conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  Ê
<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer2_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
: *
dtype0
3yamnet_frames/layer2/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"             
;yamnet_frames/layer2/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      
-yamnet_frames/layer2/depthwise_conv/depthwiseDepthwiseConv2dNative,yamnet_frames/layer1/relu/Relu:activations:0Dyamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides
°
5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer2_depthwise_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0Ò
Fyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0Ö
Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0
7yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer2/depthwise_conv/depthwise:output:0,yamnet_frames_layer2_depthwise_conv_bn_scale=yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0  : : : : :*
is_training( Ĵ
-yamnet_frames/layer2/depthwise_conv/relu/ReluRelu;yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  Ä
9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer2_pointwise_conv_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0
*yamnet_frames/layer2/pointwise_conv/Conv2DConv2D;yamnet_frames/layer2/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*
paddingSAME*
strides
°
5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer2_pointwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0Ò
Fyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0Ö
Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0
7yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer2/pointwise_conv/Conv2D:output:0,yamnet_frames_layer2_pointwise_conv_bn_scale=yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0 @:@:@:@:@:*
is_training( Ĵ
-yamnet_frames/layer2/pointwise_conv/relu/ReluRelu;yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @Ê
<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer3_depthwise_conv_depthwise_readvariableop_resource*&
_output_shapes
:@*
dtype0
3yamnet_frames/layer3/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"      @      
;yamnet_frames/layer3/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ğ
-yamnet_frames/layer3/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer2/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
paddingSAME*
strides
°
5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer3_depthwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0Ò
Fyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0Ö
Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0
7yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer3/depthwise_conv/depthwise:output:0,yamnet_frames_layer3_depthwise_conv_bn_scale=yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
is_training( Ĵ
-yamnet_frames/layer3/depthwise_conv/relu/ReluRelu;yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@Ċ
9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer3_pointwise_conv_conv2d_readvariableop_resource*'
_output_shapes
:@*
dtype0
*yamnet_frames/layer3/pointwise_conv/Conv2DConv2D;yamnet_frames/layer3/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer3_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer3/pointwise_conv/Conv2D:output:0,yamnet_frames_layer3_pointwise_conv_bn_scale=yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer3/pointwise_conv/relu/ReluRelu;yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ë
<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer4_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0
3yamnet_frames/layer4/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            
;yamnet_frames/layer4/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ĵ
-yamnet_frames/layer4/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer3/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer4_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer4/depthwise_conv/depthwise:output:0,yamnet_frames_layer4_depthwise_conv_bn_scale=yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer4/depthwise_conv/relu/ReluRelu;yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ĉ
9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer4_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
*yamnet_frames/layer4/pointwise_conv/Conv2DConv2D;yamnet_frames/layer4/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer4_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer4/pointwise_conv/Conv2D:output:0,yamnet_frames_layer4_pointwise_conv_bn_scale=yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer4/pointwise_conv/relu/ReluRelu;yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ë
<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer5_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0
3yamnet_frames/layer5/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            
;yamnet_frames/layer5/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ĵ
-yamnet_frames/layer5/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer4/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer5_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer5/depthwise_conv/depthwise:output:0,yamnet_frames_layer5_depthwise_conv_bn_scale=yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer5/depthwise_conv/relu/ReluRelu;yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ĉ
9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer5_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
*yamnet_frames/layer5/pointwise_conv/Conv2DConv2D;yamnet_frames/layer5/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer5_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer5/pointwise_conv/Conv2D:output:0,yamnet_frames_layer5_pointwise_conv_bn_scale=yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer5/pointwise_conv/relu/ReluRelu;yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ë
<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer6_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0
3yamnet_frames/layer6/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            
;yamnet_frames/layer6/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ĵ
-yamnet_frames/layer6/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer5/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer6_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer6/depthwise_conv/depthwise:output:0,yamnet_frames_layer6_depthwise_conv_bn_scale=yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer6/depthwise_conv/relu/ReluRelu;yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ĉ
9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer6_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
*yamnet_frames/layer6/pointwise_conv/Conv2DConv2D;yamnet_frames/layer6/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer6_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer6/pointwise_conv/Conv2D:output:0,yamnet_frames_layer6_pointwise_conv_bn_scale=yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer6/pointwise_conv/relu/ReluRelu;yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ë
<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOpReadVariableOpEyamnet_frames_layer7_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0
3yamnet_frames/layer7/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            
;yamnet_frames/layer7/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ĵ
-yamnet_frames/layer7/depthwise_conv/depthwiseDepthwiseConv2dNative;yamnet_frames/layer6/pointwise_conv/relu/Relu:activations:0Dyamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer7_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV36yamnet_frames/layer7/depthwise_conv/depthwise:output:0,yamnet_frames_layer7_depthwise_conv_bn_scale=yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer7/depthwise_conv/relu/ReluRelu;yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ĉ
9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOpReadVariableOpByamnet_frames_layer7_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
*yamnet_frames/layer7/pointwise_conv/Conv2DConv2D;yamnet_frames/layer7/depthwise_conv/relu/Relu:activations:0Ayamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
ħ
5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOpReadVariableOp>yamnet_frames_layer7_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0Ó
Fyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpOyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0×
Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpQyamnet_frames_layer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0
7yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV33yamnet_frames/layer7/pointwise_conv/Conv2D:output:0,yamnet_frames_layer7_pointwise_conv_bn_scale=yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp:value:0Nyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Pyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
is_training( ­
-yamnet_frames/layer7/pointwise_conv/relu/ReluRelu;yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙
?yamnet_frames/global_average_pooling2d_6/Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      ï
-yamnet_frames/global_average_pooling2d_6/MeanMean;yamnet_frames/layer7/pointwise_conv/relu/Relu:activations:0Hyamnet_frames/global_average_pooling2d_6/Mean/reduction_indices:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ħ
+yamnet_frames/dense_6/MatMul/ReadVariableOpReadVariableOp4yamnet_frames_dense_6_matmul_readvariableop_resource*
_output_shapes
:	
*
dtype0Ċ
yamnet_frames/dense_6/MatMulMatMul6yamnet_frames/global_average_pooling2d_6/Mean:output:03yamnet_frames/dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

,yamnet_frames/dense_6/BiasAdd/ReadVariableOpReadVariableOp5yamnet_frames_dense_6_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0¸
yamnet_frames/dense_6/BiasAddBiasAdd&yamnet_frames/dense_6/MatMul:product:04yamnet_frames/dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
u
IdentityIdentity&yamnet_frames/dense_6/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
ġ
NoOpNoOp-^yamnet_frames/dense_6/BiasAdd/ReadVariableOp,^yamnet_frames/dense_6/MatMul/ReadVariableOp0^yamnet_frames/layer1/conv/Conv2D/ReadVariableOp=^yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp?^yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1,^yamnet_frames/layer1/conv/bn/ReadVariableOpG^yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOpG^yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp=^yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp:^yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOpG^yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpI^yamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_16^yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2\
,yamnet_frames/dense_6/BiasAdd/ReadVariableOp,yamnet_frames/dense_6/BiasAdd/ReadVariableOp2Z
+yamnet_frames/dense_6/MatMul/ReadVariableOp+yamnet_frames/dense_6/MatMul/ReadVariableOp2b
/yamnet_frames/layer1/conv/Conv2D/ReadVariableOp/yamnet_frames/layer1/conv/Conv2D/ReadVariableOp2|
<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp<yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp2
>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1>yamnet_frames/layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_12Z
+yamnet_frames/layer1/conv/bn/ReadVariableOp+yamnet_frames/layer1/conv/bn/ReadVariableOp2
Fyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer2/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer2/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer2/pointwise_conv/Conv2D/ReadVariableOp2
Fyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer2/pointwise_conv/bn/ReadVariableOp2
Fyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer3/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer3/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer3/pointwise_conv/Conv2D/ReadVariableOp2
Fyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer3/pointwise_conv/bn/ReadVariableOp2
Fyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer4/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer4/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer4/pointwise_conv/Conv2D/ReadVariableOp2
Fyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer4/pointwise_conv/bn/ReadVariableOp2
Fyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer5/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer5/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer5/pointwise_conv/Conv2D/ReadVariableOp2
Fyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer5/pointwise_conv/bn/ReadVariableOp2
Fyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer6/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer6/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer6/pointwise_conv/Conv2D/ReadVariableOp2
Fyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer6/pointwise_conv/bn/ReadVariableOp2
Fyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp5yamnet_frames/layer7/depthwise_conv/bn/ReadVariableOp2|
<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp<yamnet_frames/layer7/depthwise_conv/depthwise/ReadVariableOp2v
9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp9yamnet_frames/layer7/pointwise_conv/Conv2D/ReadVariableOp2
Fyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpFyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp2
Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1Hyamnet_frames/layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_12n
5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp5yamnet_frames/layer7/pointwise_conv/bn/ReadVariableOp:X T
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
!
_user_specified_name	input_7: 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:

ò
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084848

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
û
s
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085149

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0  :W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
Ĵ
?
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2087858

inputs8
conv2d_readvariableop_resource: @
identity˘Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0  : 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
ĉ

7__inference_layer7/depthwise_conv_layer_call_fn_2088615

inputs"
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2085411x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
û
s
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2087928

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0 @:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @
 
_user_specified_nameinputs
!
ñ
/__inference_yamnet_frames_layer_call_fn_2086401
input_7!
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

unknown_19:@

unknown_20

unknown_21:	

unknown_22:	

unknown_23:	%

unknown_24:

unknown_25

unknown_26:	

unknown_27:	

unknown_28:	&

unknown_29:

unknown_30

unknown_31:	

unknown_32:	

unknown_33:	%

unknown_34:

unknown_35

unknown_36:	

unknown_37:	

unknown_38:	&

unknown_39:

unknown_40

unknown_41:	

unknown_42:	

unknown_43:	%

unknown_44:

unknown_45

unknown_46:	

unknown_47:	

unknown_48:	&

unknown_49:

unknown_50

unknown_51:	

unknown_52:	

unknown_53:	%

unknown_54:

unknown_55

unknown_56:	

unknown_57:	

unknown_58:	&

unknown_59:

unknown_60

unknown_61:	

unknown_62:	

unknown_63:	

unknown_64:	


unknown_65:

identity˘StatefulPartitionedCallÁ	
StatefulPartitionedCallStatefulPartitionedCallinput_7unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
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
:˙˙˙˙˙˙˙˙˙
*>
_read_only_resource_inputs 
!$&)+.0358:=?BC*0
config_proto 

CPU

GPU2*0J 8 *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086125o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
!
_user_specified_name	input_7: 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
À	
Î
:__inference_layer7/depthwise_conv/bn_layer_call_fn_2088637

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084972
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085064

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088428

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088684

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ú
ß=
 __inference__traced_save_2089201
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
Csavev2_layer7_pointwise_conv_bn_moving_variance_read_readvariableop-
)savev2_dense_6_kernel_read_readvariableop+
'savev2_dense_6_bias_read_readvariableop(
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
?savev2_adam_layer7_pointwise_conv_bn_beta_m_read_readvariableop4
0savev2_adam_dense_6_kernel_m_read_readvariableop2
.savev2_adam_dense_6_bias_m_read_readvariableop8
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
?savev2_adam_layer7_pointwise_conv_bn_beta_v_read_readvariableop4
0savev2_adam_dense_6_kernel_v_read_readvariableop2
.savev2_adam_dense_6_bias_v_read_readvariableop
savev2_const_13

identity_1˘MergeV2Checkpointsw
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
_temp/part
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
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ÓC
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*üB
valueòBBïBxB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-1/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-1/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-2/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-6/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-7/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-7/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-10/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-11/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-11/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-11/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-12/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-13/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-13/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-13/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-14/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-15/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-15/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-15/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-16/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-17/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-17/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-17/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-18/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-19/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-19/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-19/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-20/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-21/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-21/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-21/moving_variance/.ATTRIBUTES/VARIABLE_VALUEBAlayer_with_weights-22/depthwise_kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-23/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-23/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-23/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-24/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-25/beta/.ATTRIBUTES/VARIABLE_VALUEB<layer_with_weights-25/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB@layer_with_weights-25/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-26/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-26/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-2/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB\layer_with_weights-6/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-10/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-11/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-12/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-13/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-14/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-15/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-16/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-17/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-18/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-19/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-20/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-21/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB]layer_with_weights-22/depthwise_kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-23/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-24/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-25/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-26/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-26/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHà
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:x*
dtype0*
valueûBĝxB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ?;
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0-savev2_layer1_conv_kernel_read_readvariableop.savev2_layer1_conv_bn_beta_read_readvariableop5savev2_layer1_conv_bn_moving_mean_read_readvariableop9savev2_layer1_conv_bn_moving_variance_read_readvariableopAsavev2_layer2_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer2_depthwise_conv_bn_beta_read_readvariableop?savev2_layer2_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer2_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer2_pointwise_conv_kernel_read_readvariableop8savev2_layer2_pointwise_conv_bn_beta_read_readvariableop?savev2_layer2_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer2_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer3_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer3_depthwise_conv_bn_beta_read_readvariableop?savev2_layer3_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer3_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer3_pointwise_conv_kernel_read_readvariableop8savev2_layer3_pointwise_conv_bn_beta_read_readvariableop?savev2_layer3_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer3_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer4_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer4_depthwise_conv_bn_beta_read_readvariableop?savev2_layer4_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer4_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer4_pointwise_conv_kernel_read_readvariableop8savev2_layer4_pointwise_conv_bn_beta_read_readvariableop?savev2_layer4_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer4_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer5_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer5_depthwise_conv_bn_beta_read_readvariableop?savev2_layer5_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer5_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer5_pointwise_conv_kernel_read_readvariableop8savev2_layer5_pointwise_conv_bn_beta_read_readvariableop?savev2_layer5_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer5_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer6_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer6_depthwise_conv_bn_beta_read_readvariableop?savev2_layer6_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer6_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer6_pointwise_conv_kernel_read_readvariableop8savev2_layer6_pointwise_conv_bn_beta_read_readvariableop?savev2_layer6_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer6_pointwise_conv_bn_moving_variance_read_readvariableopAsavev2_layer7_depthwise_conv_depthwise_kernel_read_readvariableop8savev2_layer7_depthwise_conv_bn_beta_read_readvariableop?savev2_layer7_depthwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer7_depthwise_conv_bn_moving_variance_read_readvariableop7savev2_layer7_pointwise_conv_kernel_read_readvariableop8savev2_layer7_pointwise_conv_bn_beta_read_readvariableop?savev2_layer7_pointwise_conv_bn_moving_mean_read_readvariableopCsavev2_layer7_pointwise_conv_bn_moving_variance_read_readvariableop)savev2_dense_6_kernel_read_readvariableop'savev2_dense_6_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop4savev2_adam_layer1_conv_kernel_m_read_readvariableop5savev2_adam_layer1_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer2_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer2_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer2_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer2_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer3_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer3_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer3_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer3_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer4_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer4_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer4_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer4_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer5_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer5_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer5_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer5_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer6_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer6_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer6_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer6_pointwise_conv_bn_beta_m_read_readvariableopHsavev2_adam_layer7_depthwise_conv_depthwise_kernel_m_read_readvariableop?savev2_adam_layer7_depthwise_conv_bn_beta_m_read_readvariableop>savev2_adam_layer7_pointwise_conv_kernel_m_read_readvariableop?savev2_adam_layer7_pointwise_conv_bn_beta_m_read_readvariableop0savev2_adam_dense_6_kernel_m_read_readvariableop.savev2_adam_dense_6_bias_m_read_readvariableop4savev2_adam_layer1_conv_kernel_v_read_readvariableop5savev2_adam_layer1_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer2_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer2_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer2_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer2_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer3_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer3_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer3_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer3_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer4_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer4_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer4_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer4_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer5_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer5_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer5_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer5_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer6_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer6_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer6_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer6_pointwise_conv_bn_beta_v_read_readvariableopHsavev2_adam_layer7_depthwise_conv_depthwise_kernel_v_read_readvariableop?savev2_adam_layer7_depthwise_conv_bn_beta_v_read_readvariableop>savev2_adam_layer7_pointwise_conv_kernel_v_read_readvariableop?savev2_adam_layer7_pointwise_conv_bn_beta_v_read_readvariableop0savev2_adam_dense_6_kernel_v_read_readvariableop.savev2_adam_dense_6_bias_v_read_readvariableopsavev2_const_13"/device:CPU:0*
_output_shapes
 *
dtypes|
z2x	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
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

identity_1Identity_1:output:0*ö	
_input_shapesä	
á	: : : : : : : : : : @:@:@:@:@:@:@:@:@::::::::::::::::::::::::::::::::::::	
:
: : : : : : : : : : : : : : @:@:@:@:@::::::::::::::::::	
:
: : : : : @:@:@:@:@::::::::::::::::::	
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
:@:!

_output_shapes	
::!

_output_shapes	
::!

_output_shapes	
::-)
'
_output_shapes
::!

_output_shapes	
::!

_output_shapes	
::!

_output_shapes	
::.*
(
_output_shapes
::!

_output_shapes	
::!

_output_shapes	
::!

_output_shapes	
::-)
'
_output_shapes
::!

_output_shapes	
::!

_output_shapes	
::! 

_output_shapes	
::.!*
(
_output_shapes
::!"

_output_shapes	
::!#

_output_shapes	
::!$

_output_shapes	
::-%)
'
_output_shapes
::!&

_output_shapes	
::!'

_output_shapes	
::!(

_output_shapes	
::.)*
(
_output_shapes
::!*

_output_shapes	
::!+

_output_shapes	
::!,

_output_shapes	
::--)
'
_output_shapes
::!.

_output_shapes	
::!/

_output_shapes	
::!0

_output_shapes	
::.1*
(
_output_shapes
::!2

_output_shapes	
::!3

_output_shapes	
::!4

_output_shapes	
::%5!

_output_shapes
:	
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
:@:!I

_output_shapes	
::-J)
'
_output_shapes
::!K

_output_shapes	
::.L*
(
_output_shapes
::!M

_output_shapes	
::-N)
'
_output_shapes
::!O

_output_shapes	
::.P*
(
_output_shapes
::!Q

_output_shapes	
::-R)
'
_output_shapes
::!S

_output_shapes	
::.T*
(
_output_shapes
::!U

_output_shapes	
::-V)
'
_output_shapes
::!W

_output_shapes	
::.X*
(
_output_shapes
::!Y

_output_shapes	
::%Z!

_output_shapes
:	
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
:@:!e

_output_shapes	
::-f)
'
_output_shapes
::!g

_output_shapes	
::.h*
(
_output_shapes
::!i

_output_shapes	
::-j)
'
_output_shapes
::!k

_output_shapes	
::.l*
(
_output_shapes
::!m

_output_shapes	
::-n)
'
_output_shapes
::!o

_output_shapes	
::.p*
(
_output_shapes
::!q

_output_shapes	
::-r)
'
_output_shapes
::!s

_output_shapes	
::.t*
(
_output_shapes
::!u

_output_shapes	
::%v!

_output_shapes
:	
: w

_output_shapes
:
:x

_output_shapes
: 


U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084444

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
È
I
-__inference_layer1/relu_layer_call_fn_2087753

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
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2085120h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0  :W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
²!
?
/__inference_yamnet_frames_layer_call_fn_2086904

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

unknown_19:@

unknown_20

unknown_21:	

unknown_22:	

unknown_23:	%

unknown_24:

unknown_25

unknown_26:	

unknown_27:	

unknown_28:	&

unknown_29:

unknown_30

unknown_31:	

unknown_32:	

unknown_33:	%

unknown_34:

unknown_35

unknown_36:	

unknown_37:	

unknown_38:	&

unknown_39:

unknown_40

unknown_41:	

unknown_42:	

unknown_43:	%

unknown_44:

unknown_45

unknown_46:	

unknown_47:	

unknown_48:	&

unknown_49:

unknown_50

unknown_51:	

unknown_52:	

unknown_53:	%

unknown_54:

unknown_55

unknown_56:	

unknown_57:	

unknown_58:	&

unknown_59:

unknown_60

unknown_61:	

unknown_62:	

unknown_63:	

unknown_64:	


unknown_65:

identity˘StatefulPartitionedCallÚ	
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
:˙˙˙˙˙˙˙˙˙
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8 *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2085476o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
ì
d
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2087758

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0  :W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
·	
Ë
:__inference_layer2/pointwise_conv/bn_layer_call_fn_2087871

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity˘StatefulPartitionedCall 
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084414
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
ĉ
X
<__inference_layer3/depthwise_conv/relu_layer_call_fn_2088009

inputs
identityÍ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085205h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙@:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
°
Ä
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2088028

inputs9
conv2d_readvariableop_resource:@
identity˘Conv2D/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:@*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs

ò
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088157

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´	
Ê
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2085243

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084538

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
û
s
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088014

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙@:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs

ò
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084972

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
s
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088354

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088184

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
´	
Ê
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2088284

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088411

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ê
X
<__inference_layer4/depthwise_conv/relu_layer_call_fn_2088179

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085261i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085400

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
·	
Ë
:__inference_layer3/depthwise_conv/bn_layer_call_fn_2087957

inputs
unknown
	unknown_0:@
	unknown_1:@
	unknown_2:@
identity˘StatefulPartitionedCall 
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084476
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
˙
ï
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084414

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@

ò
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088581

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:

X
<__inference_global_average_pooling2d_6_layer_call_fn_2088783

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2085085i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:r n
J
_output_shapes8
6:4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
´
Ċ
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2088708

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088268

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
!
?
/__inference_yamnet_frames_layer_call_fn_2087043

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

unknown_19:@

unknown_20

unknown_21:	

unknown_22:	

unknown_23:	%

unknown_24:

unknown_25

unknown_26:	

unknown_27:	

unknown_28:	&

unknown_29:

unknown_30

unknown_31:	

unknown_32:	

unknown_33:	%

unknown_34:

unknown_35

unknown_36:	

unknown_37:	

unknown_38:	&

unknown_39:

unknown_40

unknown_41:	

unknown_42:	

unknown_43:	%

unknown_44:

unknown_45

unknown_46:	

unknown_47:	

unknown_48:	&

unknown_49:

unknown_50

unknown_51:	

unknown_52:	

unknown_53:	%

unknown_54:

unknown_55

unknown_56:	

unknown_57:	

unknown_58:	&

unknown_59:

unknown_60

unknown_61:	

unknown_62:	

unknown_63:	

unknown_64:	


unknown_65:

identity˘StatefulPartitionedCallÀ	
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
:˙˙˙˙˙˙˙˙˙
*>
_read_only_resource_inputs 
!$&)+.0358:=?BC*0
config_proto 

CPU

GPU2*0J 8 *S
fNRL
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086125o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
Ë	
ö
D__inference_dense_6_layer_call_and_return_conditional_losses_2088808

inputs1
matmul_readvariableop_resource:	
-
biasadd_readvariableop_resource:

identity˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
?	
É
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2085187

inputs;
!depthwise_readvariableop_resource:@
identity˘depthwise/ReadVariableOp
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
:˙˙˙˙˙˙˙˙˙@*
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0 @: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @
 
_user_specified_nameinputs
˙
s
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088694

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084878

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´
Ċ
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2085438

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085288

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088768

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ê
X
<__inference_layer3/pointwise_conv/relu_layer_call_fn_2088093

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085232i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085317

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
À	
Î
:__inference_layer5/pointwise_conv/bn_layer_call_fn_2088381

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084786
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´
Ċ
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2085326

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
û
s
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2087844

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0  :W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
Ĵ
?
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2085158

inputs8
conv2d_readvariableop_resource: @
identity˘Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0  : 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
´
Ċ
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2085382

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ë	
ö
D__inference_dense_6_layer_call_and_return_conditional_losses_2085469

inputs1
matmul_readvariableop_resource:	
-
biasadd_readvariableop_resource:

identity˘BiasAdd/ReadVariableOp˘MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:˙˙˙˙˙˙˙˙˙: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084630

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
Óà
Û#
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086759
input_7-
layer1_conv_2086583: 
layer1_conv_bn_2086586$
layer1_conv_bn_2086588: $
layer1_conv_bn_2086590: $
layer1_conv_bn_2086592: 7
layer2_depthwise_conv_2086596: $
 layer2_depthwise_conv_bn_2086599.
 layer2_depthwise_conv_bn_2086601: .
 layer2_depthwise_conv_bn_2086603: .
 layer2_depthwise_conv_bn_2086605: 7
layer2_pointwise_conv_2086609: @$
 layer2_pointwise_conv_bn_2086612.
 layer2_pointwise_conv_bn_2086614:@.
 layer2_pointwise_conv_bn_2086616:@.
 layer2_pointwise_conv_bn_2086618:@7
layer3_depthwise_conv_2086622:@$
 layer3_depthwise_conv_bn_2086625.
 layer3_depthwise_conv_bn_2086627:@.
 layer3_depthwise_conv_bn_2086629:@.
 layer3_depthwise_conv_bn_2086631:@8
layer3_pointwise_conv_2086635:@$
 layer3_pointwise_conv_bn_2086638/
 layer3_pointwise_conv_bn_2086640:	/
 layer3_pointwise_conv_bn_2086642:	/
 layer3_pointwise_conv_bn_2086644:	8
layer4_depthwise_conv_2086648:$
 layer4_depthwise_conv_bn_2086651/
 layer4_depthwise_conv_bn_2086653:	/
 layer4_depthwise_conv_bn_2086655:	/
 layer4_depthwise_conv_bn_2086657:	9
layer4_pointwise_conv_2086661:$
 layer4_pointwise_conv_bn_2086664/
 layer4_pointwise_conv_bn_2086666:	/
 layer4_pointwise_conv_bn_2086668:	/
 layer4_pointwise_conv_bn_2086670:	8
layer5_depthwise_conv_2086674:$
 layer5_depthwise_conv_bn_2086677/
 layer5_depthwise_conv_bn_2086679:	/
 layer5_depthwise_conv_bn_2086681:	/
 layer5_depthwise_conv_bn_2086683:	9
layer5_pointwise_conv_2086687:$
 layer5_pointwise_conv_bn_2086690/
 layer5_pointwise_conv_bn_2086692:	/
 layer5_pointwise_conv_bn_2086694:	/
 layer5_pointwise_conv_bn_2086696:	8
layer6_depthwise_conv_2086700:$
 layer6_depthwise_conv_bn_2086703/
 layer6_depthwise_conv_bn_2086705:	/
 layer6_depthwise_conv_bn_2086707:	/
 layer6_depthwise_conv_bn_2086709:	9
layer6_pointwise_conv_2086713:$
 layer6_pointwise_conv_bn_2086716/
 layer6_pointwise_conv_bn_2086718:	/
 layer6_pointwise_conv_bn_2086720:	/
 layer6_pointwise_conv_bn_2086722:	8
layer7_depthwise_conv_2086726:$
 layer7_depthwise_conv_bn_2086729/
 layer7_depthwise_conv_bn_2086731:	/
 layer7_depthwise_conv_bn_2086733:	/
 layer7_depthwise_conv_bn_2086735:	9
layer7_pointwise_conv_2086739:$
 layer7_pointwise_conv_bn_2086742/
 layer7_pointwise_conv_bn_2086744:	/
 layer7_pointwise_conv_bn_2086746:	/
 layer7_pointwise_conv_bn_2086748:	"
dense_6_2086753:	

dense_6_2086755:

identity˘dense_6/StatefulPartitionedCall˘#layer1/conv/StatefulPartitionedCall˘&layer1/conv/bn/StatefulPartitionedCall˘-layer2/depthwise_conv/StatefulPartitionedCall˘0layer2/depthwise_conv/bn/StatefulPartitionedCall˘-layer2/pointwise_conv/StatefulPartitionedCall˘0layer2/pointwise_conv/bn/StatefulPartitionedCall˘-layer3/depthwise_conv/StatefulPartitionedCall˘0layer3/depthwise_conv/bn/StatefulPartitionedCall˘-layer3/pointwise_conv/StatefulPartitionedCall˘0layer3/pointwise_conv/bn/StatefulPartitionedCall˘-layer4/depthwise_conv/StatefulPartitionedCall˘0layer4/depthwise_conv/bn/StatefulPartitionedCall˘-layer4/pointwise_conv/StatefulPartitionedCall˘0layer4/pointwise_conv/bn/StatefulPartitionedCall˘-layer5/depthwise_conv/StatefulPartitionedCall˘0layer5/depthwise_conv/bn/StatefulPartitionedCall˘-layer5/pointwise_conv/StatefulPartitionedCall˘0layer5/pointwise_conv/bn/StatefulPartitionedCall˘-layer6/depthwise_conv/StatefulPartitionedCall˘0layer6/depthwise_conv/bn/StatefulPartitionedCall˘-layer6/pointwise_conv/StatefulPartitionedCall˘0layer6/pointwise_conv/bn/StatefulPartitionedCall˘-layer7/depthwise_conv/StatefulPartitionedCall˘0layer7/depthwise_conv/bn/StatefulPartitionedCall˘-layer7/pointwise_conv/StatefulPartitionedCall˘0layer7/pointwise_conv/bn/StatefulPartitionedCallô
#layer1/conv/StatefulPartitionedCallStatefulPartitionedCallinput_7layer1_conv_2086583*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2085102í
&layer1/conv/bn/StatefulPartitionedCallStatefulPartitionedCall,layer1/conv/StatefulPartitionedCall:output:0layer1_conv_bn_2086586layer1_conv_bn_2086588layer1_conv_bn_2086590layer1_conv_bn_2086592*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084320ó
layer1/relu/PartitionedCallPartitionedCall/layer1/conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2085120Ż
-layer2/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall$layer1/relu/PartitionedCall:output:0layer2_depthwise_conv_2086596*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2085131³
0layer2/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/depthwise_conv/StatefulPartitionedCall:output:0 layer2_depthwise_conv_bn_2086599 layer2_depthwise_conv_bn_2086601 layer2_depthwise_conv_bn_2086603 layer2_depthwise_conv_bn_2086605*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084382
*layer2/depthwise_conv/relu/PartitionedCallPartitionedCall9layer2/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085149?
-layer2/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/depthwise_conv/relu/PartitionedCall:output:0layer2_pointwise_conv_2086609*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2085158³
0layer2/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer2/pointwise_conv/StatefulPartitionedCall:output:0 layer2_pointwise_conv_bn_2086612 layer2_pointwise_conv_bn_2086614 layer2_pointwise_conv_bn_2086616 layer2_pointwise_conv_bn_2086618*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084444
*layer2/pointwise_conv/relu/PartitionedCallPartitionedCall9layer2/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085176?
-layer3/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer2/pointwise_conv/relu/PartitionedCall:output:0layer3_depthwise_conv_2086622*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2085187³
0layer3/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/depthwise_conv/StatefulPartitionedCall:output:0 layer3_depthwise_conv_bn_2086625 layer3_depthwise_conv_bn_2086627 layer3_depthwise_conv_bn_2086629 layer3_depthwise_conv_bn_2086631*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084506
*layer3/depthwise_conv/relu/PartitionedCallPartitionedCall9layer3/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085205ż
-layer3/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/depthwise_conv/relu/PartitionedCall:output:0layer3_pointwise_conv_2086635*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2085214´
0layer3/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer3/pointwise_conv/StatefulPartitionedCall:output:0 layer3_pointwise_conv_bn_2086638 layer3_pointwise_conv_bn_2086640 layer3_pointwise_conv_bn_2086642 layer3_pointwise_conv_bn_2086644*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084568
*layer3/pointwise_conv/relu/PartitionedCallPartitionedCall9layer3/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085232ż
-layer4/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer3/pointwise_conv/relu/PartitionedCall:output:0layer4_depthwise_conv_2086648*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2085243´
0layer4/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/depthwise_conv/StatefulPartitionedCall:output:0 layer4_depthwise_conv_bn_2086651 layer4_depthwise_conv_bn_2086653 layer4_depthwise_conv_bn_2086655 layer4_depthwise_conv_bn_2086657*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084630
*layer4/depthwise_conv/relu/PartitionedCallPartitionedCall9layer4/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085261ż
-layer4/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/depthwise_conv/relu/PartitionedCall:output:0layer4_pointwise_conv_2086661*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2085270´
0layer4/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer4/pointwise_conv/StatefulPartitionedCall:output:0 layer4_pointwise_conv_bn_2086664 layer4_pointwise_conv_bn_2086666 layer4_pointwise_conv_bn_2086668 layer4_pointwise_conv_bn_2086670*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084692
*layer4/pointwise_conv/relu/PartitionedCallPartitionedCall9layer4/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085288ż
-layer5/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer4/pointwise_conv/relu/PartitionedCall:output:0layer5_depthwise_conv_2086674*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2085299´
0layer5/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/depthwise_conv/StatefulPartitionedCall:output:0 layer5_depthwise_conv_bn_2086677 layer5_depthwise_conv_bn_2086679 layer5_depthwise_conv_bn_2086681 layer5_depthwise_conv_bn_2086683*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084754
*layer5/depthwise_conv/relu/PartitionedCallPartitionedCall9layer5/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085317ż
-layer5/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/depthwise_conv/relu/PartitionedCall:output:0layer5_pointwise_conv_2086687*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2085326´
0layer5/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer5/pointwise_conv/StatefulPartitionedCall:output:0 layer5_pointwise_conv_bn_2086690 layer5_pointwise_conv_bn_2086692 layer5_pointwise_conv_bn_2086694 layer5_pointwise_conv_bn_2086696*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084816
*layer5/pointwise_conv/relu/PartitionedCallPartitionedCall9layer5/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085344ż
-layer6/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer5/pointwise_conv/relu/PartitionedCall:output:0layer6_depthwise_conv_2086700*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2085355´
0layer6/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/depthwise_conv/StatefulPartitionedCall:output:0 layer6_depthwise_conv_bn_2086703 layer6_depthwise_conv_bn_2086705 layer6_depthwise_conv_bn_2086707 layer6_depthwise_conv_bn_2086709*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084878
*layer6/depthwise_conv/relu/PartitionedCallPartitionedCall9layer6/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085373ż
-layer6/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/depthwise_conv/relu/PartitionedCall:output:0layer6_pointwise_conv_2086713*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2085382´
0layer6/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer6/pointwise_conv/StatefulPartitionedCall:output:0 layer6_pointwise_conv_bn_2086716 layer6_pointwise_conv_bn_2086718 layer6_pointwise_conv_bn_2086720 layer6_pointwise_conv_bn_2086722*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084940
*layer6/pointwise_conv/relu/PartitionedCallPartitionedCall9layer6/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085400ż
-layer7/depthwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer6/pointwise_conv/relu/PartitionedCall:output:0layer7_depthwise_conv_2086726*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2085411´
0layer7/depthwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/depthwise_conv/StatefulPartitionedCall:output:0 layer7_depthwise_conv_bn_2086729 layer7_depthwise_conv_bn_2086731 layer7_depthwise_conv_bn_2086733 layer7_depthwise_conv_bn_2086735*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2085002
*layer7/depthwise_conv/relu/PartitionedCallPartitionedCall9layer7/depthwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085429ż
-layer7/pointwise_conv/StatefulPartitionedCallStatefulPartitionedCall3layer7/depthwise_conv/relu/PartitionedCall:output:0layer7_pointwise_conv_2086739*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2085438´
0layer7/pointwise_conv/bn/StatefulPartitionedCallStatefulPartitionedCall6layer7/pointwise_conv/StatefulPartitionedCall:output:0 layer7_pointwise_conv_bn_2086742 layer7_pointwise_conv_bn_2086744 layer7_pointwise_conv_bn_2086746 layer7_pointwise_conv_bn_2086748*
Tin	
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085064
*layer7/pointwise_conv/relu/PartitionedCallPartitionedCall9layer7/pointwise_conv/bn/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085456
*global_average_pooling2d_6/PartitionedCallPartitionedCall3layer7/pointwise_conv/relu/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2085085
dense_6/StatefulPartitionedCallStatefulPartitionedCall3global_average_pooling2d_6/PartitionedCall:output:0dense_6_2086753dense_6_2086755*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_dense_6_layer_call_and_return_conditional_losses_2085469w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Û

NoOpNoOp ^dense_6/StatefulPartitionedCall$^layer1/conv/StatefulPartitionedCall'^layer1/conv/bn/StatefulPartitionedCall.^layer2/depthwise_conv/StatefulPartitionedCall1^layer2/depthwise_conv/bn/StatefulPartitionedCall.^layer2/pointwise_conv/StatefulPartitionedCall1^layer2/pointwise_conv/bn/StatefulPartitionedCall.^layer3/depthwise_conv/StatefulPartitionedCall1^layer3/depthwise_conv/bn/StatefulPartitionedCall.^layer3/pointwise_conv/StatefulPartitionedCall1^layer3/pointwise_conv/bn/StatefulPartitionedCall.^layer4/depthwise_conv/StatefulPartitionedCall1^layer4/depthwise_conv/bn/StatefulPartitionedCall.^layer4/pointwise_conv/StatefulPartitionedCall1^layer4/pointwise_conv/bn/StatefulPartitionedCall.^layer5/depthwise_conv/StatefulPartitionedCall1^layer5/depthwise_conv/bn/StatefulPartitionedCall.^layer5/pointwise_conv/StatefulPartitionedCall1^layer5/pointwise_conv/bn/StatefulPartitionedCall.^layer6/depthwise_conv/StatefulPartitionedCall1^layer6/depthwise_conv/bn/StatefulPartitionedCall.^layer6/pointwise_conv/StatefulPartitionedCall1^layer6/pointwise_conv/bn/StatefulPartitionedCall.^layer7/depthwise_conv/StatefulPartitionedCall1^layer7/depthwise_conv/bn/StatefulPartitionedCall.^layer7/pointwise_conv/StatefulPartitionedCall1^layer7/pointwise_conv/bn/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2J
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
:˙˙˙˙˙˙˙˙˙`@
!
_user_specified_name	input_7: 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:


U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088514

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
À	
Î
:__inference_layer4/pointwise_conv/bn_layer_call_fn_2088211

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084662
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2087748

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
µ	
Ë
:__inference_layer2/depthwise_conv/bn_layer_call_fn_2087800

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084382
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
ĉ

7__inference_layer6/depthwise_conv_layer_call_fn_2088445

inputs"
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2085355x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088751

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084382

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 


U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2087918

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
´
Ċ
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2088198

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ġ
ċ
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2087731

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
ä

7__inference_layer3/pointwise_conv_layer_call_fn_2088021

inputs"
unknown:@
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2085214x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙@: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
ê
X
<__inference_layer7/depthwise_conv/relu_layer_call_fn_2088689

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085429i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
û
s
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085205

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙@:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs
ġ
ċ
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084290

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 
˙
s
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085373

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
û
s
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085176

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0 @:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @
 
_user_specified_nameinputs
ĉ

7__inference_layer4/depthwise_conv_layer_call_fn_2088105

inputs"
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2085243x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
?	
É
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2085131

inputs;
!depthwise_readvariableop_resource: 
identity˘depthwise/ReadVariableOp
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
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0  : 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  
 
_user_specified_nameinputs
´	
Ê
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2085299

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0h
depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            h
depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
ï
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084476

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@

ò
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085034

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ê
X
<__inference_layer6/depthwise_conv/relu_layer_call_fn_2088519

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085373i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088071

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
!
ç
%__inference_signature_wrapper_2087674
input_7!
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

unknown_19:@

unknown_20

unknown_21:	

unknown_22:	

unknown_23:	%

unknown_24:

unknown_25

unknown_26:	

unknown_27:	

unknown_28:	&

unknown_29:

unknown_30

unknown_31:	

unknown_32:	

unknown_33:	%

unknown_34:

unknown_35

unknown_36:	

unknown_37:	

unknown_38:	&

unknown_39:

unknown_40

unknown_41:	

unknown_42:	

unknown_43:	%

unknown_44:

unknown_45

unknown_46:	

unknown_47:	

unknown_48:	&

unknown_49:

unknown_50

unknown_51:	

unknown_52:	

unknown_53:	%

unknown_54:

unknown_55

unknown_56:	

unknown_57:	

unknown_58:	&

unknown_59:

unknown_60

unknown_61:	

unknown_62:	

unknown_63:	

unknown_64:	


unknown_65:

identity˘StatefulPartitionedCall³	
StatefulPartitionedCallStatefulPartitionedCallinput_7unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
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
:˙˙˙˙˙˙˙˙˙
*X
_read_only_resource_inputs:
86	
!"#$&'()+,-.01235678:;<=?@ABC*0
config_proto 

CPU

GPU2*0J 8 *+
f&R$
"__inference__wrapped_model_2084269o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
!
_user_specified_name	input_7: 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:
À	
Î
:__inference_layer6/depthwise_conv/bn_layer_call_fn_2088467

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084848
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
?	
Î
:__inference_layer4/depthwise_conv/bn_layer_call_fn_2088140

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084630
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
ï
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2087901

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
¸
s
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2088789

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
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙^
IdentityIdentityMean:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:r n
J
_output_shapes8
6:4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
À	
Î
:__inference_layer7/pointwise_conv/bn_layer_call_fn_2088721

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2085034
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
?	
Î
:__inference_layer4/pointwise_conv/bn_layer_call_fn_2088224

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084692
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:

ò
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088497

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
s
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085232

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ç

7__inference_layer5/pointwise_conv_layer_call_fn_2088361

inputs#
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2085326x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
?	
Î
:__inference_layer7/depthwise_conv/bn_layer_call_fn_2088650

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2085002
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
ï
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084352

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 


U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084506

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
ĉ
X
<__inference_layer2/pointwise_conv/relu_layer_call_fn_2087923

inputs
identityÍ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085176h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:˙˙˙˙˙˙˙˙˙0 @:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @
 
_user_specified_nameinputs
ê
X
<__inference_layer5/pointwise_conv/relu_layer_call_fn_2088433

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085344i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
Ó
àB
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2087533

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
4layer3_pointwise_conv_conv2d_readvariableop_resource:@"
layer3_pointwise_conv_bn_scale?
0layer3_pointwise_conv_bn_readvariableop_resource:	P
Alayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer4_depthwise_conv_depthwise_readvariableop_resource:"
layer4_depthwise_conv_bn_scale?
0layer4_depthwise_conv_bn_readvariableop_resource:	P
Alayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer4_pointwise_conv_conv2d_readvariableop_resource:"
layer4_pointwise_conv_bn_scale?
0layer4_pointwise_conv_bn_readvariableop_resource:	P
Alayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer5_depthwise_conv_depthwise_readvariableop_resource:"
layer5_depthwise_conv_bn_scale?
0layer5_depthwise_conv_bn_readvariableop_resource:	P
Alayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer5_pointwise_conv_conv2d_readvariableop_resource:"
layer5_pointwise_conv_bn_scale?
0layer5_pointwise_conv_bn_readvariableop_resource:	P
Alayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer6_depthwise_conv_depthwise_readvariableop_resource:"
layer6_depthwise_conv_bn_scale?
0layer6_depthwise_conv_bn_readvariableop_resource:	P
Alayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer6_pointwise_conv_conv2d_readvariableop_resource:"
layer6_pointwise_conv_bn_scale?
0layer6_pointwise_conv_bn_readvariableop_resource:	P
Alayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	R
7layer7_depthwise_conv_depthwise_readvariableop_resource:"
layer7_depthwise_conv_bn_scale?
0layer7_depthwise_conv_bn_readvariableop_resource:	P
Alayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	P
4layer7_pointwise_conv_conv2d_readvariableop_resource:"
layer7_pointwise_conv_bn_scale?
0layer7_pointwise_conv_bn_readvariableop_resource:	P
Alayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource:	R
Clayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:	9
&dense_6_matmul_readvariableop_resource:	
5
'dense_6_biasadd_readvariableop_resource:

identity˘dense_6/BiasAdd/ReadVariableOp˘dense_6/MatMul/ReadVariableOp˘!layer1/conv/Conv2D/ReadVariableOp˘layer1/conv/bn/AssignNewValue˘layer1/conv/bn/AssignNewValue_1˘.layer1/conv/bn/FusedBatchNormV3/ReadVariableOp˘0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1˘layer1/conv/bn/ReadVariableOp˘'layer2/depthwise_conv/bn/AssignNewValue˘)layer2/depthwise_conv/bn/AssignNewValue_1˘8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer2/depthwise_conv/bn/ReadVariableOp˘.layer2/depthwise_conv/depthwise/ReadVariableOp˘+layer2/pointwise_conv/Conv2D/ReadVariableOp˘'layer2/pointwise_conv/bn/AssignNewValue˘)layer2/pointwise_conv/bn/AssignNewValue_1˘8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer2/pointwise_conv/bn/ReadVariableOp˘'layer3/depthwise_conv/bn/AssignNewValue˘)layer3/depthwise_conv/bn/AssignNewValue_1˘8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer3/depthwise_conv/bn/ReadVariableOp˘.layer3/depthwise_conv/depthwise/ReadVariableOp˘+layer3/pointwise_conv/Conv2D/ReadVariableOp˘'layer3/pointwise_conv/bn/AssignNewValue˘)layer3/pointwise_conv/bn/AssignNewValue_1˘8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer3/pointwise_conv/bn/ReadVariableOp˘'layer4/depthwise_conv/bn/AssignNewValue˘)layer4/depthwise_conv/bn/AssignNewValue_1˘8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer4/depthwise_conv/bn/ReadVariableOp˘.layer4/depthwise_conv/depthwise/ReadVariableOp˘+layer4/pointwise_conv/Conv2D/ReadVariableOp˘'layer4/pointwise_conv/bn/AssignNewValue˘)layer4/pointwise_conv/bn/AssignNewValue_1˘8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer4/pointwise_conv/bn/ReadVariableOp˘'layer5/depthwise_conv/bn/AssignNewValue˘)layer5/depthwise_conv/bn/AssignNewValue_1˘8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer5/depthwise_conv/bn/ReadVariableOp˘.layer5/depthwise_conv/depthwise/ReadVariableOp˘+layer5/pointwise_conv/Conv2D/ReadVariableOp˘'layer5/pointwise_conv/bn/AssignNewValue˘)layer5/pointwise_conv/bn/AssignNewValue_1˘8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer5/pointwise_conv/bn/ReadVariableOp˘'layer6/depthwise_conv/bn/AssignNewValue˘)layer6/depthwise_conv/bn/AssignNewValue_1˘8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer6/depthwise_conv/bn/ReadVariableOp˘.layer6/depthwise_conv/depthwise/ReadVariableOp˘+layer6/pointwise_conv/Conv2D/ReadVariableOp˘'layer6/pointwise_conv/bn/AssignNewValue˘)layer6/pointwise_conv/bn/AssignNewValue_1˘8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer6/pointwise_conv/bn/ReadVariableOp˘'layer7/depthwise_conv/bn/AssignNewValue˘)layer7/depthwise_conv/bn/AssignNewValue_1˘8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer7/depthwise_conv/bn/ReadVariableOp˘.layer7/depthwise_conv/depthwise/ReadVariableOp˘+layer7/pointwise_conv/Conv2D/ReadVariableOp˘'layer7/pointwise_conv/bn/AssignNewValue˘)layer7/pointwise_conv/bn/AssignNewValue_1˘8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp˘:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1˘'layer7/pointwise_conv/bn/ReadVariableOp
!layer1/conv/Conv2D/ReadVariableOpReadVariableOp*layer1_conv_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0ħ
layer1/conv/Conv2DConv2Dinputs)layer1/conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides

layer1/conv/bn/ReadVariableOpReadVariableOp&layer1_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0˘
.layer1/conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOp7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0Ĥ
0layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0˙
layer1/conv/bn/FusedBatchNormV3FusedBatchNormV3layer1/conv/Conv2D:output:0layer1_conv_bn_scale%layer1/conv/bn/ReadVariableOp:value:06layer1/conv/bn/FusedBatchNormV3/ReadVariableOp:value:08layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0  : : : : :*
exponential_avg_factor%
×#<ì
layer1/conv/bn/AssignNewValueAssignVariableOp7layer1_conv_bn_fusedbatchnormv3_readvariableop_resource,layer1/conv/bn/FusedBatchNormV3:batch_mean:0/^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ö
layer1/conv/bn/AssignNewValue_1AssignVariableOp9layer1_conv_bn_fusedbatchnormv3_readvariableop_1_resource0layer1/conv/bn/FusedBatchNormV3:batch_variance:01^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0w
layer1/relu/ReluRelu#layer1/conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  ?
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
valueB"      ò
layer2/depthwise_conv/depthwiseDepthwiseConv2dNativelayer1/relu/Relu:activations:06layer2/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides

'layer2/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer2_depthwise_conv_bn_readvariableop_resource*
_output_shapes
: *
dtype0ĥ
8layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0ş
:layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0?
)layer2/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer2/depthwise_conv/depthwise:output:0layer2_depthwise_conv_bn_scale/layer2/depthwise_conv/bn/ReadVariableOp:value:0@layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0  : : : : :*
exponential_avg_factor%
×#<
'layer2/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer2/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer2/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer2_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer2/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer2/depthwise_conv/relu/ReluRelu-layer2/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  ¨
+layer2/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer2_pointwise_conv_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0ì
layer2/pointwise_conv/Conv2DConv2D-layer2/depthwise_conv/relu/Relu:activations:03layer2/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @*
paddingSAME*
strides

'layer2/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer2_pointwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0ĥ
8layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0ş
:layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0ğ
)layer2/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer2/pointwise_conv/Conv2D:output:0layer2_pointwise_conv_bn_scale/layer2/pointwise_conv/bn/ReadVariableOp:value:0@layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙0 @:@:@:@:@:*
exponential_avg_factor%
×#<
'layer2/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer2/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer2/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer2_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer2/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer2/pointwise_conv/relu/ReluRelu-layer2/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @?
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
valueB"      
layer3/depthwise_conv/depthwiseDepthwiseConv2dNative-layer2/pointwise_conv/relu/Relu:activations:06layer3/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
paddingSAME*
strides

'layer3/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer3_depthwise_conv_bn_readvariableop_resource*
_output_shapes
:@*
dtype0ĥ
8layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0ş
:layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0?
)layer3/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer3/depthwise_conv/depthwise:output:0layer3_depthwise_conv_bn_scale/layer3/depthwise_conv/bn/ReadVariableOp:value:0@layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
exponential_avg_factor%
×#<
'layer3/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer3/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer3/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer3_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer3/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer3/depthwise_conv/relu/ReluRelu-layer3/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@İ
+layer3/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer3_pointwise_conv_conv2d_readvariableop_resource*'
_output_shapes
:@*
dtype0í
layer3/pointwise_conv/Conv2DConv2D-layer3/depthwise_conv/relu/Relu:activations:03layer3/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer3/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer3_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0À
)layer3/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer3/pointwise_conv/Conv2D:output:0layer3_pointwise_conv_bn_scale/layer3/pointwise_conv/bn/ReadVariableOp:value:0@layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer3/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer3/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer3/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer3_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer3/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer3/pointwise_conv/relu/ReluRelu-layer3/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer4/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer4_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0~
%layer4/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer4/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      
layer4/depthwise_conv/depthwiseDepthwiseConv2dNative-layer3/pointwise_conv/relu/Relu:activations:06layer4/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer4/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer4_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0?
)layer4/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer4/depthwise_conv/depthwise:output:0layer4_depthwise_conv_bn_scale/layer4/depthwise_conv/bn/ReadVariableOp:value:0@layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer4/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer4/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer4/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer4_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer4/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer4/depthwise_conv/relu/ReluRelu-layer4/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer4/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer4_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer4/pointwise_conv/Conv2DConv2D-layer4/depthwise_conv/relu/Relu:activations:03layer4/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer4/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer4_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0À
)layer4/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer4/pointwise_conv/Conv2D:output:0layer4_pointwise_conv_bn_scale/layer4/pointwise_conv/bn/ReadVariableOp:value:0@layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer4/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer4/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer4/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer4_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer4/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer4/pointwise_conv/relu/ReluRelu-layer4/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer5/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer5_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
dtype0~
%layer5/depthwise_conv/depthwise/ShapeConst*
_output_shapes
:*
dtype0*%
valueB"            ~
-layer5/depthwise_conv/depthwise/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB"      
layer5/depthwise_conv/depthwiseDepthwiseConv2dNative-layer4/pointwise_conv/relu/Relu:activations:06layer5/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer5/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer5_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0?
)layer5/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer5/depthwise_conv/depthwise:output:0layer5_depthwise_conv_bn_scale/layer5/depthwise_conv/bn/ReadVariableOp:value:0@layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer5/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer5/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer5/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer5_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer5/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer5/depthwise_conv/relu/ReluRelu-layer5/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer5/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer5_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer5/pointwise_conv/Conv2DConv2D-layer5/depthwise_conv/relu/Relu:activations:03layer5/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer5/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer5_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0À
)layer5/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer5/pointwise_conv/Conv2D:output:0layer5_pointwise_conv_bn_scale/layer5/pointwise_conv/bn/ReadVariableOp:value:0@layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer5/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer5/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer5/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer5_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer5/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer5/pointwise_conv/relu/ReluRelu-layer5/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer6/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer6_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      
layer6/depthwise_conv/depthwiseDepthwiseConv2dNative-layer5/pointwise_conv/relu/Relu:activations:06layer6/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer6/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer6_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0?
)layer6/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer6/depthwise_conv/depthwise:output:0layer6_depthwise_conv_bn_scale/layer6/depthwise_conv/bn/ReadVariableOp:value:0@layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer6/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer6/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer6/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer6_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer6/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer6/depthwise_conv/relu/ReluRelu-layer6/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer6/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer6_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer6/pointwise_conv/Conv2DConv2D-layer6/depthwise_conv/relu/Relu:activations:03layer6/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer6/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer6_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0À
)layer6/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer6/pointwise_conv/Conv2D:output:0layer6_pointwise_conv_bn_scale/layer6/pointwise_conv/bn/ReadVariableOp:value:0@layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer6/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer6/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer6/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer6_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer6/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer6/pointwise_conv/relu/ReluRelu-layer6/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ż
.layer7/depthwise_conv/depthwise/ReadVariableOpReadVariableOp7layer7_depthwise_conv_depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      
layer7/depthwise_conv/depthwiseDepthwiseConv2dNative-layer6/pointwise_conv/relu/Relu:activations:06layer7/depthwise_conv/depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer7/depthwise_conv/bn/ReadVariableOpReadVariableOp0layer7_depthwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0?
)layer7/depthwise_conv/bn/FusedBatchNormV3FusedBatchNormV3(layer7/depthwise_conv/depthwise:output:0layer7_depthwise_conv_bn_scale/layer7/depthwise_conv/bn/ReadVariableOp:value:0@layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer7/depthwise_conv/bn/AssignNewValueAssignVariableOpAlayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer7/depthwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer7/depthwise_conv/bn/AssignNewValue_1AssignVariableOpClayer7_depthwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer7/depthwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer7/depthwise_conv/relu/ReluRelu-layer7/depthwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙Ş
+layer7/pointwise_conv/Conv2D/ReadVariableOpReadVariableOp4layer7_pointwise_conv_conv2d_readvariableop_resource*(
_output_shapes
:*
dtype0í
layer7/pointwise_conv/Conv2DConv2D-layer7/depthwise_conv/relu/Relu:activations:03layer7/pointwise_conv/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides

'layer7/pointwise_conv/bn/ReadVariableOpReadVariableOp0layer7_pointwise_conv_bn_readvariableop_resource*
_output_shapes	
:*
dtype0·
8layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOpReadVariableOpAlayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0ğ
:layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpClayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0À
)layer7/pointwise_conv/bn/FusedBatchNormV3FusedBatchNormV3%layer7/pointwise_conv/Conv2D:output:0layer7_pointwise_conv_bn_scale/layer7/pointwise_conv/bn/ReadVariableOp:value:0@layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp:value:0Blayer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*P
_output_shapes>
<:˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<
'layer7/pointwise_conv/bn/AssignNewValueAssignVariableOpAlayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_resource6layer7/pointwise_conv/bn/FusedBatchNormV3:batch_mean:09^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0
)layer7/pointwise_conv/bn/AssignNewValue_1AssignVariableOpClayer7_pointwise_conv_bn_fusedbatchnormv3_readvariableop_1_resource:layer7/pointwise_conv/bn/FusedBatchNormV3:batch_variance:0;^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0
layer7/pointwise_conv/relu/ReluRelu-layer7/pointwise_conv/bn/FusedBatchNormV3:y:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙
1global_average_pooling2d_6/Mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB"      Ċ
global_average_pooling2d_6/MeanMean-layer7/pointwise_conv/relu/Relu:activations:0:global_average_pooling2d_6/Mean/reduction_indices:output:0*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes
:	
*
dtype0
dense_6/MatMulMatMul(global_average_pooling2d_6/Mean:output:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
g
IdentityIdentitydense_6/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ë
NoOpNoOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOp"^layer1/conv/Conv2D/ReadVariableOp^layer1/conv/bn/AssignNewValue ^layer1/conv/bn/AssignNewValue_1/^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp1^layer1/conv/bn/FusedBatchNormV3/ReadVariableOp_1^layer1/conv/bn/ReadVariableOp(^layer2/depthwise_conv/bn/AssignNewValue*^layer2/depthwise_conv/bn/AssignNewValue_19^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/depthwise_conv/bn/ReadVariableOp/^layer2/depthwise_conv/depthwise/ReadVariableOp,^layer2/pointwise_conv/Conv2D/ReadVariableOp(^layer2/pointwise_conv/bn/AssignNewValue*^layer2/pointwise_conv/bn/AssignNewValue_19^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer2/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer2/pointwise_conv/bn/ReadVariableOp(^layer3/depthwise_conv/bn/AssignNewValue*^layer3/depthwise_conv/bn/AssignNewValue_19^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/depthwise_conv/bn/ReadVariableOp/^layer3/depthwise_conv/depthwise/ReadVariableOp,^layer3/pointwise_conv/Conv2D/ReadVariableOp(^layer3/pointwise_conv/bn/AssignNewValue*^layer3/pointwise_conv/bn/AssignNewValue_19^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer3/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer3/pointwise_conv/bn/ReadVariableOp(^layer4/depthwise_conv/bn/AssignNewValue*^layer4/depthwise_conv/bn/AssignNewValue_19^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/depthwise_conv/bn/ReadVariableOp/^layer4/depthwise_conv/depthwise/ReadVariableOp,^layer4/pointwise_conv/Conv2D/ReadVariableOp(^layer4/pointwise_conv/bn/AssignNewValue*^layer4/pointwise_conv/bn/AssignNewValue_19^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer4/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer4/pointwise_conv/bn/ReadVariableOp(^layer5/depthwise_conv/bn/AssignNewValue*^layer5/depthwise_conv/bn/AssignNewValue_19^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/depthwise_conv/bn/ReadVariableOp/^layer5/depthwise_conv/depthwise/ReadVariableOp,^layer5/pointwise_conv/Conv2D/ReadVariableOp(^layer5/pointwise_conv/bn/AssignNewValue*^layer5/pointwise_conv/bn/AssignNewValue_19^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer5/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer5/pointwise_conv/bn/ReadVariableOp(^layer6/depthwise_conv/bn/AssignNewValue*^layer6/depthwise_conv/bn/AssignNewValue_19^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/depthwise_conv/bn/ReadVariableOp/^layer6/depthwise_conv/depthwise/ReadVariableOp,^layer6/pointwise_conv/Conv2D/ReadVariableOp(^layer6/pointwise_conv/bn/AssignNewValue*^layer6/pointwise_conv/bn/AssignNewValue_19^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer6/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer6/pointwise_conv/bn/ReadVariableOp(^layer7/depthwise_conv/bn/AssignNewValue*^layer7/depthwise_conv/bn/AssignNewValue_19^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/depthwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/depthwise_conv/bn/ReadVariableOp/^layer7/depthwise_conv/depthwise/ReadVariableOp,^layer7/pointwise_conv/Conv2D/ReadVariableOp(^layer7/pointwise_conv/bn/AssignNewValue*^layer7/pointwise_conv/bn/AssignNewValue_19^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp;^layer7/pointwise_conv/bn/FusedBatchNormV3/ReadVariableOp_1(^layer7/pointwise_conv/bn/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*ó
_input_shapesá
Ŝ:˙˙˙˙˙˙˙˙˙`@: : : : : : : : : : : :@: : : : :@: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : :: : : : : 2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2F
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
:˙˙˙˙˙˙˙˙˙`@
 
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
::!

_output_shapes	
::! 

_output_shapes	
::!%

_output_shapes	
::!*

_output_shapes	
::!/

_output_shapes	
::!4

_output_shapes	
::!9

_output_shapes	
::!>

_output_shapes	
:


U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088174

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
ç

7__inference_layer4/pointwise_conv_layer_call_fn_2088191

inputs#
unknown:
identity˘StatefulPartitionedCallĉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2085270x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ê
X
<__inference_layer4/pointwise_conv/relu_layer_call_fn_2088263

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2085288i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˘
ı
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2087688

inputs8
conv2d_readvariableop_resource: 
identity˘Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙`@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
 
_user_specified_nameinputs
£	
Á
0__inference_layer1/conv/bn_layer_call_fn_2087701

inputs
unknown
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity˘StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ *%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2084290
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 


U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088258

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:

ò
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084662

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
s
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088438

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs

ò
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084910

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:

ò
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088667

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088004

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
À	
Î
:__inference_layer6/pointwise_conv/bn_layer_call_fn_2088551

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084910
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084754

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´
Ċ
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2088368

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
ê
X
<__inference_layer5/depthwise_conv/relu_layer_call_fn_2088349

inputs
identityÎ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:˙˙˙˙˙˙˙˙˙* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *`
f[RY
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085317i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
´	
Ê
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2088624

inputs<
!depthwise_readvariableop_resource:
identity˘depthwise/ReadVariableOp
depthwise/ReadVariableOpReadVariableOp!depthwise_readvariableop_resource*'
_output_shapes
:*
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
valueB"      Ż
	depthwiseDepthwiseConv2dNativeinputs depthwise/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
j
IdentityIdentitydepthwise:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
ï
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087987

inputs	
scale%
readvariableop_resource:@6
(fusedbatchnormv3_readvariableop_resource:@8
*fusedbatchnormv3_readvariableop_1_resource:@
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:@*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:@*
dtype0£
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@:@:@:@:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@:@: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 
_user_specified_nameinputs: 

_output_shapes
:@
˙
s
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088524

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
?	
É
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2087944

inputs;
!depthwise_readvariableop_resource:@
identity˘depthwise/ReadVariableOp
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
:˙˙˙˙˙˙˙˙˙@*
paddingSAME*
strides
i
IdentityIdentitydepthwise:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@a
NoOpNoOp^depthwise/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙0 @: 24
depthwise/ReadVariableOpdepthwise/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙0 @
 
_user_specified_nameinputs
À	
Î
:__inference_layer5/depthwise_conv/bn_layer_call_fn_2088297

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084724
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:


U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088088

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˘
ı
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2085102

inputs8
conv2d_readvariableop_resource: 
identity˘Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *
paddingSAME*
strides
f
IdentityIdentityConv2D:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  ^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙`@: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
 
_user_specified_nameinputs
Í

-__inference_layer1/conv_layer_call_fn_2087681

inputs!
unknown: 
identity˘StatefulPartitionedCallÛ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:˙˙˙˙˙˙˙˙˙0  *#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2085102w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙0  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:˙˙˙˙˙˙˙˙˙`@: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:˙˙˙˙˙˙˙˙˙`@
 
_user_specified_nameinputs
˙
s
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088778

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
À	
Î
:__inference_layer4/depthwise_conv/bn_layer_call_fn_2088127

inputs
unknown
	unknown_0:	
	unknown_1:	
	unknown_2:	
identity˘StatefulPartitionedCallĦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙*%
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *^
fYRW
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2084600
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 22
StatefulPartitionedCallStatefulPartitionedCall:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:

ò
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088241

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0¨
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
is_training( ~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
˙
s
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088608

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs


U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087834

inputs	
scale%
readvariableop_resource: 6
(fusedbatchnormv3_readvariableop_resource: 8
*fusedbatchnormv3_readvariableop_1_resource: 
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpb
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
: *
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
: *
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
: *
dtype0ħ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : :*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*L
_input_shapes;
9:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:i e
A
_output_shapes/
-:+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 
_user_specified_nameinputs: 

_output_shapes
: 


U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2084816

inputs	
scale&
readvariableop_resource:	7
(fusedbatchnormv3_readvariableop_resource:	9
*fusedbatchnormv3_readvariableop_1_resource:	
identity˘AssignNewValue˘AssignNewValue_1˘FusedBatchNormV3/ReadVariableOp˘!FusedBatchNormV3/ReadVariableOp_1˘ReadVariableOpc
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:*
dtype0
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes	
:*
dtype0
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes	
:*
dtype0ĥ
FusedBatchNormV3FusedBatchNormV3inputsscaleReadVariableOp:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*b
_output_shapesP
N:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:::::*
exponential_avg_factor%
×#<°
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0ş
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0~
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Á
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙:: : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp:j f
B
_output_shapes0
.:,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs:!

_output_shapes	
:
´
Ċ
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2088538

inputs:
conv2d_readvariableop_resource:
identity˘Conv2D/ReadVariableOp~
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙*
paddingSAME*
strides
g
IdentityIdentityConv2D:output:0^NoOp*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙^
NoOpNoOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:˙˙˙˙˙˙˙˙˙: 2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs
˙
s
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2085261

inputs
identityO
ReluReluinputs*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙c
IdentityIdentityRelu:activations:0*
T0*0
_output_shapes
:˙˙˙˙˙˙˙˙˙"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:˙˙˙˙˙˙˙˙˙:X T
0
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
_user_specified_nameinputs"ÛL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*²
serving_default
C
input_78
serving_default_input_7:0˙˙˙˙˙˙˙˙˙`@;
dense_60
StatefulPartitionedCall:0˙˙˙˙˙˙˙˙˙
tensorflow/serving/predict:ÛÓ
ô
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
ħ

4kernel
5	variables
6trainable_variables
7regularization_losses
8	keras_api
9__call__
*:&call_and_return_all_conditional_losses"
_tf_keras_layer
ß
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
ğ
Kdepthwise_kernel
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses"
_tf_keras_layer
ß
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
ħ

bkernel
c	variables
dtrainable_variables
eregularization_losses
f	keras_api
g__call__
*h&call_and_return_all_conditional_losses"
_tf_keras_layer
ß
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
ğ
ydepthwise_kernel
z	variables
{trainable_variables
|regularization_losses
}	keras_api
~__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	axis
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
kernel
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	axis
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+ &call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
Ħ	variables
˘trainable_variables
£regularization_losses
¤	keras_api
?__call__
+Ĥ&call_and_return_all_conditional_losses"
_tf_keras_layer
Â
§depthwise_kernel
¨	variables
İtrainable_variables
Şregularization_losses
Ğ	keras_api
Ĵ__call__
+­&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	?axis
	Żbeta
°moving_mean
ħmoving_variance
²	variables
³trainable_variables
´regularization_losses
µ	keras_api
ĥ__call__
+·&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
¸	variables
ıtrainable_variables
şregularization_losses
ğ	keras_api
ĵ__call__
+½&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
?kernel
ż	variables
Àtrainable_variables
Áregularization_losses
Â	keras_api
?__call__
+Ä&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	Ċaxis
	Ĉbeta
Çmoving_mean
Èmoving_variance
É	variables
Êtrainable_variables
Ëregularization_losses
Ì	keras_api
Í__call__
+Î&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
Ï	variables
?trainable_variables
Ñregularization_losses
Ò	keras_api
Ó__call__
+Ô&call_and_return_all_conditional_losses"
_tf_keras_layer
Â
Ġdepthwise_kernel
Ö	variables
×trainable_variables
Ĝregularization_losses
Ù	keras_api
Ú__call__
+Û&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	Üaxis
	Ŭbeta
Ŝmoving_mean
ßmoving_variance
à	variables
átrainable_variables
âregularization_losses
?	keras_api
ä__call__
+ċ&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
ĉ	variables
çtrainable_variables
èregularization_losses
é	keras_api
ê__call__
+ë&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
ìkernel
í	variables
îtrainable_variables
ïregularization_losses
?	keras_api
ñ__call__
+ò&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	óaxis
	ôbeta
ġmoving_mean
ömoving_variance
÷	variables
ĝtrainable_variables
ùregularization_losses
ú	keras_api
û__call__
+ü&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
ŭ	variables
ŝtrainable_variables
˙regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
Â
depthwise_kernel
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	axis
	beta
moving_mean
moving_variance
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
kernel
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+ &call_and_return_all_conditional_losses"
_tf_keras_layer
é
	Ħaxis
	˘beta
£moving_mean
¤moving_variance
?	variables
Ĥtrainable_variables
§regularization_losses
¨	keras_api
İ__call__
+Ş&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
Ğ	variables
Ĵtrainable_variables
­regularization_losses
?	keras_api
Ż__call__
+°&call_and_return_all_conditional_losses"
_tf_keras_layer
Â
ħdepthwise_kernel
²	variables
³trainable_variables
´regularization_losses
µ	keras_api
ĥ__call__
+·&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	¸axis
	ıbeta
şmoving_mean
ğmoving_variance
ĵ	variables
½trainable_variables
?regularization_losses
ż	keras_api
À__call__
+Á&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
Â	variables
?trainable_variables
Äregularization_losses
Ċ	keras_api
Ĉ__call__
+Ç&call_and_return_all_conditional_losses"
_tf_keras_layer
¸
Èkernel
É	variables
Êtrainable_variables
Ëregularization_losses
Ì	keras_api
Í__call__
+Î&call_and_return_all_conditional_losses"
_tf_keras_layer
é
	Ïaxis
	?beta
Ñmoving_mean
Òmoving_variance
Ó	variables
Ôtrainable_variables
Ġregularization_losses
Ö	keras_api
×__call__
+Ĝ&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
Ù	variables
Útrainable_variables
Ûregularization_losses
Ü	keras_api
Ŭ__call__
+Ŝ&call_and_return_all_conditional_losses"
_tf_keras_layer
Ğ
ß	variables
àtrainable_variables
áregularization_losses
â	keras_api
?__call__
+ä&call_and_return_all_conditional_losses"
_tf_keras_layer
?
ċkernel
	ĉbias
ç	variables
ètrainable_variables
éregularization_losses
ê	keras_api
ë__call__
+ì&call_and_return_all_conditional_losses"
_tf_keras_layer
²
	íiter
îbeta_1
ïbeta_2

?decay
ñlearning_rate4m?<mÑKmÒSmÓbmÔjmĠymÖ	m×	mĜ	mÙ	§mÚ	ŻmÛ	?mÜ	ĈmŬ	ĠmŜ	Ŭmß	ìmà	ômá	mâ	m?	mä	˘mċ	ħmĉ	ımç	Èmè	?mé	ċmê	ĉmë4vì<víKvîSvïbv?jvñyvò	vó	vô	vġ	§vö	Żv÷	?vĝ	Ĉvù	Ġvú	Ŭvû	ìvü	ôvŭ	vŝ	v˙	v	˘v	ħv	ıv	Èv	?v	ċv	ĉv"
	optimizer
ï
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
13
14
15
16
17
18
19
§20
Ż21
°22
ħ23
?24
Ĉ25
Ç26
È27
Ġ28
Ŭ29
Ŝ30
ß31
ì32
ô33
ġ34
ö35
36
37
38
39
40
˘41
£42
¤43
ħ44
ı45
ş46
ğ47
È48
?49
Ñ50
Ò51
ċ52
ĉ53"
trackable_list_wrapper

40
<1
K2
S3
b4
j5
y6
7
8
9
§10
Ż11
?12
Ĉ13
Ġ14
Ŭ15
ì16
ô17
18
19
20
˘21
ħ22
ı23
È24
?25
ċ26
ĉ27"
trackable_list_wrapper
 "
trackable_list_wrapper
Ï
ònon_trainable_variables
ólayers
ômetrics
 ġlayer_regularization_losses
ölayer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
2_default_save_signature
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
2
/__inference_yamnet_frames_layer_call_fn_2085613
/__inference_yamnet_frames_layer_call_fn_2086904
/__inference_yamnet_frames_layer_call_fn_2087043
/__inference_yamnet_frames_layer_call_fn_2086401À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
ö2ó
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2087288
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2087533
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086580
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086759À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
ÍBÊ
"__inference__wrapped_model_2084269input_7"
²
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
-
÷serving_default"
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
²
ĝnon_trainable_variables
ùlayers
úmetrics
 ûlayer_regularization_losses
ülayer_metrics
5	variables
6trainable_variables
7regularization_losses
9__call__
*:&call_and_return_all_conditional_losses
&:"call_and_return_conditional_losses"
_generic_user_object
×2Ô
-__inference_layer1/conv_layer_call_fn_2087681˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ò2ï
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2087688˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
²
ŭnon_trainable_variables
ŝlayers
˙metrics
 layer_regularization_losses
layer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses"
_generic_user_object
2
0__inference_layer1/conv/bn_layer_call_fn_2087701
0__inference_layer1/conv/bn_layer_call_fn_2087714´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
Ô2Ñ
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2087731
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2087748´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses"
_generic_user_object
×2Ô
-__inference_layer1/relu_layer_call_fn_2087753˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ò2ï
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2087758˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer2/depthwise_conv_layer_call_fn_2087765˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2087774˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
V	variables
Wtrainable_variables
Xregularization_losses
Z__call__
*[&call_and_return_all_conditional_losses
&["call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer2/depthwise_conv/bn_layer_call_fn_2087787
:__inference_layer2/depthwise_conv/bn_layer_call_fn_2087800´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087817
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087834´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer2/depthwise_conv/relu_layer_call_fn_2087839˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2087844˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
c	variables
dtrainable_variables
eregularization_losses
g__call__
*h&call_and_return_all_conditional_losses
&h"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer2/pointwise_conv_layer_call_fn_2087851˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2087858˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
²
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
m	variables
ntrainable_variables
oregularization_losses
q__call__
*r&call_and_return_all_conditional_losses
&r"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer2/pointwise_conv/bn_layer_call_fn_2087871
:__inference_layer2/pointwise_conv/bn_layer_call_fn_2087884´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2087901
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2087918´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
²
 non_trainable_variables
Ħlayers
˘metrics
 £layer_regularization_losses
¤layer_metrics
s	variables
ttrainable_variables
uregularization_losses
w__call__
*x&call_and_return_all_conditional_losses
&x"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer2/pointwise_conv/relu_layer_call_fn_2087923˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2087928˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
²
?non_trainable_variables
Ĥlayers
§metrics
 ¨layer_regularization_losses
İlayer_metrics
z	variables
{trainable_variables
|regularization_losses
~__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer3/depthwise_conv_layer_call_fn_2087935˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2087944˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
+:)@2layer3/depthwise_conv/bn/beta
4:2@ (2$layer3/depthwise_conv/bn/moving_mean
8:6@ (2(layer3/depthwise_conv/bn/moving_variance
8
0
1
2"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Şnon_trainable_variables
Ğlayers
Ĵmetrics
 ­layer_regularization_losses
?layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer3/depthwise_conv/bn_layer_call_fn_2087957
:__inference_layer3/depthwise_conv/bn_layer_call_fn_2087970´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087987
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088004´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Żnon_trainable_variables
°layers
ħmetrics
 ²layer_regularization_losses
³layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer3/depthwise_conv/relu_layer_call_fn_2088009˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088014˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
7:5@2layer3/pointwise_conv/kernel
(
0"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
´non_trainable_variables
µlayers
ĥmetrics
 ·layer_regularization_losses
¸layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer3/pointwise_conv_layer_call_fn_2088021˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2088028˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer3/pointwise_conv/bn/beta
5:3 (2$layer3/pointwise_conv/bn/moving_mean
9:7 (2(layer3/pointwise_conv/bn/moving_variance
8
0
1
2"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ınon_trainable_variables
şlayers
ğmetrics
 ĵlayer_regularization_losses
½layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+ &call_and_return_all_conditional_losses
' "call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer3/pointwise_conv/bn_layer_call_fn_2088041
:__inference_layer3/pointwise_conv/bn_layer_call_fn_2088054´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088071
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088088´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
?non_trainable_variables
żlayers
Àmetrics
 Álayer_regularization_losses
Âlayer_metrics
Ħ	variables
˘trainable_variables
£regularization_losses
?__call__
+Ĥ&call_and_return_all_conditional_losses
'Ĥ"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer3/pointwise_conv/relu_layer_call_fn_2088093˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088098˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
A:?2&layer4/depthwise_conv/depthwise_kernel
(
§0"
trackable_list_wrapper
(
§0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
?non_trainable_variables
Älayers
Ċmetrics
 Ĉlayer_regularization_losses
Çlayer_metrics
¨	variables
İtrainable_variables
Şregularization_losses
Ĵ__call__
+­&call_and_return_all_conditional_losses
'­"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer4/depthwise_conv_layer_call_fn_2088105˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2088114˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer4/depthwise_conv/bn/beta
5:3 (2$layer4/depthwise_conv/bn/moving_mean
9:7 (2(layer4/depthwise_conv/bn/moving_variance
8
Ż0
°1
ħ2"
trackable_list_wrapper
(
Ż0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ènon_trainable_variables
Élayers
Êmetrics
 Ëlayer_regularization_losses
Ìlayer_metrics
²	variables
³trainable_variables
´regularization_losses
ĥ__call__
+·&call_and_return_all_conditional_losses
'·"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer4/depthwise_conv/bn_layer_call_fn_2088127
:__inference_layer4/depthwise_conv/bn_layer_call_fn_2088140´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088157
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088174´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ínon_trainable_variables
Îlayers
Ïmetrics
 ?layer_regularization_losses
Ñlayer_metrics
¸	variables
ıtrainable_variables
şregularization_losses
ĵ__call__
+½&call_and_return_all_conditional_losses
'½"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer4/depthwise_conv/relu_layer_call_fn_2088179˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088184˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
8:62layer4/pointwise_conv/kernel
(
?0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ònon_trainable_variables
Ólayers
Ômetrics
 Ġlayer_regularization_losses
Ölayer_metrics
ż	variables
Àtrainable_variables
Áregularization_losses
?__call__
+Ä&call_and_return_all_conditional_losses
'Ä"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer4/pointwise_conv_layer_call_fn_2088191˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2088198˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer4/pointwise_conv/bn/beta
5:3 (2$layer4/pointwise_conv/bn/moving_mean
9:7 (2(layer4/pointwise_conv/bn/moving_variance
8
Ĉ0
Ç1
È2"
trackable_list_wrapper
(
Ĉ0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
×non_trainable_variables
Ĝlayers
Ùmetrics
 Úlayer_regularization_losses
Ûlayer_metrics
É	variables
Êtrainable_variables
Ëregularization_losses
Í__call__
+Î&call_and_return_all_conditional_losses
'Î"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer4/pointwise_conv/bn_layer_call_fn_2088211
:__inference_layer4/pointwise_conv/bn_layer_call_fn_2088224´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088241
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088258´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ünon_trainable_variables
Ŭlayers
Ŝmetrics
 ßlayer_regularization_losses
àlayer_metrics
Ï	variables
?trainable_variables
Ñregularization_losses
Ó__call__
+Ô&call_and_return_all_conditional_losses
'Ô"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer4/pointwise_conv/relu_layer_call_fn_2088263˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088268˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
A:?2&layer5/depthwise_conv/depthwise_kernel
(
Ġ0"
trackable_list_wrapper
(
Ġ0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ánon_trainable_variables
âlayers
?metrics
 älayer_regularization_losses
ċlayer_metrics
Ö	variables
×trainable_variables
Ĝregularization_losses
Ú__call__
+Û&call_and_return_all_conditional_losses
'Û"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer5/depthwise_conv_layer_call_fn_2088275˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2088284˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer5/depthwise_conv/bn/beta
5:3 (2$layer5/depthwise_conv/bn/moving_mean
9:7 (2(layer5/depthwise_conv/bn/moving_variance
8
Ŭ0
Ŝ1
ß2"
trackable_list_wrapper
(
Ŭ0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ĉnon_trainable_variables
çlayers
èmetrics
 élayer_regularization_losses
êlayer_metrics
à	variables
átrainable_variables
âregularization_losses
ä__call__
+ċ&call_and_return_all_conditional_losses
'ċ"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer5/depthwise_conv/bn_layer_call_fn_2088297
:__inference_layer5/depthwise_conv/bn_layer_call_fn_2088310´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088327
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088344´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ënon_trainable_variables
ìlayers
ímetrics
 îlayer_regularization_losses
ïlayer_metrics
ĉ	variables
çtrainable_variables
èregularization_losses
ê__call__
+ë&call_and_return_all_conditional_losses
'ë"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer5/depthwise_conv/relu_layer_call_fn_2088349˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088354˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
8:62layer5/pointwise_conv/kernel
(
ì0"
trackable_list_wrapper
(
ì0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
?non_trainable_variables
ñlayers
òmetrics
 ólayer_regularization_losses
ôlayer_metrics
í	variables
îtrainable_variables
ïregularization_losses
ñ__call__
+ò&call_and_return_all_conditional_losses
'ò"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer5/pointwise_conv_layer_call_fn_2088361˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2088368˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer5/pointwise_conv/bn/beta
5:3 (2$layer5/pointwise_conv/bn/moving_mean
9:7 (2(layer5/pointwise_conv/bn/moving_variance
8
ô0
ġ1
ö2"
trackable_list_wrapper
(
ô0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ġnon_trainable_variables
ölayers
÷metrics
 ĝlayer_regularization_losses
ùlayer_metrics
÷	variables
ĝtrainable_variables
ùregularization_losses
û__call__
+ü&call_and_return_all_conditional_losses
'ü"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer5/pointwise_conv/bn_layer_call_fn_2088381
:__inference_layer5/pointwise_conv/bn_layer_call_fn_2088394´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088411
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088428´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
únon_trainable_variables
ûlayers
ümetrics
 ŭlayer_regularization_losses
ŝlayer_metrics
ŭ	variables
ŝtrainable_variables
˙regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer5/pointwise_conv/relu_layer_call_fn_2088433˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088438˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
A:?2&layer6/depthwise_conv/depthwise_kernel
(
0"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
˙non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer6/depthwise_conv_layer_call_fn_2088445˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2088454˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer6/depthwise_conv/bn/beta
5:3 (2$layer6/depthwise_conv/bn/moving_mean
9:7 (2(layer6/depthwise_conv/bn/moving_variance
8
0
1
2"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer6/depthwise_conv/bn_layer_call_fn_2088467
:__inference_layer6/depthwise_conv/bn_layer_call_fn_2088480´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088497
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088514´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer6/depthwise_conv/relu_layer_call_fn_2088519˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088524˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
8:62layer6/pointwise_conv/kernel
(
0"
trackable_list_wrapper
(
0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
+ &call_and_return_all_conditional_losses
' "call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer6/pointwise_conv_layer_call_fn_2088531˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2088538˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer6/pointwise_conv/bn/beta
5:3 (2$layer6/pointwise_conv/bn/moving_mean
9:7 (2(layer6/pointwise_conv/bn/moving_variance
8
˘0
£1
¤2"
trackable_list_wrapper
(
˘0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
?	variables
Ĥtrainable_variables
§regularization_losses
İ__call__
+Ş&call_and_return_all_conditional_losses
'Ş"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer6/pointwise_conv/bn_layer_call_fn_2088551
:__inference_layer6/pointwise_conv/bn_layer_call_fn_2088564´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088581
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088598´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ğ	variables
Ĵtrainable_variables
­regularization_losses
Ż__call__
+°&call_and_return_all_conditional_losses
'°"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer6/pointwise_conv/relu_layer_call_fn_2088603˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088608˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
A:?2&layer7/depthwise_conv/depthwise_kernel
(
ħ0"
trackable_list_wrapper
(
ħ0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
non_trainable_variables
layers
metrics
  layer_regularization_losses
Ħlayer_metrics
²	variables
³trainable_variables
´regularization_losses
ĥ__call__
+·&call_and_return_all_conditional_losses
'·"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer7/depthwise_conv_layer_call_fn_2088615˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2088624˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer7/depthwise_conv/bn/beta
5:3 (2$layer7/depthwise_conv/bn/moving_mean
9:7 (2(layer7/depthwise_conv/bn/moving_variance
8
ı0
ş1
ğ2"
trackable_list_wrapper
(
ı0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
˘non_trainable_variables
£layers
¤metrics
 ?layer_regularization_losses
Ĥlayer_metrics
ĵ	variables
½trainable_variables
?regularization_losses
À__call__
+Á&call_and_return_all_conditional_losses
'Á"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer7/depthwise_conv/bn_layer_call_fn_2088637
:__inference_layer7/depthwise_conv/bn_layer_call_fn_2088650´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088667
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088684´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
§non_trainable_variables
¨layers
İmetrics
 Şlayer_regularization_losses
Ğlayer_metrics
Â	variables
?trainable_variables
Äregularization_losses
Ĉ__call__
+Ç&call_and_return_all_conditional_losses
'Ç"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer7/depthwise_conv/relu_layer_call_fn_2088689˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088694˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
8:62layer7/pointwise_conv/kernel
(
È0"
trackable_list_wrapper
(
È0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ĵnon_trainable_variables
­layers
?metrics
 Żlayer_regularization_losses
°layer_metrics
É	variables
Êtrainable_variables
Ëregularization_losses
Í__call__
+Î&call_and_return_all_conditional_losses
'Î"call_and_return_conditional_losses"
_generic_user_object
á2Ŝ
7__inference_layer7/pointwise_conv_layer_call_fn_2088701˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
ü2ù
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2088708˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
,:*2layer7/pointwise_conv/bn/beta
5:3 (2$layer7/pointwise_conv/bn/moving_mean
9:7 (2(layer7/pointwise_conv/bn/moving_variance
8
?0
Ñ1
Ò2"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ħnon_trainable_variables
²layers
³metrics
 ´layer_regularization_losses
µlayer_metrics
Ó	variables
Ôtrainable_variables
Ġregularization_losses
×__call__
+Ĝ&call_and_return_all_conditional_losses
'Ĝ"call_and_return_conditional_losses"
_generic_user_object
²2Ż
:__inference_layer7/pointwise_conv/bn_layer_call_fn_2088721
:__inference_layer7/pointwise_conv/bn_layer_call_fn_2088734´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
è2ċ
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088751
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088768´
Ğ²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsŞ 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ĥnon_trainable_variables
·layers
¸metrics
 ılayer_regularization_losses
şlayer_metrics
Ù	variables
Útrainable_variables
Ûregularization_losses
Ŭ__call__
+Ŝ&call_and_return_all_conditional_losses
'Ŝ"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_layer7/pointwise_conv/relu_layer_call_fn_2088773˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088778˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¸
ğnon_trainable_variables
ĵlayers
½metrics
 ?layer_regularization_losses
żlayer_metrics
ß	variables
àtrainable_variables
áregularization_losses
?__call__
+ä&call_and_return_all_conditional_losses
'ä"call_and_return_conditional_losses"
_generic_user_object
ĉ2?
<__inference_global_average_pooling2d_6_layer_call_fn_2088783˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
2ŝ
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2088789˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
!:	
2dense_6/kernel
:
2dense_6/bias
0
ċ0
ĉ1"
trackable_list_wrapper
0
ċ0
ĉ1"
trackable_list_wrapper
 "
trackable_list_wrapper
¸
Ànon_trainable_variables
Álayers
Âmetrics
 ?layer_regularization_losses
Älayer_metrics
ç	variables
ètrainable_variables
éregularization_losses
ë__call__
+ì&call_and_return_all_conditional_losses
'ì"call_and_return_conditional_losses"
_generic_user_object
Ó2?
)__inference_dense_6_layer_call_fn_2088798˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
î2ë
D__inference_dense_6_layer_call_and_return_conditional_losses_2088808˘
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
ú
=0
>1
T2
U3
k4
l5
6
7
8
9
°10
ħ11
Ç12
È13
Ŝ14
ß15
ġ16
ö17
18
19
£20
¤21
ş22
ğ23
Ñ24
Ò25"
trackable_list_wrapper
ĉ
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
Ċ0
Ĉ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÌBÉ
%__inference_signature_wrapper_2087674input_7"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsŞ *
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
0
1"
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
0
1"
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
°0
ħ1"
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
Ç0
È1"
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
Ŝ0
ß1"
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
ġ0
ö1"
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
0
1"
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
£0
¤1"
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
ş0
ğ1"
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
Ñ0
Ò1"
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

Çtotal

Ècount
É	variables
Ê	keras_api"
_tf_keras_metric
c

Ëtotal

Ìcount
Í
_fn_kwargs
Î	variables
Ï	keras_api"
_tf_keras_metric
:  (2total
:  (2count
0
Ç0
È1"
trackable_list_wrapper
.
É	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
Ë0
Ì1"
trackable_list_wrapper
.
Î	variables"
_generic_user_object
1:/ 2Adam/layer1/conv/kernel/m
&:$ 2Adam/layer1/conv/bn/beta/m
E:C 2-Adam/layer2/depthwise_conv/depthwise_kernel/m
0:. 2$Adam/layer2/depthwise_conv/bn/beta/m
;:9 @2#Adam/layer2/pointwise_conv/kernel/m
0:.@2$Adam/layer2/pointwise_conv/bn/beta/m
E:C@2-Adam/layer3/depthwise_conv/depthwise_kernel/m
0:.@2$Adam/layer3/depthwise_conv/bn/beta/m
<::@2#Adam/layer3/pointwise_conv/kernel/m
1:/2$Adam/layer3/pointwise_conv/bn/beta/m
F:D2-Adam/layer4/depthwise_conv/depthwise_kernel/m
1:/2$Adam/layer4/depthwise_conv/bn/beta/m
=:;2#Adam/layer4/pointwise_conv/kernel/m
1:/2$Adam/layer4/pointwise_conv/bn/beta/m
F:D2-Adam/layer5/depthwise_conv/depthwise_kernel/m
1:/2$Adam/layer5/depthwise_conv/bn/beta/m
=:;2#Adam/layer5/pointwise_conv/kernel/m
1:/2$Adam/layer5/pointwise_conv/bn/beta/m
F:D2-Adam/layer6/depthwise_conv/depthwise_kernel/m
1:/2$Adam/layer6/depthwise_conv/bn/beta/m
=:;2#Adam/layer6/pointwise_conv/kernel/m
1:/2$Adam/layer6/pointwise_conv/bn/beta/m
F:D2-Adam/layer7/depthwise_conv/depthwise_kernel/m
1:/2$Adam/layer7/depthwise_conv/bn/beta/m
=:;2#Adam/layer7/pointwise_conv/kernel/m
1:/2$Adam/layer7/pointwise_conv/bn/beta/m
&:$	
2Adam/dense_6/kernel/m
:
2Adam/dense_6/bias/m
1:/ 2Adam/layer1/conv/kernel/v
&:$ 2Adam/layer1/conv/bn/beta/v
E:C 2-Adam/layer2/depthwise_conv/depthwise_kernel/v
0:. 2$Adam/layer2/depthwise_conv/bn/beta/v
;:9 @2#Adam/layer2/pointwise_conv/kernel/v
0:.@2$Adam/layer2/pointwise_conv/bn/beta/v
E:C@2-Adam/layer3/depthwise_conv/depthwise_kernel/v
0:.@2$Adam/layer3/depthwise_conv/bn/beta/v
<::@2#Adam/layer3/pointwise_conv/kernel/v
1:/2$Adam/layer3/pointwise_conv/bn/beta/v
F:D2-Adam/layer4/depthwise_conv/depthwise_kernel/v
1:/2$Adam/layer4/depthwise_conv/bn/beta/v
=:;2#Adam/layer4/pointwise_conv/kernel/v
1:/2$Adam/layer4/pointwise_conv/bn/beta/v
F:D2-Adam/layer5/depthwise_conv/depthwise_kernel/v
1:/2$Adam/layer5/depthwise_conv/bn/beta/v
=:;2#Adam/layer5/pointwise_conv/kernel/v
1:/2$Adam/layer5/pointwise_conv/bn/beta/v
F:D2-Adam/layer6/depthwise_conv/depthwise_kernel/v
1:/2$Adam/layer6/depthwise_conv/bn/beta/v
=:;2#Adam/layer6/pointwise_conv/kernel/v
1:/2$Adam/layer6/pointwise_conv/bn/beta/v
F:D2-Adam/layer7/depthwise_conv/depthwise_kernel/v
1:/2$Adam/layer7/depthwise_conv/bn/beta/v
=:;2#Adam/layer7/pointwise_conv/kernel/v
1:/2$Adam/layer7/pointwise_conv/bn/beta/v
&:$	
2Adam/dense_6/kernel/v
:
2Adam/dense_6/bias/v
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

Const_12
"__inference__wrapped_model_2084269èy4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ8˘5
.˘+
)&
input_7˙˙˙˙˙˙˙˙˙`@
Ş "1Ş.
,
dense_6!
dense_6˙˙˙˙˙˙˙˙˙
§
D__inference_dense_6_layer_call_and_return_conditional_losses_2088808_ċĉ0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş "%˘"

0˙˙˙˙˙˙˙˙˙

 
)__inference_dense_6_layer_call_fn_2088798Rċĉ0˘-
&˘#
!
inputs˙˙˙˙˙˙˙˙˙
Ş "˙˙˙˙˙˙˙˙˙
à
W__inference_global_average_pooling2d_6_layer_call_and_return_conditional_losses_2088789R˘O
H˘E
C@
inputs4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ·
<__inference_global_average_pooling2d_6_layer_call_fn_2088783wR˘O
H˘E
C@
inputs4˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ç
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2087731<=>M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p 
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 ç
K__inference_layer1/conv/bn_layer_call_and_return_conditional_losses_2087748<=>M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 ż
0__inference_layer1/conv/bn_layer_call_fn_2087701<=>M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p 
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ ż
0__inference_layer1/conv/bn_layer_call_fn_2087714<=>M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ ·
H__inference_layer1/conv_layer_call_and_return_conditional_losses_2087688k47˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙`@
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙0  
 
-__inference_layer1/conv_layer_call_fn_2087681^47˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙`@
Ş " ˙˙˙˙˙˙˙˙˙0  ´
H__inference_layer1/relu_layer_call_and_return_conditional_losses_2087758h7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙0  
 
-__inference_layer1/relu_layer_call_fn_2087753[7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş " ˙˙˙˙˙˙˙˙˙0  ñ
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087817STUM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p 
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 ñ
U__inference_layer2/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087834STUM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
 É
:__inference_layer2/depthwise_conv/bn_layer_call_fn_2087787STUM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p 
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ É
:__inference_layer2/depthwise_conv/bn_layer_call_fn_2087800STUM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 
p
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ ?
W__inference_layer2/depthwise_conv/relu_layer_call_and_return_conditional_losses_2087844h7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙0  
 
<__inference_layer2/depthwise_conv/relu_layer_call_fn_2087839[7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş " ˙˙˙˙˙˙˙˙˙0  Á
R__inference_layer2/depthwise_conv_layer_call_and_return_conditional_losses_2087774kK7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙0  
 
7__inference_layer2/depthwise_conv_layer_call_fn_2087765^K7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş " ˙˙˙˙˙˙˙˙˙0  ñ
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2087901jklM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p 
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 ñ
U__inference_layer2/pointwise_conv/bn_layer_call_and_return_conditional_losses_2087918jklM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 É
:__inference_layer2/pointwise_conv/bn_layer_call_fn_2087871jklM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p 
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@É
:__inference_layer2/pointwise_conv/bn_layer_call_fn_2087884jklM˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@?
W__inference_layer2/pointwise_conv/relu_layer_call_and_return_conditional_losses_2087928h7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0 @
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙0 @
 
<__inference_layer2/pointwise_conv/relu_layer_call_fn_2087923[7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0 @
Ş " ˙˙˙˙˙˙˙˙˙0 @Á
R__inference_layer2/pointwise_conv_layer_call_and_return_conditional_losses_2087858kb7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙0 @
 
7__inference_layer2/pointwise_conv_layer_call_fn_2087851^b7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0  
Ş " ˙˙˙˙˙˙˙˙˙0 @ô
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2087987M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p 
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 ô
U__inference_layer3/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088004M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p
Ş "?˘<
52
0+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
 Ì
:__inference_layer3/depthwise_conv/bn_layer_call_fn_2087957M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p 
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@Ì
:__inference_layer3/depthwise_conv/bn_layer_call_fn_2087970M˘J
C˘@
:7
inputs+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@
p
Ş "2/+˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙@?
W__inference_layer3/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088014h7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙@
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙@
 
<__inference_layer3/depthwise_conv/relu_layer_call_fn_2088009[7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙@
Ş " ˙˙˙˙˙˙˙˙˙@Á
R__inference_layer3/depthwise_conv_layer_call_and_return_conditional_losses_2087944ky7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0 @
Ş "-˘*
# 
0˙˙˙˙˙˙˙˙˙@
 
7__inference_layer3/depthwise_conv_layer_call_fn_2087935^y7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙0 @
Ş " ˙˙˙˙˙˙˙˙˙@ö
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088071N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer3/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088088N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer3/pointwise_conv/bn_layer_call_fn_2088041N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer3/pointwise_conv/bn_layer_call_fn_2088054N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer3/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088098j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer3/pointwise_conv/relu_layer_call_fn_2088093]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙?
R__inference_layer3/pointwise_conv_layer_call_and_return_conditional_losses_2088028m7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙@
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer3/pointwise_conv_layer_call_fn_2088021`7˘4
-˘*
(%
inputs˙˙˙˙˙˙˙˙˙@
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088157Ż°ħN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer4/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088174Ż°ħN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer4/depthwise_conv/bn_layer_call_fn_2088127Ż°ħN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer4/depthwise_conv/bn_layer_call_fn_2088140Ż°ħN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer4/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088184j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer4/depthwise_conv/relu_layer_call_fn_2088179]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer4/depthwise_conv_layer_call_and_return_conditional_losses_2088114n§8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer4/depthwise_conv_layer_call_fn_2088105a§8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088241ĈÇÈN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer4/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088258ĈÇÈN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer4/pointwise_conv/bn_layer_call_fn_2088211ĈÇÈN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer4/pointwise_conv/bn_layer_call_fn_2088224ĈÇÈN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer4/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088268j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer4/pointwise_conv/relu_layer_call_fn_2088263]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer4/pointwise_conv_layer_call_and_return_conditional_losses_2088198n?8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer4/pointwise_conv_layer_call_fn_2088191a?8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088327ŬŜßN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer5/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088344ŬŜßN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer5/depthwise_conv/bn_layer_call_fn_2088297ŬŜßN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer5/depthwise_conv/bn_layer_call_fn_2088310ŬŜßN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer5/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088354j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer5/depthwise_conv/relu_layer_call_fn_2088349]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer5/depthwise_conv_layer_call_and_return_conditional_losses_2088284nĠ8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer5/depthwise_conv_layer_call_fn_2088275aĠ8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088411ôġöN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer5/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088428ôġöN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer5/pointwise_conv/bn_layer_call_fn_2088381ôġöN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer5/pointwise_conv/bn_layer_call_fn_2088394ôġöN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer5/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088438j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer5/pointwise_conv/relu_layer_call_fn_2088433]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer5/pointwise_conv_layer_call_and_return_conditional_losses_2088368nì8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer5/pointwise_conv_layer_call_fn_2088361aì8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088497N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer6/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088514N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer6/depthwise_conv/bn_layer_call_fn_2088467N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer6/depthwise_conv/bn_layer_call_fn_2088480N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer6/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088524j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer6/depthwise_conv/relu_layer_call_fn_2088519]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer6/depthwise_conv_layer_call_and_return_conditional_losses_2088454n8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer6/depthwise_conv_layer_call_fn_2088445a8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088581˘£¤N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer6/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088598˘£¤N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer6/pointwise_conv/bn_layer_call_fn_2088551˘£¤N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer6/pointwise_conv/bn_layer_call_fn_2088564˘£¤N˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer6/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088608j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer6/pointwise_conv/relu_layer_call_fn_2088603]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer6/pointwise_conv_layer_call_and_return_conditional_losses_2088538n8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer6/pointwise_conv_layer_call_fn_2088531a8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088667ışğN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer7/depthwise_conv/bn_layer_call_and_return_conditional_losses_2088684ışğN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer7/depthwise_conv/bn_layer_call_fn_2088637ışğN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer7/depthwise_conv/bn_layer_call_fn_2088650ışğN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer7/depthwise_conv/relu_layer_call_and_return_conditional_losses_2088694j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer7/depthwise_conv/relu_layer_call_fn_2088689]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer7/depthwise_conv_layer_call_and_return_conditional_losses_2088624nħ8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer7/depthwise_conv_layer_call_fn_2088615aħ8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙ö
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088751?ÑÒN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 ö
U__inference_layer7/pointwise_conv/bn_layer_call_and_return_conditional_losses_2088768?ÑÒN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "@˘=
63
0,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
 Î
:__inference_layer7/pointwise_conv/bn_layer_call_fn_2088721?ÑÒN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p 
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Î
:__inference_layer7/pointwise_conv/bn_layer_call_fn_2088734?ÑÒN˘K
D˘A
;8
inputs,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙
p
Ş "30,˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙Ċ
W__inference_layer7/pointwise_conv/relu_layer_call_and_return_conditional_losses_2088778j8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
<__inference_layer7/pointwise_conv/relu_layer_call_fn_2088773]8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙Ä
R__inference_layer7/pointwise_conv_layer_call_and_return_conditional_losses_2088708nÈ8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş ".˘+
$!
0˙˙˙˙˙˙˙˙˙
 
7__inference_layer7/pointwise_conv_layer_call_fn_2088701aÈ8˘5
.˘+
)&
inputs˙˙˙˙˙˙˙˙˙
Ş "!˙˙˙˙˙˙˙˙˙
%__inference_signature_wrapper_2087674óy4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉC˘@
˘ 
9Ş6
4
input_7)&
input_7˙˙˙˙˙˙˙˙˙`@"1Ş.
,
dense_6!
dense_6˙˙˙˙˙˙˙˙˙
³
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086580äy4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ@˘=
6˘3
)&
input_7˙˙˙˙˙˙˙˙˙`@
p 

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙

 ³
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2086759äy4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ@˘=
6˘3
)&
input_7˙˙˙˙˙˙˙˙˙`@
p

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙

 ²
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2087288?y4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ?˘<
5˘2
(%
inputs˙˙˙˙˙˙˙˙˙`@
p 

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙

 ²
J__inference_yamnet_frames_layer_call_and_return_conditional_losses_2087533?y4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ?˘<
5˘2
(%
inputs˙˙˙˙˙˙˙˙˙`@
p

 
Ş "%˘"

0˙˙˙˙˙˙˙˙˙

 
/__inference_yamnet_frames_layer_call_fn_2085613×y4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ@˘=
6˘3
)&
input_7˙˙˙˙˙˙˙˙˙`@
p 

 
Ş "˙˙˙˙˙˙˙˙˙

/__inference_yamnet_frames_layer_call_fn_2086401×y4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ@˘=
6˘3
)&
input_7˙˙˙˙˙˙˙˙˙`@
p

 
Ş "˙˙˙˙˙˙˙˙˙

/__inference_yamnet_frames_layer_call_fn_2086904Öy4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ?˘<
5˘2
(%
inputs˙˙˙˙˙˙˙˙˙`@
p 

 
Ş "˙˙˙˙˙˙˙˙˙

/__inference_yamnet_frames_layer_call_fn_2087043Öy4<=>KSTUbjkly§Ż°ħ?ĈÇÈĠŬŜßìôġö˘£¤ħışğÈ?ÑÒċĉ?˘<
5˘2
(%
inputs˙˙˙˙˙˙˙˙˙`@
p

 
Ş "˙˙˙˙˙˙˙˙˙
