Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495BDD9437
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 16:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfJPOqq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 10:46:46 -0400
Received: from muru.com ([72.249.23.125]:37520 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726697AbfJPOqq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 10:46:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F1EAF8107;
        Wed, 16 Oct 2019 14:47:19 +0000 (UTC)
Date:   Wed, 16 Oct 2019 07:46:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 7/8] ARM: OMAP2+: Allow core oswr for omap4
Message-ID: <20191016144642.GD5610@atomide.com>
References: <20191010001224.41826-1-tony@atomide.com>
 <20191010001224.41826-8-tony@atomide.com>
 <20191013150806.GE13278@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191013150806.GE13278@amd>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [191013 15:08]:
> On Wed 2019-10-09 17:12:23, Tony Lindgren wrote:
> > Commit f74297dd9354 ("ARM: OMAP2+: Make sure LOGICRETSTATE bits are not
> > cleared") disabled oswr (open switch retention) for per and core domains
> > as various GPIO related issues were noticed if the bootloader had
> > configured the bits for LOGICRETSTATE for per and core domains.
> > 
> > With the recent gpio-omap fixes, mostly related to commit e6818d29ea15
> > ("gpio: gpio-omap: configure edge detection for level IRQs for idle
> > wakeup"), things now behave for enabling core oswr for omap4.
> > 
> > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> 2,7,8 basically modify same lines of code? Should that be done in one
> patch?

In this case let's change one thing at a time as many issues
have been seen earlier with these settings. We want git bisect
to tell us which change breaks things in case of trouble.

The related gpio related issues should be fixed now though.

Regards,

Tony
