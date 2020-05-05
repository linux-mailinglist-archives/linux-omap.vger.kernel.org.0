Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75DD1C648A
	for <lists+linux-omap@lfdr.de>; Wed,  6 May 2020 01:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbgEEXeO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 19:34:14 -0400
Received: from muru.com ([72.249.23.125]:53004 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728642AbgEEXeO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 19:34:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F1A6480A5;
        Tue,  5 May 2020 23:35:00 +0000 (UTC)
Date:   Tue, 5 May 2020 16:34:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
Message-ID: <20200505233408.GS37466@atomide.com>
References: <20200504230100.181926-1-aford173@gmail.com>
 <20200505184223.GR37466@atomide.com>
 <CAHCN7xJxg+uO4h2RcapyjormTMzXFwoMUOi7rh2hUsScJtK56Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJxg+uO4h2RcapyjormTMzXFwoMUOi7rh2hUsScJtK56Q@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200505 21:18]:
> On Tue, May 5, 2020 at 1:42 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Adam Ford <aford173@gmail.com> [200504 16:02]:
> > > Various OMAP3 boards have two AES blocks, but only one is currently
> > > available, because the hwmods are only configured for one.
> > >
> > > This patch migrates the hwmods for the AES engine to sysc-omap2
> > > which allows the second AES crypto engine to become available.
> > >
> > >   omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
> > >   omap-aes 480a6000.aes1: will run requests pump with realtime priority
> > >   omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
> > >   omap-aes 480c5000.aes2: will run requests pump with realtime priority
> >
> > Great :) Looks like I'm getting the following though:
> >
> > DTC     arch/arm/boot/dts/am3517-craneboard.dtb
> > arch/arm/boot/dts/omap3.dtsi:160.39-184.5: ERROR (phandle_references):
> > /ocp@68000000/target-module@480a6000:
> > Reference to non-existent node or label "aes1_ick"
> >
> > Is this patch maybe missing a change for am3717 for the aes1_ick?
> 
> I am guessing it's the same issue that plagues the am3517 with a note
> in the hwmods that stated noone seems to know which am3517's support
> it and which don't.  The RNG was disabled on the 3517, so I am
> guessing I'll do the same for AES.

OK, I have no idea what modules might be there on am3517.

> I should have posted it as an RFC, because I don't have the proper IRQ
> setup for the newly supported AES engine.  The interrupts that are
> used for the original AES are listed as 'Resereved' in the AM3517 TRM.
> I assume the second engine uses different interrupts.  I don't suppose
> anyone know what it should be?

Sorry no idea, usually the secure accelerator documentation is just
left out it seems. My guess the values are the same as on omap3.

Regards,

Tony
