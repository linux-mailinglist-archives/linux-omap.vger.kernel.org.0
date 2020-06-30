Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C152420ED4E
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 07:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgF3FWR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 01:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgF3FWR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 01:22:17 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95692C061755;
        Mon, 29 Jun 2020 22:22:16 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gc15so1548475pjb.0;
        Mon, 29 Jun 2020 22:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tt3UqAPgieXvuN/OSLBH2AI6nuwJPoB7pdEC5d7QwX0=;
        b=Rzrqz99ppxo5woLhPtqLdo83mGv5KVmEw66TOPkppL1egUe59sVB3/IcFek/GV7r0b
         QgZNmAafYUMPQOD5+eNOOAkt3miwJI30WA4aHZ12FqN8ef/jI+w8+7W0HMWRrzuTMVJ7
         1f3rrRWLkEFz/Zms9Vkrzp8QkPN3ITB3B7nK+pKc+gyzibpHqpssZ1q/2INFyzF8aSYV
         ZTLwnPTMCvaisQ+32nN0pSasOvOydSk0+d4abPOlIwlde74mVLnP7Pfcm4bZ31vyOhzg
         75DsPNyEQyLSf5mth67qDwMUQe57PIJuRtHvqHA/ti+btfiS3BV2Zqd/HNeYK/M4xu0B
         7f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tt3UqAPgieXvuN/OSLBH2AI6nuwJPoB7pdEC5d7QwX0=;
        b=CVryoS+4S8qtpz5fRIm77TC9AFzTWaPDDEh5mzgi3brEFy9kES7Z1GaCWQg2q4yfJ+
         4CTTPZrOclZMeNJHL+EmGYR6J33OPhoHP8CjiMIzFK2esOdEb15oLnL3frUftRSvUKXL
         yOHJJX4tB0hQ8kUAEekLGim8We4W1C5HlwfIPF2lgRWqrVhILtyjdJX5gMUcQqW8jLg3
         HSB+cJAXlVbisio4f2HDHiyXw0hoiFekANOLCaQS/sLeMEZYoEUlh4ug9A7UTq+Q1ISB
         MgO8Yyxi4cRkGg2Tll9RFS195/XvXoKUbRcwlaklJdAt8xkw/BC/0GMHBTK8rTLvJTMN
         5DNA==
X-Gm-Message-State: AOAM5309cRLWxn8CchyL82mwaX3FsgH9wHdeR68e13lrSWDqtVb36f04
        fAmUK5jXJ5qdlLBDYsxMuJs=
X-Google-Smtp-Source: ABdhPJwfCW5LZPfE/UzUd7MgFaMBIy4hDHgBVs6mq7SKUyKUUXxIXUnSgYGWnXqerQtko0lmRisL9g==
X-Received: by 2002:a17:90a:db8a:: with SMTP id h10mr4427274pjv.197.1593494535811;
        Mon, 29 Jun 2020 22:22:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 76sm1253502pfu.139.2020.06.29.22.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:22:14 -0700 (PDT)
Date:   Mon, 29 Jun 2020 22:22:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Merlijn Wajer <merlijn@wizzup.org>, jikos@suse.cz, vojtech@suse.cz,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Beno??t Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Subject: Re: input maintainer -- are you there? was Re: [PATCH 1/2] Input:
 add `SW_MACHINE_COVER`
Message-ID: <20200630052212.GH248110@dtor-ws>
References: <20200612125402.18393-1-merlijn@wizzup.org>
 <20200612125402.18393-2-merlijn@wizzup.org>
 <20200616105045.GB1718@bug>
 <fef69c79-9943-7bd1-5c51-101f551cf2c8@wizzup.org>
 <20200629133644.GA22227@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629133644.GA22227@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 29, 2020 at 03:36:44PM +0200, Pavel Machek wrote:
> Hi!
> 
> > Looks like we're blocking on this input patch.
> > 
> > On 16/06/2020 12:50, Pavel Machek wrote:
> > > On Fri 2020-06-12 14:53:58, Merlijn Wajer wrote:
> > >> This event code represents the state of a removable cover of a device.
> > >> Value 0 means that the cover is open or removed, value 1 means that the
> > >> cover is closed.
> > >>
> > >> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com> Acked-by: Tony Lindgren 
> > >> <tony@atomide.com> Signed-off-by: Merlijn Wajer <merlijn@wizzup.org> ---
> > > 
> > > Dmitry, can we get some kind of comment here, or better yet can we get you to apply this?
> > 
> > This is part of a patch series to resolve problems with the Nokia N900
> > not booting when the cover is removed (making the cover be the card
> > detect was also just weird IMHO). Just removing the card-detect from the
> > DTS is fine, but it was suggested that we expose the data instead as
> > input event. And that's gotten no response for about four months.
> > 
> > Should we just drop the feature and only remove the cd-gpios line from
> > the DTS, assuming upstream doesn't want this SW_MACHINE_COVER code?
> 
> I believe series is good, lets keep it. Changing now will only delay
> it a bit more. Let me try to get Dmitry's attention...
> 
> If that does not work, we can get Linus' attention :-).
> 
> If that does not work, umm, there are some other options.

Sorry, am really swamped the last couple months. I can pick up the input
code, do you want me to pick up DTS as well?

Thanks.


-- 
Dmitry
