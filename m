Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D67E1B2EEB
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 20:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgDUSUY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 14:20:24 -0400
Received: from muru.com ([72.249.23.125]:50780 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgDUSUX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 14:20:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DC8B98081;
        Tue, 21 Apr 2020 18:21:08 +0000 (UTC)
Date:   Tue, 21 Apr 2020 11:20:17 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200421182017.GC37466@atomide.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
 <20200417164340.3d9043d1@aktux>
 <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
 <20200417150721.GL37466@atomide.com>
 <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
 <20200420150802.GR37466@atomide.com>
 <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com>
 <20200421085336.32cf8ffe@aktux>
 <20200421180220.GB37466@atomide.com>
 <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200421 18:14]:
> > Am 21.04.2020 um 20:02 schrieb Tony Lindgren <tony@atomide.com>:
> > This is 37xx though, maybe you have 35xx and there's some errata
> > that we're not handling?
> 
> No, it is dm3730 on three different units I have tried.
> 
> > I'm only seeing "2.7. HDQTM/1-Wire® Communication Constraints"
> > for external pull-up resitor in 34xx errata at [0].
> > 
> > I wonder if wrong external pull could cause flakyeness after
> > enabling the hdq module?
> 
> I have checked and we have 10 kOhm pullup to 1.8 V and a 470 Ohm
> series resistor.

OK

> > If nothing else helps, you could try to block idle for hdq
> > module, but I have a feeling that's a workaround for something
> > else.
> 
> Well, what helps is reverting the patch and using the old driver
> (which did work for several years). So I would not assume that
> there is a hardware influence. It seems to be something the new
> driver is doing differently.

Well earlier hdq1w.c did not idle, now it does. If you just want
to keep it enabled like earlier, you can just add something like:

&hdqw1w {
	ti,no-idle;
};

> I need more time to understand and trace this issue on what it
> depends... It may depend on the sequence some other modules are
> loaded and what the user-space (udevd) is doing in the meantime.

Yes would be good to understand what goes wrong here before we
apply the ti,no-idle as that will block SoC deeper idle states.

Regards,

Tony
