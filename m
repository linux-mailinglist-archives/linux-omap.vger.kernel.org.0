Return-Path: <linux-omap+bounces-2024-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642F960CAA
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2024 15:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983A31F23742
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2024 13:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8AB1C3F0B;
	Tue, 27 Aug 2024 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1RSwg++"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D3119ADBE;
	Tue, 27 Aug 2024 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766907; cv=none; b=mn+DDtLbhNZjZf1FvzoqVD2Lcq1RmDlIGXglXw0HdGGhV0+4IpUa7W9MGi4aaEyA260M4cRRUnHXdwzoQZIK6mGoRGvP1NriIctIsywxK9cS8HT0MKcQEB3s7TDacH2aoXj97sj3BgP47NzbZB13DNZLMC7hhJd3TFOZiGp39lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766907; c=relaxed/simple;
	bh=SUBG5hoMIRO14nV0jWKUhFG2oORyt7kd2MOv6Sog22g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmJlpxTK4cSsPFhJW+dQ+JZfEMSdsblKxUdVAdNF5SlrA9am07hiHSEpXWZw5gef3rRO9e9OnK/g93q/zFsc0nyslNiiH2xmUAtB31KrDCMW4kT+yDgPxVHs+VeZOX2/mHFxFHXLq7w0i/WsTgM0Vaztvnf4rH2ws3LziPiI/2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1RSwg++; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8A9C6104C;
	Tue, 27 Aug 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724766906;
	bh=SUBG5hoMIRO14nV0jWKUhFG2oORyt7kd2MOv6Sog22g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d1RSwg++2vsw27s5mw8S0E+m9otKmoDc4aWXcdNmuuRadOumVBMJ5Z3RIJqQBGOUd
	 /GCzOiCqujhzfUTswtOAvS2x4uxA/hIWsSw9WxFzNny3Zme003ccv/o0wfMZLFVF6m
	 4mZS9CNY3CZBdR8wTZ8cJS843k3Lo4er0MWq7D3U4GSWqk1bEtRSJ1vquvKlFKBc8Y
	 3ZNy5KKmqFwT2Zxgtmh8J9vg67x/lWxrckJrBfWkei+qKLEbhP2uLN403+CEUwAQFl
	 yLEIeytnrvtvK6L14vWSu5pR5hniIa+Od3dlUdQTfQ35wo2jCwABezOXNEL5Ju1hpO
	 iErF6HvEpGrzA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-533de5a88f8so4990234e87.3;
        Tue, 27 Aug 2024 06:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVEfBjwRUI8QXbiUevc+F5ksH1/aSCQbcZS0KBGVHmL6m64HBtfI0xoqMU5Jj/NNEaG5ZD+Lv+LkWyj9w=@vger.kernel.org, AJvYcCUrWrVSyaLcfS2T09uqtSM58wiKvdV894O/wiWXlovSDOkAFqkTuQ/pCoRozz+1l7TRRi8JKafclim2sA==@vger.kernel.org, AJvYcCV3hhp9uRDqU6UqWgJ2P6Yjn+vtySR0b6X+EXtptwad9A1RuBBfD7jIQWOrdjkLvG0Zt3HEL+hOnp2fYOk=@vger.kernel.org, AJvYcCWCK4gAsiz5H2xyZYm2VJioh5ZNwvXScznveJ2HlvEJjmicxahKK6HUL0PEO+aJrsjOuWj4CRY2p65X@vger.kernel.org, AJvYcCXrm4sTGrh/IntHDvYNKI8S5vPLXpoVrzKFS3L58jGXhoeyWlWfgyQSGVjyYENKAC9bAok3I+db87AsZ7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpOyEWb7yz4RMNCKn7trseq+X0py3WppjF7g8+wlHYvzQBQ2N
	7qt0CW2SZJMyTa3g0qpv4aCRi7KssRG/NPU904K5oec5wUP4MxluFg2U35cDQ3Z6OpzAYKmwOI4
	0EHuL1B/GONP1QlF2vSZTnkxOgQ==
