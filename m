Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538C51D3841
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 19:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENRbu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 13:31:50 -0400
Received: from muru.com ([72.249.23.125]:54564 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgENRbt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 13:31:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1AD9380C0;
        Thu, 14 May 2020 17:32:37 +0000 (UTC)
Date:   Thu, 14 May 2020 10:31:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv8 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200514173144.GP37466@atomide.com>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200513190942.GA2626@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513190942.GA2626@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200513 19:10]:
> Hi!
> 
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
> 
> > 4. Adds a gnss-motmdm consumer driver for the GNSS device found on
> >    the Motorola Mapphone MDM6600 modem on devices like droid4
> 
> It does one thing ... it turns Droid 4 into useful phone! 

Right, a minor detail I forgot :)

> Thanks a lot. I believe these are same patches as in
> droid4-pending-v5.7 branch, so whole series is
> 
> Tested-by: Pavel Machek <pavel@ucw.cz>
> 
> Getting this into 5.8 would be nice :-).
> 
> > Now without the chardev support, the /dev/gsmtty* using apps need
> > to use "U1234AT+CFUN?" format for the packets. The advantage is
> > less kernel code, and we keep the existing /dev/gsmtty* interface.
> > 
> > If we still really need the custom chardev support, that can now
> > be added as needed with the channel specific consumer driver(s),
> > but looks like this won't be needed based on Pavel's ofono work.
> 
> These work for me, and I have patched ofono with basic
> functionality. It is no longer possible to use minicom for debugging,
> but printf can be used instead, so that's not much of a problem.
> 
> I have adjusted ofono code, and moved away from normal AT support
> code. More API changes would not be welcome :-).

There is no need for a new API or API changes as we now use the
existing n_gsm tty interface for /dev/gsmtty* devices that have
been around for years.

Regards,

Tony

