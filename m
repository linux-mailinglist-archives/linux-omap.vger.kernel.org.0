Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02A311D384
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbfLLRPx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:15:53 -0500
Received: from muru.com ([72.249.23.125]:46440 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730022AbfLLRPw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:15:52 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 59D6D80C0;
        Thu, 12 Dec 2019 17:16:31 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:15:49 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191212171549.GX35479@atomide.com>
References: <20191126034151.38154-1-tony@atomide.com>
 <20191212160059.GI16429@iaqt7>
 <20191212160946.GR35479@atomide.com>
 <20191212170829.GA14499@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212170829.GA14499@iaqt7>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Bin Liu <b-liu@ti.com> [191212 17:09]:
> On Thu, Dec 12, 2019 at 08:09:46AM -0800, Tony Lindgren wrote:
> > That will wake up musb waiting for further interrupts thinking it's
> > connected. But after that there are no more interrupts as the cable
> > is disconnected so we need to poll the status again.
> > 
> > If we see SUSPEND before DISCONNECT, then things idle fine.
> 
> Does SUSPEND always comes after DISCONNECT on omap2430, or just
> sometimes? I guess the USB connector has some issue - when DP/DM pins
> are disconnected, SUSPEND interrupt is generated; when VBUS/GND pins are
> disconnected, DISCONNECT interrupt is generated. Because DP/DM pins are
> shorter than VBUS/GND, SUSPEND should come before DISCONNECT.

No this does not always happen, but happens annoyingly often for
me to notice. Your explanation sounds good though, and also sounds
that can be affected by the wear on a micro-USB connector.

Regards,

Tony

