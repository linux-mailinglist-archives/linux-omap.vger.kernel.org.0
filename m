Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AB5453E6C
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 03:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhKQCYo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 21:24:44 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41019 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231244AbhKQCYn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Nov 2021 21:24:43 -0500
Received: (qmail 158965 invoked by uid 1000); 16 Nov 2021 21:21:44 -0500
Date:   Tue, 16 Nov 2021 21:21:44 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v17 7/7] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
Message-ID: <20211117022144.GA158646@rowland.harvard.edu>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.7.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116120642.v17.7.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 16, 2021 at 12:07:39PM -0800, Matthias Kaehlcke wrote:
> Some USB controller drivers that depend on the xhci-plat driver
> specify this dependency using 'select' in Kconfig. This is not
> recommended for symbols that have other dependencies as it may
> lead to invalid configurations. Use 'depends on' to specify the
> dependency instead of 'select'.
> 
> For dwc3 specify the dependency on USB_XHCI_PLATFORM in
> USB_DWC3_HOST and USB_DWC3_DUAL_ROLE. Also adjust the
> dependencies of USB_DWC3_CORE to make sure that at least one
> of USB_DWC3_HOST, USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE can be
> selected.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v17:
> - removed explicit dependency on USB from USB_DWC3
> - added 'Reviewed-by' tags from Roger and Doug
> 
> Changes in v16:
> - none
> 
> Changes in v15:
> - adjusted dependencies of USB_DWC3_CORE to make sure it can only
>   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
>   or USB_DWC3_DUAL_ROLE is selectable
> - updated commit message
> 
> Changes in v14:
> - none
> 
> Changes in v13:
> - patch added to the series

> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index d1d926f8f9c2..e5e612f143a1 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -80,7 +80,7 @@ config USB_XHCI_MTK
>  
>  config USB_XHCI_MVEBU
>  	tristate "xHCI support for Marvell Armada 375/38x/37xx"
> -	select USB_XHCI_PLATFORM
> +	depends on USB_XHCI_PLATFORM
>  	depends on HAS_IOMEM
>  	depends on ARCH_MVEBU || COMPILE_TEST
>  	help
> @@ -112,9 +112,9 @@ config USB_EHCI_BRCMSTB
>  config USB_BRCMSTB
>  	tristate "Broadcom STB USB support"
>  	depends on (ARCH_BRCMSTB && PHY_BRCM_USB) || COMPILE_TEST
> +	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
>  	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
>  	select USB_EHCI_BRCMSTB if USB_EHCI_HCD
> -	select USB_XHCI_PLATFORM if USB_XHCI_HCD
>  	help
>  	  Enables support for XHCI, EHCI and OHCI host controllers
>  	  found in Broadcom STB SoC's.

It should be pointed out that this now requires people with xHCI systems 
to actively turn on CONFIG_USB_XHCI_PLATFORM before they can enable 
CONFIG_USB_BRCMSTB.  Before, that was not necessary.  Some users might 
get confused and not realize what is needed.  Perhaps something should 
be added to the "help" text.

Alan Stern