X-Google-Smtp-Source: AGHT+IFGoChqzPb8c5bU7g7SCtu0XFZWBbc3/ggPD1QT1E2fNBMBbbJ063/8ywSLhH92vmiZkqq4veEvdtq2nuDD85I=
X-Received: by 2002:a05:6512:31d3:b0:533:4b07:a8dc with SMTP id
 2adb3069b0e04-5344e3e4978mr2079374e87.35.1724766904825; Tue, 27 Aug 2024
 06:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com> <20240826154009.GA300981-robh@kernel.org>
 <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Aug 2024 08:54:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
Message-ID: <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>, 
	Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Jonathan C for the naming

On Mon, Aug 26, 2024 at 7:14=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> > > We already have of_graph_get_next_endpoint(), but it is not
> > > intuitive to use in some case.
> >
> > Can of_graph_get_next_endpoint() users be replaced with your new
> > helpers? I'd really like to get rid of the 3 remaining users.
>
> Hmm...
> of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port",
> but new helper doesn't have such feature.

Right, but the "feature" is somewhat awkward as you said. You
generally should know what port you are operating on.

> Even though I try to replace it with new helper, I guess it will be
> almost same as current of_graph_get_next_endpoint() anyway.
>
> Alternative idea is...
> One of the big user of of_graph_get_next_endpoint() is
> for_each_endpoint_of_node() loop.
>
> So we can replace it to..
>
> -       for_each_endpoint_of_node(parent, endpoint) {
> +       for_each_of_graph_port(parent, port) {
> +               for_each_of_graph_port_endpoint(port, endpoint) {
>
> Above is possible, but it replaces single loop to multi loops.
>
> And, we still need to consider about of_fwnode_graph_get_next_endpoint()
> which is the last user of of_graph_get_next_endpoint()

I missed fwnode_graph_get_next_endpoint() which has lots of users.
Though almost all of those are just "get the endpoint" and assume
there is only 1. In any case, it's a lot more than 3, so nevermind for
now.

> > > +struct device_node *of_graph_get_next_port_endpoint(const struct dev=
ice_node *port,
> > > +                                               struct device_node *p=
rev)
> > > +{
> > > +   do {
> > > +           prev =3D of_get_next_child(port, prev);
> > > +           if (!prev)
> > > +                   break;
> > > +   } while (!of_node_name_eq(prev, "endpoint"));
> >
> > Really, this check is validation as no other name is valid in a
> > port node. The kernel is not responsible for validation, but okay.
> > However, if we are going to keep this, might as well make it WARN().
>
> OK, will do in v4
>
> > > +/**
> > > + * for_each_of_graph_port_endpoint - iterate over every endpoint in =
a port node
> > > + * @parent: parent port node
> > > + * @child: loop variable pointing to the current endpoint node
> > > + *
> > > + * When breaking out of the loop, of_node_put(child) has to be calle=
d manually.
> >
> > No need for this requirement anymore. Use cleanup.h so this is
> > automatic.
>
> Do you mean it should include __free() inside this loop, like _scoped() ?

Yes.

> #define for_each_child_of_node_scoped(parent, child) \
>         for (struct device_node *child __free(device_node) =3D           =
 \
>              of_get_next_child(parent, NULL);                           \
>              child !=3D NULL;                                            =
 \
>              child =3D of_get_next_child(parent, child))
>
> In such case, I wonder does it need to have _scoped() in loop name ?

Well, we added that to avoid changing all the users at once.

> And in such case, I think we want to have non _scoped() loop too ?

Do we have a user? I don't think we need it because anywhere we need
the node iterator pointer outside the loop that can be done explicitly
(no_free_ptr()).

So back to the name, I don't think we need _scoped in it. I think if
any user treats the iterator like it's the old style, the compiler is
going to complain.

> For example, when user want to use the param.
>
>         for_each_of_graph_port_endpoint(port, endpoint)
>                 if (xxx =3D=3D yyy)
>                         return endpoint;
>
>         for_each_of_graph_port_endpoint_scoped(port, endpoint)
>                 if (xxx =3D=3D yyy)
>                         return of_node_get(endpoint)

Actually, you would do "return_ptr(endpoint)" here.

Rob

