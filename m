Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A7E22B856
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 23:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGWVIL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 17:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgGWVIL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 17:08:11 -0400
X-Greylist: delayed 764 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Jul 2020 14:08:11 PDT
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4503FC0619D3
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From:Subject:Message-ID; bh=GVHWuSBLLor554PVb+AbJTCraXOKqQJdAkMxXWazX0w=;
        b=B2tdSAq3HsQqX3cHYsAH2vS+bxaH8DPPn9xSRtNqCYfJXJ6Xd+cO6VCqgpvISfdp5fgJ02W9UXQYYeJEN1BZOSetwPAg4MFKoE1xIhywwJU0QecHQGhp2FB2+BsJsyyKrGs/TsAgJ1InS4wH957pw+/x637T8Ox9xFK+NCzD55Y=;
Received: from 97e2e5e0.skybroadband.com ([151.226.229.224] helo=david-5530)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1jyiFR-0005BD-JL; Thu, 23 Jul 2020 16:55:26 -0400
Message-ID: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me>
Subject: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
From:   David Shah <dave@ds0.me>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Date:   Thu, 23 Jul 2020 21:55:18 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

There has been a somewhat longstanding issue on the Pyra, where any kind of soft reboot causes
it to hang (only a true power off and on again works). The background is at
https://projects.goldelico.com/p/gta04-kernel/issues/876/.

The failure is typically of the following form: https://dev.pyra-handheld.com/snippets/765
(the exact failure sequence has changed a bit in different kernel versions).

With the pertinent line being:
[    0.000000] clock: dpll_abe_ck failed transition to 'locked'

This only happens on the Pyra, not the OMAP5 uEVM. This seems to be because
the Pyra uses TIMER8 for the backlight PWM.

Looking around at some other OMAP5 clocking code, I found
https://gitlab.com/linux-omap4-dev/omapboot/-/blob/kexec_support/arch/omap5/clock.c#L335
This to me suggests that both CM_CLKSEL_ABE_PLL_REF and CM_CLKSEL_WKUPAON
should be set to 1. I found that only CM_CLKSEL_ABE_PLL_REF was 1 and 
CM_CLKSEL_WKUPAON was 0 at the point of checking DPLL lock.

I wrote a very hacky patch just to force CM_CLKSEL_WKUPAON to 1 at startup, to test
this theory: https://dev.pyra-handheld.com/snippets/770 (breaking every rule in the
book, I know :)

And indeed with this reboots now seem to work fine.

The question is, what is the correct way/place to deal with this? Is this even a Linux
issue at all, or should U-Boot be doing something here? A quick glance suggests that
nothing in the kernel deals with CM_CLKSEL_WKUPAON at all but I may have missed
something.

Best

David

