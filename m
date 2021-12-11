Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF113471247
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 07:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhLKG5y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Dec 2021 01:57:54 -0500
Received: from muru.com ([72.249.23.125]:37108 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229455AbhLKG5y (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 11 Dec 2021 01:57:54 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 199CB809F;
        Sat, 11 Dec 2021 06:58:35 +0000 (UTC)
Date:   Sat, 11 Dec 2021 08:57:51 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <YbRL75F/SlcPJjtf@atomide.com>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz>
 <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Merlijn Wajer <merlijn@wizzup.org> [211210 23:41]:
> Hi Aaro,
> 
> On 10/12/2021 12:13, Aaro Koskinen wrote:
> > Hi,
> > 
> > On Wed, Dec 08, 2021 at 11:34:53PM +0100, Merlijn B.W. Wajer wrote:
> >> What I have seen is that if off mode is enabled from userspace
> >> (debugfs), it does not cause a problem (or I don't hit the problem at
> >> least). That said, my off mode tests are pretty minimal with
> >> init=/bin/sh, and I haven't gotten a fully booted (with lots of modules
> >> loaded, gui and daemons) system to enter off mode yet.
> > 
> > I also started seeing crashes with fb2c599f0566 on N900. It's been several
> > months since I last tested, but I remember I was able to trigger the
> > crashes reliably with MMC access from the minimal shell enviroment.
> > I see the MMC is also visible in your crash logs. My test case was
> > something like "sleep 30 ; blkid ; sleep 30".
> 
> Thanks for this info -- I can confirm, I see the same when I do this:
> 
> 1. boot to init=/bin/bash
> 
> 2. run:
> 
> > modprobe panel-sony-acx565akm
> > 
> > mount -t proc none /proc
> > mount -t sysfs none /sys
> > mount -t debugfs none /sys/kernel/debug
> > mount -o rw,remount /
> > 
> > echo 1 > /sys/kernel/debug/pm_debug/enable_off_mode
> > echo 0 > /sys/class/backlight/acx565akm/brightness
> 
> 3. run:
> 
> > sleep 30 ; blkid
> 
> So we have a pretty reproducible test case here I think.

Just to see if this relates to the omap_hsmmc.c driver, maybe try this with
v5.16-rc1 also with a patch that changes omap3.dtsi ti,omap3-hsmmc compatibles
with ti,omap3-sdhci compatibles.

Regards,

Tony

