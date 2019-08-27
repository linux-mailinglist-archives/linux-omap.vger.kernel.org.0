Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C928D9EF6C
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2019 17:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfH0Pu5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Aug 2019 11:50:57 -0400
Received: from emh02.mail.saunalahti.fi ([62.142.5.108]:45268 "EHLO
        emh02.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfH0Pu5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Aug 2019 11:50:57 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-76-175-nat.elisa-mobile.fi [85.76.76.175])
        by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 26E4D20033;
        Tue, 27 Aug 2019 18:50:55 +0300 (EEST)
Date:   Tue, 27 Aug 2019 18:50:54 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org
Subject: Re: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190827155054.GI30291@darkstar.musicnaut.iki.fi>
References: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
 <7d195797-085e-3bcc-933e-dca71dc12364@ti.com>
 <20190827081120.6lvtmqrdh2un7kit@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190827081120.6lvtmqrdh2un7kit@pali>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, Aug 27, 2019 at 10:11:20AM +0200, Pali Rohár wrote:
> On Monday 26 August 2019 11:00:21 Tero Kristo wrote:
> > On 24.8.2019 0.46, Aaro Koskinen wrote:
> > > I was looking at N900 boot logs from the current mainline (v5.3-rc),
> > > and noticed this:
> > > 
> > > [    3.297668] omap3_rom_rng: initializing
> > > [    3.301940] omap3_rom_rng: unable to get RNG clock
> > > [    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2
> > > 
> > > It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
> > > cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
> > > How this driver is supposed to work now? I guess it has been broken for
> > > a while. :-(
> > 
> > You should have a DT node for the device, which contains the clock handle.
> 
> Hello, I have not tested new kernel on N900 for a longer time. And at
> that time (4.9) it worked fine. So it is just missing DT node? Maybe you
> could fix it when you testing it?

The driver does not seem to have DT support, it has only legacy init in
pdata-quirks. So maybe deleting the clock alias was premature.

A.
