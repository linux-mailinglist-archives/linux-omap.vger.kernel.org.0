Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131C2AC583
	for <lists+linux-omap@lfdr.de>; Sat,  7 Sep 2019 11:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfIGJOD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Sep 2019 05:14:03 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:39920 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfIGJOC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Sep 2019 05:14:02 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23994248AbfIGJOAdZwOx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Sep 2019 11:14:00 +0200
Date:   Sat, 7 Sep 2019 11:13:58 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Tomas Novotny <tomas@novotny.cz>
Cc:     linux-omap@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: omap-mcbsp: TX Buffer Overflow
Message-ID: <20190907091358.GA7166@lenoch>
References: <20190906165109.53c5a306@tomas.local.tbs-biometrics.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906165109.53c5a306@tomas.local.tbs-biometrics.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 06, 2019 at 04:51:09PM +0200, Tomas Novotny wrote:
> Hi,
> 
> we have AM3703 based board similar to BeagleBoard. I'm hitting this error
> after upgrade to latest LTS 4.19.71 (upgraded from 4.1):
> 
> omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
> 
> This appears during or after playing of short (~2s) ding-dong wav. That error
> exists for longer time, because handling of tx buffer overflow irq was
> introduced in 2016: 4e85e7776eba ("ASoC: omap-mcbsp: Enable TX/RX under and
> overflow interrupts"). I've cherry-picked it to 4.1 and I see the error there also.
> The sound seems clear and ok to me, but we are using low quality speaker.

Just FYI, for stream capture there's
omap-mcbsp 49022000.mcbsp: RX Buffer Underflow!

As far as I remember all stable kernels we have in production - 4.9.x, 4.14.x and
4.19.x - are affected. IGEPv2 with both DM3730 and OMAP3530 are affected
(headless machines, CONFIG_VIDEO_OMAP3=n).

And DT is probably worth updating:
omap_hwmod: mcbsp2_sidetone using broken dt data from mcbsp
omap_hwmod: mcbsp3_sidetone using broken dt data from mcbsp

I never motivated myself to dig deeper as catured stream looks pretty normal.

	l.

> There are two workarounds to get rid of the message:
> 1) Change 'dma_op_mode' sysfs attribute from 'element' to 'threshold'. I
> found that just by coincidence when checking sysfs attributes.
> 2) Compile kernel with CONFIG_VIDEO_OMAP3=y. Found on Logic PD forum [1].
> 
> Does anybody have any idea what's going wrong? Or why these (somehow)
> unrelated workarounds help?
> 
> Thanks,
> 
> Tomas
> 
> [1] https://support.logicpd.com/TDGForum/tabid/124/aft/2277/Default.aspx
