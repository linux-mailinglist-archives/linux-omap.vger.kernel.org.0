Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3C211D3AC
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbfLLRVH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:21:07 -0500
Received: from muru.com ([72.249.23.125]:46476 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730033AbfLLRVH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:21:07 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 25D8D80C0;
        Thu, 12 Dec 2019 17:21:46 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:21:04 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Message-ID: <20191212172104.GY35479@atomide.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125131100.9839-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191125 05:11]:
> Add HDMI support for AM437x GP EVM. The HDMI uses SiI9022 HDMI encoder,
> and is mutually exclusive with the LCD. The choice between LCD and HDMI
> is made by booting either with am437x-gp-evm.dtb or
> am437x-gp-evm-hdmi.dtb.

So Linux kernel needs a new board device tree file to toggle a GPIO line
to switch between LCD mode and HDMI?

That does not sound very user friendly for something that's supposed
to be hot pluggabe :)

> +/* Override SelLCDorHDMI from am437x-gp-evm.dts to select HDMI */
> +&gpio5 {
> +	p8 {
> +		output-low;
> +	};
> +};

How about just leave the gpio unconfigured and document that a userspace
tool or /sys/kernel/debug/gpio is needed to toggle between the modes?

Regards,

Tony
