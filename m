Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902B52B32F7
	for <lists+linux-omap@lfdr.de>; Sun, 15 Nov 2020 09:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgKOIbn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sun, 15 Nov 2020 03:31:43 -0500
Received: from muru.com ([72.249.23.125]:48278 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbgKOIbf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Nov 2020 03:31:35 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6A86D80A0;
        Sun, 15 Nov 2020 08:31:36 +0000 (UTC)
Date:   Sun, 15 Nov 2020 10:31:26 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: v5.10-rc3 vs. Droid 4
Message-ID: <20201115083126.GX26857@atomide.com>
References: <20201114205744.GA7436@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201114205744.GA7436@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [201114 20:59]:
> Hi!
> 
> Does anyone have Droid 4 working with 5.10-rc3?
> 
> I tried it with the original config; I got message about culomb
> counter calibration done scrolling (and boot progressing very slowly
> or not at all) . So ... I disabled cpcap battery & charger
> support. But init still drops me to emergency shell.
> 
> I may try some more, but if someone know what is going on, let me
> know.

I ran into this too, sorry I thought I added you to Cc but looks like not.
See the fix here:

https://lore.kernel.org/lkml/20201111170613.46057-1-tony@atomide.com/

Regards,

Tony
