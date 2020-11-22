Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E732BC589
	for <lists+linux-omap@lfdr.de>; Sun, 22 Nov 2020 13:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgKVMBi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Nov 2020 07:01:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:35000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727318AbgKVMBh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 22 Nov 2020 07:01:37 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6AE5620760;
        Sun, 22 Nov 2020 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606046497;
        bh=2/qAX5BkPs42hKYLm51EboQB6diuinSxs3CjQRneQKA=;
        h=From:To:Cc:Subject:Date:From;
        b=Iy82igAhyKJfYbtgHiuUQmsly6h9q6ESDduD45mEDrjlpgZDtlIUup03PwkXw9CxE
         0+HMP6+kmfgpY20kTMTyy9SgLkTw444ROUabMBUA5/4iJepVTXnifZR1lNye1NpODd
         9eyAfgM4tD34E2Fzr9jH/bkSbD+FCsdn2YVdyGh0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] mfd: omap-usb: depend on COMMON_CLK to fix compile tests
Date:   Sun, 22 Nov 2020 13:01:33 +0100
Message-Id: <20201122120133.100170-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The MFD_OMAP_USB_HOST uses Common Clock Framework thus it cannot be
built on platforms without it (e.g. compile test on MIPS with LANTIQ):

    mips-linux-ld: drivers/mfd/omap-usb-host.o: in function `usbhs_omap_probe':
    omap-usb-host.c:(.text+0x940): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index cc0b73280c68..fe79e8ff4669 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1442,6 +1442,7 @@ config MFD_TI_LMU
 config MFD_OMAP_USB_HOST
 	bool "TI OMAP USBHS core and TLL driver"
 	depends on USB_EHCI_HCD_OMAP || USB_OHCI_HCD_OMAP3
+	depends on COMMON_CLK
 	default y
 	help
 	  This is the core driver for the OAMP EHCI and OHCI drivers.
-- 
2.25.1

