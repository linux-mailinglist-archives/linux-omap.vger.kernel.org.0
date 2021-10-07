Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3CA425A82
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 20:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhJGSTM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 14:19:12 -0400
Received: from muru.com ([72.249.23.125]:41998 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233750AbhJGSTM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 14:19:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C4AB980C7;
        Thu,  7 Oct 2021 18:17:48 +0000 (UTC)
Date:   Thu, 7 Oct 2021 21:17:16 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 1/3] dt-bindings: bus: simple-pm-bus: Make clocks and
 power-domains optional
Message-ID: <YV85rKlB79nMC+nq@atomide.com>
References: <20211007124858.44011-1-tony@atomide.com>
 <20211007124858.44011-2-tony@atomide.com>
 <CAMuHMdX3XBA25sUMF2SpfbH7XX5-UpPFj-0nHuwDOv49YWQn+A@mail.gmail.com>
 <YV8tZP05lAukFc4E@atomide.com>
 <CAMuHMdUzL7PWrUaO3CeCz7XXm=cmSg4BEZo582cxeTL_YuuETQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUzL7PWrUaO3CeCz7XXm=cmSg4BEZo582cxeTL_YuuETQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [211007 17:57]:
> Hi Tony,
> 
> On Thu, Oct 7, 2021 at 7:24 PM Tony Lindgren <tony@atomide.com> wrote:
> > * Geert Uytterhoeven <geert@linux-m68k.org> [211007 13:27]:
> > > On Thu, Oct 7, 2021 at 2:49 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > Even without clocks and power domains configured, simple-pm-bus is still
> > > > different from simple-bus as simple-pm-bus enables runtime PM for the bus
> > > > driver.
> > >
> > > Which you need to have working Runtime PM for child devices, right? ;-)
> >
> > Right. And based on what I remember we simply cannot do pm_runtime_enable()
> > for simple-bus without breaking tons of devices.
> 
> Why not? Do you have an example of what would break?
> The only reason I created simple-pm-bus was because the DT people
> objected to adding PM to simple-bus, as they considered it wrong
> conceptually.  AFAIK this wouldn't have caused any actual breakage.

Oh OK, then I just remember the reasons wrong for the need for
adding it as a driver.

Regards,

Tony
