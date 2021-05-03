Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A336637138E
	for <lists+linux-omap@lfdr.de>; Mon,  3 May 2021 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhECKUc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 May 2021 06:20:32 -0400
Received: from muru.com ([72.249.23.125]:51086 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233025AbhECKUb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 3 May 2021 06:20:31 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 75346809F;
        Mon,  3 May 2021 10:19:39 +0000 (UTC)
Date:   Mon, 3 May 2021 13:19:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Mighty M <mightymb17@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Performance difference in mainline and downstream
Message-ID: <YI/ONvCE4RuUV6SC@atomide.com>
References: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Mighty M <mightymb17@gmail.com> [210430 07:49]:
> I have a Samsung Galaxy Tab 2 which has an OMAP 4430 clocked at 1Ghz,
> with that there is quite some difference in performance when comparing
> the mainline and downstream kernels. To confirm my suspicions I ran
> UnixBench(https://github.com/kdlucas/byte-unixbench) on both of them,
> the results are as follows -
> 1) Downstream (running SailfishOS) - Kernel Source -
> https://github.com/CyanogenMod/android_kernel_samsung_espresso10, I
> get a result of 580.4 in dual-core and 292.9 in single core. I
> compiled UnixBench manually.
> 2) Mainline (running PostMarketOS) - Kernel Source -
> https://github.com/MightyM17/linux_openpvrsgx/tree/letux-pvrsrvkm-5.12-rc1,
> when using UnixBench package from PostMarketOS repo, I get a score of
> 352.7 dual core and 192.7 single core, and compiling it myself and
> then running gives the score 415.1 dual core and 209.9 single core.
> 
> The downstream scores are quite high even beating Droid 4 which has
> CPU clocked at 1.2Ghz when Tab 2 has it at 1 GHz.
> 
> Why is there so much difference in mainline and downstream and what
> can be done to improve the performance.

If you have a good test case, it would be nice to narrow down the
performance issue and fix it. My guess is that the following might
help with the mainline Linux kernel built with omap2plus_defconfig:

- Disable CONFIG_DEBUG in .config

- Disable CONFIG_ARCH_OMAP2 in .config to disable the build options
  for ARMv6

If the above does not help, then let's look further in the L2
settings for example.

Regards,

Tony


