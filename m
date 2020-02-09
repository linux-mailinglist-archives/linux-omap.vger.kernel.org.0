Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6236F156CC7
	for <lists+linux-omap@lfdr.de>; Sun,  9 Feb 2020 22:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgBIVhX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 9 Feb 2020 16:37:23 -0500
Received: from muru.com ([72.249.23.125]:54026 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgBIVhX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 9 Feb 2020 16:37:23 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 089288081;
        Sun,  9 Feb 2020 21:38:03 +0000 (UTC)
Date:   Sun, 9 Feb 2020 13:37:17 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: 5.6-rc0.95: /dev/motmdm no longer there
Message-ID: <20200209213717.GD64767@atomide.com>
References: <20200209213422.GA3009@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200209213422.GA3009@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200209 21:35]:
> Hi!
> 
> 5.6-rc0.95 -- based on:
> 
> commit fdfa3a6778b194974df77b384cc71eb2e503639a
> Merge: 291abfea4746 e0a514259378
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Feb 8 17:24:41 2020 -0800
> 
>     Merge tag 'scsi-misc' of
>     git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> 
> 
> /dev/motmdm* is not there for me. Unfortunately,
> drivers/mfd/motorola-mdm.c is not mainline, so I can't just try with
> the mainline....
> 
> Does it work for you?
> 
> I have ... rather a lot of warnings in dmesg :-(. /dev/ttyUSB4 works
> ok for me.
> 
> Can I somehow help get /dev/motmdmX upstream?

Heh yeah actually I'm cleaning up those patches right now :)

Meanwhile, try droid4-pending-v5.5 branch or pick the related
patches from there.

Regards,

Tony
