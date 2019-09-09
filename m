Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2395BADD03
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 18:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389269AbfIIQYL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 12:24:11 -0400
Received: from muru.com ([72.249.23.125]:60372 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbfIIQYL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 9 Sep 2019 12:24:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 69DBC80BF;
        Mon,  9 Sep 2019 16:24:41 +0000 (UTC)
Date:   Mon, 9 Sep 2019 09:24:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     Tomas Novotny <tomas@novotny.cz>, linux-omap@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: omap-mcbsp: TX Buffer Overflow
Message-ID: <20190909162407.GO52127@atomide.com>
References: <20190906165109.53c5a306@tomas.local.tbs-biometrics.cz>
 <20190907091358.GA7166@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190907091358.GA7166@lenoch>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ladislav Michl <ladis@linux-mips.org> [190907 09:14]:
> On Fri, Sep 06, 2019 at 04:51:09PM +0200, Tomas Novotny wrote:
> > Hi,
> > 
> > we have AM3703 based board similar to BeagleBoard. I'm hitting this error
> > after upgrade to latest LTS 4.19.71 (upgraded from 4.1):
> > 
> > omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
> > 
> > This appears during or after playing of short (~2s) ding-dong wav. That error
> > exists for longer time, because handling of tx buffer overflow irq was
> > introduced in 2016: 4e85e7776eba ("ASoC: omap-mcbsp: Enable TX/RX under and
> > overflow interrupts"). I've cherry-picked it to 4.1 and I see the error there also.
> > The sound seems clear and ok to me, but we are using low quality speaker.
> 
> Just FYI, for stream capture there's
> omap-mcbsp 49022000.mcbsp: RX Buffer Underflow!
> 
> As far as I remember all stable kernels we have in production - 4.9.x, 4.14.x and
> 4.19.x - are affected. IGEPv2 with both DM3730 and OMAP3530 are affected
> (headless machines, CONFIG_VIDEO_OMAP3=n).

Hmm I wonder if this is still related to the SoC idling?
See commit 9834ffd1ecc3 ("ASoC: omap-mcbsp: Add PM QoS support for McBSP
to prevent glitches"), maybe something still needs to be fixed in that
area.

> And DT is probably worth updating:
> omap_hwmod: mcbsp2_sidetone using broken dt data from mcbsp
> omap_hwmod: mcbsp3_sidetone using broken dt data from mcbsp
> 
> I never motivated myself to dig deeper as catured stream looks pretty normal.

These mean the devices should really have separate nodes
in the dts rather than combining multiple devices into a
single node with multiple reg entries.

The issue with combining multiple devices into a single device
is that flushing posted write with a read back to one register
range will not flush it for the other which can cause mysterious
bugs.

Regards,

Tony
