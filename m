Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623D11B2916
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 16:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbgDUOJ7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 10:09:59 -0400
Received: from muru.com ([72.249.23.125]:50540 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728825AbgDUOJ7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 10:09:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6DF158081;
        Tue, 21 Apr 2020 14:10:45 +0000 (UTC)
Date:   Tue, 21 Apr 2020 07:09:54 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@denx.de>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv5 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20200421140954.GT37466@atomide.com>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200421115920.GA16890@amd>
 <20200421124820.GB784065@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421124820.GB784065@kroah.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Greg Kroah-Hartman <gregkh@linuxfoundation.org> [200421 12:49]:
> On Tue, Apr 21, 2020 at 01:59:20PM +0200, Pavel Machek wrote:
> > Hi!
> > 
> > > Here's v4 set of n_gsm serdev support patches, and the related protocol
> > > driver for the modem found on Motorola Mapphone phones and tablets
> > > like droid4.
> > > 
> > > This series only adds basic character device support for the serdev
> > > driver. Other serdev consumer drivers for specific devices will be
> > > posted separately.
> > > 
> > > The patches are against v5.6-rc series.
> > 
> > And it would be good to get them into v5.7... pretty please :-).
> 
> No, 5.7 is not ok for this, and i think it already needs a respin as
> this is not in my patch queue anymore.

I'll send out an updated series.

Thanks,

Tony
