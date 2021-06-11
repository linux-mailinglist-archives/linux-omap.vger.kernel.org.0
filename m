Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022E13A3B67
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 07:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFKFfw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 01:35:52 -0400
Received: from muru.com ([72.249.23.125]:41638 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229908AbhFKFfw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 01:35:52 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E0391818C;
        Fri, 11 Jun 2021 05:34:01 +0000 (UTC)
Date:   Fri, 11 Jun 2021 08:33:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Gowtham Tammana <g-tammana@ti.com>, Suman Anna <s-anna@ti.com>,
        bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nisanth Menon <nm@ti.com>
Subject: Re: [PATCH v4] ARM: dts: dra7: Fix duplicate USB4 target module node
Message-ID: <YML1vuROPftMR+j6@atomide.com>
References: <20210602220458.9728-1-g-tammana@ti.com>
 <c140f39c-9fe1-f7e1-3da5-fc5fff604714@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c140f39c-9fe1-f7e1-3da5-fc5fff604714@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210608 10:40]:
> On 03/06/2021 01:04, Gowtham Tammana wrote:
> > With [1] USB4 target-module node got defined in dra74x.dtsi file.
> > However, the earlier definition in [2] was not removed, and this
> > duplication of the target module is causing boot failure on dra74
> > variant boards - dra7-evm, dra76-evm.
> > 
> > USB4 is only present in DRA74x variants, so keeping the entry in
> > dra74x.dtsi and removing it from the top level interconnect hierarchy
> > dra7-l4.dtsi file. This change makes the USB4 target module no longer
> > visible to AM5718, DRA71x and DRA72x so removing references to it in
> > their respective dts files.
> > 
> > [1]: commit c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for
> > dra7 dwc3")
> > [2]: commit 549fce068a311 ("ARM: dts: dra7: Add l4 interconnect
> > hierarchy and ti-sysc data")
> > 
> > Fixes: c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
...
> Thank you.
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Thanks applying into fixes.

Tony
