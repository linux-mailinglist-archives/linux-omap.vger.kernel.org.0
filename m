Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDDA1B421F
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 12:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgDVK6N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 06:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728021AbgDVKE3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Apr 2020 06:04:29 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AECC03C1A8;
        Wed, 22 Apr 2020 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xjPeTaJb6fDrWwRoeW49VkZts+eKBc+WVFAQnP6cFZM=; b=Wt31SlMc19Z0O6lY8IZJYheFde
        oPfDUlaW46nJbFfm3gQ0kbJkR1RuLcrCT2GDTLcFfYwReBZFcSosQ40yi3chPXHqvXSrCdY8aX6xC
        b6DkCSwnw6Aaeh+/fMad49xxZbNFRpCe07fN8+c2vc9QePrybW79oDED6Dl2FaJ5UBZI=;
Received: from p200300ccff0a5d001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:5d00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jRCEt-0004YJ-At; Wed, 22 Apr 2020 12:04:19 +0200
Date:   Wed, 22 Apr 2020 12:04:18 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200422120418.49a40c75@aktux>
In-Reply-To: <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com>
References: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
        <20200417164340.3d9043d1@aktux>
        <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com>
        <20200417150721.GL37466@atomide.com>
        <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
        <20200420150802.GR37466@atomide.com>
        <D1A77603-11FB-407F-B480-82C57E742C51@goldelico.com>
        <20200421085336.32cf8ffe@aktux>
        <20200421180220.GB37466@atomide.com>
        <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com>
        <20200421182017.GC37466@atomide.com>
        <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 Apr 2020 22:40:39 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Tony,
> 
> > Am 21.04.2020 um 20:20 schrieb Tony Lindgren <tony@atomide.com>:
> >   
> >> Well, what helps is reverting the patch and using the old driver
> >> (which did work for several years). So I would not assume that
> >> there is a hardware influence. It seems to be something the new
> >> driver is doing differently.  
> > 
> > Well earlier hdq1w.c did not idle, now it does.  
> 
> Ah, I see!
> 
> > If you just want to keep it enabled like earlier, you can just add something like:  
> 
> Well, I don't want it enabled, it just should work as before.
> Ideally including all improvements :)
> 
> > 
> > &hdqw1w {
> > 	ti,no-idle;
> > };  
> 
> I have added that and there might be a slightly different pattern
> (unless that is just by luck): the first two or three attempts to
> read the bq27xx/uevent did still time out. But then the next ones
> worked fine (with a response time of ca. 65 .. 230 ms).
> 
> So as if something needs to be shaken into the right position after
> boot until it works.
> 

What about reading battery with just omap_hdq loaded and then continue
booting as usual, e.g. something like:

have script init-bat.sh
#!/bin/sh
modprobe omap_hdq
cat /sys/class/power_supply/bq27000_battery/uevent
exec /sbin/init "$@"

and then append to kernel parameters init=/init-bat.sh

Regards,
Andreas
