Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA32111D3C5
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730094AbfLLR0S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:26:18 -0500
Received: from muru.com ([72.249.23.125]:46496 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730086AbfLLR0S (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:26:18 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9C59780C0;
        Thu, 12 Dec 2019 17:26:56 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:26:14 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191212172614.GZ35479@atomide.com>
References: <20191126034151.38154-1-tony@atomide.com>
 <5ae7f3aa-3992-a810-f5d4-0b5bb8fa6356@cogentembedded.com>
 <20191126174515.GZ35479@atomide.com>
 <20191212172157.GJ16429@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212172157.GJ16429@iaqt7>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Bin Liu <b-liu@ti.com> [191212 17:23]:
> On Tue, Nov 26, 2019 at 09:45:15AM -0800, Tony Lindgren wrote:
> > * Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> [191126 10:21]:
> > > Hello!
> > > 
> > > On 26.11.2019 6:41, Tony Lindgren wrote:
> > > 
> > > > When disconnected as USB B-device, we sometimes get a suspend interrupt
> > > > after disconnect interrupt. In that case we have devctl set to 99 with
> > > > VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> > > 
> > >     Thinks?
> > 
> > Thanks will fix.
> 
> Is this the only update needed? I can fix it locally when queuing the
> patch.

So it seems. Maybe also add your explanation for why the wrong
ordering of interrupts can happen while at it.

Regards,

Tony
