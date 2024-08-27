Return-Path: <linux-omap+bounces-2027-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4F960D5B
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2024 16:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E4101F23751
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2024 14:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11EA1C4614;
	Tue, 27 Aug 2024 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GuLTrcOj"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4C1DFF5;
	Tue, 27 Aug 2024 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768159; cv=pass; b=nmdLmO1w4S22zdV2ynZSUmJVYqLT4iWWq+MPnVZY/lNDIZ6IDZF0aD3vyu9rN697/PKDFxtgzVb/s5lGMYP9vUMFVUpLhNNOx7pYhVK6DchFM+fpNZcIqNyqPmKdngLwzyUWb96WQ6jplVqtAa34rP1nT0WTM5KDMgJRoB+1h3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768159; c=relaxed/simple;
	bh=nTVhOVCIP89BCAX4g/41ySPqi/xcC+80eYJA4jvAeb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dawzjBgkOHHZJ8T8IS8KlAlQEnZbEPD7fQvz12lWzw1E6qObyU//aNnVd5HAcsna+T5VLkl/dIYB+t4OlVAVmaGlm7gf13lWEuO6Md1DwIOOjm9lyFd1Y6nS/exIUYOeMMmX2pK0O3eYEvYENnz9g0YZQX/Qv4+Y00vKYqFidq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GuLTrcOj; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WtV2C56krz49Q44;
	Tue, 27 Aug 2024 17:15:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724768149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKYvXpJS62xLbIhNVPi2GA6XAl6FOhp0wDIum6Cn7Sg=;
	b=GuLTrcOjhwkQglGpjy+xoMZrQyFl8RgSN/5cFaEvfoMT66611KT6SgL7iM2UTlzPaS9qZy
	DNpZnt3az3/7Z+3OuKyMQLM44dJEb1eBKPJjXt6WfCq+7pGFzwRMmA1CWMpiZJohOHjLl4
	Tocdh0WML/dIOXWyT1ZZiQiJB5kSuymf/dzkGKem8qsKZ/dIl6gktOoH7/0lWmIP7hCEBw
	lP6P7j1vsjakTaqpogJUoJR6ZNsVHBhMPc3l0fMZTtSP+tNFLtRP5jgkHWtJVvjsqm0/nA
	81BSdK5Fkdzibc0ayayLGbsmeQajFsdnN3Azs82+SmveWBcZjg9skPCflKxyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1724768149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKYvXpJS62xLbIhNVPi2GA6XAl6FOhp0wDIum6Cn7Sg=;
	b=gPAL9vZHFElW7JQJLHmvXEOMY/pMB+2D2N9+heOQ0YgG/kQqRqY5ZdJuXjMT/Y4saNtMMG
	xcW30f1kd9Ygcj2Fp+XNaaKd/edipJYtv0cE8YfYasJGQceKWzoI/5xzr5itCRZUrwRCnX
	pTurn7jvI9ZfG4c3EE0PU/J56pfzUlu+xyKrBuZoT/QecYCeMfXPqm6dvIaF9qFgPATe42
	d9wHP3lu+a0zxdY7fET2xbRBUUWLwtYIj+wjeKqXaDCnvXIhjSvnbd+twA62KJ0UnMlusD
	bgiwb+Nj9jVVTgjHVkMOt3DQqWE5QJ8RMKi05AIfZjvM4VYBCE469Sibvz1VeA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724768149; a=rsa-sha256;
	cv=none;
	b=K3SYGdAtU10DUuKaGGwIW5dqUdDnrNiK236yvDSGLNT9NWDj6c5NnO382nCKNRONmP3hdU
	s31S3yqAybTx4keEJFvpLG0oJL4R7AuJPJtcyq+uABjjMHC5Y9TI36ENdsu62ilex/6qqe
	u0crr5OOoaHRtnVpFT/DnWSPfhT/ahdbAVp8rr2rMqLMNflM7INjuYDpsEJAHm2RQMGCSC
	GZDXdTf3lEpSdueQTGc7b8TkVFZ22OJFgD7XaS/2Re+GK6n27PCBPZbP6f+OOsUrqrmPek
	wdsCrbmQw1kWpbXw8p5OdifSFPgjNEnFl4YkLnIaX946UzF1j7cZ/fenYrlpRQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 700C1634C93;
	Tue, 27 Aug 2024 17:15:47 +0300 (EEST)
Date: Tue, 27 Aug 2024 14:15:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/9] of: property: add
 of_graph_get_next_port_endpoint()
Message-ID: <Zs3fk-buU8Z-wwz3@valkosipuli.retiisi.eu>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
 <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
 <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>

Hi Rob,

On Tue, Aug 27, 2024 at 09:05:02AM -0500, Rob Herring wrote:
> On Tue, Aug 27, 2024 at 5:47 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Rob, Kunimori-san,
> >
> > On Mon, Aug 26, 2024 at 10:40:09AM -0500, Rob Herring wrote:
> > > On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> > > > We already have of_graph_get_next_endpoint(), but it is not
> > > > intuitive to use in some case.
> > >
> > > Can of_graph_get_next_endpoint() users be replaced with your new
> > > helpers? I'd really like to get rid of the 3 remaining users.
> >
> > The fwnode graph API has fwnode_graph_get_endpoint_by_id() which can also
> > be used to obtain endpoints within a port. It does the same than
> > of_graph_get_endpoint_by_regs() with the addition that it also has a
> > flags field to allow e.g. returning endpoints with regs higher than
> > requested (FWNODE_GRAPH_ENDPOINT_NEXT).
> 
> Looks to me like FWNODE_GRAPH_ENDPOINT_NEXT is always used with
> endpoint #0. That's equivalent to passing -1 for the endpoint number
> with the OF API.

If the caller needs a single endpoint only, then the two are the same, yes.
The NEXT flag can still be used for obtaining further endpoints, unlike
setting endpoint to -1 in of_graph_get_endpoint_by_regs(). 

> 
> > Most users dealing with endpoints on fwnode property API use this, could
> > something like this be done on OF as well? Probably a similar flag would be
> > needed though.
> 
> I had fixed almost all the OF cases at one point. Unfortunately, there
> were a few corner cases that I didn't address to eliminate the API. So
> now it has proliferated with the fwnode API.

Much of the usage of fwnode_graph_get_next_endpoint() is conversion from
the OF API but there are some newer drivers, too. I admit I've sometimes
missed this in review. At the same time I can say most users in the media
tree do employ fwnode_graph_get_endpoint_by_id() already.

The good thing is that almost all current users are camera sensors and
converting them is fairly trivial. I can post patches but it'll take a
while...

-- 
Kind regards,

Sakari Ailus

