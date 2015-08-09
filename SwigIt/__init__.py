bl_info = {
    "name": "FUSEE - Uniplug",
    "category": "Object",
}

import bpy

class Uniplug(bpy.types.Operator):
    """FUSEE - Uniplug"""      		  # blender will use this as a tooltip for menu items and buttons.
    bl_idname = "export.uniplug"      # unique identifier for buttons and menu items to reference.
    bl_label = "FUSEE - Uniplug"       # display name in the interface.
    bl_options = {'REGISTER', 'UNDO'}  # enable undo for the operator.

    def execute(self, context):        # execute() is called by blender when running the operator.

        from fusee import uniplug
        uniplug.init()

        return {'FINISHED'}            # this lets blender know the operator finished successfully.

def menu_func(self, context):
    self.layout.operator(Uniplug.bl_idname)
		
def register():
    bpy.utils.register_class(Uniplug)
    bpy.types.VIEW3D_MT_object.append(menu_func)

def unregister():
    bpy.utils.unregister_class(Uniplug)
    bpy.types.VIEW3D_MT_object.remove(menu_func)


# This allows you to run the script directly from blenders text editor
# to test the addon without having to install it.
if __name__ == "__main__":
    register()