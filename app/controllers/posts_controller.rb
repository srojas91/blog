class PostsController < ApplicationController
	#Metodo para reutilizar el codigo en varios metodos
	#el metodo llamara a otro que se encarga de buscar el post
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	#Metodo principal, carga todos los post ordenados
	#por el ultimo que se creo
  def index
  	@post = Post.all.order("created_at DESC")
  end
  #Metodo para cargar formulario de nuevo post
  def new
  	@post = Post.new
  end
#Metodo para crear nuevo post, utilizando parametros 
#permitidos, luego si guardo lo manda al nuevo post
#sino recarga el fomulario para post
  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end

  end
#Muestra el post de acuerdo al id enviado por parametro
def show
	
end

def edit
	
end

def update
 
	if @post.update(post_params)
		redirect_to @post
	else
		render 'edit'
	end
end

def destroy
	@post.destroy
	redirect_to root_path
end

#Metodo que valida que datos se van a ingresar en 
#la base de datos, parametros especificos

private

def find_post
@post = Post.find(params[:id]) 
 end

def post_params

	params.require(:post).permit(:title, :body)
end

end
