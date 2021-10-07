Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934D2425958
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 19:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbhJGR0t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 13:26:49 -0400
Received: from muru.com ([72.249.23.125]:41966 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233133AbhJGR0s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 13:26:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6E3E080C7;
        Thu,  7 Oct 2021 17:25:24 +0000 (UTC)
Date:   Thu, 7 Oct 2021 20:24:52 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 1/3] dt-bindings: bus: simple-pm-bus: Make clocks and
 power-domains optional
Message-ID: <YV8tZP05lAukFc4E@atomide.com>
References: <20211007124858.44011-1-tony@atomide.com>
 <20211007124858.44011-2-tony@atomide.com>
 <CAMuHMdX3XBA25sUMF2SpfbH7XX5-UpPFj-0nHuwDOv49YWQn+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3XBA25sUMF2SpfbH7XX5-UpPFj-0nHuwDOv49YWQn+A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [211007 13:27]:
> Hi Tony,
> 
> Thanks for your patch!
> 
> On Thu, Oct 7, 2021 at 2:49 PM Tony Lindgren <tony@atomide.com> wrote:
> > Clocks and power domains are not required by the simple-pm-bus driver.
> > There are buses with read-only registers for clocks and power domains
> > that are always on.
> 
> The presence of clocks or power-domains properties is the only
> distinguishing factor between simple-pm-bus and simple-bus, from a
> DT point of view.  So if there has to be a distinguishment, the
> properties should be required

Heh seems there is no need for distinguishment beyond the compatible
property here though :)

> If you don't have clocks and power-domains, you should use simple-bus.

Except simple-bus is not the same as simple-pm-bus. We do not have
simple-bus do pm_runtime_enable() as you well know having written it :)

> > Even without clocks and power domains configured, simple-pm-bus is still
> > different from simple-bus as simple-pm-bus enables runtime PM for the bus
> > driver.
> 
> Which you need to have working Runtime PM for child devices, right? ;-)

Right. And based on what I remember we simply cannot do pm_runtime_enable()
for simple-bus without breaking tons of devices.

> This is not specific to DT, but to Linux.
> One more reason to let Linux treat simple-pm-bus and simple-bus exactly
> the same.  Linux handles the clocks and power-domains (if present)
> transparently anyway, through PM Domains

I agree they should be treated the same way with simple-pm-bus just
doing the pm_runtime_enable() being the only difference.

But the clocks and power domain still should be optional. They are
not required by simple-pm-bus.c driver, and may not be required by
the hardware.

Got any better solutions in mind? Adding yet another compatible or
another driver does not seem to get us anywhere either with this :)

Regards,

Tony


