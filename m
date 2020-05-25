Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4F91E0827
	for <lists+linux-omap@lfdr.de>; Mon, 25 May 2020 09:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389152AbgEYHog (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 May 2020 03:44:36 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39581 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389105AbgEYHof (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 May 2020 03:44:35 -0400
Received: by mail-lf1-f68.google.com with SMTP id z206so6346748lfc.6;
        Mon, 25 May 2020 00:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QQh8K/AzxLyGXT7M8yyjCx9x6FADb3eXEm3pp3jyfa4=;
        b=Zgpw5qphMRCBKWHJFfrmVihs3Yafigyu8r1I6rSThpIn6IoCrkEpHpPQPdOHdILtnc
         o34ZdzK05O2EsAhcbSDNuL+nKpO+VM9vB4D2hruSUmIelKC21lcFQLYJIITIYr9OXqO2
         J7Kh8jVQtBwfksKmwcm+xu6RERFPITseVDe/HSusP/+szbISvyBqLliroe980yVj4WyK
         KqHjWB2nzJIkBZ9GISVRnFUxD0cNkDnXj6VqoVmVJfrZ1nr3vx6BcO6NdH4MhvXv3Py9
         VgUjhf4dxXNbjcyxXY2tdxkJxR2XWIvKPOn9/mjm36rfj4mWGmPUfycX8OP+Ic84EIiZ
         lACw==
X-Gm-Message-State: AOAM532xn4mq4lgKq2+RbU1mnSmcdVKpM0GRSMWV5BLXzrCQjw/gkz8O
        TKGIm6QLXLRR6cEuSZC7tO4=
X-Google-Smtp-Source: ABdhPJxKSbwHav/tnGnwZwLeNFOidZRkNGpkdbwTWES4Gq2Rkn73uu1zH4rlqSs7CM5G8CSF/j4pBg==
X-Received: by 2002:a19:c212:: with SMTP id l18mr6677122lfc.68.1590392673005;
        Mon, 25 May 2020 00:44:33 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l15sm4308390ljc.73.2020.05.25.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 00:44:32 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jd7ma-0001OJ-DP; Mon, 25 May 2020 09:44:24 +0200
Date:   Mon, 25 May 2020 09:44:24 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tony Lindgren <tony@atomide.com>, Johan Hovold <johan@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200525074424.GA5276@localhost>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200522091731.GA1203588@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522091731.GA1203588@kroah.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 22, 2020 at 11:17:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 12, 2020 at 02:47:07PM -0700, Tony Lindgren wrote:
> > Hi all,
> > 
> > Here's the updated set of these patches fixed up for Johan's and
> > Pavel's earlier comments.
> > 
> > This series does the following:
> > 
> > 1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use
> > 
> > 2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
> >    TTY ports configured in devicetree with help of n_gsm.c
> > 
> > 3. Allows the use of standard Linux device drivers for dedicated
> >    TS 27.010 channels for devices like GNSS and ALSA found on some
> >    modems for example
> > 
> > 4. Adds a gnss-motmdm consumer driver for the GNSS device found on
> >    the Motorola Mapphone MDM6600 modem on devices like droid4
> > 
> > I've placed the serdev-ngsm.c under drivers/tty/serdev as it still
> > seems to make most sense with no better places available. It's no
> > longer an MFD driver as it really does not need to care what channel
> > specific consumer drivers might be configured for the generic driver.
> > Now serdev-ngsm just uses of_platform_populate() to probe whatever
> > child nodes it might find.
> > 
> > I'm not attached having the driver in drivers/tty/serdev. I just
> > don't have any better locations in mind. So using Johan's earlier
> > i2c example, the drivers/tty/serdev/serdev-ngsm.c driver is now a
> > generic protocol and bus driver, so it's getting closer to the
> > the drivers/i2c/busses analogy maybe :) Please do suggest better
> > locations other than MFD and misc if you have better ideas.
> > 
> > Now without the chardev support, the /dev/gsmtty* using apps need
> > to use "U1234AT+CFUN?" format for the packets. The advantage is
> > less kernel code, and we keep the existing /dev/gsmtty* interface.
> > 
> > If we still really need the custom chardev support, that can now
> > be added as needed with the channel specific consumer driver(s),
> > but looks like this won't be needed based on Pavel's ofono work.
> 
> Johan and Rob, any objection/review of this series?

Yeah, sorry I haven't had time to review this yet. I should be able to
look at it today.

Johan
