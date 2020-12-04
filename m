Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA782CE973
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 09:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgLDIWp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 03:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgLDIWo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 03:22:44 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936C2C061A51;
        Fri,  4 Dec 2020 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WbW+gn6S/fvAC4RBecIwLAv21lRtD0xCR13FIw/9+jg=; b=Fr3zOqv3Q/fWqOsqFpBJmkJ7A8
        lXcLsoklT2cUl7fdYH7A99UDzo9mC7BAHRHHQ5Xx2dfLXW7rIJPDWGTg8AziltB5mCFvsxwgndZoR
        T2drucFgUddgWlI3hTdN/NBB74obJPdQ1xGZhSAgUGHcltM4lgXT3ibb3oWAkbBT3W44=;
Received: from p200300ccff0a0b001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:b00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kl6Lp-0002e2-C3; Fri, 04 Dec 2020 09:22:01 +0100
Date:   Fri, 4 Dec 2020 09:22:00 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Thierry Reding <treding@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [REGRESSION] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers
 that existed in v4.4
Message-ID: <20201204092200.0c7894ce@aktux>
In-Reply-To: <CAD=FV=VucTxW3PxtrN-Dye4h0LravXd-wHLKU91TaKe0eQ4TyA@mail.gmail.com>
References: <20201201210039.258d3fed@aktux>
        <20201203224309.5b5e0b50@aktux>
        <CAD=FV=VucTxW3PxtrN-Dye4h0LravXd-wHLKU91TaKe0eQ4TyA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 3 Dec 2020 14:03:46 -0800
Doug Anderson <dianders@chromium.org> wrote:

> Hi,
> 
> On Thu, Dec 3, 2020 at 1:43 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > On Tue, 1 Dec 2020 21:00:39 +0100
> > Andreas Kemnade <andreas@kemnade.info> wrote:
> >  
> > > Hi,
> > >
> > > during probing of second mmc host on the GTA04A5 which has a
> > > WL1835 wifi chip attached, I get the following oops. From a first glance
> > > this seems to be a timing sensitive. Maybe it rings some bells for someone...
> > > so I hesitate a bit to start the bisect job.  
> > Did the bisect job.
> > 21b2cec61c04 (mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)
> >
> > is the evil commit. Reverting it on top of v5.10-rc6 solves the problem.
> >  
> > > Wild guessing: bus width is set while mmc module is not active, so registers
> > > are not accessible.
> > > Kernel configuration is omap2plus_defconfig
> > >
> > > Regards,
> > > Andreas
> > >
> > >  
> 
> ...snip...
> 
> > > [    3.152587]  mmcblk0: p1 p2 p3 p4 < p5 p6 p7 p8 >
> > > [    3.159393] 0x000000880000-0x000020000000 : "File System"
> > > [    3.179534] omap_hsmmc 480b4000.mmc: omap_device_late_idle: enabled but no driver.  Idling  
> 
> I'm guessing that this is the key line.  It seems to come from
> omap_device_late_idle().
> 
> I don't know tons about that function, but a quick guess is that it needs a:
> 
> wait_for_device_probe();
> 
> ...at the start of it.  It seems like it's trying to idle devices that
> never got probed but not actually waiting for all devices to probe.
> It's just assuming that everything is done by late_initcall_sync().
> 
hmm, not sure, we have:
if (od->_driver_status != BUS_NOTIFY_BOUND_DRIVER &&
            od->_driver_status != BUS_NOTIFY_BIND_DRIVER) {
                if (od->_state == OMAP_DEVICE_STATE_ENABLED) {
                        dev_warn(dev, "%s: enabled but no driver.  Idling\n",
                                 __func__);
                        omap_device_idle(pdev);
                }
        }

apparently there is no code to set _driver_status to
BUS_NOTIFY_BOUND_DRIVER. I think that is the key problem. I will try to
create a patch to fix that.

Regards,
Andreas
