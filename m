Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A3A456149
	for <lists+linux-omap@lfdr.de>; Thu, 18 Nov 2021 18:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbhKRRTR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Nov 2021 12:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234022AbhKRRTR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Nov 2021 12:19:17 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3026C06174A
        for <linux-omap@vger.kernel.org>; Thu, 18 Nov 2021 09:16:16 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id k4so5801958plx.8
        for <linux-omap@vger.kernel.org>; Thu, 18 Nov 2021 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FndYr0qwU2GRfRJE7/Zc89ZCgTNkWQJ8LHvpWcp9GA0=;
        b=Ju1LRNiA/W27gB9xy5brMPAbwNd4NIS3O7OF0tQibcdx032Yx3q/JWBgfrbj1EqMkv
         hv06mzH/wUfCORLxtFPCTXHRUlKNvNmhX5HS15pGodQhDjmbZ6x6SJ7YLG2nKfjSsN7C
         K3lvdbNgasHvN50bbOnOWjxuF3XPJFtWoTEs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FndYr0qwU2GRfRJE7/Zc89ZCgTNkWQJ8LHvpWcp9GA0=;
        b=zX4893+1zNd/c8ZmP2fxdnTvb4Aqwij0trOqSTf22ebTCuop1niFr95rX6x+JZsyLm
         SdUCjjbj2FmXpxFZqk9cNuieomDrcMOVA3+RqUQTki2XTiHdQX95WQF7PEFaAhzXe8T7
         o+srVVDbxzaZR8ricMt6P7J5/MBCDgnAsoRFs2Oe6tcgqIUrL4xEScPVdOho2oOYfoK4
         JG/wDansR5oBkW0zmayp0Q9XzvcW5JQxN823VdsruOvqo6cUN99kkAoLDIAxBusHqynq
         YTprM+25z68MVHKPTYLLITyipUeyokvZhBx/LKCIYn4Hu2U3m1cMS90xpIQTMYv9Bbsn
         JtMg==
X-Gm-Message-State: AOAM530Jc684NRbgQyUNCGuiZ3yNOZrTGpiY3/0n2vuHAnshZsbj4tYh
        R2yebNEbofhwatoiSeJGqJ1RoQ==
X-Google-Smtp-Source: ABdhPJy+MBB6lHWPY8+YDrYXHI/xPNJN9EJi9uDlOmPn4pR0RXebX/Mx/tnu+yfFjq9XXjvqeAmu0Q==
X-Received: by 2002:a17:90b:97:: with SMTP id bb23mr12331985pjb.201.1637255776529;
        Thu, 18 Nov 2021 09:16:16 -0800 (PST)
Received: from localhost ([2620:15c:202:201:8ceb:c68a:21af:bebe])
        by smtp.gmail.com with UTF8SMTPSA id k3sm190564pff.211.2021.11.18.09.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 09:16:16 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:16:14 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
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
Message-ID: <YZaKXtRW7oO1SNbG@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.7.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
 <20211117022144.GA158646@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211117022144.GA158646@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 16, 2021 at 09:21:44PM -0500, Alan Stern wrote:
> On Tue, Nov 16, 2021 at 12:07:39PM -0800, Matthias Kaehlcke wrote:
> > Some USB controller drivers that depend on the xhci-plat driver
> > specify this dependency using 'select' in Kconfig. This is not
> > recommended for symbols that have other dependencies as it may
> > lead to invalid configurations. Use 'depends on' to specify the
> > dependency instead of 'select'.
> > 
> > For dwc3 specify the dependency on USB_XHCI_PLATFORM in
> > USB_DWC3_HOST and USB_DWC3_DUAL_ROLE. Also adjust the
> > dependencies of USB_DWC3_CORE to make sure that at least one
> > of USB_DWC3_HOST, USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE can be
> > selected.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > 
> > Changes in v17:
> > - removed explicit dependency on USB from USB_DWC3
> > - added 'Reviewed-by' tags from Roger and Doug
> > 
> > Changes in v16:
> > - none
> > 
> > Changes in v15:
> > - adjusted dependencies of USB_DWC3_CORE to make sure it can only
> >   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
> >   or USB_DWC3_DUAL_ROLE is selectable
> > - updated commit message
> > 
> > Changes in v14:
> > - none
> > 
> > Changes in v13:
> > - patch added to the series
> 
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index d1d926f8f9c2..e5e612f143a1 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -80,7 +80,7 @@ config USB_XHCI_MTK
> >  
> >  config USB_XHCI_MVEBU
> >  	tristate "xHCI support for Marvell Armada 375/38x/37xx"
> > -	select USB_XHCI_PLATFORM
> > +	depends on USB_XHCI_PLATFORM
> >  	depends on HAS_IOMEM
> >  	depends on ARCH_MVEBU || COMPILE_TEST
> >  	help
> > @@ -112,9 +112,9 @@ config USB_EHCI_BRCMSTB
> >  config USB_BRCMSTB
> >  	tristate "Broadcom STB USB support"
> >  	depends on (ARCH_BRCMSTB && PHY_BRCM_USB) || COMPILE_TEST
> > +	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
> >  	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
> >  	select USB_EHCI_BRCMSTB if USB_EHCI_HCD
> > -	select USB_XHCI_PLATFORM if USB_XHCI_HCD
> >  	help
> >  	  Enables support for XHCI, EHCI and OHCI host controllers
> >  	  found in Broadcom STB SoC's.
> 
> It should be pointed out that this now requires people with xHCI systems 
> to actively turn on CONFIG_USB_XHCI_PLATFORM before they can enable 
> CONFIG_USB_BRCMSTB.  Before, that was not necessary.  Some users might 
> get confused and not realize what is needed.  Perhaps something should 
> be added to the "help" text.

I agree that the change could cause confusion, I'm not sure though if
adding something to the "help" text is a good mitigation. Users won't see
the text unless they can select the option, which requires
CONFIG_USB_XHCI_PLATFORM to be enabled. Also the dependencies are specified
nearby (and displayed), so it seems similar to a code comment on something
that the code evidently does (e.g. "initialize foobar with 0").

On a different note: I'm considering to break the CONFIG_USB_XHCI_PLATFORM
related patches out of the onboard_usb_hub series, since the driver
doesn't any longer depend on xhci_plat. In that sense I'm also open
to abandon those patches, if they aren't considered an improvement on
their own.
