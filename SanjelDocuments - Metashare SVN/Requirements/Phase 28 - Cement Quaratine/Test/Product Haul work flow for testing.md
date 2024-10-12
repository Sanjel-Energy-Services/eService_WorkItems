```mermaid
flowchart LR
A[Start]-->B
subgraph Enter Blend Information
B[Choose isTotalBlend]-->C
C[Enter Amount]-->D
D[Enter MixWater]
end
D-->E{Is Blend Test?}
E-->|Yes|E1
E-->|No|E2
subgraph BlendTest
E1[Select Bulk Plant]-->F1[Select Bulk Plant Bin]
end
F1--->Z1[/Product Haul Load/]
subgraph ProductHaul
E2[select Bulk Plant]-->F2[Select Rig Bin]
F2-->G2{Load to Existing Haul}
G2-->|Yes|H21
G2-->|No|H22
subgraph Load to Existing Haul
H21[select existing haul]
end
subgraph Create New Product Haul
H22{Go with Crew}
H22-->|Yes|I221
H22-->|No|I222
subgraph Go With Crew
I221[select Estimated Load Time]
end
subgraph Not Go With Crew
I222[select Estimated Load Time]-->J222[select Expect On Location time]
J222-->K222[Enter Estimated Travel Time]
end
I221-->L
K222-->L
L{Is Third Party}
L-->|Yes|M1
L-->|No|M2
subgraph Third Party Crew
M1[Select third party crew]
end
subgraph Sanjel Crew
M2[Select sanjel crew]
end
end
end
H21-->Z2[/Product Haul Load link to an exsiting haul/]
M1-->N[/Product Haul and Product Haul Load/]
M2-->N

```

根据以上流程，Create Product Haul from Rig Job Blend 总共有六种情况，所以除了测试验证的用例，只有六个测试就足够了。

那么Reschedule Product Haul 只对Product Haul框内Not Load to existing haul的情况进行Reschedule，那么有四种情况的product haul需要做对应的测试。因为Go With Crew和Is Third Party之间没有依赖关系，可以分别测。你可以对比一下我们确定的五个测试用例，思考一下这五个用例是否完备地测试了所有路径？

那么Reschedule Product Haul Load需要对哪些情况进行测试呢？它涉及到可以回溯到Blend Test和Is existing haul，情况会更多一些。如果你按从上至下的逻辑顺序去思考设计测试用例，会清晰很多。

记住，Create Product Haul from Rig Job Blend 测试用例的结果是Reschedule的测试用例的前提条件。在测试用例中一定要写清楚，这样在后面我们创建测试计划的时候，可以有效地组合，结省时间。

