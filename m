Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D911D9B80
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 17:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbgESPmx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 11:42:53 -0400
Received: from muru.com ([72.249.23.125]:55012 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728633AbgESPmx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 May 2020 11:42:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B164380FA;
        Tue, 19 May 2020 15:43:42 +0000 (UTC)
Date:   Tue, 19 May 2020 08:42:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, "Liu, Bin" <b-liu@ti.com>
Subject: Re: AM3517 MUSB and CPPI
Message-ID: <20200519154250.GS37466@atomide.com>
References: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
 <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com>
 <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200518 10:20]:
> On Mon, May 18, 2020 at 12:35 AM Sekhar Nori <nsekhar@ti.com> wrote:
> >
> > + Bin who maintains MUSB controller support
> >
> > On 5/18/20 8:17 AM, Adam Ford wrote:
> > > From what I can tell, the MUSB controller on the AM3517 hasn't worked
> > > in a very long time.
> 
> Thanks for adding Bin.
> 
> I can post of code patches as an RFC if interested.  They don't work
> any better, but they don't work any worse either.
> 
> I have modifications to the am35x glue to support cppi41, cppi41 to
> support am35, and updates to the device tree to point the musb
> controller to the am35 glue with additions for cppi41 references and
> some additional clocks.

Sorry no idea about am3517 for musb. Sounds like it's similar to the
am335x though. The USB PHY(s) is probably different though and maybe
you need a separate drivers/phy driver. Maybe check the phy drivers
we have for davinci/dm814x/dm816x, maybe it's similar to those if
not the same as on am335x.

Regards,

Tony
