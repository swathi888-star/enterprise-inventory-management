from datetime import date,datetime
from flask import Flask, abort, render_template, redirect, url_for, flash,session
from flask_bootstrap import Bootstrap5
# from flask_ckeditor import CKEditor
#from flask_gravatar import Gravatar
from flask_login import UserMixin, login_user, LoginManager, current_user, logout_user
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import  DeclarativeBase, Mapped, mapped_column
from sqlalchemy import Integer, String, ForeignKey
from functools import wraps
from werkzeug.security import generate_password_hash, check_password_hash
from sqlalchemy.orm import relationship
# Import your forms from the forms.py
from forms import CreateItemForm, RegisterForm, LoginForm, LeadForm, LeadUpdateForm
from dotenv import load_dotenv
import os, smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText



'''
On Windows type:
python -m pip install -r requirements.txt
This will install the packages from the requirements.txt for this project.
'''
load_dotenv()  # loads values from .env


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///inventory_management.db'

app.config['SECRET_KEY'] = '8BYkEfBA6O6donzWlSihBXox7C0sKR6b'
Bootstrap5(app)

# Configure Flask-Login
login_manager = LoginManager()
login_manager.init_app(app)


@login_manager.user_loader
def load_user(user_id):
    return db.get_or_404(Users, user_id)


# CREATE DATABASES

class Base(DeclarativeBase):
    pass
app.config['SQLALCHEMY_DATABASE-URI']='sqlite:///inventory_management.db'
db=SQLAlchemy(model_class=Base)
db.init_app(app)

# CONFIGURE TABLES
class Inventory(db.Model):
    __tablename__ = "inventory"
    inventory_id: Mapped[int] = mapped_column(Integer, primary_key=True,autoincrement=True)
    product_SKU:Mapped[str]=mapped_column(String(250),nullable=False)
    purchase_date:Mapped[str]=mapped_column(String(250),nullable=False)
    warranty_end_date: Mapped[str] = mapped_column(String(250), nullable=False)
    quantity: Mapped[int] = mapped_column(Integer, nullable=False)
    purchase_cost: Mapped[Integer] = mapped_column(Integer, nullable=False)
    product_info: Mapped[str] = mapped_column(String(500), nullable=False)
    division: Mapped[str] = mapped_column(String(100), nullable=False)
    brand: Mapped[str] = mapped_column(String(100), nullable=False)
    country_of_origin: Mapped[str] = mapped_column(String(100), nullable=False)
    unit_price: Mapped[int] = mapped_column(Integer, nullable=False)
    # Foreign key to InventoryLookup
    status_id: Mapped[int] = mapped_column(Integer, ForeignKey("inventory_lookup.status_id"), default=1)
    status: Mapped["InventoryLookup"] = relationship("InventoryLookup", back_populates="availability")
    # One inventory item can be linked to many leads
    leads: Mapped[list["Leads"]] = relationship("Leads", back_populates="inventory_detail")


class InventoryLookup(db.Model):
    __tablename__ = "inventory_lookup"
    status_id: Mapped[int] = mapped_column(Integer, primary_key=True,autoincrement=True)
    name: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(String(250),nullable=False)
    availability: Mapped[list["Inventory"]] = relationship("Inventory", back_populates="status")


#Create LeadStatusLookup,LeadSourceLookup,Leads,OrderStatusLookup,Orders,Users databases.
#Learn to assign parent and child relationships to tables.
class LeadStatusLookup(db.Model):
    __tablename__ = "lead_statuslookup"

    status_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(String(250), nullable=False)
    # One status can be linked to many leads
    leads: Mapped[list["Leads"]] = relationship("Leads", back_populates="status")

class LeadSourceLookup(db.Model):
    __tablename__ = "lead_sourcelookup"

    source_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(String(250), nullable=False)
    # One source can be linked to many leads
    origin: Mapped[list["Leads"]] = relationship("Leads", back_populates="source")

class Leads(db.Model):
    __tablename__ = "leads"

    lead_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    # Foreign key to Inventory
    inventory_id: Mapped[int] = mapped_column(Integer, ForeignKey("inventory.inventory_id"))
    inventory_detail: Mapped["Inventory"] = relationship("Inventory", back_populates="leads")
    #Todo: Check later on if you can store the date in date format and make changes everywhere before deploying.
    lead_date: Mapped[str] = mapped_column(
        String(10),
        default=lambda: datetime.now(timezone.utc).date().isoformat(),
        nullable=False
    )
    quantity: Mapped[int] = mapped_column(Integer, nullable=False)
    customer: Mapped[str] = mapped_column(String(250), nullable=False)
    # Foreign key to LeadSourceLookup
    source_id: Mapped[int] = mapped_column(Integer, ForeignKey("lead_sourcelookup.source_id"))
    source: Mapped["LeadSourceLookup"] = relationship("LeadSourceLookup", back_populates="origin")
    probability: Mapped[int] = mapped_column(Integer, nullable=False)
    # Foreign key to Users
    user_id: Mapped[int] = mapped_column(Integer, ForeignKey("users.user_id"))
    user: Mapped["Users"] = relationship("Users", back_populates="leads")
    sales_person: Mapped[str] = mapped_column(String(250), nullable=False)
    status_id: Mapped[int] = mapped_column(Integer, ForeignKey("lead_statuslookup.status_id"))
    status: Mapped["LeadStatusLookup"] = relationship("LeadStatusLookup", back_populates="leads")
    # One lead has one order
    offer: Mapped["Orders"] = relationship("Orders", back_populates="lead", uselist=False)


