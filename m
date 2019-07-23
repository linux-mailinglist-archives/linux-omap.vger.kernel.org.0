Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073BD711FD
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 08:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfGWGi5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 02:38:57 -0400
Received: from muru.com ([72.249.23.125]:55542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732836AbfGWGiz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 02:38:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D40A0808C;
        Tue, 23 Jul 2019 06:39:20 +0000 (UTC)
Date:   Mon, 22 Jul 2019 23:38:52 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     David Lechner <david@lechnology.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] ARM: OMAP2+: Drop mmc platform data for am330x and
 am43xx
Message-ID: <20190723063852.GO5447@atomide.com>
References: <20190326181324.32140-1-tony@atomide.com>
 <20190326181324.32140-2-tony@atomide.com>
 <0af63198-5a68-2f0d-f14e-2b514580d2d5@lechnology.com>
 <20190722060951.GL5447@atomide.com>
 <d66357e0-62e1-6132-00a1-a9c48ca3e481@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d66357e0-62e1-6132-00a1-a9c48ca3e481@lechnology.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* David Lechner <david@lechnology.com> [190722 14:55]:
> Not sure if this is related, but this is what I get on v5.3-rc1
> with this patch (wifi still not working, obviously):
> 
> [   21.952767] wlcore: wl18xx HW: 183x or 180x, PG 2.2 (ROM 0x11)
> [   22.011340] ------------[ cut here ]------------
> [   22.016402] WARNING: CPU: 0 PID: 65 at /home/david/work/ev3dev2/ev3dev-kernel/net/wireless/core.c:868 wiphy_register+0x860/0xba0 [cfg80211]

This one is fixed in Linux next but missed -rc1, see thread
"nl80211 wlcore regression in next".

Regards,

Tony
