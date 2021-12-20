Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B9547B318
	for <lists+linux-omap@lfdr.de>; Mon, 20 Dec 2021 19:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbhLTSpB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Dec 2021 13:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240538AbhLTSpA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Dec 2021 13:45:00 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B8BC06173F
        for <linux-omap@vger.kernel.org>; Mon, 20 Dec 2021 10:44:59 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id q17so8778668plr.11
        for <linux-omap@vger.kernel.org>; Mon, 20 Dec 2021 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WdbWOY03V2kpY7k/lf8oQTo4VEA2Vdp6umA4nuJEIuc=;
        b=ofClJz4jo3PpFecYdRQZhVP85Bb8PtBQgBwgyp7zglJ53fJ18lBCJ1++xK5e2qbXTZ
         gdVV854jGh9SJ8Z/7xSAottZKfoeVHL7nYCguLL9UOlLpyNXeNMtWHvVfTUylyVyVn0k
         Gk3lDmZQ1sNFi9JwvcCeEoIbhcKLw5TktL9R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WdbWOY03V2kpY7k/lf8oQTo4VEA2Vdp6umA4nuJEIuc=;
        b=Y2E7xM9OjdjCX0mAXdiQ7TDOHtgeZh7ALY2lohpXMGXmglXhXKRqyUAfMv6hQjhG/F
         nDcGYmG7RuLWvSjVFRJPn3XC6QAVmMcwEn2b+GWYRQqcn1qLEfdnVYqIRK2KqlWTc0iI
         L4DrYBLcneTO9ryxq/B1G2KIpZKKKQpEnItfK1h6JVCuEsKFVydMo13OEIa2FsDeSYgk
         hvpltYhKI/+DDXLAhjQme2TzwCCqt+19ZHclWxn841N477m5lwJfsA0ap0n6cNH/ftIJ
         Nm3ncFpV1wt5I9GEvWJejkoDSyifCxaPKaMioOvfBTcOZ/7/9jUfXqSqwEMaW3t2muWx
         nUmg==
X-Gm-Message-State: AOAM530m54pe2NYV7JiZ6EEqU3ATj/8QBeCVc/oF6SObUkF/8BxSA4uj
        nNzjr8GTq8rmzSFH4toRkfLpug==
X-Google-Smtp-Source: ABdhPJyPQrHhFTVe7FBptsBwkry6fep3hyiTtJ3cgtGZkH8eIcRapLjFTx40/3fW35AjMX138/wVXQ==
X-Received: by 2002:a17:902:e80f:b0:148:a949:93ab with SMTP id u15-20020a170902e80f00b00148a94993abmr17960692plg.113.1640025899153;
        Mon, 20 Dec 2021 10:44:59 -0800 (PST)
Received: from localhost ([2620:15c:202:201:b6e8:fca9:3622:591e])
        by smtp.gmail.com with UTF8SMTPSA id 72sm3775169pfu.70.2021.12.20.10.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 10:44:58 -0800 (PST)
Date:   Mon, 20 Dec 2021 10:44:55 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
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
Message-ID: <YcDPJ1POD5oAqyLj@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.7.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
 <YbvSNta4jCxizaTa@google.com>
 <b0b69294-e7fb-5e7a-80f3-466dd4bdc88a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0b69294-e7fb-5e7a-80f3-466dd4bdc88a@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Dec 17, 2021 at 03:47:24AM +0300, Dmitry Osipenko wrote:
> 17.12.2021 02:56, Matthias Kaehlcke пишет:
> > On Tue, Nov 16, 2021 at 12:07:39PM -0800, Matthias Kaehlcke wrote:
> >> Some USB controller drivers that depend on the xhci-plat driver
> >> specify this dependency using 'select' in Kconfig. This is not
> >> recommended for symbols that have other dependencies as it may
> >> lead to invalid configurations. Use 'depends on' to specify the
> >> dependency instead of 'select'.
> >>
> >> For dwc3 specify the dependency on USB_XHCI_PLATFORM in
> >> USB_DWC3_HOST and USB_DWC3_DUAL_ROLE. Also adjust the
> >> dependencies of USB_DWC3_CORE to make sure that at least one
> >> of USB_DWC3_HOST, USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE can be
> >> selected.
> >>
> >> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> >> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > 
> > Note: This patch has been removed from the onboard_usb_hub series,
> > together with "ARM: configs: Explicitly enable USB_XHCI_PLATFORM
> > where needed" and "arm64: defconfig: Explicitly enable
> > USB_XHCI_PLATFORM". These patches aren't any longer needed for the
> > series. If maintainers think they are useful independently from
> > the series please pick them or let me know what needs to be
> > changed to get them landed.
> > 
> 
> Hi,
> 
> I don't know what this all is about, perhaps I'm CC'ed semi-randomly
> because touched that Kconfig once.

Yes, it seems tools select you based on their heuristics because you
made changes to that file.

> All I can say here is that the commit message tells us "This is not
> recommended" and doesn't explain what's the actual problem is being
> solved. If there is no real problem, why bother?

Earlier versions of the onboard_usb_hub series [1] which had a dependency
involving USB_XHCI_PLATFORM had an issue with invalid (rand)configs
that was related with the 'selects'.

The series doesn't depend on USB_XHCI_PLATFORM any longer, hence the
original issue doesn't exist anymore, however it might re-surface in
the future.

Personally I have no vested interest at this point in getting the
config changes landed, I just wanted to make clear what the status
is (split off from the series, no future versions unless someone
requests them), rather than abandoning them silently.

[1]: https://patchwork.kernel.org/project/linux-usb/list/?series=531343
