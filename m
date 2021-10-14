Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AB642E3BC
	for <lists+linux-omap@lfdr.de>; Thu, 14 Oct 2021 23:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhJNVqe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Oct 2021 17:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhJNVqe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Oct 2021 17:46:34 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAFAC061570
        for <linux-omap@vger.kernel.org>; Thu, 14 Oct 2021 14:44:28 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id i11so5005862ila.12
        for <linux-omap@vger.kernel.org>; Thu, 14 Oct 2021 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4D2KqVz/grDaUl76s7J9zeGObKQ15bbnSTv7OIZk5vg=;
        b=aHb1/6TKnQqMhvtJOJF1tVMo8BcJNVRSFTz2VWYibKU9O3GX/MIvY0bW93RHJN+Gww
         yYW0fGz9LXFulKqY3fcA+8On2SGSH5iyQ+x0VZYh23p7LAOOtKkv6DHZMzYsmCQCisRG
         q1N2UEHd+BICw52knzA0+JKld6AiYCZIbgOl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4D2KqVz/grDaUl76s7J9zeGObKQ15bbnSTv7OIZk5vg=;
        b=BFKuhkGgQ88Uw6wiacvI6+fBcwSRf7r9N4g88YNQVhgi6ffDf/x/tABSTbUIawddcB
         V13OxzC6IX6BJpJ9moD9tgnV+t1Gj5UJXdx0UT3svyEkxTMtYC61oiJXlHAOQ8PriE/3
         NJMDezVFF9gVn4e4tCXkJmBzKCKMK9XxQYoRIzAAVj+BClWxXjWcGZ+YPV6ehFTpQITK
         Hm0JpJqykJPt14MwIS1p4XIlkGznzNL8ePLoZnFafZmHQ8xdj70/xrmJF/cRyZDrDAbP
         n8//Uld+DPF+HrEzcQBROCTkNunie1a6IO9m9CmF7QEGfNtoEQePHv+At/mgkznML4nY
         BAaw==
X-Gm-Message-State: AOAM530bQqYtRGNlScGTm9W6pELlJLnoIEsZKRD2XezVkKJG5viqepMo
        0+YwivNHa1CGw6YbfUdAOX8M/BUMNII=
X-Google-Smtp-Source: ABdhPJyYaRAfm4wEO8rngvDj/YMoJIQSakUDfe1arCWCggHJeL8OmtFduvYlqDIIrf+2dpmUcq/9iQ==
X-Received: by 2002:a05:6e02:1d12:: with SMTP id i18mr1077593ila.182.1634247868115;
        Thu, 14 Oct 2021 14:44:28 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id d11sm1766036iom.29.2021.10.14.14.44.28
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 14:44:28 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id n7so5560289iod.0
        for <linux-omap@vger.kernel.org>; Thu, 14 Oct 2021 14:44:28 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr1122421iog.98.1634247547766;
 Thu, 14 Oct 2021 14:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210813195228.2003500-1-mka@chromium.org> <YUoRq1RrOIoiBJ5+@google.com>
In-Reply-To: <YUoRq1RrOIoiBJ5+@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Oct 2021 14:38:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
Message-ID: <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
Subject: Re: [PATCH v16 0/7] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
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
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, Sep 21, 2021 at 10:09 AM Matthias Kaehlcke <mka@chromium.org> wrote=
:
>
> Hi Greg,
>
> are there any actions pending or can this land in usb-testing?
>
> I confirmed that this series can be rebased on top of v5.15-rc2
> without conflicts.

I'm quite interested to know what the next action items are, too. This
is one of the very few patches we have for trogdor (excluding MIPI
camera, which is a long story) that we're carrying downstream, so I'm
keenly interested in making sure it's unblocked (if, indeed, it's
blocked on anything).

If folks feel that this needs more review eyes before landing again
then I'll try to find some time in the next week or two. If it's just
waiting for the merge window to open/close so it can have maximal bake
time, that's cool too. Please yell if there's something that I can do
to help, though! :-)


