Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B0C17953E
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 17:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388240AbgCDQ2w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 11:28:52 -0500
Received: from muru.com ([72.249.23.125]:58776 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388019AbgCDQ2w (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Mar 2020 11:28:52 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AC18380F5;
        Wed,  4 Mar 2020 16:29:37 +0000 (UTC)
Date:   Wed, 4 Mar 2020 08:28:49 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] ti-sysc support for PRUSS
Message-ID: <20200304162849.GW37466@atomide.com>
References: <20200227222837.7329-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227222837.7329-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200227 14:29]:
> Hi Tony,
> 
> The following is a revised series of the ti-sysc support for PRUSS.
> Please refer to the original series cover-letter [1] for details.
> 
> Following are the main changes in v2:
>  - Drop the enabling of the interconnect nodes from various AM335x and
>    AM437x board dts files (last 7 patches from original series)
>  - Enable the target-module node for AM437x by default. None of the
>    current AM437x board dts files use AM4372, so there should not be
>    any regressions.
> 
> We can drop the status=disabled in the am33xx.dtsi file once we add the
> SoC revision support for AM335x SoCs. This is already disabled before the
> series as well. I have identified a few boards which use the older SoCs
> that can disable the node in dts, but there were few others which can
> use any of the SoCs, so those will definitely require the SoC device
> match logic and an additional PRUSS disable quirk in the ti-sysc bus
> driver.

OK thanks, applied and pushed out into omap-for-v5.7/ti-sysc-drop-pdata.

Regards,

Tony
