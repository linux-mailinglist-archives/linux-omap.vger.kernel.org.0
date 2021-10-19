Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87F3433673
	for <lists+linux-omap@lfdr.de>; Tue, 19 Oct 2021 14:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbhJSM7i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Oct 2021 08:59:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235517AbhJSM7i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Oct 2021 08:59:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A883A60FC2;
        Tue, 19 Oct 2021 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634648245;
        bh=qZvgX93/l3kaWVsSfl7RcjNNRArfXfWCDJWWqjKZDgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QvqYnRsMnW+tTB3c48slfsbMV0X0MqFXObUDhqPezISPyHTrxB532y4nnLUQ/pMHX
         VFFyu/eJdEYD3oltcnECnImVIzA7ejQm4g4xAbxXyAyI0UzQYa9y9chOZUXSYyAICt
         AhT6PoUPfztFZjQvWWiVIvsV9X6S2pPAJazjhq9RtwkEtj73eY0+R063rPqW8S6St1
         ItzRXf5va4leC4IXu/FuBayPQWx4wSldhXp01rjZuR/diDrDXCgeZLG2MIcTAi/8bu
         PRqkNkrz14myCddpcJXoLhAM+o/V/brcqmrXAmu+bmeWBFCMcVjXP91he0ezahGD6n
         nGhfWCa8qhW1w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mcog8-0000jV-8j; Tue, 19 Oct 2021 14:57:17 +0200
Date:   Tue, 19 Oct 2021 14:57:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Drew Fustini <dfustini@baylibre.com>
Cc:     Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Benoit Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: am335x: add rtc system-power-controller
Message-ID: <YW7ArLpGwKz2Fc/b@hovoldconsulting.com>
References: <20211018220018.1514652-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018220018.1514652-1-dfustini@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 18, 2021 at 03:00:18PM -0700, Drew Fustini wrote:
> Johan pointed out when I submitted "ARM: dts: am335x: Add rtc node as
> system-power-controller" [1] that mentioning am335x-evm and boneblack
> in the commit message was incorrect. system-power-controller is already
> present in am335x-boneblack-common.dtsi and am335x-evm would need the
> property added directly to the dts file.
> 
> These are the dts files that currently include either
> am335x-bone-common.dtsi or am335x-boneblack-common.dtsi:
> 
>     am335x-bone.dts
> 	am335x-bone-common.dtsi
> 
>     am335x-boneblack.dts
>         am335x-bone-common.dtsi
> 	am335x-boneblack-common.dtsi
> 
>     am335x-boneblack-wireless.dts
> 	am335x-bone-common.dtsi
> 	am335x-boneblack-common.dtsi
> 
>     am335x-bonegreen.dts
> 	am335x-bone-common.dtsi
> 
>     am335x-bonegreen-wireless.dts
> 	am335x-bone-common.dtsi
> 
>     am335x-sancloud-bbe.dts
> 	am335x-bone-common.dtsi
> 	am335x-boneblack-common.dtsi
> 
>     am335x-sancloud-bbe-lite.dts
> 	am335x-bone-common.dtsi
> 	am335x-boneblack-common.dtsi
> 
> am335x-boneblack, am335x-boneblack-wireless, am335x-sancloud-bbe and
> am335x-sancloud-bbe-lite currently get the system-power-controller
> property from am335x-boneblack-common.dtsi. Moving that property to
> am335x-bone-common.dtsi would have no change for these boards as they
> include that dtsi file too.
> 
> This change would result in the addition of system-power-controller
> to bone, bonegreen and bonegreen-wireless. These boards all have
> PMIC_POWR_EN (ZCZ ball C6) connected to PWR_EN on the TPS65217B PMIC.
> Thus system-power-controller is a valid property for them too.
> 
> In addition to BeagleBone, I have reviewed the TI AM335x eval boards:
> 
> am335x-evm.dts should _not_ have the system-power-controller property as
> the PMIC_POWER_EN is not connected on the TMDXEVM3358 board [2]. The
> ball would be connected to SLEEP (pin 37) on the TPS65910A3 PMIC but R65
> is marked as do not populate.
> 
> am335x-evmsk.dts should _not_ have system-power-controller property as
> PMIC_POWER_EN is not connected on the TMDSSK3358 board [3].
> 
> am335x-icev2.dts should have the system-power-controller property as the
> PMIC_POWER_EN (ZCZ ball C6) is connected to PWRHOLD (pin 1) of the
> TPS65910A3 PMIC on the TMDSICE3359 board [4].
>
> Cc: Jason Kridner <jkridner@beagleboard.org>
> Cc: Dave Gerlach <d-gerlach@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Johan Hovold <johan@kernel.org>
> 
> [1] https://lore.kernel.org/linux-omap/20211012191311.879838-1-dfustini@baylibre.com/
> [2] https://www.ti.com/tool/TMDXEVM3358
> [3] https://www.ti.com/tool/TMDSSK3358
> [4] https://www.ti.com/tool/TMDSICE3359
> 
> 
> Drew Fustini (2):
>   ARM: dts: am335x-boneblack-common: move system-power-controller
>   ARM: dts: am335x-icev2: Add system-power-controller to RTC node

Nice work. I trust your review of the schematics, and only
double-checked sancloud-bbe. The patches look good.

For the series:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
