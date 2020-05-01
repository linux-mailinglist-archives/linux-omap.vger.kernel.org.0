Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CAD1C1794
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 16:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgEAOUZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 10:20:25 -0400
Received: from muru.com ([72.249.23.125]:52482 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728839AbgEAOUZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 May 2020 10:20:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3BFC4810E;
        Fri,  1 May 2020 14:21:10 +0000 (UTC)
Date:   Fri, 1 May 2020 07:20:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200501142018.GB37466@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200501082111.GA7501@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501082111.GA7501@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200501 08:22]:
> Hi!
> 
> > Now without the chardev support, the /dev/gsmtty* using apps need
> > to use "U1234AT+CFUN?" format for the packets. The advantage is
> > less kernel code, and we keep the existing /dev/gsmtty* interface.
> 
> Actually... yes, this works. But no, this is not "existing" tty
> interface.
> 
> ttys work per character, and this interface definitely does not... it
> is "packet" based, write() syscalls need exactly right lengths. You
> can't just open minicom, and type "U1234...". You can't paste it,
> either (I tried). tty controls like start/stop bits and baud rate are
> useless here. CR/LF conversions are unwanted/dangerous because it is
> confusing hard to debug if you get them wrong.

Yes.. That's what n_gsm spins up.

> Now, I don't see reason why this could not be made to work, and it may
> be more important to have something in mainline and work with that. So
> if you can make this into -next, I'll not complain too loudly. But it
> is... still wrong and I liked motmdm* more :-).

Yes.. There are issues too with the motmdm* char dev interface too.

I don't think it would work as is for devices with network interfaces
on some channel, and continuation packets could need more handling
possibly.

But let's try to get the basics sorted out first and use the "raw"
gsmtty* interface. More stuff can always be added later as needed.

Regards,

Tony



