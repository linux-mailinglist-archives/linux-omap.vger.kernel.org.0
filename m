Return-Path: <linux-omap+bounces-2469-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 219059AC075
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2024 09:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7052282AB8
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2024 07:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465691553AB;
	Wed, 23 Oct 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="JY4IPgUU"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2DB154BFF;
	Wed, 23 Oct 2024 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669125; cv=pass; b=X9g4rPRcToFa76bN43kaYWuCMtcU825NPxM+no6mJpM5T8C1+PvCESufIinrNlBOBOH8xullTAIro8p3j9niaH6ykLMVC5DMEQ7YU47Rmorq+Nmw9k8NWxyFC3slNTE4KQr8Qwehi87csVJIbIuAi8zMWLkL4GR6Q4xEJuGiWgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669125; c=relaxed/simple;
	bh=NrzpukXh6P7IisrDPAmM5wk0qWZ9z3zuvZ8moxfUkxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRoY9gt2X54wWhe+uYNfJNu+8GTA2urtW4grsRBt4NA/zhJMT6elxnfviommLbpSGoYIJCkqBRXd0lwzfOnwTA2n3Yfu6DMSDSFNl4FKuOmRMUiBU7VfzIyXwxOKJloCd2rmtVeV0+1NJnrtGkQXaGvmcQ3ETJCOB43R8p6xwlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=JY4IPgUU; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XYLWf5yY6z49QG8;
	Wed, 23 Oct 2024 10:38:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1729669120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1h+F/u7tVRldbNXsJpUJj1dGS4Jj3sN0KCmaRER52UA=;
	b=JY4IPgUUebTOP68hAyVqLDne1vVPZTrNDzB7jAtDtVNYt3IqdjdGY3nb7NWUb1Ak4cmssz
	wEuHxiFPisnqTlhH226i2kq74xvqK0vShaxg1KoDTYP1QZyCdoLfWQUfo2URcJBZUPrveI
	giMrKdFIS+8wuTGm3ydFGpyYEZiWFQAyvhShlkuzJ3iDe4Irmb14RyVcloVJBgFp75qMvM
	MZWr/0uAYxgR+HQefP0Th7dRyCRNJv1MiHoYDjNCjaXdxSMSaC6LPO0tW3cBmgikaTUacl
	j67M/RxZ6vHPbK6+mgixdLEgfyOIzT5m87t863zfc8KwCtaQ4/CS9omSESZ3BQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1729669120; a=rsa-sha256;
	cv=none;
	b=FvfpxZPPmgr9hTE7bsNVnfE+TfCOBlj0mDd/nFOWogNn/0jz28Yl8iUV8KJcVZ1oNPVK6P
	xmXME5c2wgvTpFZOWL8cKSaYpooYMPbxInmzGez0mZdauQIjjcgq3TtULPC+rDuENlc/TZ
	PojAXNqwA2smd+Uflbnpr91Ag5dkOlwQKr7EuoPboOZkzUIUOzuCRavvxzbG5Jv764DHtr
	veULu9SdmGdJJX8SQ3ZjDS8mIqWY12u1ZK5yZoaTNawBI4VonOBiFCK1VU78WmdbtPJFiW
	9vF4uU/EWjs+i4VcbWYM9QfbpW+WvWnMD5xWwEcUao2nwlnThXPMlfExc919aQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1729669120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1h+F/u7tVRldbNXsJpUJj1dGS4Jj3sN0KCmaRER52UA=;
	b=h1RgPKM0i5vhy0NAvI3YP9focSGtw0oHdw30Pq7UljFoAXWEiNXjVkgOu8Dm35/2kJWHs6
	HIl0HMv9iEZ9gJgw9/hEfKz25xAFilvPNxUeyj7EYYEoemOHClh0G8dyV+cs/CdYxzcFwq
	D6VpRkKPSLnZD4+K8Q3NLyQzTAmrIraMq8VPGySpvMDP8nqtuSKd3X30U3jN7FBep9K0Cn
	Go/eHa6urAYA1NWZC2jE1xZNZabuk4P9DijkfMOcQoPnJvg5nS9GzIGWt/L70fGlu4qGH2
	8HQv8MG3qRMQEyFh7vvWLS6PxiRaxVpAGvFkg09xiSMP6FGSk3s3Vl451pYZKw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C563F634C94;
	Wed, 23 Oct 2024 10:38:36 +0300 (EEST)
Date: Wed, 23 Oct 2024 07:38:36 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
Message-ID: <Zxin_DeoTPjZ0enu@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
 <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
 <87y12fwhwy.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y12fwhwy.wl-kuninori.morimoto.gx@renesas.com>

Dear Morimoto-san,

On Wed, Oct 23, 2024 at 04:40:45AM +0000, Kuninori Morimoto wrote:
> 
> Hi Sakari, again
> 
> > > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > > index 11b922fde7af..6a5d27dd0c64 100644
> > > --- a/drivers/of/property.c
> > > +++ b/drivers/of/property.c
> > > @@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
> > >  }
> > >  EXPORT_SYMBOL(of_graph_get_port_by_id);
> > >  
> > > +/**
> > > + * of_graph_get_next_port() - get next port node.
> > > + * @parent: pointer to the parent device node, or parent ports node
> > > + * @prev: previous port node, or NULL to get first
> > > + *
> > > + * Parent device node can be used as @parent whether device node has ports node or not.
> > 
> > This line should be wrapped, no reason to have it longer than 80 chars.
> 
> We can use 100 char now on upstream ?
> 
> 	commit bdc48fa11e46f867ea4d75fa59ee87a7f48be144
> 	("checkpatch/coding-style: deprecate 80-column warning")

It's the checkpatch.pl warning that's gone, not the preference to have
lines shorter than that. This is reflected in
Documentation/process/coding-style.rst as well as the commit message of the
patch removing the warning.

> 
> Thank you for your help !!

You're welcome!

-- 
Kind regards,

Sakari Ailus

