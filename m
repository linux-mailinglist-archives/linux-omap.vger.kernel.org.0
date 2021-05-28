Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C140393D72
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 09:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhE1HH0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 03:07:26 -0400
Received: from muru.com ([72.249.23.125]:33154 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhE1HH0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 May 2021 03:07:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6A6D4809F;
        Fri, 28 May 2021 07:05:56 +0000 (UTC)
Date:   Fri, 28 May 2021 10:05:47 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Dario Binacchi <dariobin@libero.it>
Subject: Re: [PATCH] dt-bindings: serial: Move omap-serial.txt to YAML schema
Message-ID: <YLCWS/+TwSs8HhRG@atomide.com>
References: <20210527165636.939-1-vigneshr@ti.com>
 <3760d1e6-2121-323b-d962-60e8291d0bb7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3760d1e6-2121-323b-d962-60e8291d0bb7@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210527 17:49]:
> 
> 
> On 27/05/2021 19:56, Vignesh Raghavendra wrote:
> > Convert serial-omap.txt to YAML schema for better checks and documentation.
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > ---
> >   .../bindings/serial/omap_serial.txt           |  40 ------
> >   .../bindings/serial/ti,omap4-uart.yaml        | 116 ++++++++++++++++++
> >   2 files changed, 116 insertions(+), 40 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
> >   create mode 100644 Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
> 
> Why omap4? Seems ti,omap-uart.yaml is more suitable.

Additionally omap-serial should be deprecated in favor of 8250_omap and
omap-serial not used at all in general.

It seems some folks still stick to omap-serial for legacy reasons when
using an old .config. That's easy to fix by just changing inittab to
use ttyS instead of ttyO, the kernel cmdline is already fixed up on
init to use ttyS, but might as well update the bootloader cmdline too.

But why do we even allow using this driver on newer SoCs when we have
already planned to deprecate omap-serial.c years before the new SoCs?

I suggest we make omap-serial deprecated for all SoCs, and not even
allow it for am6, omap-serial.c only lists these:

        { .compatible = "ti,omap2-uart" },
        { .compatible = "ti,omap3-uart" },
        { .compatible = "ti,omap4-uart" },

And folks are also using it for some rs485 cases that should just be
really fixed for 8250_omap instead.. Adding Dario to Cc because of
these omap-serial patches:

e2a5e8448e73 ("serial: omap: fix rs485 half-duplex filtering")
45f6b6db53c8 ("serial: omap: don't disable rs485 if rts gpio is missing")

Dario, why not use 8250_omap instead?

Regards,

Tony
