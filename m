Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE841C18CA
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 16:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgEAOw4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 10:52:56 -0400
Received: from muru.com ([72.249.23.125]:52510 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728737AbgEAOw4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 May 2020 10:52:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B3F02810E;
        Fri,  1 May 2020 14:53:43 +0000 (UTC)
Date:   Fri, 1 May 2020 07:52:52 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>, Stephen Boyd <swboyd@chromium.org>
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
Message-ID: <20200501145252.GC37466@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430222605.GA10922@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430222605.GA10922@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200430 22:27]:
> 
> > My guess is that at least with the pending ofono patches, we just
> > want to use the raw interface for /dev/gsmtty* interface and stop
> > pretending we have a modem that is AT compatible.
> 
> I tried to get it to work... it was not fun and I did not get far.

OK. Yeah it's now 2020 and still dealing with serial port stuff :)

> I pushed my results...
> 
> user@devuan:/my/ofono$ git push
> Counting objects: 10, done.
> Delta compression using up to 2 threads.
> Compressing objects: 100% (10/10), done.
> Writing objects: 100% (10/10), 1.17 KiB | 0 bytes/s, done.
> Total 10 (delta 8), reused 0 (delta 0)
> remote: Resolving deltas: 100% (8/8), completed with 8 local objects.
> To github.com:pavelmachek/ofono.git
>    fd34ca20..9042014b  mux-v1.29-1 -> mux-v1.29-1

OK :) I still need to update the ALSA related patches on top
of this $subject series.

Also what I've noticed is that modprobe n_gsm debug=0xff hex output is
currently broken since commit 091cb0994edd ("lib/hexdump: make
print_hex_dump_bytes() a nop on !DEBUG builds"). Reverting the commit
fixes it.

Stephen, any ideas what should be changed to fix it?

Regards,

Tony
