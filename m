Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9478C1DE2C6
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 11:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgEVJRg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 May 2020 05:17:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgEVJRf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 22 May 2020 05:17:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9800F206B6;
        Fri, 22 May 2020 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590139054;
        bh=HNMgBFDJToK3zbjWXKcZnffRZmJKX11EfdxrUJQVZ+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ALXMmxWNVRdAjNCssSQVc/aCyaMykegZCH1zG2CEyzJQngkhsO1Y29uPu1QJsKqUk
         Va1x7rbuVZTiy8uA6On9aCxlWqVvBJ0TCtd76m0uBBkp3mw0sDp3eX1C9M1thT8Kqz
         59gCS+p+GCEM4CESC9xYJ51C2Ps59hFla3XZTOe8=
Date:   Fri, 22 May 2020 11:17:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200522091731.GA1203588@kroah.com>
References: <20200512214713.40501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-1-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 12, 2020 at 02:47:07PM -0700, Tony Lindgren wrote:
> Hi all,
> 
> Here's the updated set of these patches fixed up for Johan's and
> Pavel's earlier comments.
> 
> This series does the following:
> 
> 1. Adds functions to n_gsm.c for serdev-ngsm.c driver to use
> 
> 2. Adds a generic serdev-ngsm.c driver that brings up the TS 27.010
>    TTY ports configured in devicetree with help of n_gsm.c
> 
> 3. Allows the use of standard Linux device drivers for dedicated
>    TS 27.010 channels for devices like GNSS and ALSA found on some
>    modems for example
> 
> 4. Adds a gnss-motmdm consumer driver for the GNSS device found on
>    the Motorola Mapphone MDM6600 modem on devices like droid4
> 
> I've placed the serdev-ngsm.c under drivers/tty/serdev as it still
> seems to make most sense with no better places available. It's no
> longer an MFD driver as it really does not need to care what channel
> specific consumer drivers might be configured for the generic driver.
> Now serdev-ngsm just uses of_platform_populate() to probe whatever
> child nodes it might find.
> 
> I'm not attached having the driver in drivers/tty/serdev. I just
> don't have any better locations in mind. So using Johan's earlier
> i2c example, the drivers/tty/serdev/serdev-ngsm.c driver is now a
> generic protocol and bus driver, so it's getting closer to the
> the drivers/i2c/busses analogy maybe :) Please do suggest better
> locations other than MFD and misc if you have better ideas.
> 
> Now without the chardev support, the /dev/gsmtty* using apps need
> to use "U1234AT+CFUN?" format for the packets. The advantage is
> less kernel code, and we keep the existing /dev/gsmtty* interface.
> 
> If we still really need the custom chardev support, that can now
> be added as needed with the channel specific consumer driver(s),
> but looks like this won't be needed based on Pavel's ofono work.

Johan and Rob, any objection/review of this series?

thanks,

greg k-h
