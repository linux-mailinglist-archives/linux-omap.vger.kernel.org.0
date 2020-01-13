Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7C813992B
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2020 19:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgAMSos (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jan 2020 13:44:48 -0500
Received: from muru.com ([72.249.23.125]:50794 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgAMSos (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jan 2020 13:44:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2101B8047;
        Mon, 13 Jan 2020 18:45:29 +0000 (UTC)
Date:   Mon, 13 Jan 2020 10:44:44 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>, Keerthy <j-keerthy@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, bcousson@baylibre.com,
        kishon@ti.com
Subject: Re: [PATCH] arm: dts: Move am33xx and am43xx mmc nodes to sdhci-omap
 driver
Message-ID: <20200113184444.GO5885@atomide.com>
References: <20200106111517.15158-1-faiz_abbas@ti.com>
 <ab908007-fd7d-9dd5-c822-f4058c793d7d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab908007-fd7d-9dd5-c822-f4058c793d7d@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Faiz Abbas <faiz_abbas@ti.com> [200109 13:57]:
> Hi,
> 
> On 06/01/20 4:45 pm, Faiz Abbas wrote:
> > Move mmc nodes to be compatible with the sdhci-omap driver. The following
> > modifications are required for omap_hsmmc specific properties:
> > 
> > ti,non-removable: convert to the generic mmc non-removable
> > ti,needs-special-reset:  co-opted into the sdhci-omap driver
> > ti,dual-volt: removed. Legacy property not used in am335x or am43xx
> > ti,needs-special-hs-handling: removed. Legacy property not used in am335x or am43xx
> > 
> > Also since the sdhci-omap driver does not support runtime PM, explicitly
> > disable the mmc3 instance in the dtsi.
> > 
> > Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> > ---
> > 
> > Driver modifications have been posted separately:
> > https://patchwork.kernel.org/project/linux-mmc/list/?series=224053
> > 
> > Tested on: am335x-evm, am335x-boneblack, am335x-sk, am335x-bone, am437x-idk,
> > am43xx-gp-evm, am43xx-epos-evm.
> > 
> > I need some help with testing all other am335x variants and SDIO cards.
> > 
> > Here's a branch for testing: https://github.com/faizinator/linux/tree/sdhci-omap_v4_2
> > 
> 
> Tony, can you help test some of these boards?

I have your branch above a quick boot test on bbb and am437x-idk and both
detected MMC just fine :)

I guess up to Dave and Keerthy to check if this conversion can be done
without missing runtime PM support, any comments?

I guess it should not be hard implement runtime PM support for
autosuspend in sdhci-omap.c?

Regards,

Tony

