Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D7ACFC72
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfJHObU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:31:20 -0400
Received: from muru.com ([72.249.23.125]:35994 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725795AbfJHObU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 10:31:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 48D9F8081;
        Tue,  8 Oct 2019 14:31:53 +0000 (UTC)
Date:   Tue, 8 Oct 2019 07:31:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv2 0/4] Convert all btwilink users to hci_ll and drop
 btwilink
Message-ID: <20191008143116.GF5610@atomide.com>
References: <20191003134147.9458-1-sre@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003134147.9458-1-sre@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [191003 06:42]:
> Hi,
> 
> This moves the remaining users of btwilink to the "new" serdev based hci_ll
> driver and drops the btwilink driver afterwards. The patches were only compile
> tested by me, but Enric tested the IGEP platform and Adam will test the LogicPD
> platform.
> 
> I kept the TI_ST driver for now, since I plan to send a second patchset for the
> FM radio driver. Once the FM driver has been converted to also use hci_ll, we
> can remove TI_ST completly.
> 
> My suggestion is for the patch handling is, that everything simply goes through
> Tony's tree.

Sounds good to me, good to see kim gone with patch 3/4 :)

Marcel, care to ack the old driver removal patch?

Regards,

Tony

> Changes since PATCHv1 [0]
>  * rebase to 5.4-rc1
>  * move FM radio patches into separate patchset
> 
> [0] https://lore.kernel.org/lkml/20181221011752.25627-1-sre@kernel.org/
> 
> -- Sebastian
> 
> Sebastian Reichel (4):
>   ARM: dts: LogicPD Torpedo: Add WiLink UART node
>   ARM: dts: IGEP: Add WiLink UART node
>   ARM: OMAP2+: pdata-quirks: drop TI_ST/KIM support
>   Bluetooth: btwilink: drop superseded driver
> 
>  .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |   8 +
>  arch/arm/boot/dts/omap3-igep0020-rev-f.dts    |   8 +
>  arch/arm/boot/dts/omap3-igep0030-rev-g.dts    |   8 +
>  arch/arm/mach-omap2/pdata-quirks.c            |  52 ---
>  drivers/bluetooth/Kconfig                     |  11 -
>  drivers/bluetooth/Makefile                    |   1 -
>  drivers/bluetooth/btwilink.c                  | 337 ------------------
>  7 files changed, 24 insertions(+), 401 deletions(-)
>  delete mode 100644 drivers/bluetooth/btwilink.c
> 
> -- 
> 2.23.0
> 
