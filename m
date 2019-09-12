Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3F0FB15AF
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 23:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfILVIO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 17:08:14 -0400
Received: from muru.com ([72.249.23.125]:60620 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbfILVIN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Sep 2019 17:08:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 28A3280B6;
        Thu, 12 Sep 2019 21:08:44 +0000 (UTC)
Date:   Thu, 12 Sep 2019 14:08:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190912210751.GG22241@atomide.com>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
 <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLqbQ80+AO1Q5PoYyHpdjCTMBYTXzG=HBb5W838dXavjQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190827 13:18]:
> On Tue, Aug 27, 2019 at 3:12 AM Pali Rohár <pali.rohar@gmail.com> wrote:
> >
> > On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > > Hi,
> > > >
> > > > I was looking at N900 boot logs from the current mainline (v5.3-rc),
> > > > and noticed this:
> > > >
> > > > [    3.297668] omap3_rom_rng: initializing
> > > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
> > > >
> > > > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
> > > > cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> > > > How this driver is supposed to work now? I guess it has been broken for
> > > > a while. :-(
> > >
> > > You should have a DT node for the device, which contains the clock handle.
> 
> I am interested in enabling the RNG too, because sshd takes a long
> time to initialize without the hwrng.

FYI, I'll be posting some fixes to omap3_rom_rng including
the dts support. Not getting any data from it yet though..

Regards,

Tony
