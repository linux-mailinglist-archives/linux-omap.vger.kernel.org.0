Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB9A155BE9
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 17:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgBGQgc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 11:36:32 -0500
Received: from muru.com ([72.249.23.125]:53230 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726897AbgBGQgb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 7 Feb 2020 11:36:31 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 349C98047;
        Fri,  7 Feb 2020 16:37:14 +0000 (UTC)
Date:   Fri, 7 Feb 2020 08:36:23 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Kees Cook <keescook@chromium.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: Nokia N900 on 5.4 and 5.5
Message-ID: <20200207163623.GA64767@atomide.com>
References: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
 <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* H. Nikolaus Schaller <hns@goldelico.com> [200207 15:52]:
> 
> > Am 07.02.2020 um 15:54 schrieb Merlijn Wajer <merlijn@wizzup.org>:
> > 
> > Hi,
> > 
> > I've tried to build 5.4.18 and 5.5.2 for the Nokia N900, using
> > omap2plus_defconfig. Using appended DTB, like so:
> > 
> > $ cat arch/arm/boot/zImage arch/arm/boot/dts/omap3-n900.dtb > zImage.dtb
> > $ mkimage -A arm -O linux -T kernel -C none -a 80008000 -e 80008000 -n
> > zImage -d zImage.dtb uImage
> > 
> > But they both fail to boot for me - the device resets almost instantly:
> > 
> >> data abort
> >> 
> >>    MAYBE you should read doc/README.arm-unaligned-accesses
> >> 
> >> pc : [<8000c878>]          lr : [<80008160>]
> >> sp : 803c46c8  ip : 003a1870     fp : 003a1848
> >> r10: 803ba890  r9 : 00caa42c     r8 : 80000100
> >> r7 : 000007a3  r6 : 803a9878     r5 : 80000100  r4 : 80008000
> >> r3 : 00004e6c  r2 : 00019fa8     r1 : 803a9878  r0 : 00000000
> >> Flags: nZcv  IRQs off  FIQs on  Mode SVC_32
> >> Resetting CPU ...
> >> 
> >> resetting ...
> > 
> > Full log below. I tried the same with "-Os" instead of "-O2" ; to no avail.
> > 
> > Any clue what could be up?
> 
> I can only tell that I have successfully running 5.5.2 on GTA04A5 (dm3730
> but with our own defconfig). This may reduce the number of problem areas
> a little.

Looks like there's a regression in general for appended dtb booting that
was caused by commit 9f671e58159a ("security: Create "kernel hardening"
config area"). With that change we now get STACKPROTECTOR_PER_TASK
selected by default with Kconfig.

Merlijn, care to try to disable STACKPROTECTOR_PER_TASK in your
.config to see if that helps?

Not sure why appended dtb boot now breaks though.. Could be just the
zImage uncompressing over dtb again? Any ideas?

Regards,

Tony
