Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A1620FF4E
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 23:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgF3Ve1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 17:34:27 -0400
Received: from muru.com ([72.249.23.125]:60142 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgF3Ve1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Jun 2020 17:34:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9CB7881A8;
        Tue, 30 Jun 2020 21:35:18 +0000 (UTC)
Date:   Tue, 30 Jun 2020 14:34:23 -0700
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
Message-ID: <20200630213423.GG37466@atomide.com>
References: <20200628152442.322593-1-drew@beagleboard.org>
 <20200629170358.GT37466@atomide.com>
 <20200630020102.GA45128@x1>
 <20200630182037.GF37466@atomide.com>
 <20200630213155.GA115731@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630213155.GA115731@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200630 21:32]:
> On Tue, Jun 30, 2020 at 11:20:37AM -0700, Tony Lindgren wrote:
...
> > > > Needing to change the dts does not sound good to me.. But maybe you mean
> > > > this is needed until the gpio-omap and pinctrl-single patches are merged?
> > >
> > > I agree that I would like for userspace to be able to do run-time
> > > changes.  However, I think something would need to be added to the
> > > pinconf support in pinctrl-single for that to be possible.  There are
> > > bias properties but non for receiver enable.
> > > 
> > > Does it seem sensible to add that?
> > 
> > Well let's see with Linus W says. To me it seems this might be a good
> > reason to allow a sysfs interface to change the pinctrl if we don't
> > have it yet? With the proper gpio line naming it should be quite simple
> > to use too :)
> 
> I think if pinctrl-single allowed mux to be set through debugfs that
> could be one solution to the use case of users prototyping with a
> beaglebone.  Maybe that could be acceptable?

I think this should not depend on debugfs though, it should be a
generic interface.

Regards,

Tony
