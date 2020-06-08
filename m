Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6691F1DE2
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jun 2020 18:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387482AbgFHQza (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jun 2020 12:55:30 -0400
Received: from muru.com ([72.249.23.125]:57288 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387409AbgFHQz3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Jun 2020 12:55:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3DDF080E7;
        Mon,  8 Jun 2020 16:56:20 +0000 (UTC)
Date:   Mon, 8 Jun 2020 09:55:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Holmlund <info@ohdata.se>
Cc:     linux-omap@vger.kernel.org, bcousson@baylibre.com
Subject: Re: PATCH: ARM: am33xx.dtsi USB ranges length
Message-ID: <20200608165526.GI37466@atomide.com>
References: <d22deb609cf4678d569928f4a48cb409@ohdata.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d22deb609cf4678d569928f4a48cb409@ohdata.se>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Oskar Holmlund <info@ohdata.se> [200605 17:46]:
> AM335x TRM: Table 2-1 defines USBSS - USB Queue Manager in memory region
> 0x4740 0000 to 0x4740 7FFF.

Oh OK, looks like the older TRM revisions list the ragen from
offset 0x5000 to 0x8000 as reserved. Thanks for fixing it,
applying into fixes.

BTW, you should check your setup and use git tools for
generating the patches. I could not git am apply it directly
without manual editing. And then scripts/checkpatch_pl --strict
still complained as you have different sender email from
commit email. With git this gets fixed up with an extra
"From:" at the top of the email.

Regards,

Tony

> Diff created from am33xx.dtsi commit
> e20ef23dd6937c38df2cfddf15270668153c8177
> 
> Signed-off-by: Oskar Holmlund <oskar@ohdata.se>
> --- arch/arm/boot/dts/am33xx.dtsi.orig	2020-06-05 18:58:39.720383275 +0200
> +++ arch/arm/boot/dts/am33xx.dtsi	2020-06-05 19:01:32.974619980 +0200
> @@ -347,7 +347,7 @@
>  			clock-names = "fck";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			ranges = <0x0 0x47400000 0x5000>;
> +			ranges = <0x0 0x47400000 0x8000>;
> 
>  			usb0_phy: usb-phy@1300 {
>  				compatible = "ti,am335x-usb-phy";
> 
> -- 
> Bästa Hälsningar
> Oskar Holmlund
> Tel 070-3220292
