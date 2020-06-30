Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E08B20FB9E
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 20:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387763AbgF3SUn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 14:20:43 -0400
Received: from muru.com ([72.249.23.125]:60110 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733297AbgF3SUn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Jun 2020 14:20:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 620CE8164;
        Tue, 30 Jun 2020 18:21:33 +0000 (UTC)
Date:   Tue, 30 Jun 2020 11:20:37 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: am335x-pocketbeagle: set default mux for
 gpio pins
Message-ID: <20200630182037.GF37466@atomide.com>
References: <20200628152442.322593-1-drew@beagleboard.org>
 <20200629170358.GT37466@atomide.com>
 <20200630020102.GA45128@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630020102.GA45128@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200630 02:02]:
> On Mon, Jun 29, 2020 at 10:03:58AM -0700, Tony Lindgren wrote:
> > Hi,
> > 
> > * Drew Fustini <drew@beagleboard.org> [200628 08:26]:
> > > v2 changes:
> > > - change default mux from output to input.  Input is safer as it does
> > >   not drive the line.  If the user wants output, they will need to edit
> > >   this device tree.
> > 
> > So can you please clarify this a bit, are you saying that gpio output can't
> > be done via userspace?
> 
> As it stands, there is no way for userspace to change a pin from gpio 
> input to gpio output as it is based on the reciever active bit in the
> pin control register (table 9-60 in the AM3358 datasheet [0]).

OK. I guess one not so nice option would be to enable receiver active
for all the gpio pins.. But this also affects power consumption a little.

> I thought it would be useful to at least define the GPIOs available for
> use on the PocketBeagle by default (and eventually the other BeagleBone
> device trees).  Input seems to be the safest value.  This patch at least
> makes it more clear where the user should edit to switch from input to
> output.

Some TI TRMs actually have tables listing the preferred mux logic
for unused pins. I recall safe mode input pull down being one of the
preferred modes. Sorry not sure which TRM that is, maybe omap3 or
omap4 or omap5?

> > Needing to change the dts does not sound good to me.. But maybe you mean
> > this is needed until the gpio-omap and pinctrl-single patches are merged?
>
> I agree that I would like for userspace to be able to do run-time
> changes.  However, I think something would need to be added to the
> pinconf support in pinctrl-single for that to be possible.  There are
> bias properties but non for receiver enable.
> 
> Does it seem sensible to add that?

Well let's see with Linus W says. To me it seems this might be a good
reason to allow a sysfs interface to change the pinctrl if we don't
have it yet? With the proper gpio line naming it should be quite simple
to use too :)

Regards,

Tony
