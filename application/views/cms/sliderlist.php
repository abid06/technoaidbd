<?php
if (isset($slider) && count($slider))
{
    ?>
       
                <?php foreach ($slider as $slide): ?>
                    <div class="row">
                        <div class="col-md-2">
                            <img height="50px;" src="<?php echo base_url().$slide['image_path'];?>" alt="Slide">
                        </div>
                        <div class="col-md-10">

                             <label class="badge">Title :</label> <?php echo $slide['caption_title']; ?><br/>
                             <label class="label  label-primary">Subtitle:</label> <?php echo $slide['caption_subtitle']; ?>
                        </div>
                    </div>
                        
                            <div class="caption-group">
                              
                            <a  class="delete_file_link caption button-radius" data-file_id="<?php echo $slide['id'];?>"><i class=" icon-trash"> Delete</i></a>
                            </div>
                       
                     <hr/>   
                        

                <?php endforeach; ?>
        
    </form>
    <?php
}

?>