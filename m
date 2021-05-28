Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE9A539401C
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 11:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235297AbhE1Ji6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 05:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbhE1Ji6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 May 2021 05:38:58 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FA8C061574;
        Fri, 28 May 2021 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=D+35yASJhUYaJUAGPFyaJmXl49n0Cd1yVFeciqFYkFw=; b=h0JbpeZbFuuTg3es42JGVhYS58
        X84jCytJOYBgFh487BV6xcsRbyPEQxjSNBVYKiBh/W2IEY9Kn1G7plbHp6MiHCLLzEOV3xR7pw9RH
        S0b2YLISYbFlshxzMm+Rb4NjHIQSd9jk+HgsDl+uEOHKgQ0S5HXuce68gpZdWXTpUgFw=;
Received: from p200300ccff0cdc001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:dc00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lmYvc-00072Y-Jn; Fri, 28 May 2021 11:37:16 +0200
Date:   Fri, 28 May 2021 11:37:15 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210528113715.40ff1ff9@aktux>
In-Reply-To: <YLCGZEan87yp9Eeq@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, 28 May 2021 08:57:56 +0300
Tony Lindgren <tony@atomide.com> wrote:

> Hi,
> 
> * Andreas Kemnade <andreas@kemnade.info> [210527 19:15]:
> > Hi,
> > 
> > On Tue, 18 May 2021 18:06:15 +0300
> > Tony Lindgren <tony@atomide.com> wrote:
> >   
> > > On start-up, we can get a spurious session request interrupt with nothing
> > > connected. After that the devctl session bit will silently clear, but the
> > > musb hardware is never idled until a cable is plugged in, or the glue
> > > layer module is reloaded.
> > > 
> > > Let's just check the session bit again in 3 seconds in peripheral mode
> > > to catch the issue.
> > >   
> > Tested this together with the other musb patch you sent on gta04.
> > This has some interesting side effects.
> > 
> > Test done:
> > - loading kernel+ramdisk via usb-dfu
> > - disconnecting usb cable
> > - loading omap_hdq (to see battery status)
> > - idling serial ports
> > - checking battery current 1.
> > - loading omap2430, phy-twl4030-usb, g_ether
> > - checking battery current 2 (again with idled serial ports).
> > - rtcwake -s 20 -m mem
> > - checking current during suspend (3)
> > 
> > Without your patches: current 2 is current 1 + approx 15 mA, current 3
> > is near current 1.
> > With your patches: current 2 is near current 1, current 3 is approx
> > 15mA higher.  
> 
> Interesting, so power consumption is now better for runtime with cable
> disconnected, and after booting, but now somehow is now worse for
> suspended state. I'll try to reproduce.

dmesg of high power suspend:
[  769.181793] PM: suspend entry (deep)
[  769.181915] Filesystems sync: 0.000 seconds
[  769.183410] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  769.184875] OOM killer disabled.
[  769.184906] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  769.186462] printk: Suspending console(s) (use no_console_suspend to debug)
[  769.514526] Disabling non-boot CPUs ...
[  769.514556] Successfully put all powerdomains to target state
[  770.024322] musb-hdrc musb-hdrc.0.auto: musb_set_peripheral: already in peripheral mode: 80
[  770.026641] pwrseq_simple wifi_pwrseq: GPIO lookup for consumer reset
[  770.026672] pwrseq_simple wifi_pwrseq: using device tree for GPIO lookup
[  770.026702] pwrseq_simple wifi_pwrseq: No GPIO consumer reset found
[  770.027862] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer cd
[  770.027893] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup
[  770.027923] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of node '/ocp@68000000/mmc@480b4000[0]'
[  770.027954] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of node '/ocp@68000000/mmc@480b4000[0]'
[  770.028015] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup
[  770.028015] omap_hsmmc 480b4000.mmc: No GPIO consumer cd found
[  770.028045] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp
[  770.028045] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup
[  770.028076] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of node '/ocp@68000000/mmc@480b4000[0]'
[  770.028106] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of node '/ocp@68000000/mmc@480b4000[0]'
[  770.028137] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup
[  770.028137] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found
[  770.028594] OOM killer enabled.
[  770.028625] Restarting tasks ... done.
[  770.142852] PM: suspend exit

yes, some gpio driver is not loaded (not included in
omap2plus_defconfig).

rmmod omap2430 seems to bring back suspend current current to low
currents. 

> 
> > Another strange thing I have hit (I have not done this test before, no
> > idea yet if it is related, but it is also about musb):
> > Connecting a usb cable while serial ports are idle (not in system
> > supend), console serial port does not wake up by input, it reacts again
> > if I unplug usb. If I give usb0 an IP address, I can ping it. No
> > intensive debugging done there yet. Just stumbled across it.  
> 
> Hmm so if you have a usb cable connected and gta04 is a b-device, and
> there is vbus, musb should not currently idle at all.
> 
hmm, if musb and serial idle, and I connect usb, musb should power up.
It seems to work. I have no idea about serial state there. I used the
non-8250-based driver for that test (not the other one), so I do not
need to detach console. Maybe I created some wakeup race when
musb/serial wake up at the same time. because musb causes some console
messages. 

Ok, did not hit the send button... retested with the other console
driver.

> Maybe your uart3 wakeirq is not using the uart3_rx.uart3_rx
> pad but uses some alternative pad and the wakeirq is not working?
> 
Console rx is connected to H20, which is
uart3_rx_irrx = CONTROL_PADCONF_UART3_RTS_SD[31:16]
Nothing strange connected there.

Regards,
Andreas

