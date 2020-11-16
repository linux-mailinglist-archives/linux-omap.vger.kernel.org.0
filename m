Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3382B42FD
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729851AbgKPLhD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:37:03 -0500
Received: from muru.com ([72.249.23.125]:48566 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729848AbgKPLhD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:37:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D2BCF80C8;
        Mon, 16 Nov 2020 11:37:07 +0000 (UTC)
Date:   Mon, 16 Nov 2020 13:36:58 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     David Lechner <david@lechnology.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Enable eQEP counter driver on BeagleBone Blue
Message-ID: <20201116113658.GE26857@atomide.com>
References: <20201012211229.3282128-1-david@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012211229.3282128-1-david@lechnology.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* David Lechner <david@lechnology.com> [201013 00:13]:
> This series adds device tree nodes for the eQEP portion of the PWMSS on AM33xx
> and enables it on BeagleBone Blue.
> 
> I actually submitted these a year ago, but it looks like these patches never got
> applied with the actual eQEP driver when it was merged.

Sorry if I dropped these earlier, I guess I though you're reposting the
series and untagged them.

> For reference, there was some previous discussion about the clocks in "ARM: dts:
> am33xx: Add nodes for eQEP". [1]
> 
> [1]: https://lore.kernel.org/linux-omap/20190723145100.GS5447@atomide.com/
> 
> I have also included a new patch to enable the eQEP driver in the defconfig.

Great, thanks applying these into omap-for-v5.11/dt and defconfig branches.

Regards,

Tony
