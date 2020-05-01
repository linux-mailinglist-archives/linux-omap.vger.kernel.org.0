Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6381C1E8E
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgEAUc3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:32:29 -0400
Received: from muru.com ([72.249.23.125]:52542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgEAUc3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 May 2020 16:32:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CF4E8810E;
        Fri,  1 May 2020 20:33:15 +0000 (UTC)
Date:   Fri, 1 May 2020 13:32:24 -0700
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
Message-ID: <20200501203224.GD37466@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200501201905.GA6043@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501201905.GA6043@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@denx.de> [200501 20:20]:
> Hi!
> 
> > My guess is that at least with the pending ofono patches, we just
> > want to use the raw interface for /dev/gsmtty* interface and stop
> > pretending we have a modem that is AT compatible.
> 
> Ok, so I got ofono back to work. ... I believe. It was not that
> bad. SMS send/receive and outgoing call start/hangup worked at some
> point (I did not play with mixers).
> 
> To github.com:pavelmachek/ofono.git
>    61d3d727..195760e9  mux-v1.29-1 -> mux-v1.29-1

OK good to hear and thanks for doing it.

Regards,

Tony
