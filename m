Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60701B2EB2
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 20:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDUSC1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 14:02:27 -0400
Received: from muru.com ([72.249.23.125]:50758 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbgDUSC1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 14:02:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C86768081;
        Tue, 21 Apr 2020 18:03:11 +0000 (UTC)
Date:   Tue, 21 Apr 2020 11:02:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200421180220.GB37466@atomide.com>
References: <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
 <20200416184638.GI37466@atomide.com>
 <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
 <20200417164340.3d9043d1@aktux>
 <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
 <20200417150721.GL37466@atomide.com>
 <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
 <20200420150802.GR37466@atomide.com>
 <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com>
 <20200421085336.32cf8ffe@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421085336.32cf8ffe@aktux>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [200421 06:54]:
> On Mon, 20 Apr 2020 23:11:18 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> > The only maybe important observation was when I disabled all
> > kernel modules except *hdq*.ko and *bq27*.ko. Then I did only
> > get an emergency shell so that it is quite similar to the
> > scenario Andreas has tested. With this setup it did work.
> > 
> So I guess without idling uarts?
> 
> > I then tried to reenable other kernel modules but the result
> > wasn't convincing that it gives a reliable result.
> > 
> > So I have still no clear indication when the problem occurs and
> > when not.
> > 
> Hmm, last summer I had problems even without that patch reading
> temperature while doing umts transfers. Maybe there are some
> connections,
> maybe not. For that scenario we might have emc issues, thermal problems
> or a real kernel problem.

I have confimed here that logicpd torpedo devkit with battery
works just fine while entering off mode during idle. I can see
the temperature just fine with:

# cat /sys/class/power_supply/bq27000-battery/uevent
POWER_SUPPLY_NAME=bq27000-battery
POWER_SUPPLY_STATUS=Charging
POWER_SUPPLY_PRESENT=1
POWER_SUPPLY_VOLTAGE_NOW=3829000
POWER_SUPPLY_CURRENT_NOW=-592084
POWER_SUPPLY_CAPACITY_LEVEL=Normal
POWER_SUPPLY_TEMP=306
POWER_SUPPLY_TECHNOLOGY=Li-ion
POWER_SUPPLY_CHARGE_FULL_DESIGN=2056320
POWER_SUPPLY_CYCLE_COUNT=0
POWER_SUPPLY_POWER_AVG=0
POWER_SUPPLY_MANUFACTURER=Texas Instruments

This is 37xx though, maybe you have 35xx and there's some errata
that we're not handling?

I'm only seeing "2.7. HDQTM/1-Wire® Communication Constraints"
for external pull-up resitor in 34xx errata at [0].

I wonder if wrong external pull could cause flakyeness after
enabling the hdq module?

If nothing else helps, you could try to block idle for hdq
module, but I have a feeling that's a workaround for something
else.

Regards,

Tony

[0] https://www.ti.com/pdfs/wtbu/SWPZ009A_OMAP4430_Errata_Public_vA.pdf

