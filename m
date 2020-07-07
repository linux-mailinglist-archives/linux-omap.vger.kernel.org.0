Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F47221785B
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 21:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgGGTzQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 15:55:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728254AbgGGTzP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 15:55:15 -0400
Received: from embeddedor (unknown [200.39.26.250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5258A2067D;
        Tue,  7 Jul 2020 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594151714;
        bh=EKHQa0fn19dP7DdfSsBAyCGObw/4dqvoeOQ2/MAc5zM=;
        h=Date:From:To:Cc:Subject:From;
        b=FXBCzWY09+DYmPoVYbiaKTUAOjJ2ovjQFPURMU2W4LPZGUL596iwJJV2TIeAesPLA
         OQ2b6A9ZfvORaDVut94zw1dvVT2NU3xUF22BweWUM1x/u1/gQkhQeI009o++B21hhO
         wUzk9OWGE1aCepcl2X+wbc6C8UORlOyXiEKuXxAg=
Date:   Tue, 7 Jul 2020 15:00:40 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] usb: phy: Use fallthrough pseudo-keyword
Message-ID: <20200707200040.GA4525@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/usb/phy/phy-ab8500-usb.c   |   12 ++++++------
 drivers/usb/phy/phy-fsl-usb.c      |    4 ++--
 drivers/usb/phy/phy-isp1301-omap.c |   14 +++++++-------
 drivers/usb/phy/phy-mv-usb.c       |    2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index 20c0f082bf9c..aa4a3140394b 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -331,7 +331,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 	switch (lsts) {
 	case USB_LINK_ACA_RID_B_8505:
 		event = UX500_MUSB_RIDB;
-		/* Fall through */
+		fallthrough;
 	case USB_LINK_NOT_CONFIGURED_8505:
 	case USB_LINK_RESERVED0_8505:
 	case USB_LINK_RESERVED1_8505:
@@ -352,7 +352,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 
 	case USB_LINK_ACA_RID_C_NM_8505:
 		event = UX500_MUSB_RIDC;
-		/* Fall through */
+		fallthrough;
 	case USB_LINK_STD_HOST_NC_8505:
 	case USB_LINK_STD_HOST_C_NS_8505:
 	case USB_LINK_STD_HOST_C_S_8505:
@@ -371,7 +371,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 	case USB_LINK_ACA_RID_A_8505:
 	case USB_LINK_ACA_DOCK_CHGR_8505:
 		event = UX500_MUSB_RIDA;
-		/* Fall through */
+		fallthrough;
 	case USB_LINK_HM_IDGND_8505:
 		if (ab->mode == USB_IDLE) {
 			ab->mode = USB_HOST;
@@ -444,7 +444,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
 	switch (lsts) {
 	case USB_LINK_ACA_RID_B_8500:
 		event = UX500_MUSB_RIDB;
-		/* Fall through */
+		fallthrough;
 	case USB_LINK_NOT_CONFIGURED_8500:
 	case USB_LINK_NOT_VALID_LINK_8500:
 		ab->mode = USB_IDLE;
@@ -461,7 +461,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
 	case USB_LINK_ACA_RID_C_HS_8500:
 	case USB_LINK_ACA_RID_C_HS_CHIRP_8500:
 		event = UX500_MUSB_RIDC;
-		/* Fall through */
+		fallthrough;
 	case USB_LINK_STD_HOST_NC_8500:
 	case USB_LINK_STD_HOST_C_NS_8500:
 	case USB_LINK_STD_HOST_C_S_8500:
@@ -481,7 +481,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
 
 	case USB_LINK_ACA_RID_A_8500:
 		event = UX500_MUSB_RIDA;
-		/* Fall through */
+		fallthrough;
 	case USB_LINK_HM_IDGND_8500:
 		if (ab->mode == USB_IDLE) {
 			ab->mode = USB_HOST;
diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index b451f4695f3f..01985e1b513a 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -911,10 +911,10 @@ int usb_otg_start(struct platform_device *pdev)
 		break;
 	case FSL_USB2_PHY_UTMI_WIDE:
 		temp |= PORTSC_PTW_16BIT;
-		/* fall through */
+		fallthrough;
 	case FSL_USB2_PHY_UTMI:
 		temp |= PORTSC_PTS_UTMI;
-		/* fall through */
+		fallthrough;
 	default:
 		break;
 	}
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 7041ba030052..4a6462c92ef2 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -581,11 +581,11 @@ static void otg_update_isp(struct isp1301 *isp)
 		/* HNP failed for some reason (A_AIDL_BDIS timeout) */
 		notresponding(isp);
 
-		/* FALLTHROUGH */
+		fallthrough;
 	case OTG_STATE_A_VBUS_ERR:
 		isp->phy.otg->state = OTG_STATE_A_WAIT_VFALL;
 		pr_debug("  --> a_wait_vfall\n");
-		/* FALLTHROUGH */
+		fallthrough;
 	case OTG_STATE_A_WAIT_VFALL:
 		/* FIXME usbcore thinks port power is still on ... */
 		clr |= OTG1_VBUS_DRV;
@@ -595,7 +595,7 @@ static void otg_update_isp(struct isp1301 *isp)
 			isp->phy.otg->state = OTG_STATE_A_WAIT_VRISE;
 			pr_debug("  --> a_wait_vrise\n");
 		}
-		/* FALLTHROUGH */
+		fallthrough;
 	default:
 		toggle(OTG_DRV_VBUS, OTG1_VBUS_DRV);
 	}
@@ -945,10 +945,10 @@ static void isp_update_otg(struct isp1301 *isp, u8 stat)
 			switch (state) {
 			case OTG_STATE_B_IDLE:
 				a_idle(isp, "idle");
-				/* FALLTHROUGH */
+				fallthrough;
 			case OTG_STATE_A_IDLE:
 				enable_vbus_source(isp);
-				/* FALLTHROUGH */
+				fallthrough;
 			case OTG_STATE_A_WAIT_VRISE:
 				/* we skip over OTG_STATE_A_WAIT_BCON, since
 				 * the HC will transition to A_HOST (or
@@ -1032,12 +1032,12 @@ static void isp_update_otg(struct isp1301 *isp, u8 stat)
 						OTG1_DP_PULLUP);
 			dump_regs(isp, __func__);
 #endif
-			/* FALLTHROUGH */
+			fallthrough;
 		case OTG_STATE_B_SRP_INIT:
 			b_idle(isp, __func__);
 			l = omap_readl(OTG_CTRL) & OTG_XCEIV_OUTPUTS;
 			omap_writel(l, OTG_CTRL);
-			/* FALLTHROUGH */
+			fallthrough;
 		case OTG_STATE_B_IDLE:
 			if (otg->gadget && (isp_bstat & OTG_B_SESS_VLD)) {
 #ifdef	CONFIG_USB_OTG
diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index 06b47f1028b3..ce767ecc0636 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -334,7 +334,7 @@ static void mv_otg_update_state(struct mv_otg *mvotg)
 	switch (old_state) {
 	case OTG_STATE_UNDEFINED:
 		mvotg->phy.otg->state = OTG_STATE_B_IDLE;
-		/* FALL THROUGH */
+		fallthrough;
 	case OTG_STATE_B_IDLE:
 		if (otg_ctrl->id == 0)
 			mvotg->phy.otg->state = OTG_STATE_A_IDLE;

