Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C63831A7F1
	for <lists+linux-omap@lfdr.de>; Fri, 12 Feb 2021 23:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbhBLWnG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Feb 2021 17:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbhBLWkV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Feb 2021 17:40:21 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B353C061794
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 14:37:46 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o24so1093013wmh.5
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 14:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gabp5PA91SwinpJ0/myZDDPAWJJmDGhuF5vT4HNQofk=;
        b=lzptYNv+Z/QkUjO1dor3sL5BlvgIRzJT0h3tMKe+AEsBnXH7z9s3DEjUf4ogNn07Bm
         SYkfEK7DEk7HbO6bs2GfyVnUPJuIbwvSYRQZU3qm/ENvlPlqYZYeeFUmElt8hp9808Gh
         jHiPsPRyuDq4vcSW3ZynoMmbn8t/Vf83Qeij8ATKKgXsvBiBStVp2M/aogaFGZo2G9l9
         KOksv/RBoVdxTB+BnnfIFJzEKw94Qm6UwwU4X4q4w6Xrx3QHpWeTjpL/uS9dH4q0UvT/
         nOAIOypn0sTekthhwXWei2O6M2wnbBdsYnwxj2Gp697y/os3Rxes6rNclui8jYxeeUvD
         fA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gabp5PA91SwinpJ0/myZDDPAWJJmDGhuF5vT4HNQofk=;
        b=hsAf3K0vSdySwIxcG7du25H39lazWu121Ba26ZM/Pz2vtVb8RXuvjHzN03xjhzz+NO
         gU0/t1KRDMFc2xrRw62odUKbFMJA1IL+3yBv9BX+of5u3TSrktVsMX+zGl/yla+lZgcs
         m4O8qL3eDSFeMDB9+7gwNsjAjWVUu2QxbYf461yMf0QbT0a0ndE0Blr9L/819QkMbMkp
         6Oi2g1l18m8w+Kukm0X10ilxh06Epsrb+JBg0Fvt0b5vFW/WhAAP+8iqT2o6XFCVbwqM
         1CwyDce6ER1Z4N7xx0m3ZtX4mIps1CpczuQyX+6SJB4aVW59DYW7rl8EWzqu2KQIg+wL
         r/bg==
X-Gm-Message-State: AOAM532GDHbNrkMA8c0fLncZsQ3257DDNQ+rH8Fju7PkCMVyjyES9/EM
        x9n/KH5x/ELqiiIsaawq75wRLw==
X-Google-Smtp-Source: ABdhPJw/W7aXURMUdb+FiiPcMWZ20hidPBYo6T7ZCqELCNUFf+nZRpp16Lmp3XkUiPvFeKkrd7BkhQ==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr4450894wmf.93.1613169462215;
        Fri, 12 Feb 2021 14:37:42 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id l5sm11839112wrv.44.2021.02.12.14.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 14:37:41 -0800 (PST)
Date:   Fri, 12 Feb 2021 22:37:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Loc Ho <lho@apm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Nancy Yuen <yuenn@google.com>,
        Nuvoton Technologies <tali.perry@nuvoton.com>,
        NXP Linux Team <linux-imx@nxp.com>, openbmc@lists.ozlabs.org,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Richard Woodruff <r-woodruff2@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Tero Kristo <kristo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210212223739.GE179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell>
 <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 12 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-12 13:26:30)
> > On Fri, 12 Feb 2021, Lee Jones wrote:
> > 
> > > The alternative is to not worry about it and review the slow drip of
> > > fixes that will occur as a result.  The issues I just fixed were built
> > > up over years.  They won't get to that level again.
> > > 
> > > In my mind contributors should be compiling their submissions with W=1
> > > enabled by default.  I'm fairly sure the auto-builders do this now.
> 
> That's good.
> 
> > > 
> > > Once W=1 warnings are down to an acceptable level in the kernel as a
> > > whole, we can provide some guidance in SubmittingPatches (or similar)
> > > on how to enable them (hint: you add "W=1" on the compile line).
> > > 
> > > Enabling W=1 in the default build will only serve to annoy Linus IMHO.
> > > If he wants them to be enabled by default, they wouldn't be W=1 in the
> > > first place, they'd be W=0 which *is* the default build.
> > 
> > Just to add real quick - my advice is to enable them for yourself and
> > send back any issues along with your normal review.  A W=1 issue is no
> > different to a semantic or coding style one.
> > 
> 
> I'd like to enable it for only files under drivers/clk/ but it doesn't
> seem to work. I'm not asking to enable it at the toplevel Makefile. I'm
> asking to enable it for drivers/clk/ so nobody has to think about it now
> that you've done the hard work of getting the numbers in this directory
> down to zero or close to zero.

I'm not sure which one of us is confused.  Probably me, but ...

Even if you could enable it per-subsystem, how would that help you?

How can you ensure that contributors see any new W=1 warnings, but
Linus doesn't?  When Linus conducts his build-tests during the merge
window, he is also going to build W=1 for drivers/clk.

All that's going to achieve is put you in the firing line.

From my PoV W=1 builds should be enabled during the development phase
(i.e. contributor, auto-builder, maintainer).  By the time patches get
make it into Mainline the review/testing stage is over and only the
default W=0 warnings are meaningful.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
