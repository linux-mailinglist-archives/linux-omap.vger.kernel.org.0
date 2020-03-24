Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB517191722
	for <lists+linux-omap@lfdr.de>; Tue, 24 Mar 2020 18:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgCXRBP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Mar 2020 13:01:15 -0400
Received: from muru.com ([72.249.23.125]:33112 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727314AbgCXRBP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Mar 2020 13:01:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CE63E81CA;
        Tue, 24 Mar 2020 17:02:00 +0000 (UTC)
Date:   Tue, 24 Mar 2020 10:01:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        Peter Hurley <peter@hurleysoftware.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Droid 4 in -next -- still no backlight was Re: [PATCH 1/4] tty:
 n_gsm: Add support for serdev drivers
Message-ID: <20200324170110.GB37466@atomide.com>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-2-tony@atomide.com>
 <20200322224230.GB28082@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200322224230.GB28082@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200322 22:43]:
> Hi!
> 
> > We can make use of serdev drivers to do simple device drivers for
> > TS 27.010 chanels, and we can handle vendor specific protocols on top
> > of TS 27.010 with serdev drivers.
> 
> I took all three series (
> 
> [PATCHv3 0/3] Lost key-up interrupt handling for omap4-keypa
> [PATCH 1/3] Input: atmel_mxt_ts - use runtime PM instead of
> [PATCHv5 0/4] n_gsm serdev support and protocol driver for d
> 
> ) and applied them on top of next-20200320.
> 
> Good news is that result boots. (So I did partial testing of the patches).
> 
> Bad news is that I still don't have working backlight. I do have LED
> and there's backlight device connected to the LED, so I can't control
> the LED directly, but the screen is black (and I don't see boot
> messages either).
> 
> Before I start debugging, does screen work for you in -next, or do you
> have some fixes I could try?

Yes the backlight works for me now just fine with current v5.6-rc.

But yeah, looks like LCD is again broken in current Linux next,
maybe Laurent and Sebastian have some clues?

Regards,

Tony
