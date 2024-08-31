Return-Path: <linux-omap+bounces-2070-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3719670CF
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2024 12:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9293B1F22712
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2024 10:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E801F17C230;
	Sat, 31 Aug 2024 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chdsIsiz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E5F16F0F0;
	Sat, 31 Aug 2024 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725099893; cv=none; b=cYb+ub5rCYK0IEvBeWsEc6Hrjf0roEy3iGiDbpoGLXdqpcBB2OhMgZiGFqJ7n53Qgz/9z42GXq/ic2FsECDWfA9fLfWuC6fO1aFrZZlh7IrehJtE4abg8HXSufKwvIJ2KeFcC2a4oM7d5Ck01WmMZdz5v1QVz9hFZstvraAEsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725099893; c=relaxed/simple;
	bh=JaObuWEZUK4FTWTxsswtHtStwRyczcdv8rTcV+HpaGw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/le89ibVosI3r6eIiz7ahoTp1SlaS41J7wyqBF1hCvx6K2ybWPjsZ/2BevurzjeRf0KDtdFp+kAAOEkqElCrB9WmrnrdwTqoWLCLpoK0oAf6lgNevVzstq1XhktCG/uFBdvgz8bWkGARmyVkzDSEctNp4bewEmAwCfVThAtcZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chdsIsiz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E4EC4CEC0;
	Sat, 31 Aug 2024 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725099892;
	bh=JaObuWEZUK4FTWTxsswtHtStwRyczcdv8rTcV+HpaGw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=chdsIsiz5ob3VHxzLH2w1Ue1FUzWxdHf8pxZb/hEMYYHtKTACz1kk5v+tVOtEDhi3
	 QOK3MpTA5YITJixvJWIETE+nPnqIpqf5+xFatx4WtgBTLOfJs5wFTg+euCElNUSZ4z
	 STrsTrKhWgcg7XgpOaeOyzPj9kkb6C6JEoWQYm/AtnN0pOWn4Dy+BAB1cmXVFVa6M0
	 xZXKht1h+0JRsmMVrGXxPb4deZ9UNN1uCN3SyFQWIBGQiLEOnJC3TtFiSsE6nu56nb
	 r17wOuT47QqNhhcDRS8E9u9/RureflYXHNc+7ZLOE5pIbJbDFcCaKAAlMCfw8NDiXp
	 A9V2K43lw9BSQ==
Date: Sat, 31 Aug 2024 11:24:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Saravana
 Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org, Sakari Ailus
 <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/9] of: property: add
 of_graph_get_next_port_endpoint()
Message-ID: <20240831112440.3fa997a1@jic23-huawei>
In-Reply-To: <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
	<87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
	<20240826154009.GA300981-robh@kernel.org>
	<87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
	<CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Aug 2024 08:54:51 -0500
Rob Herring <robh@kernel.org> wrote:

> +Jonathan C for the naming
>=20
> On Mon, Aug 26, 2024 at 7:14=E2=80=AFPM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> >
> >
> > Hi Rob
> > =20
> > > > We already have of_graph_get_next_endpoint(), but it is not
> > > > intuitive to use in some case. =20
> > >
> > > Can of_graph_get_next_endpoint() users be replaced with your new
> > > helpers? I'd really like to get rid of the 3 remaining users. =20
> >
> > Hmm...
> > of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port",
> > but new helper doesn't have such feature. =20
>=20
> Right, but the "feature" is somewhat awkward as you said. You
> generally should know what port you are operating on.
>=20
> > Even though I try to replace it with new helper, I guess it will be
> > almost same as current of_graph_get_next_endpoint() anyway.
> >
> > Alternative idea is...
> > One of the big user of of_graph_get_next_endpoint() is
> > for_each_endpoint_of_node() loop.
> >
> > So we can replace it to..
> >
> > -       for_each_endpoint_of_node(parent, endpoint) {
> > +       for_each_of_graph_port(parent, port) {
> > +               for_each_of_graph_port_endpoint(port, endpoint) {
> >
> > Above is possible, but it replaces single loop to multi loops.
> >
> > And, we still need to consider about of_fwnode_graph_get_next_endpoint()
> > which is the last user of of_graph_get_next_endpoint() =20
>=20
> I missed fwnode_graph_get_next_endpoint() which has lots of users.
> Though almost all of those are just "get the endpoint" and assume
> there is only 1. In any case, it's a lot more than 3, so nevermind for
> now.
>=20
> > > > +struct device_node *of_graph_get_next_port_endpoint(const struct d=
evice_node *port,
> > > > +                                               struct device_node =
*prev)
> > > > +{
> > > > +   do {
> > > > +           prev =3D of_get_next_child(port, prev);
> > > > +           if (!prev)
> > > > +                   break;
> > > > +   } while (!of_node_name_eq(prev, "endpoint")); =20
> > >
> > > Really, this check is validation as no other name is valid in a
> > > port node. The kernel is not responsible for validation, but okay.
> > > However, if we are going to keep this, might as well make it WARN(). =
=20
> >
> > OK, will do in v4
> > =20
> > > > +/**
> > > > + * for_each_of_graph_port_endpoint - iterate over every endpoint i=
n a port node
> > > > + * @parent: parent port node
> > > > + * @child: loop variable pointing to the current endpoint node
> > > > + *
> > > > + * When breaking out of the loop, of_node_put(child) has to be cal=
led manually. =20
> > >
> > > No need for this requirement anymore. Use cleanup.h so this is
> > > automatic. =20
> >
> > Do you mean it should include __free() inside this loop, like _scoped()=
 ? =20
>=20
> Yes.
>=20
> > #define for_each_child_of_node_scoped(parent, child) \
> >         for (struct device_node *child __free(device_node) =3D         =
   \
> >              of_get_next_child(parent, NULL);                          =
 \
> >              child !=3D NULL;                                          =
   \
> >              child =3D of_get_next_child(parent, child))
> >
> > In such case, I wonder does it need to have _scoped() in loop name ? =20
>=20
> Well, we added that to avoid changing all the users at once.
>=20
> > And in such case, I think we want to have non _scoped() loop too ? =20
>=20
> Do we have a user? I don't think we need it because anywhere we need
> the node iterator pointer outside the loop that can be done explicitly
> (no_free_ptr()).
>=20
> So back to the name, I don't think we need _scoped in it. I think if
> any user treats the iterator like it's the old style, the compiler is
> going to complain.

Hmm.  Up to you but I'd be concerned that the scoping stuff is non
obvious enough that it is worth making people really really aware
it is going on.

However I don't feel strongly about it.
For the other _scoped iterators there is some push back
on the churn using them is causing so I doubt we'll ever get rid
of the non scoped variants.  For something new that's not a concern.

Jonathan

>=20
> > For example, when user want to use the param.
> >
> >         for_each_of_graph_port_endpoint(port, endpoint)
> >                 if (xxx =3D=3D yyy)
> >                         return endpoint;
> >
> >         for_each_of_graph_port_endpoint_scoped(port, endpoint)
> >                 if (xxx =3D=3D yyy)
> >                         return of_node_get(endpoint) =20
>=20
> Actually, you would do "return_ptr(endpoint)" here.
>=20
> Rob


