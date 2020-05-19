Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9351F1D9B9C
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 17:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgESPsK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 11:48:10 -0400
Received: from muru.com ([72.249.23.125]:55022 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729007AbgESPsK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 May 2020 11:48:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9831D80FA;
        Tue, 19 May 2020 15:48:59 +0000 (UTC)
Date:   Tue, 19 May 2020 08:48:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        robh+dt@kernel.org, bcousson@baylibre.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] arm: dts: Move am33xx and am43xx mmc nodes to
 sdhci-omap driver
Message-ID: <20200519154807.GT37466@atomide.com>
References: <20200512203804.9340-1-faiz_abbas@ti.com>
 <20200513162327.GM37466@atomide.com>
 <94025425-95e2-e53d-cfac-a1e73e6c011a@ti.com>
 <53c815db-dd7d-e6e1-f81a-cf05ef340c71@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c815db-dd7d-e6e1-f81a-cf05ef340c71@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Faiz Abbas <faiz_abbas@ti.com> [200519 08:23]:
> Tony,
> 
> On 15/05/20 3:04 pm, Faiz Abbas wrote:
> > Hi Tony,
> > 
> > On 13/05/20 9:53 pm, Tony Lindgren wrote:
> >> * Faiz Abbas <faiz_abbas@ti.com> [200512 13:39]:
> >>> Move mmc nodes to be compatible with the sdhci-omap driver. The following
> >>> modifications are required for omap_hsmmc specific properties:
> >>>
> >>> ti,non-removable: convert to the generic mmc non-removable
> >>> ti,needs-special-reset:  co-opted into the sdhci-omap driver
> >>> ti,dual-volt: removed. Legacy property not used in am335x or am43xx
> >>> ti,needs-special-hs-handling: removed. Legacy property not used in am335x
> >>> or am43xx
> >>>
> >>> Also since the sdhci-omap driver does not support runtime PM, explicitly
> >>> disable the mmc3 instance in the dtsi.
> >>>
> >>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> >>> ---
> >>>
> >>> v2: Rebased to latest mainline where all kernel dependancies have been merged.
> >>>
> >>> Suspend/Resume is now supported in the sdhci-omap driver.
> >>
> >> Great, thanks for updating it.
> >>
> >> Keerthy, care to test for am3 and am4?
> >>
> > 
> > Suspend/resume on am43xx-gpevm is broken right now in mainline and the regression looks
> > like it is caused by the display subsystem. I have reported this to Tomi and
> > its being investigated.
> > 
> > Meanwhile I have tested this patch with display configs disabled and Keerthy's
> > suspend/resume tests pass on both am3 and am4.

OK great thanks for checking it. Do you have the display subsystem
related commit that broke PM? I'm wondering if my recent DSS platform
data removal changes might have caused the regression.

> Can this patch be picked up? I would really like this to be merged by v5.8

Yeah me too :) Looks good to me, planning on applying these today.

Thanks,

Tony
