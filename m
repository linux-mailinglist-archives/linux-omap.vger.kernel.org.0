Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0562AB50C
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 11:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgKIKej (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 05:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIKej (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 05:34:39 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B724C0613CF;
        Mon,  9 Nov 2020 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qH9b1O1m9yVoEB6n8QkB/6TaJXHCxIPP32Fq1mFfWKE=; b=gGrvZ5xBLQtSpNi2uSB0ANIyt
        afY6SWLthCnmt6Eeq9iZZax1/dyotilgV7RwYmDtVPVh7RwXnEAYDGAtLsa727gWFqK5CzSIwzblw
        DaYTkWl5eVU2agK0Wy6hnKjxer6VycAEWpMtm1NwlVYP8n9kJucFn6RRJt2oQiqC+/YAOq4k6TXTo
        dYesdPUt9+kdk2famskEu8KnvAp6sqlxtQTkKiPG+IohXg8HNv0sKPXA55oJI+hF72r+UriKjmSUr
        sydSD86p/UZ7m2nM8/IM9hJ+KGVUGO+/ml+2PkrHYDWyWW/YYlOyIF6iLw25zd+4lV3cvHJvnHiJX
        ZcxHuRLig==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56980)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kc4V7-000858-1A; Mon, 09 Nov 2020 10:34:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kc4V4-0000KD-S1; Mon, 09 Nov 2020 10:34:14 +0000
Date:   Mon, 9 Nov 2020 10:34:14 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH usb-next] usb: dwc3: Use devm_of_platform_populate
Message-ID: <20201109103414.GF1559@shell.armlinux.org.uk>
References: <20201109095953.7f810239@xhacker.debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109095953.7f810239@xhacker.debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 09, 2020 at 09:59:53AM +0800, Jisheng Zhang wrote:
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 417e05381b5d..83015bb7b926 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -702,7 +702,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_meson_g12a	*priv;
>  	struct device		*dev = &pdev->dev;
> -	struct device_node	*np = dev->of_node;
>  	void __iomem *base;
>  	int ret, i;
>  
> @@ -794,7 +793,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  			goto err_phys_power;
>  	}
>  
> -	ret = of_platform_populate(np, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret)
>  		goto err_phys_power;
>  
> @@ -832,8 +831,6 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
>  	if (priv->drvdata->otg_switch_supported)
>  		usb_role_switch_unregister(priv->role_switch);
>  
> -	of_platform_depopulate(dev);
> -
>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>  		phy_power_off(priv->phys[i]);
>  		phy_exit(priv->phys[i]);

Does it matter that the order that things happen in
dwc3_meson_g12a_remove() is changed as a result of your patch? Was
the code relying on the platform devices being depopulated before
powering off the PHYs?

> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> index e62ecd22b3ed..f1c267e39d62 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -73,7 +73,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_resetc_assert;
>  
> -	ret = of_platform_populate(np, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret)
>  		goto err_clk_put;
>  
> @@ -97,8 +97,6 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  
>  static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
>  {
> -	of_platform_depopulate(simple->dev);
> -
>  	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
>  	clk_bulk_put_all(simple->num_clocks, simple->clks);
>  	simple->num_clocks = 0;

Same here... and for anywhere else in this patch that you're deleting
a of_platform_depopulate().

You effectively are moving the call to of_platform_depopulate() *after*
the driver's .remove function has been called.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
