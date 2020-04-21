Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428261B26A7
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 14:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgDUMsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 08:48:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgDUMsX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 08:48:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5179D2076E;
        Tue, 21 Apr 2020 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587473302;
        bh=MX//OISkXMkefkAGS97bnGPUwUOdUgkMZrE4oSc7af0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I61zNOARA45e29Y+vMJPmWFEfryzRhUTwFgUmghn5kTdgaT9VFPaYn7sYVK/88ZxU
         skzz9Eb3OKBdZvBv4RCa0D1IvH80O7Nyir94yeG5lQk5ilxKf7TKqQCeRh5UEmWyMz
         RAYA+9XeaKcFuXAhSdQel0SJ9Jsli7axPfagcNVQ=
Date:   Tue, 21 Apr 2020 14:48:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Machek <pavel@denx.de>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20200421124820.GB784065@kroah.com>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200421115920.GA16890@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421115920.GA16890@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Apr 21, 2020 at 01:59:20PM +0200, Pavel Machek wrote:
> Hi!
> 
> > Here's v4 set of n_gsm serdev support patches, and the related protocol
> > driver for the modem found on Motorola Mapphone phones and tablets
> > like droid4.
> > 
> > This series only adds basic character device support for the serdev
> > driver. Other serdev consumer drivers for specific devices will be
> > posted separately.
> > 
> > The patches are against v5.6-rc series.
> 
> And it would be good to get them into v5.7... pretty please :-).

No, 5.7 is not ok for this, and i think it already needs a respin as
this is not in my patch queue anymore.

thanks,

greg k-h
