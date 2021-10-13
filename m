Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF6D42B8EC
	for <lists+linux-omap@lfdr.de>; Wed, 13 Oct 2021 09:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhJMHZz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Oct 2021 03:25:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhJMHZz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Oct 2021 03:25:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57620604DA;
        Wed, 13 Oct 2021 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634109832;
        bh=8tW3jrUtGh8D9IU8h+F9Q4KrLn2sM5xgpjJKt7sTuJU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ajPZjsQOgWjU9UI0nm93R3TbZ3+CwaymKKRi5sOwoCNnFUE6AiOPWN9C1kk/PBjNp
         z8Rz7KnYTpREYRz7yeV2viNAYvG02to5NL46z9RFaCnfseCNL7nC5qh02lVDV7yzI6
         tGgXvlSXX6UND33vElSheIYmPKBHXkZFe4ktHNmXHjkJd2i0zjx1aHZmsI01nPFsR3
         v2qrrd0tKpfCigGK8phCGe5w73CB1thoE0vy4bTspR+Jq5Fmg7/9F2yR+rHr7P2k7D
         B7diX5icAa4X1btgKmRvKNiZAyphCNaZx335rQaJ/pQeJOC/Jn8+LE8RtOWSC9JfxE
         /BZdA79qSTX5Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1maYc2-0005xc-SY; Wed, 13 Oct 2021 09:23:43 +0200
Date:   Wed, 13 Oct 2021 09:23:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Drew Fustini <dfustini@baylibre.com>
Cc:     Benoit Cousson <bcousson@baylibre.com>,
        Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x: Add rtc node as system-power-controller
Message-ID: <YWaJfofs8QAtBnVu@hovoldconsulting.com>
References: <20211012191311.879838-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012191311.879838-1-dfustini@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 12, 2021 at 12:13:12PM -0700, Drew Fustini wrote:
> From: Keerthy <j-keerthy@ti.com>
> 
> PMIC_PWR_EN pin of RTC on am335x-evm, bone, and boneblack is connected to
> PMIC on board, so flag rtc node as system-power-controller to allow
> software to poweroff boards.

The "system-power-controller" property is already set in
bone-common.dtsi since

	2876cc4a773c ("ARM: dts: Move most of am335x-boneblack.dts to am335x-boneblack-common.dtsi")

so this probably only affects am335x-evm and that should be reflected in
the commit message.

Also, should you now remove the property from boneblack-common? Or just
add it to am335x-evm instead?

> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/arm/boot/dts/am335x-bone-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
> index 0ccdc7cd463b..56ae5095a5b8 100644
> --- a/arch/arm/boot/dts/am335x-bone-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
> @@ -399,6 +399,7 @@ &sham {
>  &rtc {
>  	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
>  	clock-names = "ext-clk", "int-clk";
> +	system-power-controller;
>  };
>  
>  &pruss_tm {

Johan