class OrderLookup(db.Model):
    __tablename__ = "order_lookup"
    status_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(250), nullable=False)
    description: Mapped[str] = mapped_column(String(250), nullable=False)
    orders: Mapped[list["Orders"]] = relationship("Orders", back_populates="status")

class Orders(db.Model):
    __tablename__ = "orders"
    order_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    date: Mapped[str] = mapped_column(String(250), nullable=False)
    value: Mapped[Integer] = mapped_column(Integer, nullable=False)
    # One-to-one with Leads
    # One order belongs to one lead
    lead_id: Mapped[int] = mapped_column(Integer, ForeignKey("leads.lead_id"), unique=True)
    lead: Mapped["Leads"] = relationship("Leads", back_populates="offer", uselist=False)
    # Foreign key to OrderLookup
    status_id: Mapped[int] = mapped_column(Integer, ForeignKey("order_lookup.status_id"))
    status: Mapped["OrderLookup"] = relationship("OrderLookup", back_populates="orders")


class Users(db.Model,UserMixin):
    __tablename__ = "users"
    user_id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    # manager=relationship("Leads",back_populates="user")
    leads: Mapped[list["Leads"]] = relationship("Leads", back_populates="user")

    name: Mapped[str] = mapped_column(String(100), nullable=False)
    region: Mapped[str] = mapped_column(String(100), nullable=False)
    email: Mapped[str] = mapped_column(String(100), unique=True)
    password: Mapped[str] = mapped_column(String(100))
#IDE issue check did this. can check and delete this part of code later.
    def __init__(self, name: str, region: str, email: str, password: str):
        self.name = name
        self.region = region
        self.email = email
        self.password = password

    def get_id(self):
        return str(self.user_id)


#Learn to display inventory in form of table in homepage (index.html)

with app.app_context():
    db.create_all()