> On Fri, Aug 13, 2021 at 12:52:21PM -0700, Matthias Kaehlcke wrote:
> > This series adds:
> > - the onboard_usb_hub_driver
> > - glue in the xhci-plat driver to create and destroy the
> >   onboard_usb_hub platform devices if needed
> > - a device tree binding for the Realtek RTS5411 USB hub controller
> > - device tree changes that add RTS5411 entries for the QCA SC7180
> >   based boards trogdor and lazor
> > - a couple of stubs for platform device functions to avoid
> >   unresolved symbols with certain kernel configs
> >
> > The main issue the driver addresses is that a USB hub needs to be
> > powered before it can be discovered. For discrete onboard hubs (an
> > example for such a hub is the Realtek RTS5411) this is often solved
> > by supplying the hub with an 'always-on' regulator, which is kind
> > of a hack. Some onboard hubs may require further initialization
> > steps, like changing the state of a GPIO or enabling a clock, which
> > requires even more hacks. This driver creates a platform device
> > representing the hub which performs the necessary initialization.
> > Currently it only supports switching on a single regulator, support
> > for multiple regulators or other actions can be added as needed.
> > Different initialization sequences can be supported based on the
> > compatible string.
> >
> > Besides performing the initialization the driver can be configured
> > to power the hub off during system suspend. This can help to extend
> > battery life on battery powered devices which have no requirements
> > to keep the hub powered during suspend. The driver can also be
> > configured to leave the hub powered when a wakeup capable USB device
> > is connected when suspending, and power it off otherwise.
> >
> > Changes in v16:
> > - added patch 'ARM: configs: Explicitly enable USB_XHCI_PLATFORM
> >   where needed' to keep arm32 defconfigs effectively unchanged
> >
> > Changes in v15:
> > - adjusted dependencies of USB_DWC3_CORE to make sure it can only
> >   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
> >   or USB_DWC3_DUAL_ROLE is selectable
> >
> > Changes in v14:
> > - rebased on top of v5.14-rc1
> > - dropped DT binding patch which landed in v5.13
> >
> > Changes in v13:
> > - added patch "usb: Specify dependency on USB_XHCI_PLATFORM with
> >   'depends on'" to the series to avoid Kconfig conflicts
> > - added patch "arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM"
> >   to the series to keep effective defconfig unchanged
> >
> > Changes in v12:
> > - onboard_hub driver: use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE)
> >   in onboard_hub.h to also check for the driver built as module
> > - onboard_hub_driver: include onboard_hub.h again to make sure there
> >   are prototype declarations for the public functions
> >
> > Changes in v11:
> > - support multiple onboard hubs connected to the same parent
> > - don't include =E2=80=98onboard_hub.h=E2=80=99 from the onboard hub dr=
iver
> >
> > Changes in v10:
> > - always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=3Dy/m
> > - keep 'regulator-boot-on' property for pp3300_hub
> >
> > Changes in v9:
> > - added dependency on ONBOARD_USB_HUB (or !!ONBOARD_USB_HUB) to
> >   USB_PLATFORM_XHCI
> >
> > Changes in v7:
> > - updated DT binding
> > - series rebased on qcom/arm64-for-5.13
> >
> > Changes in v6:
> > - updated summary
> >
> > Changes in v5:
> > - cover letter added
> >
> > Matthias Kaehlcke (7):
> >   usb: misc: Add onboard_usb_hub driver
> >   of/platform: Add stubs for of_platform_device_create/destroy()
> >   ARM: configs: Explicitly enable USB_XHCI_PLATFORM where needed
> >   arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
> >   usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
> >   usb: host: xhci-plat: Create platform device for onboard hubs in
> >     probe()
> >   arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub
> >
> >  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
> >  MAINTAINERS                                   |   7 +
> >  arch/arm/configs/exynos_defconfig             |   1 +
> >  arch/arm/configs/keystone_defconfig           |   1 +
> >  arch/arm/configs/multi_v7_defconfig           |   1 +
> >  arch/arm/configs/mvebu_v7_defconfig           |   1 +
> >  arch/arm/configs/omap2plus_defconfig          |   1 +
> >  arch/arm/configs/pxa_defconfig                |   1 +
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  19 +-
> >  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  12 +-
> >  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  19 +-
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  19 +-
> >  arch/arm64/configs/defconfig                  |   1 +
> >  drivers/usb/cdns3/Kconfig                     |   2 +-
> >  drivers/usb/dwc3/Kconfig                      |   5 +-
> >  drivers/usb/host/Kconfig                      |   5 +-
> >  drivers/usb/host/xhci-plat.c                  |   6 +
> >  drivers/usb/host/xhci.h                       |   2 +
> >  drivers/usb/misc/Kconfig                      |  17 +
> >  drivers/usb/misc/Makefile                     |   1 +
> >  drivers/usb/misc/onboard_usb_hub.c            | 497 ++++++++++++++++++
> >  include/linux/of_platform.h                   |  22 +-
> >  include/linux/usb/onboard_hub.h               |  18 +
> >  23 files changed, 627 insertions(+), 39 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboar=
d-usb-hub
> >  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
> >  create mode 100644 include/linux/usb/onboard_hub.h
> >
> > --
> > 2.33.0.rc1.237.g0d66db33f3-goog
> >
