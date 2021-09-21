Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77966413810
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 19:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhIURKf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 13:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhIURKe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 13:10:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E72CC061760
        for <linux-omap@vger.kernel.org>; Tue, 21 Sep 2021 10:09:05 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f129so21349854pgc.1
        for <linux-omap@vger.kernel.org>; Tue, 21 Sep 2021 10:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=n7HGmPYwL475PdtYm46wy9zSx3aGM/fXJUshwhN+SlM=;
        b=EBGNZr04Sh+tbGaVPvAAdZ5Ir0X+RVOsM8s8+OSuzEJrbjn0YyjKTiFuqcQx3s+Fzp
         Wmp4l5WktYW+gN3asE7UoNA3p5ZebYhMoMLKR/wbIpzMPux113AF9qx4jS0Ik/QqDhQs
         CksYISDeY0hZPI/xyNpHfrWANy33TDBgE1Yk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=n7HGmPYwL475PdtYm46wy9zSx3aGM/fXJUshwhN+SlM=;
        b=h+Bp8AuJQOlZvpOW0hS/7KbNNGnZ/ixCinPvB4oAphXfP1gSEGRRrfGA6vXSWODKDz
         s3Uic4sEpH5CdFFdooebASpjYwYfFnHheeNy1c7+Nhb1dreRo+dvX1GQJVDWFL5ldHPW
         s88lpAxlRHCVHd+9TzsHrRl1k30bJKZWNG6o9XH+KH8XE9xYKA9LBsTHioNKfiDXCHDt
         o66bbX1+4Vw6sFk8bCE2V0MDZigBJCGoF+E6TtHE7507FKusDk7GR8arsl+plXeLH8Cf
         NGIh9wk9H88VFqzFh9geYfrDqq0GSyupGi49EV9OOp0dAM81FBvSy3fk74bYMJb2SbqX
         Z+kQ==
X-Gm-Message-State: AOAM533McDEncg9qMoXI+pT4lHmE0+jFAJAldpDOBQ2pyYMzo5/EmU2e
        80WuPrhmfwzKbpOsz2qJFjFrbQ==
X-Google-Smtp-Source: ABdhPJwk5MxTN+l52NY4vcaU18EvzpQ49+tcjyE707C5yPkbyZlZeop5dVG7ahQWqeY1X+ZkbGx7/A==
X-Received: by 2002:a05:6a00:26cc:b0:440:51c6:fa38 with SMTP id p12-20020a056a0026cc00b0044051c6fa38mr30406951pfw.45.1632244144756;
        Tue, 21 Sep 2021 10:09:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:40f3:7953:e98e:68ab])
        by smtp.gmail.com with UTF8SMTPSA id w4sm2874355pfb.3.2021.09.21.10.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 10:09:04 -0700 (PDT)
Date:   Tue, 21 Sep 2021 10:08:59 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Will Deacon <will@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Subject: Re: [PATCH v16 0/7] usb: misc: Add onboard_usb_hub driver
Message-ID: <YUoRq1RrOIoiBJ5+@google.com>
References: <20210813195228.2003500-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210813195228.2003500-1-mka@chromium.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Greg,

are there any actions pending or can this land in usb-testing?

I confirmed that this series can be rebased on top of v5.15-rc2
without conflicts.

Thanks

m.

On Fri, Aug 13, 2021 at 12:52:21PM -0700, Matthias Kaehlcke wrote:
> This series adds:
> - the onboard_usb_hub_driver
> - glue in the xhci-plat driver to create and destroy the
>   onboard_usb_hub platform devices if needed
> - a device tree binding for the Realtek RTS5411 USB hub controller
> - device tree changes that add RTS5411 entries for the QCA SC7180
>   based boards trogdor and lazor
> - a couple of stubs for platform device functions to avoid
>   unresolved symbols with certain kernel configs
> 
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. For discrete onboard hubs (an
> example for such a hub is the Realtek RTS5411) this is often solved
> by supplying the hub with an 'always-on' regulator, which is kind
> of a hack. Some onboard hubs may require further initialization
> steps, like changing the state of a GPIO or enabling a clock, which
> requires even more hacks. This driver creates a platform device
> representing the hub which performs the necessary initialization.
> Currently it only supports switching on a single regulator, support
> for multiple regulators or other actions can be added as needed.
> Different initialization sequences can be supported based on the
> compatible string.
> 
> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.
> 
> Changes in v16:
> - added patch 'ARM: configs: Explicitly enable USB_XHCI_PLATFORM
>   where needed' to keep arm32 defconfigs effectively unchanged
> 
> Changes in v15:
> - adjusted dependencies of USB_DWC3_CORE to make sure it can only
>   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
>   or USB_DWC3_DUAL_ROLE is selectable
> 
> Changes in v14:
> - rebased on top of v5.14-rc1
> - dropped DT binding patch which landed in v5.13
> 
> Changes in v13:
> - added patch "usb: Specify dependency on USB_XHCI_PLATFORM with
>   'depends on'" to the series to avoid Kconfig conflicts
> - added patch "arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM"
>   to the series to keep effective defconfig unchanged
> 
> Changes in v12:
> - onboard_hub driver: use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE)
>   in onboard_hub.h to also check for the driver built as module
> - onboard_hub_driver: include onboard_hub.h again to make sure there
>   are prototype declarations for the public functions
> 
> Changes in v11:
> - support multiple onboard hubs connected to the same parent
> - don't include ‘onboard_hub.h’ from the onboard hub driver
> 
> Changes in v10:
> - always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=y/m
> - keep 'regulator-boot-on' property for pp3300_hub
> 
> Changes in v9:
> - added dependency on ONBOARD_USB_HUB (or !!ONBOARD_USB_HUB) to
>   USB_PLATFORM_XHCI
> 
> Changes in v7:
> - updated DT binding
> - series rebased on qcom/arm64-for-5.13
> 
> Changes in v6:
> - updated summary
> 
> Changes in v5:
> - cover letter added
> 
> Matthias Kaehlcke (7):
>   usb: misc: Add onboard_usb_hub driver
>   of/platform: Add stubs for of_platform_device_create/destroy()
>   ARM: configs: Explicitly enable USB_XHCI_PLATFORM where needed
>   arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
>   usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
>   usb: host: xhci-plat: Create platform device for onboard hubs in
>     probe()
>   arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
> 
>  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
>  MAINTAINERS                                   |   7 +
>  arch/arm/configs/exynos_defconfig             |   1 +
>  arch/arm/configs/keystone_defconfig           |   1 +
>  arch/arm/configs/multi_v7_defconfig           |   1 +
>  arch/arm/configs/mvebu_v7_defconfig           |   1 +
>  arch/arm/configs/omap2plus_defconfig          |   1 +
>  arch/arm/configs/pxa_defconfig                |   1 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  12 +-
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/usb/cdns3/Kconfig                     |   2 +-
>  drivers/usb/dwc3/Kconfig                      |   5 +-
>  drivers/usb/host/Kconfig                      |   5 +-
>  drivers/usb/host/xhci-plat.c                  |   6 +
>  drivers/usb/host/xhci.h                       |   2 +
>  drivers/usb/misc/Kconfig                      |  17 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 497 ++++++++++++++++++
>  include/linux/of_platform.h                   |  22 +-
>  include/linux/usb/onboard_hub.h               |  18 +
>  23 files changed, 627 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 include/linux/usb/onboard_hub.h
> 
> -- 
> 2.33.0.rc1.237.g0d66db33f3-goog
> 
