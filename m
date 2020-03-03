Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87870177A28
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 16:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgCCPNy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 10:13:54 -0500
Received: from muru.com ([72.249.23.125]:58542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbgCCPNy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 10:13:54 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9BD6180EE;
        Tue,  3 Mar 2020 15:14:37 +0000 (UTC)
Date:   Tue, 3 Mar 2020 07:13:49 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
Message-ID: <20200303151349.GQ37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
 <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 06:03]:
> On 24/02/2020 21:12, Tony Lindgren wrote:
> > +	/* Remap the whole module range to be able to reset dispc outputs */
> > +	devm_iounmap(ddata->dev, ddata->module_va);
> > +	ddata->module_va = devm_ioremap(ddata->dev,
> > +					ddata->module_pa,
> > +					ddata->module_size);
> 
> Why is this needed? The range is not mapped when sysc_pre_reset_quirk_dss()
> is called? This will unmap and remap twice, as this function is called
> twice. And then left mapped.

That's because by default we only ioremap the module revision, sysconfig
and sysstatus register are and provide the rest as a range for the child
nodes.

In the dss quirk case we need to tinker with registers also in the dispc
range, and at the parent dss probe time dispc has not probed yet.

We may be able to eventually move the reset quirk to dispc, but then
it won't happen in the current setup until after dss top level driver
has loaded.

We leave the module range ioremapped as we still need to access
sysconfig related registers for PM runtime.

> > +	if (!ddata->module_va)
> > +		return -EIO;
> > +
> > +	/* DISP_CONTROL */
> > +	val = sysc_read(ddata, dispc_offset + 0x40);
> 
> Defines for dss/dispc register offsets could have been copied from the
> platform display.c and used in this file.

Yeah I though about that, but decided to keep everything local to
the quirk handling. We could have them defined in some dss header
though.

> > +	/* Clear IRQSTATUS */
> > +	sysc_write(ddata, 0x1000 + 0x18, irq_mask);
> 
> dispc_offset instead of 0x1000.

OK

> > +
> > +	/* Disable outputs */
> > +	val = sysc_quirk_dispc(ddata, dispc_offset, true);
> > +
> > +	/* Poll IRQSTATUS */
> > +	error = readl_poll_timeout(ddata->module_va + dispc_offset + 0x18,
> > +				   val, val != irq_mask, 100, 50);
> > +	if (error)
> > +		dev_warn(ddata->dev, "%s: timed out %08x !+ %08x\n",
> > +			 __func__, val, irq_mask);
> > +
> > +	if (sysc_soc->soc == SOC_3430) {
> > +		/* Clear DSS_SDI_CONTROL */
> > +		sysc_write(ddata, dispc_offset + 0x44, 0);
> > +
> > +		/* Clear DSS_PLL_CONTROL */
> > +		sysc_write(ddata, dispc_offset + 0x48, 0);
> 
> These are not dispc registers, but dss registers.

Ouch. Thanks for catching this, will include in the fix.

> > +	}
> > +
> > +	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
> > +	sysc_write(ddata, dispc_offset + 0x40, 0);
> 
> Same here.

OK

Regards,

Tony
