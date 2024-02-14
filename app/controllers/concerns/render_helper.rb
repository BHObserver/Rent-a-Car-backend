module RenderHelper
  def render_success(data, status = :ok)
    render json: data, status: status
  end

  def render_error(message, status = :unprocessable_entity)
    render json: { error: message }, status: status
  end
end
