Return-Path: <linux-omap+bounces-2466-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB99A9B3C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2024 09:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB6C4B20B7C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2024 07:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28BE1527B1;
	Tue, 22 Oct 2024 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Ug5CIh3w"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403414EC60;
	Tue, 22 Oct 2024 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582737; cv=pass; b=hUeBpc/BpA1XKVhgcfA5RZ4YCsCfgTyl3n2ULd5bSTdm5szNPiAZi38EE1bOebVOi0dysu6C6OyN/nrIK0kjurL5fRmcTjnjkpwNJwgqtG6HrthfyGYXx4mADBamxHyDC7Jw8KvvwCUBi7FJtQGDK8G5PYGERXHT119uJ0Wm7s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582737; c=relaxed/simple;
	bh=iVC4rGuUWrDbXKFGbcB0c7rDS+JuAC4pEITpMqaVOWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEGO47yFR+X27fG7czhU8JsowMYLM7dXu4IQDqMgz1l4QLk2Pq5qX6j5IRWxkVkTi+26qB5YKcb03t4aMtcrliNXm6AxqhwKcBdZ8w5qkoph8kEODumCvLFMlv6ukbxQ/LkFy3aXQtasBLPfyQEveOZo4AlYP2Vma0AEc3oSqPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Ug5CIh3w; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XXkZD0MHgz49QB3;
	Tue, 22 Oct 2024 10:38:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1729582726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JywbDX15nq2UroYMBFhAwnTYlwi6J5gla6pJnh99TIQ=;
	b=Ug5CIh3wd2favuBs1zfGzgeIkMM18PuICQn4kLoZEJF0I4Iln0b7X/T7H6MzFZJyZE2cJu
	ZUYb1Aatxq1+44x1A5kz1yR7y5GHTVbmSGuF35ipvd5WZdwq7NANsn9zr9//Q0s++1RBcT
	zD33msa5ng7EXjNYRn68gTZ0y+GUcXNPSiG5dPoiMd3O7K8iFJe51SmJupZNXjgE8Q/dR+
	dfzbvBKXHPdl1o8VxEb3MVqgwkyN9xJa7zr8egkcNAqPqeWgCHTYCgbo7r8jEFczuEQ5eg
	10ahoL7v44SCGrGMK4rS6ZgIPKTyVaRLrCnImsjCepCwK6aZAl0gVAv6/3M4Bw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1729582726; a=rsa-sha256;
	cv=none;
	b=aVNLoEqQSDWxxRn0i2iY3h5UOGcvN7v8Fehljky+yjTbGMIJcUIdD4BmdcMe7y0/md0qwO
	OF/IjxdhqSq5jEQ4GUF7ljU9ap6QpiQ/eh2wT5PQcE8IFX7BRLFN9RleK1VVNRALBoTDPN
	3Z7ZTPph2Bb078svCVX8lPkJrPXmh6SgZjROgX8mIwL6cMspFPT6LNSUeBUk1Kf1g8PHDr
	0HHSkkEWwZzcKCebGtxNdk3Au8JHDqiFuGVTX7Ts7dwEPt2/VQh/Tthg8nnNPwZ6aPmP44
	pBVJ4av4Ug9EzkKMvHHAUJ+Vfe+5vKuaEMAqigUQ7EjG0kyZLGMWj2ilzK+N4Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1729582726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JywbDX15nq2UroYMBFhAwnTYlwi6J5gla6pJnh99TIQ=;
	b=ahBeazQXJN0sr8dX4cYyLxfpE+ornNZKUNgPkuQhUNVFh0GvouWLDbBG6hj/J+Jol/+lZY
	Vbmm5gMKvx0zgA8qPZMD3mwduEwy+9nbCnDPvxKzJcxz1vqcBRe+QN6nOEyvHl0+fqQrZz
	MDk1ep9790xOKq/TLoQ3eU7aoKaHUVHl/VPWpxGlbrPeYIFs1uidFn/18kHKVCDUOSVQic
	q6GzpsxzFrcVfeZUOEVb6jklequWQjeYxTWdjlI2l0iK5oevJrOtJPuO95m0Md8A11wVXa
	XpFapAUycljenzSdhyVUKPCuqSHQSUBZrpNWmzLQguxrxcmhy2v+jB/jk7MfKA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 96BB5634C93;
	Tue, 22 Oct 2024 10:38:43 +0300 (EEST)
Date: Tue, 22 Oct 2024 07:38:43 +0000
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
Subject: Re: [PATCH v7 9/9] media: xilinx-tpg: use new of_graph functions
Message-ID: <ZxdWg68UVopg7ZvT@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87jzeirqv3.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzeirqv3.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san, Rob,

On Wed, Oct 09, 2024 at 01:45:36AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I.e. it's ok to merge this via non-media tree.

-- 
Kind regards,

Sakari Ailus

