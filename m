Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575E8A1B20
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2019 15:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfH2NOa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Aug 2019 09:14:30 -0400
Received: from muru.com ([72.249.23.125]:59074 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbfH2NOa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Aug 2019 09:14:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4A7A180E7;
        Thu, 29 Aug 2019 13:14:59 +0000 (UTC)
Date:   Thu, 29 Aug 2019 06:14:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] usb: musb: omap2430: Fix flakeyness enumerating when
 connected to a lapdock
Message-ID: <20190829131426.GG52127@atomide.com>
References: <20190828151100.31996-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828151100.31996-1-tony@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190828 08:11]:
> With commit 594632efbb9a ("usb: musb: Adding musb support for OMAP4430")
> Looks like always calling otg_set_vbus() causes flakeyness enumerating when
> droid4 is connected to a lapdock. In this case lapdock runs in USB carkit
> type mode and feeds the VBUS.

I don't think this patch helps much actually, let's forget it for now.

Looks like the core reason for flakeyness enumerating devices is that
clocks are not idling on disconnect properly, and then the next
enumeration will fail. I'll debug more and will send a better patch
at some point.

Regards,

Tony
