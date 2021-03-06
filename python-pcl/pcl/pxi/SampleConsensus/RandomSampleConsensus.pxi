# -*- coding: utf-8 -*-
from libcpp.vector cimport vector

cimport pcl_defs as cpp
cimport pcl_sample_consensus_defs as pcl_sac


cdef class RandomSampleConsensus:
    """
    """
    cdef pcl_sac.RandomSampleConsensus_t *me

    # SetNG
    def __cinit__(self, SampleConsensusModel model):
        self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
        pass

    # SetNG
    def __cinit__(self, SampleConsensusModelPlane model):
        self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
        pass

    def __cinit__(self, SampleConsensusModelSphere model):
        self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
        pass

    # build error
    # def __cinit__(self, model=None):
    #     if model is None:
    #         return
    #     elif isinstance(model, SampleConsensusModel):
    #         self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
    #     elif isinstance(model, SampleConsensusModelPlane):
    #         self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
    #     elif isinstance(model, SampleConsensusModelSphere):
    #         self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
    #     else:
    #         raise TypeError("Can't initialize a RandomSampleConsensus from a %s"
    #                         % type(model))
    #     pass

    # build error
    # def __init__(self, model=None):
    #     if model is None:
    #         return
    #     elif isinstance(model, type(SampleConsensusModelPlane)):
    #         self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
    #     elif isinstance(model, type(SampleConsensusModelSphere)):
    #         self.me = new pcl_sac.RandomSampleConsensus_t(<pcl_sac.SampleConsensusModelPtr_t> model.thisptr_shared)
    #     else:
    #         raise TypeError("Can't initialize a RandomSampleConsensus from a %s"
    #                         % type(model))
    #     pass

    def __dealloc__(self):
        del self.me

    def computeModel(self):
        self.me.computeModel(0)

    # base Class(SampleConsensus)
    def set_DistanceThreshold(self, double param):
        self.me.setDistanceThreshold(param)

    # base Class(SampleConsensus)
    def get_Inliers(self):
        cdef vector[int] inliers
        self.me.getInliers(inliers)
        return inliers


