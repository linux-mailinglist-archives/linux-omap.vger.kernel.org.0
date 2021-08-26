Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3555A3F82A3
	for <lists+linux-omap@lfdr.de>; Thu, 26 Aug 2021 08:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhHZGq6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Aug 2021 02:46:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:38886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239112AbhHZGq5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 26 Aug 2021 02:46:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B9A060FDC;
        Thu, 26 Aug 2021 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629960370;
        bh=J6ZcW3z82EQuJPCW19f+4Dp9f4QbeEdqv8HxFEf6j6g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pDN5pmmJoQCOMAFfW3j7gKvuE1OG9kRVO11hmxcB08Y/+Fl0XVL/uixTB19kCE24p
         3Rt9TBNuMnWch4KHdzTJ3014NAula4o7cQtDjxL/cMnI20r8pluTNrpYZ5GoDO7LOI
         KLlf32xQ4GdmN/8eOZE5Dj7DntGKvJa0dXJMbyoJp6HXTPoo8LXPSIzXZEBmB1cHjd
         53zSa5BD+xbQlZB4SSjuHYrAKGF7S7hkIJYimJD5yK4N0ZoJcsKjjetxQxTA9ta3Rt
         lcfwmXbm4x1yalCzKke1pVJHyEjk7AXK2cHHlh37X5dUBPyl6WbRkJV2csTJdYhAW8
         Uc59+tR4bWtaQ==
Subject: Re: [PATCH v16 3/7] ARM: configs: Explicitly enable USB_XHCI_PLATFORM
 where needed
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        William Cohen <wcohen@redhat.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <bcbb80fe-950f-6ea5-0f09-a4cf5b571912@kernel.org>
Date:   Thu, 26 Aug 2021 09:45:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13/08/2021 22:52, Matthias Kaehlcke wrote:
> The dependency of USB_DWC3 and USB_XHCI_MVEBU on USB_XHCI_PLATFORM
> is being changed from 'select' to 'depends on' by another patch.
> With that patch the defconfigs that enable one of these host
> controllers also need to select USB_XHCI_PLATFORM explicitly
> to keep the resulting config unchanged.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

cheers,
-roger

> ---
> 
> Changes in v16:
> - patch added to the series
> 
>  arch/arm/configs/exynos_defconfig    | 1 +
>  arch/arm/configs/keystone_defconfig  | 1 +
>  arch/arm/configs/multi_v7_defconfig  | 1 +
>  arch/arm/configs/mvebu_v7_defconfig  | 1 +
>  arch/arm/configs/omap2plus_defconfig | 1 +
>  arch/arm/configs/pxa_defconfig       | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index f4e1873912a3..660fccb40f34 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -255,6 +255,7 @@ CONFIG_SND_SIMPLE_CARD=y
>  CONFIG_USB=y
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_EXYNOS=y
>  CONFIG_USB_OHCI_HCD=y
> diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
> index 33c917df7b32..4f66c5a5d94d 100644
> --- a/arch/arm/configs/keystone_defconfig
> +++ b/arch/arm/configs/keystone_defconfig
> @@ -164,6 +164,7 @@ CONFIG_USB=y
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_MON=y
>  CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_DWC3=y
>  CONFIG_NOP_USB_XCEIV=y
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 52a0400fdd92..4619418e53f4 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -787,6 +787,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=m
>  CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
>  CONFIG_USB_XHCI_MVEBU=y
>  CONFIG_USB_XHCI_TEGRA=m
>  CONFIG_USB_EHCI_HCD=y
> diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
> index cddce57fe4b9..6cb85ec4fe54 100644
> --- a/arch/arm/configs/mvebu_v7_defconfig
> +++ b/arch/arm/configs/mvebu_v7_defconfig
> @@ -103,6 +103,7 @@ CONFIG_SND_SIMPLE_CARD=y
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_MVEBU=y
> +CONFIG_USB_XHCI_PLATFORM=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_ROOT_HUB_TT=y
>  CONFIG_USB_STORAGE=y
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 2ac2418084ab..a015fb04fa25 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -562,6 +562,7 @@ CONFIG_USB=m
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_MON=m
>  CONFIG_USB_XHCI_HCD=m
> +CONFIG_USB_XHCI_PLATFORM=m
>  CONFIG_USB_EHCI_HCD=m
>  CONFIG_USB_OHCI_HCD=m
>  CONFIG_USB_ACM=m
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 363f1b1b08e3..e44763fe2b23 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -524,6 +524,7 @@ CONFIG_USB=m
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_MON=m
>  CONFIG_USB_XHCI_HCD=m
> +CONFIG_USB_XHCI_PLATFORM=m
>  CONFIG_USB_EHCI_HCD=m
>  CONFIG_USB_EHCI_HCD_PLATFORM=m
>  CONFIG_USB_ISP116X_HCD=m
> 
