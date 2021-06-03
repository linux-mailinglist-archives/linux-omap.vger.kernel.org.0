Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072D839ACAF
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jun 2021 23:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhFCVX5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Jun 2021 17:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhFCVX5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Jun 2021 17:23:57 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0312C06174A;
        Thu,  3 Jun 2021 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3gdCFfcVS5DAeQU/Z/UPm4XYOW2hVv0rGemy44jz4pc=; b=B9JkKz+Hj+ISNmQf5VinUDokfJ
        vKg7GhnYxne6upo5NC+GHks8Fbw27J77f97mYjNKZ/lQe49cqekj6Y/QBtvSbbRCltWYdCFxFcyLA
        EuMLK/7Bn6xRZnWtVsKv3D/De1KDSFK+DUyxXsVuUw2hDdsgCvZaH1nj/kk0PXXMGbNo=;
Received: from p200300ccff12d3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:d300:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1loumy-0007AX-Fv; Thu, 03 Jun 2021 23:22:05 +0200
Date:   Thu, 3 Jun 2021 23:22:03 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210603232203.51f6293b@aktux>
In-Reply-To: <YLcaIqqjtmizjRLL@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
        <20210528113715.40ff1ff9@aktux>
        <YLcaIqqjtmizjRLL@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, 2 Jun 2021 08:41:54 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [210528 09:37]:
> > rmmod omap2430 seems to bring back suspend current current to low
> > currents.   
> 
> I wonder if the recent musb fix patch helps with this?
> 
> [PATCH] usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling
> https://lore.kernel.org/lkml/20210528140446.278076-1-thomas.petazzoni@bootlin.com/
> 
it does not help.
I did some more experiments and found out that
echo on >/sys/bus/platform/devices/480ab000.usb_otg_hs/power/control
sleep 3
before doing an rtcwake -m mem helps
2 seconds are not long enough.
All with usb disconnected.

some debug printks inserted into omap2430.c (doing it without the echo
on thing) [  355.643768] PM: suspend entry (deep)
[  355.643920] Filesystems sync: 0.000 seconds
[  355.644683] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  355.646392] OOM killer disabled.
[  355.646423] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  355.648010] printk: Suspending console(s) (use no_console_suspend to debug)
[  355.649291] musb-hdrc musb-hdrc.1.auto: omap2430 runtime_resume
[  355.966522] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
[  355.966552] musb-hdrc musb-hdrc.1.auto: omap2430 runtime_suspend
[  355.975250] musb-hdrc musb-hdrc.1.auto: omap2430 runtime_suspend
[  355.977294] Disabling non-boot CPUs ...
[  355.977325] Successfully put all powerdomains to target state
[  355.979034] musb-hdrc musb-hdrc.1.auto: omap2430 runtime_resume
[  356.244628] musb-omap2430 480ab000.usb_otg_hs: omap2430 resume
[  356.244659] musb-hdrc musb-hdrc.1.auto: omap2430 runtime_resume
[  356.486145] musb-hdrc musb-hdrc.1.auto: VBUS b_idle, devctl 80
[  356.486175] musb-hdrc musb-hdrc.1.auto: VBUS Disconnect
[  356.486175] musb-hdrc musb-hdrc.1.auto: musb_set_peripheral: already in peripheral mode: 80

There are two suspends in a row, I tried to fix it but it seems not to
be the cause for trouble. 

Regards,
Andreas
