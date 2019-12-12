Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B34C11D1E7
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 17:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbfLLQJu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 11:09:50 -0500
Received: from muru.com ([72.249.23.125]:46364 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729731AbfLLQJu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 11:09:50 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9780D80C0;
        Thu, 12 Dec 2019 16:10:28 +0000 (UTC)
Date:   Thu, 12 Dec 2019 08:09:46 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191212160946.GR35479@atomide.com>
References: <20191126034151.38154-1-tony@atomide.com>
 <20191212160059.GI16429@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212160059.GI16429@iaqt7>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Bin Liu <b-liu@ti.com> [191212 16:02]:
> Hi Tony,
> 
> Sorry for my late response.

No worries.

> On Mon, Nov 25, 2019 at 07:41:51PM -0800, Tony Lindgren wrote:
> > When disconnected as USB B-device, we sometimes get a suspend interrupt
> > after disconnect interrupt. In that case we have devctl set to 99 with
> > VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> > have an active session. We have no other interrupts after disconnect
> > coming in this case at least with the omap2430 glue.
> 
> I don't have an omap2430 platform to test, but its musb doesn't generate
> DISCONNECT interrupt at all when disconnected from USB host in any case?
> It is a surprise, the musb core driver expects the DISCONNECT interrupt
> after VBUS is lost and relies on it to tear down the gadget driver and
> the state machine. I am wondering how its USB is functional without the
> DISCONNECT event...

We do get DISCONNECT, but we can then get a SUSPEND after DISCONNECT
has already happened..

That will wake up musb waiting for further interrupts thinking it's
connected. But after that there are no more interrupts as the cable
is disconnected so we need to poll the status again.

If we see SUSPEND before DISCONNECT, then things idle fine.

Regards,

Tony
