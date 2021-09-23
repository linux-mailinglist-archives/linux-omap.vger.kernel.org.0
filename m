Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FB9415A9E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 11:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240070AbhIWJM7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 05:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240022AbhIWJMw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 05:12:52 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2664CC061574
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 02:11:17 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id w29so15073355wra.8
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=12EQr3ZLzKhK5ETv63IZ0Tjj44UHMvHzw6pTaaaVejk=;
        b=oZ1AjSVrUD/dVn2FpE7IzgZHVXx3Zr4Db8ttahRB4jS+mvtQ6lJmu64c1fZj2L0XYu
         Nk+knP4iBIw+WEFCm8uK9ym2pVOIFRjk8U2jiudtBwtfAEg/sUN4FraMC/Z3PjwoIw1y
         0wdGMV2l4/3+LTtaWsQLAA4r3wtejkmbb03UVP9otgbKU7goQToYMh48VOJn21QmlYnt
         CaGMVQ3dQqusilc79T/CqAsAqWw8bu4BvrwNjnJmMCQmyZQDK3JYW593p4QdT+FR+S11
         uNEwUNSBbbm5oXJKbPtL+aOXT/4NJoK7/CEYK6vVzHV7e3/aRiFHT0Ia1u08Hc090MHR
         9J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=12EQr3ZLzKhK5ETv63IZ0Tjj44UHMvHzw6pTaaaVejk=;
        b=myGzueztF9Xk/hNMBaetIlB/pU/SpQtb5CmoHV3q8p2qK9DedBoTjuqBspCE+8kxb/
         BiS1K16p8ZAwVaJtnbZsJyUhp4GbmiE3nQJF4et/PGGWnZmUU3JKBRb4dYKM54klEIsU
         WlAGDOfs5QtiJXB9oydlXd00FS0zR9EGqbkrAXrKXPthxAelFwx17FgrWWyXZi1ywa5v
         qREgzZOdBfb4XIvdFc8lH4H+d6WNgcS7FzszuwnTaMr6LCHDuppg3ry2WCGHohDzRnwh
         RVA/okh5oq5DhOAbBCtVW7k/1RAvDCJr4p5x+JRxWVGntvlD02+FDYxQvSHwrvxSGJ/K
         wbnw==
X-Gm-Message-State: AOAM530bTQciaD4ijLGp3u/lkII6BZQ/rx5pdyCZbAWhgleJkYKIFihY
        mdNlnK3eNEw8irP5IlZ788/5Bg==
X-Google-Smtp-Source: ABdhPJzsZyxJPiWcYgyjEaAxZQmGBvHDVjGMpwzVh6RVfLuFHlx9uWt9U3zqfL7XJ1MZkxFm98ajBQ==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr14740503wmi.163.1632388275609;
        Thu, 23 Sep 2021 02:11:15 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id c7sm4890729wmq.13.2021.09.23.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 02:11:15 -0700 (PDT)
Date:   Thu, 23 Sep 2021 10:11:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        bcousson@baylibre.com, Tony Lindgren <tony@atomide.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Ryan Barnett <ryan.barnett@collins.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Reeder <jreeder@ti.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 36/47] mfd: ti_am335x_tscadc: Support the correctly
 spelled DT property
Message-ID: <YUxEsfOvn7Vr8F2c@google.com>
References: <20210915155908.476767-1-miquel.raynal@bootlin.com>
 <20210915155908.476767-37-miquel.raynal@bootlin.com>
 <YUtSVo9HBAiomswv@google.com>
 <20210923101922.2c108d2b@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210923101922.2c108d2b@xps13>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 23 Sep 2021, Miquel Raynal wrote:

> Hi Lee,
> 
> lee.jones@linaro.org wrote on Wed, 22 Sep 2021 16:57:10 +0100:
> 
> > On Wed, 15 Sep 2021, Miquel Raynal wrote:
> > 
> > > There was in the past a typo in the coordinate readouts property. The
> > > bindings have been updated, the touchscreen driver as well and now
> > > supports both. However, the MFD driver that is in charge of verifying
> > > the validity of the property only checks the bogus one. Add support for
> > > the correctly spelled DT property.
> > > 
> > > Fixes: c9aeb249bf72 ("Input: ti_am335x_tsc - fix spelling mistake in TSC/ADC DT binding")
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > ---
> > >  drivers/mfd/ti_am335x_tscadc.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
> > > index 155a8ed879b3..aa46ed669016 100644
> > > --- a/drivers/mfd/ti_am335x_tscadc.c
> > > +++ b/drivers/mfd/ti_am335x_tscadc.c
> > > @@ -144,8 +144,14 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
> > >  	if (tscadc->data->has_tsc) {
> > >  		node = of_get_child_by_name(pdev->dev.of_node, "tsc");
> > >  		of_property_read_u32(node, "ti,wires", &tscmag_wires);
> > > -		of_property_read_u32(node, "ti,coordiante-readouts", &readouts);
> > > +		err = of_property_read_u32(node, "ti,coordinate-readouts",
> > > +					   &readouts);
> > > +		if (err < 0)
> > > +			of_property_read_u32(node, "ti,coordiante-readouts",
> > > +					     &readouts);
> > > +  
> > 
> > How long are you proposing that we support this churn?
> 
> Well, I am not proposing anything, I am just "fixing" the driver so
> that it fits the bindings :) Given the fact that at the end of this
> series there is a patch that changes the "coordiante" typo to
> "coordinate" in a device tree source file, I believe it is still too
> soon...

If this is something you're changing in this set, please reconsider.

I'd rather have a slightly misspelled documented property than being
forced to support 2 for any length of time.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
