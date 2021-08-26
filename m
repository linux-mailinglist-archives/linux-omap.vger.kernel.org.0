Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAB83F82AD
	for <lists+linux-omap@lfdr.de>; Thu, 26 Aug 2021 08:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239810AbhHZGrX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Aug 2021 02:47:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:39250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239338AbhHZGrX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 26 Aug 2021 02:47:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B6CB610A3;
        Thu, 26 Aug 2021 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629960396;
        bh=TXXuH3GQWG/dHh9dF46kHpR0bJSKf6DH7WjXr/7kP6w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Aaky2LOScLcka+hizjd/GQpTDwIEXi1YEV52hS39ypGeDSeGo2SRQ3IA8BrwjiH54
         7dWpygoyvm1F+u3WCHpDaRIHYo8XMixh8MSFbDFrEqVF2t2NVQOj7bZEsZOM1cANRJ
         +QcIhQYqr+pMq0MJuEm+hKGymmBl80PB6EE2cOeJMm6sGM8HWzY0NP5qXitFD0rtN2
         23CVcwaq6pZw1Lrs3aLQWUWhUMhH8lGxSIXAGVAFTkvdJpjiPPcEvtJFCF0zVDyy7i
         XgRMQSS5lxULHuh+1KFfJ/8mH+cgHOzGAmShMvF3sjDr4faiVWwhHdxjun2EUqBYFC
         eKUNKuAq5W1Yw==
Subject: Re: [PATCH v16 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
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
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210813195228.2003500-1-mka@chromium.org>
 <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <ad5a2b81-3ecb-e1d8-9bcb-b5b3a8d0385e@kernel.org>
Date:   Thu, 26 Aug 2021 09:46:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13/08/2021 22:52, Matthias Kaehlcke wrote:
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

Reviewed-by: Roger Quadros <rogerq@kernel.org>

cheers,
-roger

> ---
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
> 
>  drivers/usb/cdns3/Kconfig | 2 +-
>  drivers/usb/dwc3/Kconfig  | 5 +++--
>  drivers/usb/host/Kconfig  | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index b98ca0a1352a..07e12f786d48 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -1,7 +1,7 @@
>  config USB_CDNS_SUPPORT
>  	tristate "Cadence USB Support"
>  	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
> -	select USB_XHCI_PLATFORM if USB_XHCI_HCD
> +	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
>  	select USB_ROLE_SWITCH
>  	help
>  	  Say Y here if your system has a Cadence USBSS or USBSSP
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 66b1454c4db2..870f2251350a 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -2,8 +2,7 @@
>  
>  config USB_DWC3
>  	tristate "DesignWare USB3 DRD Core Support"
> -	depends on (USB || USB_GADGET) && HAS_DMA
> -	select USB_XHCI_PLATFORM if USB_XHCI_HCD
> +	depends on ((USB && USB_XHCI_PLATFORM) || USB_GADGET) && HAS_DMA
>  	select USB_ROLE_SWITCH if USB_DWC3_DUAL_ROLE
>  	help
>  	  Say Y or M here if your system has a Dual Role SuperSpeed
> @@ -30,6 +29,7 @@ choice
>  config USB_DWC3_HOST
>  	bool "Host only mode"
>  	depends on USB=y || USB=USB_DWC3
> +	depends on USB_XHCI_PLATFORM
>  	help
>  	  Select this when you want to use DWC3 in host mode only,
>  	  thereby the gadget feature will be regressed.
> @@ -44,6 +44,7 @@ config USB_DWC3_GADGET
>  config USB_DWC3_DUAL_ROLE
>  	bool "Dual Role mode"
>  	depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
> +	depends on USB_XHCI_PLATFORM
>  	depends on (EXTCON=y || EXTCON=USB_DWC3)
>  	help
>  	  This is the default mode of working of DWC3 controller where
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index df9428f1dc5e..518c2312ef0c 100644
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
> 
