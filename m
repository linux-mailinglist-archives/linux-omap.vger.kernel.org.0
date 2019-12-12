Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8BA211D440
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbfLLRl1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:41:27 -0500
Received: from muru.com ([72.249.23.125]:46572 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730023AbfLLRl1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:41:27 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9399680C0;
        Thu, 12 Dec 2019 17:42:05 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:41:23 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
Message-ID: <20191212174123.GF35479@atomide.com>
References: <20191211140720.10539-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211140720.10539-1-bparrot@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191211 06:04]:
> This patch series adds the missing camera endpoint (ov2659) as well as
> the required source clocks nodes for the sensor.
> 
> On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
> clock nodes/tree was removed as it was unsed at the time, we are
> re-adding the needed clock nodes here.

Tero, it seems I can already pick this series?

Or ou want to queue the changes to am43xx-clocks.dtsi along with all
your other clock patches?

Regards,

Tony

 
> Changes since v2:
> - Fixed/added Tony's ack
> 
> Changes since v1:
> - Fix clock name to make it generic
> - Add non-standard clock node naming to commit message as per Tony's
>   comment
> - Rename all clock nodes to use '-' instead of '_'
> 
> Benoit Parrot (2):
>   ARM: dts: am437x-sk-evm: Add VPFE and OV2659 entries
>   ARM: dts: am43x-epos-evm: Add VPFE and OV2659 entries
> 
> Tero Kristo (1):
>   ARM: dts: am43xx: add support for clkout1 clock
> 
>  arch/arm/boot/dts/am437x-sk-evm.dts  | 27 +++++++++++++-
>  arch/arm/boot/dts/am43x-epos-evm.dts | 23 +++++++++++-
>  arch/arm/boot/dts/am43xx-clocks.dtsi | 54 ++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+), 2 deletions(-)
> 
> -- 
> 2.17.1
> 
