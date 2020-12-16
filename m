Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630202DC255
	for <lists+linux-omap@lfdr.de>; Wed, 16 Dec 2020 15:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgLPOf4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Dec 2020 09:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgLPOf4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Dec 2020 09:35:56 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1384DC061794
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 06:35:14 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r3so23422908wrt.2
        for <linux-omap@vger.kernel.org>; Wed, 16 Dec 2020 06:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=XSQ515YX1lL7SdLjwXSi0+PfZjksYfxwOfIy/7hxa2Q=;
        b=M855+cec+7hhTRXCte9mdlQBN4qId6bRJgg47Kf/7eMbmLnJEsFDvuRfa4o+Ji2I0t
         aySnCxp+wx+F02X1ev/kfdgAhk3QKUZ07ZVXjf3ec1S6jK4A7KMKAtEhrxedRRYs7Ycx
         GhZUsHtxksIj/2Zz+wpjjwcpKQ/0XmrpgexYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=XSQ515YX1lL7SdLjwXSi0+PfZjksYfxwOfIy/7hxa2Q=;
        b=U7nMAMQMRBHEY8RbquseUBbcnfRGdzx5mp0LEyIg5UW0Po8AvBZ4lfYYrdHLkNrNad
         8b6QeBRFSHx92cG+EVQQsHiBznTUydwWNVdzE9fkGPWMXkJcAE4xssPvVbbFizKDAiwZ
         XTaCCeuM645UAXsHBSaSeewWGV+O24r6tZoO27bjJ3/l33Z6fAS+gV4nq48OZACH4F+b
         phUg1CzgxzHnBbP/miDNeSGhjP/hUCTTkkpKslwbb3MDhinyeO4DW8GOUxoVQPunXVPS
         vunX9qMgmR4bu8+GVXGgi37mbEsEaOE8bjCSWoUERPv6vqibBmXJMPPH+yKqXcPC73nX
         EL/Q==
X-Gm-Message-State: AOAM533Hy9gbPKINz8VixdT6CxKEBJ84YPKQPY8O7ZSgfhLwmPVt8N9f
        j81uWqSQ4hAPwyb1errbvYoqL9XAMB0E7w==
X-Google-Smtp-Source: ABdhPJw6sopHtFhuCuY7z9Og6UwUsCkiLLAibKTKR25cmQkf0cApYj5FT6xFl2X2Mz1oqEAGeg7PSQ==
X-Received: by 2002:adf:f845:: with SMTP id d5mr20121128wrq.182.1608129313750;
        Wed, 16 Dec 2020 06:35:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 125sm2841371wmc.27.2020.12.16.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 06:35:12 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:35:10 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        jyri.sarha@iki.fi, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, tomba@kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update addresses for TI display drivers
Message-ID: <X9obHqQ0BBtZaSyz@phenom.ffwll.local>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        jyri.sarha@iki.fi, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, tomba@kernel.org
References: <20201216075917.17481-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216075917.17481-1-tomi.valkeinen@ti.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Dec 16, 2020 at 09:59:17AM +0200, Tomi Valkeinen wrote:
> Update the maintainer email addresses for TI display drivers.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 281de213ef47..c21471497a18 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5932,8 +5932,8 @@ F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>  F:	drivers/gpu/drm/stm
>  
>  DRM DRIVERS FOR TI KEYSTONE
> -M:	Jyri Sarha <jsarha@ti.com>
> -M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +M:	Jyri Sarha <jyri.sarha@iki.fi>
> +M:	Tomi Valkeinen <tomba@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -5943,15 +5943,15 @@ F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
>  F:	drivers/gpu/drm/tidss/
>  
>  DRM DRIVERS FOR TI LCDC
> -M:	Jyri Sarha <jsarha@ti.com>
> -R:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +M:	Jyri Sarha <jyri.sarha@iki.fi>
> +R:	Tomi Valkeinen <tomba@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/tilcdc/
>  F:	drivers/gpu/drm/tilcdc/
>  
>  DRM DRIVERS FOR TI OMAP
> -M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +M:	Tomi Valkeinen <tomba@kernel.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/ti/
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
