classdef ImagesProcessor < gadgetron.GadgetChain
    properties
    end
    methods
        function self = ImagesProcessor()
            self.name_ = 'ImagesProcessor';
            self.handle_ = calllib('mgadgetron', 'mGT_newObject', self.name_);
            gadgetron.checkExecutionStatus(self.name_, self.handle_);
        end
        function delete(self)
            calllib('mutilities', 'mDeleteObject', self.handle_)
            self.handle_ = [];
        end
        function images = process(self, input_data)
            imgs.handle_ = calllib...
                ('mgadgetron', 'mGT_processImages', ...
                self.handle_, input_data.handle_);
            gadgetron.checkExecutionStatus(self.name_, imgs.handle_);
            images = gadgetron.ImagesList(imgs);
        end
    end
end