Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E56427689A
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 07:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgIXFxR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 01:53:17 -0400
Received: from muru.com ([72.249.23.125]:45304 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXFxQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Sep 2020 01:53:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7E49280A0;
        Thu, 24 Sep 2020 05:53:19 +0000 (UTC)
Date:   Thu, 24 Sep 2020 08:53:13 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200924055313.GC9471@atomide.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924054220.GA9471@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> > > > On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> > > > > v5.9-rc5
> > > > > [    0.706165] cpuidle: using governor menu
> > > > > [    6.761812] No ATAGs?
> > > > > 
> > > > > [   19.522536] Run /sbin/init as init process

Hmm v5.9-rc1 here with NFSroot shows this for me:

[   11.704511] Run /sbin/init as init process

And v5.9-rc6 shows:

[   13.120913] Run /sbin/init as init process

With at least two seconds spent on waiting for Ethernet PHY to
negotiate the speed. This is with omap2plus_defconfig.

Regards,

Tony
