Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4BE358238
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2019 14:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfF0MMC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jun 2019 08:12:02 -0400
Received: from muru.com ([72.249.23.125]:53730 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfF0MMB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Jun 2019 08:12:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4CED2805C;
        Thu, 27 Jun 2019 12:12:24 +0000 (UTC)
Date:   Thu, 27 Jun 2019 05:11:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] bus: ti-sysc: Simplify cleanup upon failures in
 sysc_probe()
Message-ID: <20190627121158.GJ5447@atomide.com>
References: <20190625233315.22301-1-s-anna@ti.com>
 <20190625233315.22301-6-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625233315.22301-6-s-anna@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Suman Anna <s-anna@ti.com> [190625 23:33]:
> The clocks are not yet parsed and prepared until after a successful
> sysc_get_clocks(), so there is no need to unprepare the clocks upon
> any failure of any of the prior functions in sysc_probe(). The current
> code path would have been a no-op because of the clock validity checks
> within sysc_unprepare(), but let's just simplify the cleanup path by
> returning the error directly.
> 
> While at this, also fix the cleanup path for a sysc_init_resets()
> failure which is executed after the clocks are prepared.

Sounds like this should get queued separately as a fix for v5.3-rc
cycle, probably got broken with the recent ti-sysc init order changes.

Regards,

Tony
