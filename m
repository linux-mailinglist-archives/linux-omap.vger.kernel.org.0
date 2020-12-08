Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827952D2986
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 12:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgLHLFP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 06:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgLHLFO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 06:05:14 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F15C061793
        for <linux-omap@vger.kernel.org>; Tue,  8 Dec 2020 03:04:34 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 91so11862111wrj.7
        for <linux-omap@vger.kernel.org>; Tue, 08 Dec 2020 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oVdto4l/iQFOE/jcGLfjaxzoGzq2Ps5a3Ie3KVUxu1I=;
        b=qb024noJnAcaD4FrKPkd4Ne8IhxPQM8AlFz92r4A6tTwucH6MQXOpPuRiJdwTukbJK
         J+1ZPm8YX5jCZaEvyjJ6vpn4lAMa7UFXjLoCTOLFc501Hrx1cNiVd+Z8WluLCJc96MuN
         lG3zsMPbMQ7hm6N6VfWocnn+bbRnLm+Gti9iZ1XUFKkrwPa52L+7FuO98JnyIATsKAvJ
         zhHBZaGpGCQf8SOU7RWmdoMsg25XwH8LXk3+VNnowPQbs0YR6Fbl8kFUTCijvApbHnRT
         x/2pY4XAtfUyMd/mC2HSFBNTO0FPeKDCdLVM3JnPGjoXBVpvqs5FD3afdifAdwB7tAmT
         gSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oVdto4l/iQFOE/jcGLfjaxzoGzq2Ps5a3Ie3KVUxu1I=;
        b=ROfImWdj9w28tI4IypgV1tFea9uKuQNersDu2AvMe/9zzpTNRPwPRh45H3/Z59FfQV
         DuBqKCGq5qCXI+Z1Rsx8vRJ3fQ3oMqYkREJOpKOlKZ4crerF41tqBv3XcHLQstl6d6Lb
         mu0l8eifjY7Io+HJmMGV7Oh8z4/hFyNjbXIDOVgbS2axU/bbFXhTy6y0SYSt0s3c4KFP
         RF3MWV5jZyR4NuqsmVihmWZtZZm+EgzJX4S52QmUOvc5mZtIrW7pdTfl4pG9W425bBGM
         3eG9eB4zRx9s3a38uiWsGLIhKW0CtSCQ5dshaQs/CkRK4UXd1+GE3m+AgDylIflE0j4X
         s0eg==
X-Gm-Message-State: AOAM532485/U8So12rfa9e5wM/kukLBkhIQU/T5ht9BCQhmbhuC8GQZ0
        ERahpEtHH6XoImyky8n9bp9ExA==
X-Google-Smtp-Source: ABdhPJxArhPoyEic163xkIJznknOhIaG8ofGldEM/e3Q9Bok2a5xIQOzLIt+OejlKTMEWByALsMqsw==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr24125501wrq.11.1607425473108;
        Tue, 08 Dec 2020 03:04:33 -0800 (PST)
Received: from dell ([91.110.221.209])
        by smtp.gmail.com with ESMTPSA id h20sm2925583wmb.29.2020.12.08.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 03:04:32 -0800 (PST)
Date:   Tue, 8 Dec 2020 11:04:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>, ohad@wizery.com,
        bjorn.andersson@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, rogerq@ti.com
Subject: Re: [PATCH v3 3/6] remoteproc: pru: Add support for PRU specific
 interrupt configuration
Message-ID: <20201208110430.GS4801@dell>
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
 <20201204201807.14716-4-grzegorz.jaszczyk@linaro.org>
 <20201207173731.GA1509079@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201207173731.GA1509079@xps15>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 07 Dec 2020, Mathieu Poirier wrote:

> On Fri, Dec 04, 2020 at 09:18:04PM +0100, Grzegorz Jaszczyk wrote:
> > The firmware blob can contain optional ELF sections: .resource_table
> > section and .pru_irq_map one. The second one contains the PRUSS
> > interrupt mapping description, which needs to be setup before powering
> > on the PRU core. To avoid RAM wastage this ELF section is not mapped to
> > any ELF segment (by the firmware linker) and therefore is not loaded to
> > PRU memory.
> > 
> > The PRU interrupt configuration is handled within the PRUSS INTC irqchip
> > driver and leverages the system events to interrupt channels and host
> > interrupts mapping configuration. Relevant irq routing information is
> > passed through a special .pru_irq_map ELF section (for interrupts routed
> > to and used by PRU cores) or via the PRU application's device tree node
> > (for interrupts routed to and used by the main CPU). The mappings are
> > currently programmed during the booting/shutdown of the PRU.
> > 
> > The interrupt configuration passed through .pru_irq_map ELF section is
> > optional. It varies on specific firmware functionality and therefore
> > have to be unwinded during PRU stop and performed again during
> > PRU start.
> > 
> > Co-developed-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---

[...]

> >  drivers/remoteproc/pru_rproc.c | 180 +++++++++++++++++++++++++++++++++
> >  drivers/remoteproc/pru_rproc.h |  46 +++++++++
> >  2 files changed, 226 insertions(+)
> >  create mode 100644 drivers/remoteproc/pru_rproc.h
> > 
> > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > index d33392bbd8af..4ef59d15d888 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -11,13 +11,16 @@
> >   */

[...]

> > +static int pru_handle_intrmap(struct rproc *rproc)
> > +{
> > +	struct device *dev = rproc->dev.parent;
> > +	struct pru_rproc *pru = rproc->priv;
> > +	struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
> > +	struct irq_fwspec fwspec;
> > +	struct device_node *irq_parent;
> > +	int i, ret = 0;
> > +
> > +	/* not having pru_interrupt_map is not an error */
> > +	if (!rsc)
> > +		return 0;
> > +
> > +	/* currently supporting only type 0 */
> > +	if (rsc->type != 0) {
> > +		dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (rsc->num_evts > MAX_PRU_SYS_EVENTS)
> > +		return -EINVAL;
> > +
> > +	if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> > +	    pru->pru_interrupt_map_sz)
> > +		return -EINVAL;
> > +
> > +	pru->evt_count = rsc->num_evts;
> > +	pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
> 
> sizeof(unsigned int)

Would you mind trimming your replies please?

Brain grepping through 200+ lines of quote for a one line review
comment is a little frustrating.

TIA.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
