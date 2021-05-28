Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7E393CCC
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 07:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbhE1F7f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 01:59:35 -0400
Received: from muru.com ([72.249.23.125]:33120 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234811AbhE1F7e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 May 2021 01:59:34 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B363C80A8;
        Fri, 28 May 2021 05:58:05 +0000 (UTC)
Date:   Fri, 28 May 2021 08:57:56 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <YLCGZEan87yp9Eeq@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
 <20210527211501.70d176b4@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527211501.70d176b4@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Andreas Kemnade <andreas@kemnade.info> [210527 19:15]:
> Hi,
> 
> On Tue, 18 May 2021 18:06:15 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > On start-up, we can get a spurious session request interrupt with nothing
> > connected. After that the devctl session bit will silently clear, but the
> > musb hardware is never idled until a cable is plugged in, or the glue
> > layer module is reloaded.
> > 
> > Let's just check the session bit again in 3 seconds in peripheral mode
> > to catch the issue.
> > 
> Tested this together with the other musb patch you sent on gta04.
> This has some interesting side effects.
> 
> Test done:
> - loading kernel+ramdisk via usb-dfu
> - disconnecting usb cable
> - loading omap_hdq (to see battery status)
> - idling serial ports
> - checking battery current 1.
> - loading omap2430, phy-twl4030-usb, g_ether
> - checking battery current 2 (again with idled serial ports).
> - rtcwake -s 20 -m mem
> - checking current during suspend (3)
> 
> Without your patches: current 2 is current 1 + approx 15 mA, current 3
> is near current 1.
> With your patches: current 2 is near current 1, current 3 is approx
> 15mA higher.

Interesting, so power consumption is now better for runtime with cable
disconnected, and after booting, but now somehow is now worse for
suspended state. I'll try to reproduce.

> Another strange thing I have hit (I have not done this test before, no
> idea yet if it is related, but it is also about musb):
> Connecting a usb cable while serial ports are idle (not in system
> supend), console serial port does not wake up by input, it reacts again
> if I unplug usb. If I give usb0 an IP address, I can ping it. No
> intensive debugging done there yet. Just stumbled across it.

Hmm so if you have a usb cable connected and gta04 is a b-device, and
there is vbus, musb should not currently idle at all.

Maybe your uart3 wakeirq is not using the uart3_rx.uart3_rx
pad but uses some alternative pad and the wakeirq is not working?

Or the twl4030 usb phy is somehow interfering with the uart3 pins
when usb is in use. Worth checking the schematics again for the
uart3 rx pin used? Sorry I don't remember if omap3 has multiple
alternative pins for uart3, but I think it does.

Regards,

Tony

