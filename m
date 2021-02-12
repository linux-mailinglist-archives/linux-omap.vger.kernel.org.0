Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D26E31A6DC
	for <lists+linux-omap@lfdr.de>; Fri, 12 Feb 2021 22:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhBLV1V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Feb 2021 16:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhBLV1Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Feb 2021 16:27:16 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBD0C061756
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 13:26:35 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v7so837080wrr.12
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 13:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HkqR5YSUfK4R7W+GTGeLr6TmDe+FVUBEEGrvMyCm10g=;
        b=wCztQqZUFSS/X/WEM0InWCZNFakC6lQFsTg6aJtdu88LFShwneNNLtMRalXdQJvUs6
         5evSk694b24/YVfDEEc/B1iu9d/+VjeWtfSZWgjthK1okpOejm5J+I4lPkbLlvJrgK+K
         FFpx44bpkZVEmaDzXQxQv6LKAubgLEU23K+ttitzUnGsnanYpQOFLlokkEPeNzRGjc+G
         H2ErjCRpx01qGB+SS35MeyN1Pofa0/lVPlXPeZo8VMsEIXYMXdfT7PJWFXY1vfjV4fD6
         R5h+Ye3mdrVZSDoH8UWfbMONpTSeR2vXQf5lWCdMYzDrVbZ6WYjGANmbNJiz3Q1jE7JU
         wSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HkqR5YSUfK4R7W+GTGeLr6TmDe+FVUBEEGrvMyCm10g=;
        b=NLvQSyIkJqWNpZM0yXaK8X2Qd9HcpXiFLkD22ec8wcFeuyX59/7J8wU7h+tQ2VRGIx
         X6DUGcWFs9y8kKPbSQWYvwx/GPVYEalvTH3wNUC3O/xDXhoNIW6GwSD60HGI8bdc96pP
         PGaueYXp2EEbtjMHRnZw+9d+rBsq3d0faxsBE8MxcZbpKXDec0RvR2Qkf/dAZyf2e2k4
         WZo/Pt7JxRB3Rl+XpramEcu70dLvcr2ihYPDa1DpJWk1CWSjAAKLIbHAjgVN0QZAHQl+
         MfTp1mBDYRTovPHNDsI1oCSvIzEhv/afoiOKcaCBXFvu0kcCZTh5HV2NNsNQQl+ssTa0
         EkHw==
X-Gm-Message-State: AOAM531AW4YTAVsK0mpWcXcL/vzGYvSlUu53FJB/zmE3//ZZCi/oq5di
        OhyqSZc5cLcnHyhjdPpVzFZrpkcPNkdY9A==
X-Google-Smtp-Source: ABdhPJwhZlIwuGtUdrvybHR0t9H1gY+kEia4csmuMdVzYVfLGSB/ifG8SIgmz4d3vm5lOLrt5ugZdA==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr5508432wrq.213.1613165193851;
        Fri, 12 Feb 2021 13:26:33 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id t17sm15384396wmi.20.2021.02.12.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 13:26:33 -0800 (PST)
Date:   Fri, 12 Feb 2021 21:26:30 +0000
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
Message-ID: <20210212212630.GD179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210212212503.GC179940@dell>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 12 Feb 2021, Lee Jones wrote:

> On Fri, 12 Feb 2021, Stephen Boyd wrote:
> 
> > Quoting Lee Jones (2021-02-12 01:20:16)
> > > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > > 
> > > > Quoting Lee Jones (2021-02-11 13:10:54)
> > > > > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > > > > 
> > > > > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > > > > This set is part of a larger effort attempting to clean-up W=1
> > > > > > > kernel builds, which are currently overwhelmingly riddled with
> > > > > > > niggly little warnings.
> > > > > > > 
> > > > > > > This is the last set.  Clock is clean after this.
> > > > > > 
> > > > > > Is it possible to slam in some patch that makes W=1 the default for the
> > > > > > clk directory? I'm trying to avoid seeing this patch series again.
> > > > > 
> > > > > One of my main goals of this project is that everyone (contributors,
> > > > > maintainers auto-builder robots etc) will be enabling W=1 builds
> > > > > *locally*.
> > > > > 
> > > > > This isn't something you'll want to do at a global (i.e. in Mainline)
> > > > > level.  That's kinda the point of W=1.
> > > > > 
> > > > 
> > > > Agreed, but is it possible to pass W=1 in the drivers/clk/Makefile?
> > > 
> > > That would circumvent the point of W=1.  Level-1 warnings are deemed,
> > > and I'm paraphrasing/making this up "not worth rejecting pull-requests
> > > over".  In contrast, if Linus catches any W=0 warnings at pull-time,
> > > he will reject the pull-request as 'untested'.
> > > 
> > > W=1 is defiantly something you'll want to enable locally though, and
> > > subsequently push back on contributors submitting code adding new
> > > ones.
> > > 
> > 
> > Why should I install a land mine for others to trip over? Won't that
> > just take them more time because they won't know to compile with W=1 and
> > then will have to go for another round of review while I push back on
> > them submitting new warnings?
> 
> The alternative is to not worry about it and review the slow drip of
> fixes that will occur as a result.  The issues I just fixed were built
> up over years.  They won't get to that level again.
> 
> In my mind contributors should be compiling their submissions with W=1
> enabled by default.  I'm fairly sure the auto-builders do this now.
> 
> Once W=1 warnings are down to an acceptable level in the kernel as a
> whole, we can provide some guidance in SubmittingPatches (or similar)
> on how to enable them (hint: you add "W=1" on the compile line).
> 
> Enabling W=1 in the default build will only serve to annoy Linus IMHO.
> If he wants them to be enabled by default, they wouldn't be W=1 in the
> first place, they'd be W=0 which *is* the default build.

Just to add real quick - my advice is to enable them for yourself and
send back any issues along with your normal review.  A W=1 issue is no
different to a semantic or coding style one.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
