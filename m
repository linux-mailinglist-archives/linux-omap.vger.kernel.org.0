Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF7FCE8E6
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbfJGQQi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:16:38 -0400
Received: from muru.com ([72.249.23.125]:35650 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfJGQQi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 12:16:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5B2E580A5;
        Mon,  7 Oct 2019 16:17:11 +0000 (UTC)
Date:   Mon, 7 Oct 2019 09:16:34 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Emmanuel Vadot <manu@freebsd.org>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Set status to disable for MMC3
Message-ID: <20191007161634.GS5610@atomide.com>
References: <20191007080339.57209-1-manu@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007080339.57209-1-manu@freebsd.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Emmanuel Vadot <manu@freebsd.org> [191007 08:04]:
> Commit 5b63fb90adb95 ("ARM: dts: Fix incomplete dts data for am3 and am4 mmc")
> fixed the mmc instances on the l3 interconnect but removed the disabled status.
> Fix this and let boards properly define it if it have it.

The dts default is "okay", and should be fine for all the
internal devices even if not pinned out on the board. This
way the devices get properly idled during boot, and we
avoid repeating status = "enabled" over and over again in
the board specific dts files.

Then the board specific dts files might want to configure
devices with status = "disabled" if really needed. But this
should be only done for devices that Linux must not use,
such as crypto acclerators on secure devices if claimed by
the secure mode.

So if this fixes something, it's almost certainly a sign
of something else being broken?

Regards,

Tony


> Fixes: 5b63fb90adb95 ("ARM: dts: Fix incomplete dts data for am3 and am4 mmc")
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
> ---
>  arch/arm/boot/dts/am33xx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index fb6b8aa12cc5..b3a1fd9e39fa 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -260,6 +260,7 @@
>  				ti,needs-special-reset;
>  				interrupts = <29>;
>  				reg = <0x0 0x1000>;
> +				status = "disabled";
>  			};
>  		};
>  
> -- 
> 2.22.0
> 
