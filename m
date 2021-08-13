Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7133EBCC9
	for <lists+linux-omap@lfdr.de>; Fri, 13 Aug 2021 21:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhHMTxV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Aug 2021 15:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbhHMTxS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Aug 2021 15:53:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA97C061756
        for <linux-omap@vger.kernel.org>; Fri, 13 Aug 2021 12:52:49 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so17582399pjb.0
        for <linux-omap@vger.kernel.org>; Fri, 13 Aug 2021 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmecue9QUeQLjEjIx40ol9W8NZeTwwWyqVOpKPEfJgQ=;
        b=h4+g/p4zliff4K3/cjL/A4A5SmFQmvVCsuFj25M74PywK8belHVLPd84mufDGOc99Y
         fGqjxwCyRuccst5WNCdAUE7ch+nbURpFjSg5atf2Zf3WWduE4FhEogoZV2doYILpzEL7
         xHYipN658PX7IqYoLi7fOn+uDM2MVYnWBKC7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmecue9QUeQLjEjIx40ol9W8NZeTwwWyqVOpKPEfJgQ=;
        b=HWyIvuyc38v8e2sH9qcqghdq+QzPwdPonacycT8gy+e/SNjHGlOwxpItbYDTqQSvdJ
         5CMemCqnHl/QOLpeA7BW7O+opNeNETxZsDEBwL9QwRXMj/j/Dd8/mYgVACXd7DipLvQa
         U6Pii0ykmKE0iyfBzZJ/cKqOOfJux+T3iW9HAgsxlx0IlyCm5HDnOwG/CLe4AhglzpKs
         fbu55yRoQAqgJ7THyh1qdvmPr00r2Fni01bqcriEbVzeoXWYEcKACpYYzLzVZBXjARxt
         dg0u4w2+dO20ldw+UsK7VaEM36oPeqjCyq2tEp4vBr3ZP4PEZI2pf8y5TsyuxVW+K3rs
         dNWw==
X-Gm-Message-State: AOAM531pmI41yOQ+kWAB2IvnEdZB5eQMyASjGP/SljQt1nKUcvr16QeO
        Und1bfn3inIeGrA96AR4iYh3YQ==
X-Google-Smtp-Source: ABdhPJzOWOlsavcCtPw0JA3mrby5b3cV4By0+SKQ6t9340axfGaaw4art/RyEN/KJya669RhN3muMg==
X-Received: by 2002:a65:4581:: with SMTP id o1mr3695529pgq.349.1628884369112;
        Fri, 13 Aug 2021 12:52:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:450d:9788:a70e:42d6])
        by smtp.gmail.com with UTF8SMTPSA id ca7sm2554886pjb.11.2021.08.13.12.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:52:48 -0700 (PDT)
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
        Matthias Kaehlcke <mka@chromium.org>,
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
Subject: [PATCH v16 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
Date:   Fri, 13 Aug 2021 12:52:26 -0700
Message-Id: <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813195228.2003500-1-mka@chromium.org>
References: <20210813195228.2003500-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some USB controller drivers that depend on the xhci-plat driver
specify this dependency using 'select' in Kconfig. This is not
recommended for symbols that have other dependencies as it may
lead to invalid configurations. Use 'depends on' to specify the
dependency instead of 'select'.

For dwc3 specify the dependency on USB_XHCI_PLATFORM in
USB_DWC3_HOST and USB_DWC3_DUAL_ROLE. Also adjust the
dependencies of USB_DWC3_CORE to make sure that at least one
of USB_DWC3_HOST, USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE can be
selected.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v16:
- none

Changes in v15:
- adjusted dependencies of USB_DWC3_CORE to make sure it can only
  be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
  or USB_DWC3_DUAL_ROLE is selectable
- updated commit message

Changes in v14:
- none

Changes in v13:
- patch added to the series

 drivers/usb/cdns3/Kconfig | 2 +-
 drivers/usb/dwc3/Kconfig  | 5 +++--
 drivers/usb/host/Kconfig  | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index b98ca0a1352a..07e12f786d48 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -1,7 +1,7 @@
 config USB_CDNS_SUPPORT
 	tristate "Cadence USB Support"
 	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
 	select USB_ROLE_SWITCH
 	help
 	  Say Y here if your system has a Cadence USBSS or USBSSP
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 66b1454c4db2..870f2251350a 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -2,8 +2,7 @@
 
 config USB_DWC3
 	tristate "DesignWare USB3 DRD Core Support"
-	depends on (USB || USB_GADGET) && HAS_DMA
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	depends on ((USB && USB_XHCI_PLATFORM) || USB_GADGET) && HAS_DMA
 	select USB_ROLE_SWITCH if USB_DWC3_DUAL_ROLE
 	help
 	  Say Y or M here if your system has a Dual Role SuperSpeed
@@ -30,6 +29,7 @@ choice
 config USB_DWC3_HOST
 	bool "Host only mode"
 	depends on USB=y || USB=USB_DWC3
+	depends on USB_XHCI_PLATFORM
 	help
 	  Select this when you want to use DWC3 in host mode only,
 	  thereby the gadget feature will be regressed.
@@ -44,6 +44,7 @@ config USB_DWC3_GADGET
 config USB_DWC3_DUAL_ROLE
 	bool "Dual Role mode"
 	depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
+	depends on USB_XHCI_PLATFORM
 	depends on (EXTCON=y || EXTCON=USB_DWC3)
 	help
 	  This is the default mode of working of DWC3 controller where
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index df9428f1dc5e..518c2312ef0c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -80,7 +80,7 @@ config USB_XHCI_MTK
 
 config USB_XHCI_MVEBU
 	tristate "xHCI support for Marvell Armada 375/38x/37xx"
-	select USB_XHCI_PLATFORM
+	depends on USB_XHCI_PLATFORM
 	depends on HAS_IOMEM
 	depends on ARCH_MVEBU || COMPILE_TEST
 	help
@@ -112,9 +112,9 @@ config USB_EHCI_BRCMSTB
 config USB_BRCMSTB
 	tristate "Broadcom STB USB support"
 	depends on (ARCH_BRCMSTB && PHY_BRCM_USB) || COMPILE_TEST
+	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
 	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select USB_EHCI_BRCMSTB if USB_EHCI_HCD
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
 	help
 	  Enables support for XHCI, EHCI and OHCI host controllers
 	  found in Broadcom STB SoC's.
-- 
2.33.0.rc1.237.g0d66db33f3-goog

