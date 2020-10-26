Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85D0298D5F
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 14:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1775985AbgJZNCu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 09:02:50 -0400
Received: from muru.com ([72.249.23.125]:46766 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773755AbgJZNCt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 09:02:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A69D980AA;
        Mon, 26 Oct 2020 13:02:50 +0000 (UTC)
Date:   Mon, 26 Oct 2020 15:02:38 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 9/9] remoteproc/wkup_m3: Use reset control driver if
 available
Message-ID: <20201026130238.GA5639@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
 <20201026111049.54835-10-tony@atomide.com>
 <c8ea80c2eb79f80539911f3563398957beedaa41.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ea80c2eb79f80539911f3563398957beedaa41.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Philipp Zabel <p.zabel@pengutronix.de> [201026 11:35]:
> On Mon, 2020-10-26 at 13:10 +0200, Tony Lindgren wrote:
> > @@ -57,6 +60,9 @@ static int wkup_m3_rproc_start(struct rproc *rproc)
> >  	struct device *dev = &pdev->dev;
> >  	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
> >  
> > +	if (wkupm3->rsts)
> 
> No need for this check, reset_control_deassert() just returns 0 if the
> rstc parameter is NULL.
> 
> > +		return reset_control_deassert(wkupm3->rsts);
> > +
> >  	if (pdata->deassert_reset(pdev, pdata->reset_name)) {
> >  		dev_err(dev, "Unable to reset wkup_m3!\n");
> >  		return -ENODEV;
> > @@ -72,6 +78,9 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
> >  	struct device *dev = &pdev->dev;
> >  	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
> >  
> > +	if (wkupm3->rsts)
> 
> Same as above.

OK great.

> > +		return reset_control_assert(wkupm3->rsts);
> > +
> >  	if (pdata->assert_reset(pdev, pdata->reset_name)) {
> >  		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
> >  		return -ENODEV;
> > @@ -132,12 +141,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
> >  	int ret;
> >  	int i;
> >  
> > -	if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
> > -	      pdata->reset_name)) {
> > -		dev_err(dev, "Platform data missing!\n");
> > -		return -ENODEV;
> > -	}
> > -
> >  	ret = of_property_read_string(dev->of_node, "ti,pm-firmware",
> >  				      &fw_name);
> >  	if (ret) {
> > @@ -165,6 +168,17 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
> >  	wkupm3->rproc = rproc;
> >  	wkupm3->pdev = pdev;
> >  
> > +	wkupm3->rsts = devm_reset_control_get_optional_shared(dev, "rstctrl");
> > +	if (PTR_ERR_OR_ZERO(wkupm3->rsts)) {
> 
> Please properly return errors. rsts will be NULL if the optional rstctrl
> reset is not specified:
> 
> 	if (IS_ERR(wkump3->rsts))
> 		return PTR_ERR(wkump3->rsts);

OK thanks will do.

> 	if (!wkump3->rsts) {
> > +		if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
> > +		      pdata->reset_name)) {
> > +			dev_err(dev, "Platform data missing!\n");
> > +			ret = -ENODEV;
> > +			goto err_put_rproc;
> > +		}
> > +		wkupm3->rsts = NULL;
> 
> I assume this will later be dropped with the platform data support?

Yes once also am437x has been updated to probe with dts data only we
can drop the custom callbacks.

Regards,

Tony
