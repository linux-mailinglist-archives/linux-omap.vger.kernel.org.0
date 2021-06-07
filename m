Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B52739D5F2
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jun 2021 09:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFGH1a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Jun 2021 03:27:30 -0400
Received: from muru.com ([72.249.23.125]:37924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230198AbhFGH1a (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Jun 2021 03:27:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 55EA580F0;
        Mon,  7 Jun 2021 07:25:45 +0000 (UTC)
Date:   Mon, 7 Jun 2021 10:25:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Dario Binacchi <dariobin@libero.it>
Subject: Re: [PATCH] dt-bindings: serial: Move omap-serial.txt to YAML schema
Message-ID: <YL3J7tiggBqI/kZJ@atomide.com>
References: <20210527165636.939-1-vigneshr@ti.com>
 <3760d1e6-2121-323b-d962-60e8291d0bb7@ti.com>
 <YLCWS/+TwSs8HhRG@atomide.com>
 <20210604204859.GA3885095@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604204859.GA3885095@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [210604 20:49]:
> On Fri, May 28, 2021 at 10:05:47AM +0300, Tony Lindgren wrote:
> > * Grygorii Strashko <grygorii.strashko@ti.com> [210527 17:49]:
> > > 
> > > 
> > > On 27/05/2021 19:56, Vignesh Raghavendra wrote:
> > > > Convert serial-omap.txt to YAML schema for better checks and documentation.
> > > > 
> > > > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > > > ---
> > > >   .../bindings/serial/omap_serial.txt           |  40 ------
> > > >   .../bindings/serial/ti,omap4-uart.yaml        | 116 ++++++++++++++++++
> > > >   2 files changed, 116 insertions(+), 40 deletions(-)
> > > >   delete mode 100644 Documentation/devicetree/bindings/serial/omap_serial.txt
> > > >   create mode 100644 Documentation/devicetree/bindings/serial/ti,omap4-uart.yaml
> > > 
> > > Why omap4? Seems ti,omap-uart.yaml is more suitable.
> > 
> > Additionally omap-serial should be deprecated in favor of 8250_omap and
> > omap-serial not used at all in general.
> 
> That's the driver, I assume the binding works with either?

Yes both drivers work with this driver.

Regards,

Tony
