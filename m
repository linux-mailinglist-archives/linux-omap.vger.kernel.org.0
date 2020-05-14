Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6389E1D34D5
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 17:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgENPSX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 11:18:23 -0400
Received: from muru.com ([72.249.23.125]:54488 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgENPSX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 11:18:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B9C0A80C0;
        Thu, 14 May 2020 15:19:11 +0000 (UTC)
Date:   Thu, 14 May 2020 08:18:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] soc: ti: omap-prm: Add basic power domain support
Message-ID: <20200514151819.GO37466@atomide.com>
References: <20200512203852.29499-1-tony@atomide.com>
 <20200512203852.29499-3-tony@atomide.com>
 <acb3960a-fbbb-f764-9ee2-191aac2f8323@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb3960a-fbbb-f764-9ee2-191aac2f8323@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200514 08:05]:
> On 12/05/2020 23:38, Tony Lindgren wrote:
> > +struct omap_prm_domain {
> > +	struct device *dev;
> > +	struct omap_prm *prm;
> > +	struct generic_pm_domain pd;
> > +	void __iomem *pwrstctrl;
> > +	void __iomem *pwrstst;
> 
> I think the pwrstst is not really used as of now, it is just part of couple
> of dev_dbg prints.

Yes to me it seems the pwrstst only changes later on.

> > +static int omap_prm_domain_power_on(struct generic_pm_domain *domain)
> > +{
> > +	struct omap_prm_domain *prmd;
> > +	u32 v;
> > +
> > +	prmd = genpd_to_prm_domain(domain);
> > +	if (!prmd->cap)
> > +		return 0;
> > +
> > +	dev_dbg(prmd->dev, "%s: %s: old state: pwrstctrl: %08x pwrstst: %08x\n",
> > +		__func__, prmd->pd.name, readl_relaxed(prmd->pwrstctrl),
> > +		readl_relaxed(prmd->pwrstst));
> > +
> > +	if (prmd->pwrstctrl_saved)
> > +		v = prmd->pwrstctrl_saved;
> > +	else
> > +		v = readl_relaxed(prmd->pwrstctrl);
> > +
> > +	writel_relaxed(v | OMAP_PRMD_ON_ACTIVE, prmd->pwrstctrl);
> > +	dev_dbg(prmd->dev, "%s: %s: new state pwrstctrl: %08x\n",
> > +		__func__, prmd->pd.name, readl_relaxed(prmd->pwrstctrl));
> 
> Should we wait for the transition to complete here?

Good idea :)

> > +	v &= ~PRM_POWERSTATE_MASK;
> > +	v |= omap_prm_domain_find_lowest(prmd);
> > +
> > +	if (prmd->cap->statechange)
> > +		v |= PRM_LOWPOWERSTATECHANGE;
> > +	if (prmd->cap->logicretstate)
> > +		v &= ~PRM_LOGICRETSTATE;
> > +	else
> > +		v |= PRM_LOGICRETSTATE;
> > +
> > +	writel_relaxed(v, prmd->pwrstctrl);
> 
> Should we wait for the transition to complete here?

Would be nice yeah.

> Is any of the following clock handling needed, and if yes, whats its
> purpose?
> 
> It looks like this is only used for ABE clkctrl handling on omap4/omap5 (at
> least for now), but afaik, ABE clkctrl is read only so this code would
> effectively do nothing (and potentially just even fail.)

Yeah this seems unnecessary, let's plan on leaving it out. I think the
clocks in the l4_abe dst changes are actually handled by simple-pm-bus,
not this driver, I was just confused :)

Regards,

Tony
