Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E8841E88
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfFLIEZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:04:25 -0400
Received: from muru.com ([72.249.23.125]:52866 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfFLIEZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Jun 2019 04:04:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BDB1D80E2;
        Wed, 12 Jun 2019 08:04:45 +0000 (UTC)
Date:   Wed, 12 Jun 2019 01:04:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     yegorslists@googlemail.com
Cc:     linux-omap@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
Message-ID: <20190612080421.GC5447@atomide.com>
References: <20190611093045.4810-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611093045.4810-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* yegorslists@googlemail.com <yegorslists@googlemail.com> [190611 02:31]:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The PHY must add both tx and rx delay and not only on the tx clock.

As we're close to -rc5, I applied this against v5.2-rc1 and merged into
omap-for-v5.3/dt as it seems it's optional or has been broken for a while
with no fixes tag. After it hits the mainline kernel during the merge
window you can request it be applied into the stable trees as needed.

However, if this is urgent, let me know what regression it fixes and
I'll merge it into my fixes branch too.

Regards,

Tony
