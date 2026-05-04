from xmlrpc.client import DateTime

from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, SelectField,HiddenField,DateField
from wtforms.fields.numeric import IntegerField
from wtforms.validators import DataRequired, NumberRange,Length,Regexp

# WTForm for registering lead
#lead_id, inv_id,date and user_id are auto collected.
# collect customer_info,lead_source (display dropdown),probability(20-100),status(dropdown),sales_person.
class CreateItemForm(FlaskForm):
    product_SKU=StringField("Product Model number",  validators=[DataRequired(),
                                            Length(min=5, max=20),
                                            Regexp(r'^[A-Za-z\s]+$',
                                            message="Only letters and spaces allowed")])
    purchase_date = DateField("Purchase Date",format="%Y-%m-%d",
                                validators=[DataRequired()],
                            render_kw={"placeholder": "YYYY-MM-DD", "type": "date"})
    warranty_end_date = DateField("Warranty End Date",format="%Y-%m-%d",
                                    validators=[DataRequired()],
                                    render_kw={"placeholder": "YYYY-MM-DD", "type": "date"})
    quantity = IntegerField("Quantity Purchase", validators=[DataRequired(),NumberRange(min=0,message="Quantity must be non‑negative")])
    purchase_cost = IntegerField("Cost of purchase", validators=[DataRequired()])
    product_info = StringField("Product Description", validators=[DataRequired(),
                                            Length(min=5, max=50),
                                            Regexp(r'^[A-Za-z\s]+$',
                                            message="Only letters and spaces allowed")])
    division = StringField("Market Division", validators=[DataRequired(),
                                            Length(min=5, max=20),
                                            Regexp(r'^[A-Za-z\s]+$',
                                            message="Only letters and spaces allowed")])
    brand = StringField("Brand name", validators=[DataRequired(),
                                            Length(min=5, max=20),
                                            Regexp(r'^[A-Za-z\s]+$',
                                            message="Only letters and spaces allowed")])
    country_of_origin=StringField("Country of Origin", validators=[DataRequired(),
                                            Length(min=5, max=20),
                                            Regexp(r'^[A-Za-z\s]+$',
                                            message="Only letters and spaces allowed")])
    unit_price= IntegerField("Selling price per unit", validators=[DataRequired()])
    status_id = SelectField(
        "Status", choices=[
        (1,"In_stock"),(2,"Low_Stock"), (3,"Aging"),
        (4,"Fast_Moving"),(5,"Slow_Moving")],
        coerce=int ,validators=[DataRequired()]
    )
    submit = SubmitField("Submit")

class LeadForm(FlaskForm):
    inventory_id = HiddenField("Inventory ID")
    user_id = HiddenField("User ID")
    quantity = IntegerField("Quantity", validators=[DataRequired(),NumberRange(min=1,message="Quantity must be non‑negative")])
    customer = StringField("Customer Institute/Company", validators=[DataRequired(),
                                            Length(min=3, max=50),
                                            Regexp(r'^[A-Za-z\s]+$',
                                            message="Only letters and spaces allowed")])

    source_id= SelectField(
        "Lead Source",choices=[
            (11,"Website"), (12,"Referral"),
            (13,"Cold Call"), (14,"Email Campaign"),
            (15,"Event/Expo"), (16,"Advertisement"),
            (17,"Visit"), (18,"Tender/Enquiry")
        ],coerce=int ,
        validators=[DataRequired()]
    )
    probability=IntegerField("Rate on Scale of 10-100",
                             validators=[DataRequired(),
                             NumberRange(min=10,message="Probability must be non‑negative")])
    sales_person= StringField("Handled by", validators=[DataRequired()])
    status_id= SelectField(
        "Lead Status",choices=[
            (21,"Hot"), (22,"Warm"),
            (23,"Cold"),(24, "Lost"),
            (25,"Won"),(26, "Demo Scheduled"),
            (27,"Negotiation"), (28,"Tendered"),
            (29,"Qualified"), (30,"New Lead"),
            (31,"On Hold"), (32,"Deferred"),
        ],coerce=int,
        validators=[DataRequired()]
    )
    submit = SubmitField("Submit")

class LeadUpdateForm(FlaskForm):
    quantity= IntegerField("Quantity", validators=[DataRequired()])
    status_id = SelectField(
        "Lead Status", choices=[
            (21, "Hot"), (22, "Warm"),
            (23, "Cold"), (24, "Lost"),
            (25, "Won"), (26, "Demo Scheduled"),
            (27, "Negotiation"), (28, "Tendered"),
            (29, "Qualified"), (30, "New Lead"),
            (31, "On Hold"), (32, "Deferred"),
        ], coerce=int,
        validators=[DataRequired()]
    )
    submit = SubmitField("Submit")
#The Order form pops up only after lead is converted to order, triggered through leadform.
# Auto generates order_id, date recorded, order value collected.

#form to insert and edit inventory if user is admin.

# Create a form to register new users
class RegisterForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired()])
    password = PasswordField("Password", validators=[DataRequired()])
    name = StringField("Name", validators=[DataRequired()])
    region=StringField(label="Region",validators=[DataRequired()])
    submit = SubmitField("Sign Me Up!")


# Create a form to login existing users
class LoginForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired()])
    password = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Let Me In!")


#
