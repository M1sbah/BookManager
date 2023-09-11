class CategoryPolicy < ApplicationPolicy

	def index?
		user.Admin?
	end

	def show?
		user.Admin? or user.User?
	end

	def create?
		user.Admin?
	end

	def update?
		user.Admin?
	end

	def destroy?
		user.Admin?
	end

end