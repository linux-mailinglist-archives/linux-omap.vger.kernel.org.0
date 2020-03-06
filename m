Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF2517BCCE
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 13:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgCFMeq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 07:34:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:49816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgCFMep (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 07:34:45 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D3D22072A;
        Fri,  6 Mar 2020 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583498085;
        bh=50FsvEWhVLCsXiT3fYUpxYQIEwnyRkjX2gQrIJs9pYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MqS88dhL/XPiRJyhwQhpkh7U1ms/rZrTIJRsbADkPAKs9VTrlUcomFIxcDhFhjiaX
         dnkB3CKGI+o0dgziPDIdgCiwUNXxIXGkAHBXBtpCO7DrjMUEHrYprqhrzYGFfDOdL3
         W3CkeTz40TJ5zLMZ7CdvG6sL6igocRd5BtK/jyfQ=
Date:   Fri, 6 Mar 2020 13:34:40 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mfd: motmdm: Add Motorola TS 27.010 serdev modem
 driver for droid4
Message-ID: <20200306123440.GA3691382@kroah.com>
References: <20200220195943.15314-1-tony@atomide.com>
 <20200220195943.15314-3-tony@atomide.com>
 <20200226115548.GO3494@dell>
 <20200226144308.GM37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226144308.GM37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Feb 26, 2020 at 06:43:08AM -0800, Tony Lindgren wrote:
> * Lee Jones <lee.jones@linaro.org> [200226 11:56]:
> > On Thu, 20 Feb 2020, Tony Lindgren wrote:
> > 
> > > Many Motorola phones are controlling the modem using a custom variant
> > > of TS 27.010 serial line discipline. Devices on these modems have a
> > > dedicated TS 27.010 channel for features like audio mixer, GNSS, voice
> > > modem, SIM card reader and so on.
> > > 
> > > This driver allows using various devices on the modem. In order to do
> > > that, we need to take care of the following three things:
> > > 
> > > 1. Provide /dev/motmdm* character devices for apps to use for talking
> > >    to the various devices on the modem
> > > 
> > > 2. Handle Motorola custom protocol over TS 27.010 to make the channels
> > >    usable for userspace
> > > 
> > > 3. Coordinate PM runtime with the USB PHY because of shared GPIO pins
> > >    with the USB PHY
> ...
> > > ---
> > >  drivers/mfd/Kconfig        |    9 +
> > >  drivers/mfd/Makefile       |    1 +
> > >  drivers/mfd/motorola-mdm.c | 1200 ++++++++++++++++++++++++++++++++++++
> > 
> > I'm not even going to start reviewing this as I can see, without even
> > looking at the code, that this has too much functionality (stuff that
> > does stuff) contained.
> > 
> > Please move as much functionality out into the subsystems as
> > possible.  Ideally, MFDs should be responsible for obtaining and
> > registering shared resources and registering child devices.  Anything
> > else should be shifted out to an appropriate subsystem.
> > 
> > MFD is not Misc.
> 
> OK good point. So this is a serdev consumer driver that eventually will
> also provide serdev style access to few device drivers too for the
> device within the modem after decoding the Motorola specific protocol.
> No special need for this driver to be under drivers/mfd though.
> 
> How about we add drivers/tty/serdev/protocol or similar directory for
> drivers like this?

Sure, that seems sane.