# Create an admin-only decorator
def admin_only(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        # If id is not 1 then return abort with 403 error
        if current_user.user_id != 301:
            return abort(403)
        # Otherwise continue with the route function
        return f(*args, **kwargs)

    return decorated_function

def build_user_activities(user_id):
    # user = Users.query.get_or_404(user_id)
    leads = Leads.query.filter_by(user_id=user_id).all()
    # orders = Orders.query.filter_by(user_id=leads.user_id).all()
    # Normalize into a timeline list
    activities = []

    for lead in leads:
        inv = Inventory.query.get(lead.inventory_id)
        activities.append({
            "type": "Lead",
            "id": lead.lead_id,
            "product": inv.product_SKU,
            "description": inv.product_info,
            "quantity": lead.quantity,
            "status": lead.status.name,
            "date": datetime.strptime(lead.lead_date, "%Y-%m-%d").date(),
            "updatable": lead.status.name not in ["Won", "Lost"]
        })
        # Fetch the order linked to this lead (if any)
        # order = Orders.query.filter_by(lead_id=lead.id).first()
        # if order:
        if lead.offer:
            activities.append({
                                  "type": "Order",
                                  "id": lead.offer.order_id,
                                  # "product": lead.order.lead.inventory.product_SKU,
                                  # "description": lead.order.lead.inventory.product_info,
                                  "quantity": lead.quantity,
                                  "value": lead.offer.value,
                                  "status_name": lead.offer.status.name,
                                  "date": datetime.strptime(lead.offer.date, "%Y-%m-%d").date(),
                                  "updatable": False
            })
    activities = sorted(activities, key=lambda x: x["date"], reverse=True)
    return activities


# Register new users into the User database
@app.route('/register', methods=["GET", "POST"])
def register():
    form = RegisterForm()
    if form.validate_on_submit():

        # Check if user email is already present in the database.
        result = db.session.execute(db.select(Users).where(Users.email == form.email.data))
        user = result.scalar()
        if user:
            # User already exists
            flash("You've already signed up with that email, log in instead!")
            return redirect(url_for('login'))

        hash_and_salted_password = generate_password_hash(
            form.password.data,
            method='pbkdf2:sha256',
            salt_length=8
        )
        new_user = Users(
            name=form.name.data,
            region=form.region.data,
            email=form.email.data,
            password=hash_and_salted_password,
        )
        db.session.add(new_user)
        db.session.commit()
        # This line will authenticate the user with Flask-Login
        login_user(new_user)
        return redirect(url_for("show_inventory"))
    return render_template("register.html", form=form, current_user=current_user)


@app.route('/login', methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        password = form.password.data
        result = db.session.execute(db.select(Users).where(Users.email == form.email.data))
        # Note, email in db is unique so will only have one result.
        user = result.scalar()
        # Email doesn't exist
        if not user:
            flash("That email does not exist, please try again.")
            return redirect(url_for('login'))
        # Password incorrect
        elif not check_password_hash(user.password, password):
            flash('Password incorrect, please try again.')
            return redirect(url_for('login'))
        else:
            login_user(user)
            return redirect(url_for('show_inventory'))

    return render_template("login.html", form=form, current_user=current_user)

#if logged out, should show welcome page or login page.
@app.route('/logout')
def logout():
    logout_user()
    return render_template("welcome.html")

#show a welcome page initially and then after login go to index.html with inventory details.
@app.route('/')
def welcome():
    # If user is logged in, redirect to get_all_items
    if current_user.is_authenticated:
        return redirect(url_for('show_inventory'))
    return render_template('welcome.html')

@app.route('/home')
def show_inventory():
    if current_user.is_authenticated:
        result = db.session.execute(db.select(Inventory))
        items = result.scalars().all()
        return render_template("index.html", items=items,current_user=current_user)
    else:
        return redirect(url_for('welcome'))


#this is to insert a new inventory item.changes in index.html pending.

# Use a decorator so only an admin user can create new posts
@app.route("/new-item", methods=["GET", "POST"])
@admin_only
def add_new_inventory():
    form = CreateItemForm()
    if form.validate_on_submit():
        new_item = Inventory(
            product_SKU=form.product_SKU.data,
            purchase_date=form.purchase_date.data,
            warranty_expiry_date=form.warranty_expiry_date.data,
            quantity=form.quantity.data,
            purchase_cost=form.purchase_cost.data,
            product_info=form.product_info.data,
            division=form.division.data,
            brand=form.brand.data,
            country_of_origin=form.country_of_origin.data,
            unit_price=form.unit_price.data
        #date=date.today().strftime("%B %d, %Y")
        )
        db.session.add(new_item)
        db.session.commit()
        return redirect(url_for("show_inventory"))
    return render_template("add-inventory.html", form=form, current_user=current_user)

#this is to edit inventory items, can only edit status, qty and unit_price.
# changes in index.html pending.

# Use a decorator so only an admin user can edit a post
@app.route("/edit-item/<int:inventory_id>", methods=["GET", "POST"])
@admin_only
def edit_inventory(inventory_id):
    item = db.get_or_404(Inventory, inventory_id)
    edit_form = CreateItemForm(
        quantity=item.quantity,
        unit_price=item.unit_price,
        status_id=item.status_id
    )
    # Populate choices only for edit
    edit_form.status_id.choices = [
        (s.status_id, s.name) for s in InventoryLookup.query.all()
    ]
    if edit_form.validate_on_submit():
            item.quantity = edit_form.quantity.data
            item.unit_price = edit_form.unit_price.data
            item.status_id = edit_form.status_id.data
            db.session.commit()
            return redirect(url_for("show_inventory"))
    return render_template("add-inventory.html", form=edit_form, is_edit=True, current_user=current_user)

#Done here. changes in index.html pending.

# Use a decorator so only an admin user can delete a post
@app.route("/delete/<int:inventory_id>")
@admin_only
def delete_inventory(inventory_id):
    item_to_delete = db.get_or_404(Inventory, inventory_id)
    db.session.delete(item_to_delete)
    db.session.commit()
    return redirect(url_for('show_inventory'))

#should capture all the entries in the leadform and put it into the Db.
@app.route("/new-lead/<int:inventory_id>",methods=["GET", "POST"])
def add_new_lead(inventory_id):
    form = LeadForm()
    if form.validate_on_submit():
        new_lead = Leads(
            inventory_id=inventory_id,
            user_id=current_user.user_id,
            quantity=form.quantity.data,
            customer=form.customer.data,
            source_id=form.source_id.data,
            probability=form.probability.data,
            sales_person=form.sales_person.data,
            status_id=form.status_id.data,
            lead_date = date.today().strftime("%Y-%m-%d")
        )
        db.session.add(new_lead)
        db.session.flush()
        flash("Lead added successfully!", "success")
        # if lead status is Won. It has to be recorded as order.
        if form.status_id.data == 25:
            inventory = Inventory.query.get(inventory_id)
            if inventory.quantity >= new_lead.quantity:
                inventory.quantity -= new_lead.quantity
                new_order = Orders(
                    lead_id=new_lead.lead_id,
                    date=date.today().strftime("%Y-%m-%d"),
                    value=new_lead.quantity * inventory.unit_price,
                    status_id=101,  # e.g., default "Confirmed" from StatusLookup
                )
                db.session.add(new_order)
                if inventory.quantity <= 2:
                    inventory.status_id = 2
                flash("Lead won! Order created successfully.", "success")
            else:
                flash("Not enough inventory to fulfill this order.", "danger")
        db.session.commit()
        return redirect(url_for("show_inventory"))
    return render_template("add-lead.html", form=form, current_user=current_user,inventory_id=inventory_id,mode="add")

@app.route('/lead/<int:lead_id>/update', methods=['GET', 'POST'])
def update_lead(lead_id):
    lead = Leads.query.get_or_404(lead_id)
    form = LeadUpdateForm(obj=lead)
    success_count = 0

    if form.validate_on_submit():
        lead.quantity = form.quantity.data
        lead.status_id = form.status_id.data
        lead.lead_date = date.today().strftime("%Y-%m-%d")
        db.session.commit()
        success_count+=1
        inventory = Inventory.query.get(lead.inventory_id)

        # if after update, lead status =Won, it has to be recorded in the order table.
        if lead.status == "Won":
            if inventory.quantity >= lead.quantity:
                inventory.quantity -= lead.quantity
                new_order = Orders(
                    lead_id=lead.lead_id,
                    date=lead.lead_date,
                    value=lead.quantity * lead.inventory.unit_price,
                    status_id=101,  # e.g., default "Confirmed" from StatusLookup
                )
                db.session.add(new_order)
                db.session.commit()
                lead.status_id = 25
                success_count+=1
            else:
                flash("Not enough inventory to fulfill this order.", "danger")
                return redirect(url_for("user_activity", user_id=current_user))
            if inventory.quantity<=2:
                inventory.status_id=2
        else:
            success_count+=1

        if success_count > 0:
            flash(f"{success_count} lead actions completed successfully.", "success")

        return redirect(url_for("user_activity", user_id=current_user.get_id()))
    return render_template("add-lead.html", form=form, lead=lead, inventory_id=lead.inventory_id,mode="edit")

#should display all the leads and orders booked by the user with update options.
# If lead lost or order booked cannot update. In activity.html, have an option to send email.

@app.route('/activity')

def user_activity():
    activities = build_user_activities(current_user.user_id)
    current_date = date.today()
    return render_template('activity.html', activities=activities, current_date=current_date)

@app.route('/email-activity', methods=['GET'])


def email_activity():

    activities = build_user_activities(current_user.get_id())
    # format and send email using smtplib
    body = "<h3>Your Activity Summary</h3><ul>"
    for a in activities:
        if a["type"] == "Lead":
            body += f"<li><strong>{a['type']} #{a['id']}</strong> — {a['product']} — {a['description']}<br>"
            body += f"Quantity: {a['quantity']}<br>"
            body += f"Status: {a['status']}<br>"
            body += f"Date: {a['date'].strftime('%d %b %Y')}</li><br>"
        elif a["type"] == "Order":
            body += f"<li><strong>{a['type']} #{a['id']}</strong><br>"
            body += f"Value: {a['value']}<br>"
            body += f"Status: {a['status_name']}<br>"
            body += f"Date: {a['date'].strftime('%d %b %Y')}</li><br>"
    body += "</ul>"

    # smtp_server = os.getenv("SMTP_SERVER")
    smtp_server="smtp.gmail.com"
    # smtp_port = int(os.getenv("SMTP_PORT", 587))
    smtp_port=587
    sender_email="appcheckpy@gmail.com"
    sender_password="ftmtciegcxgghkvn"
    # sender_email = os.getenv("SMTP_SENDER_EMAIL")
    # sender_password = os.getenv("SMTP_SENDER_PASSWORD")
    # receiver_email = current_user.email
    receiver_email="appcheckpy@yahoo.com"
    msg = MIMEMultipart("alternative")
    msg["Subject"] = "Your Activity Summary"
    msg["From"] = sender_email
    msg["To"] = receiver_email
    msg.attach(MIMEText(body, "html"))

    try:
        with smtplib.SMTP(smtp_server, smtp_port) as server:
            server.ehlo()
            server.starttls()
            server.ehlo()
            server.login(sender_email, sender_password)
            server.sendmail(sender_email, receiver_email, msg.as_string())
        flash("Activity summary emailed successfully!", "success")
    except Exception as e:
        print(f"Error: {e}")
        app.logger.error(f"Lead update failed: {e}")
        flash("Email could not be sent. Please check your server settings.", "error")

    return redirect(url_for('user_activity'))


if __name__ == "__main__":
    app.run(debug=True, port=5001)
