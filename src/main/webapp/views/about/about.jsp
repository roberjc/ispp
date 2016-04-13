<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Main content -->
<div class="page-wrap container">
	<div class="col-md-12 no-padding">
		<div class="row">
			<div class="col-md-6">
				<!-- Video content -->
				<div class="video">
					<iframe
						src="https://www.youtube.com/embed/FsmQo25eRps?autoplay=1"
						class="full-video" height="300"></iframe>
				</div>
				<!-- Video content -->
			</div>
			<div class="col-md-6">
				<h4>Welcome Video</h4>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
					Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque
					penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
				<div class="space20"></div>
				<p>Donec quam felis, ultricies nec, pellentesque eu, pretium
					quis, sem. Nulla consequat massa quis enim. Donec pede justo,
					fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,
					rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum
					felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.
					Vivamus elementum semper nisi.</p>
			</div>
		</div>
	</div>

	<div class="divider"></div>
	<div class="space30"></div>

	<!-- Team content -->
	<h3 class="head-title">Meet the Team</h3>
	<div class="row team-wrap">
		<div class="col-md-12 no-padding">
			<div class="col-md-6">
				<div class="team-author">
					<img src="images/demo/team/fran.png" alt="img" />
				</div>
				<div class="team-info">
					<h4>Francisco J. Macías</h4>
					<h6>
						<em>Project Manager</em>
					</h6>
					<p><a target="target" href="mailto:framacgar1@alum.us.es"><i class="fa fa-envelope-o"></i> framacgar1@alum.us.es</a></p>
					<p><a target="target" href="https://github.com/roberjc"><i class="icon-github3"></i> roberjc</a></p>
					<p><a target="target" href="https://es.linkedin.com/in/roberto-jiménez-5150a5b6"><i class="fa fa-linkedin"></i> Roberto Jiménez Castillo</a></p>
					<br />
					<br />
					<br />
				</div>
			</div>
			<div class="col-md-6">
				<div class="team-author">
					<img src="images/demo/team/vladi.png" alt="img" />
				</div>
				<div class="team-info">
					<h4>Vladimir Rico</h4>
					<h6>
						<em>Spokeman</em>
					</h6>
					<p><a target="target" href="mailto:vlaricheb@alum.us.es"><i class="fa fa-envelope-o"></i> vlaricheb@alum.us.es</a></p>
					<p><a target="target" href="https://github.com/roberjc"><i class="icon-github3"></i> roberjc</a></p>
					<p><a target="target" href="https://es.linkedin.com/in/roberto-jiménez-5150a5b6"><i class="fa fa-linkedin"></i> Roberto Jiménez Castillo</a></p>
					<br />
					<br />
					<br />
				</div>
			</div>
			<div class="col-md-6">
				<div class="team-author">
					<img src="images/demo/team/juan.png" alt="img" />
				</div>
				<div class="team-info">
					<h4>Juan García-Quismondo</h4>
					<h6>
						<em>Analyst</em>
					</h6>
					<p><a target="target" href="mailto:juagarfer4@alum.us.es"><i class="fa fa-envelope-o"></i> juagarfer4@alum.us.es</a></p>
					<p><a target="target" href="https://github.com/roberjc"><i class="icon-github3"></i> roberjc</a></p>
					<p><a target="target" href="https://es.linkedin.com/in/roberto-jiménez-5150a5b6"><i class="fa fa-linkedin"></i> Roberto Jiménez Castillo</a></p>
					<br />
					<br />
					<br />
				</div>
			</div>
			<br /><br />
			<div class="col-md-6">
				<div class="team-author">
					<img src="images/demo/team/robe.png" alt="img" />
				</div>
				<div class="team-info">
					<h4>Roberto Jiménez</h4>
					<h6>
						<em>Designer</em>
					</h6>
					<p><a target="target" href="mailto:robjimcas@alum.us.es"><i class="fa fa-envelope-o"></i> robjimcas@alum.us.es</a></p>
					<p><a target="target" href="https://github.com/roberjc"><i class="icon-github3"></i> roberjc</a></p>
					<p><a target="target" href="https://es.linkedin.com/in/roberto-jiménez-5150a5b6"><i class="fa fa-linkedin"></i> Roberto Jiménez Castillo</a></p>
					<br />
					<br />
					<br />
				</div>
			</div>
			<br /><br />
			<div class="col-md-6">
				<div class="team-author">
					<img src="images/demo/team/alfre.png" alt="img" />
				</div>
				<div class="team-info">
					<h4>Alfredo Menéndez</h4>
					<h6>
						<em>Developer</em>
					</h6>
					<p><a target="target" href="mailto:alfmencha@alum.us.es"><i class="fa fa-envelope-o"></i> alfmencha@alum.us.es</a></p>
					<p><a target="target" href="https://github.com/roberjc"><i class="icon-github3"></i> roberjc</a></p>
					<p><a target="target" href="https://es.linkedin.com/in/roberto-jiménez-5150a5b6"><i class="fa fa-linkedin"></i> Roberto Jiménez Castillo</a></p>
					<br />
					<br />
					<br />
				</div>
			</div>
			<br /><br />
			<div class="col-md-6">
				<div class="team-author">
					<img src="images/demo/team/ruben.png" alt="img" />
				</div>
				<div class="team-info">
					<h4>Rubén Ramírez</h4>
					<h6>
						<em>Developer</em>
					</h6>
					<p><a target="target" href="mailto:rubramver@alum.us.es"><i class="fa fa-envelope-o"></i> rubramver@alum.us.es</a></p>
					<p><a target="target" href="https://github.com/roberjc"><i class="icon-github3"></i> roberjc</a></p>
					<p><a target="target" href="https://es.linkedin.com/in/roberto-jiménez-5150a5b6"><i class="fa fa-linkedin"></i> Roberto Jiménez Castillo</a></p>
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>
	</div>

	<div class="divider"></div>
	<div class="space30"></div>

	<!-- Tabs -->
	<h3 class="head-title">Why Choose Us?</h3>
	<div class="row">
		<div class="col-md-12">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab1" data-toggle="tab">Tab
						Item 1</a></li>
				<li><a href="#tab2" data-toggle="tab">Tab Item 2</a></li>
				<li><a href="#tab3" data-toggle="tab">Tab Item 3</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<div class="row">
						<div class="col-md-6">
							<img src="images/demo/4.jpg" alt="img"
								class="img-square pull-left img-left">
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, nascetur
								ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,
								pretium quis, sem. Nulla consequat massa quis enim. Donec pede
								justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim
								justo, rhoncus ut, imperdiet a, venenatis.</p>
						</div>
						<div class="col-md-6">
							<h5 class="white">Awesome</h5>
							<p>Aenean massa. Cum sociis natoque penatibus et magnis dis
								parturient montes, nascetur ridiculus mus.</p>
							<div class="space20"></div>
							<h5 class="white">Sauce</h5>
							<p>Donec quam felis, ultricies nec, pellentesque eu, pretium
								quis, sem. Nulla consequat massa quis enim.</p>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab2">
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
						Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque
						penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
					<div class="space20"></div>
					<p>Donec quam felis, ultricies nec, pellentesque eu, pretium
						quis, sem. Nulla consequat massa quis enim. Donec pede justo,
						fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,
						rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum
						felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.
						Vivamus elementum semper nisi.</p>
				</div>
				<div class="tab-pane" id="tab3">
					<div class="row">
						<div class="col-md-6">
							<img src="images/demo/4.jpg" alt="img"
								class="img-square pull-left img-left">
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
								natoque penatibus et magnis dis parturient montes, nascetur
								ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,
								pretium quis, sem. Nulla consequat massa quis enim. Donec pede
								justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim
								justo, rhoncus ut, imperdiet a, venenatis.</p>
						</div>
						<div class="col-md-6">
							<h5 class="white">Awesome</h5>
							<p>Aenean massa. Cum sociis natoque penatibus et magnis dis
								parturient montes, nascetur ridiculus mus.</p>
							<div class="space20"></div>
							<h5 class="white">Sauce</h5>
							<p>Donec quam felis, ultricies nec, pellentesque eu, pretium
								quis, sem. Nulla consequat massa quis enim.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Main content -->