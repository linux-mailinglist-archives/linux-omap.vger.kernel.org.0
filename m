Return-Path: <linux-omap+bounces-949-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC6988B200
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 21:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94286B2CF45
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 15:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7913415748C;
	Mon, 25 Mar 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waT/yd4c"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80716157482
	for <linux-omap@vger.kernel.org>; Mon, 25 Mar 2024 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370109; cv=none; b=efzCy+9g5Ukj9k7QQa6I38G17x4Hlp/yoAmNzZht7QFdQt2eixwM90FaF9BYYDB7WpgGgvL+Z8A0bDSOiUxs9ZllzEyCKCjcEswORG6QtigJw5bBq6zHnpX0Tfq2GTHNmvg2ZBV4xDOzcah7KN2xZcbYvzwz9Oh4rSL5ru4gPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370109; c=relaxed/simple;
	bh=Ihco2VVQ8EM7Jh1F8wrCqICE2zkzbKD5Hk3coKQgtXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsneGqcRNzt/UTn2sFIT3W0syhzFugh/KxIaCDu6VzMPw3zpG7r8s3GIaHZi78YibxevETXH2iV4Gb1oG0Ja/YGTuWBkmTSTEWnSNc4Qd4RBdv1xqUoI7N+bisRGUEWgUtW2pck/1U6IwKDtwvyIsHcy3WDmvNbz6lnh7Ih0p4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waT/yd4c; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-568c714a9c7so4961268a12.2
        for <linux-omap@vger.kernel.org>; Mon, 25 Mar 2024 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711370106; x=1711974906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWqmr4tJSgMTZuBlY7silaTC/ghGytqv25bJf51WJeA=;
        b=waT/yd4cU4mNnUmHP5+44H/LdpDe6k1mDmwTsWZ260b/hmLwFpeAVOjMylwsfz6P09
         UEc/ee8vp56Nq4CX7NnHHj7Ja/pbAuDXpYhGUcLdUNKUW60eMdHFN1Z4rEBcu5LKFCzY
         PyLMefIL6VA9jdltO+mA4ji1FlzDOePVnpAuKNydEh8aQpnEUeDSs/hINvWZcKxrdQQH
         4ZstZ9JysY2G6n3BIv7+s1b6LG3q9zt0GstasxDHdM/Z6juk925rKcTgGtC6HgedjZSv
         oRK1BZMP/9QdvB5lVFybRVodoDWcFPT47YaAIYfmGSirnra5vAu6/LSCSEPfOBbcTbXl
         Y2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711370106; x=1711974906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWqmr4tJSgMTZuBlY7silaTC/ghGytqv25bJf51WJeA=;
        b=YKqeWn7KVz9RhU7sv2dLqhv4VijSXSZrFJWjSy16fs0Ltdisu8se4x0LjbkhFnLcbB
         tmO1RW1+FzmmUQSFoFBocViJkyM2N7sjhhZz8SLOTv+gNUwbtNWDPGXYMVHAITFboPlr
         8AgIE7+12ZzytswqOSaV3+VJIPoxiIONT/Tm06BWAMBAg/a1l/PK+Ip0mOh2w9psgv2I
         2lMPh8vwf0VlMfPkRi3G1IG1JwdqrZX3u55f4XWhQgpgqPp9Bw6cDAwX9OX9NaOZKLmr
         jVWkTSCI2muMFzSBOwo4UHjBBKjRKY2hBq70sI6DB17w67AHOyBwMKo9Gdq9rG6XknCy
         Vlpg==
X-Forwarded-Encrypted: i=1; AJvYcCUXZlFPDIYnXW3nSNQlo5Ux56aD7Gem58Pmua7J2lvweWqT8c6FaHkkaEm/wvttdDMrORvBS3WQ3plhnedXQ8ZKHD+OhXoE97aB4Q==
X-Gm-Message-State: AOJu0YxqDogzxfm47VhS3DYgxs6KLWxYbHOtX1zDNArfmrG+E+XAmEkW
	c13GSkGmugEmTUuBselLB0lzVzPoZB+GIlcDGb1B8Xb3o0s92q8pMRaLMcIpoxc=
X-Google-Smtp-Source: AGHT+IH8Cn89ggEfIANbpUmr3OPCf2JNAzSSROYWGxG3Th6G6cN11daoFg65mxm7kIJzyF7KMVoTFg==
X-Received: by 2002:a50:d786:0:b0:567:ff26:4bcb with SMTP id w6-20020a50d786000000b00567ff264bcbmr4510771edi.30.1711370105691;
        Mon, 25 Mar 2024 05:35:05 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s21-20020a056402037500b0056bdc4a5cd6sm2947522edw.62.2024.03.25.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 05:35:05 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:35:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/8] media: platform: ti: use for_each_endpoint_of_node()
Message-ID: <02d6efba-6d1c-465f-a06d-cf7c02656e21@moroto.mountain>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
 <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmpr57uw.wl-kuninori.morimoto.gx@renesas.com>

On Mon, Mar 25, 2024 at 03:05:27AM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   |  8 +++-----
>  drivers/media/platform/ti/davinci/vpif_capture.c | 11 +++++------
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 77e12457d149..4f185a0d42b3 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2306,14 +2306,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  	if (!pdata)
>  		return NULL;
>  
> -	for (i = 0; ; i++) {
> +	for_each_endpoint_of_node(dev->of_node, endpoint) {
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> -		if (!endpoint)
> -			break;
> -
>  		sdinfo = &pdata->sub_devs[i];
                                          ^
"i" is uninitialized now.

Also in the initializer it has "struct device_node *endpoint = NULL;"
which is unnecessary now.  And at the end it has:

	of_node_put(endpoint);
	return pdata;

Since endpoint is NULL this was always a pointless no-op but now it's
more obvious, so lets delete that.

regards,
dan carpenter


