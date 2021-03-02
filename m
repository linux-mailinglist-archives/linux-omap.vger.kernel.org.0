Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CE332B132
	for <lists+linux-omap@lfdr.de>; Wed,  3 Mar 2021 04:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbhCCAnz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Mar 2021 19:43:55 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52529 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1449294AbhCBQ1f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Mar 2021 11:27:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id H7oZlNjwSOruFH7oklAWNz; Tue, 02 Mar 2021 17:24:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614702254; bh=pdYKDyrONOB4Vl8gSgev/XHYF/k739wydCb0PH7SXZI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=YyM4Lso1amS4IgLLRLWjPl0jUqbW1JTyeuISNUwsM58wOM85r4GVKJ4XOLE2XxDe+
         tUWgJvE+7I31CYZI5EY65VvNQbnFYIK/yt+Z/LKbb518z9R6rPtJ3KYL7mzP3M+FN+
         C4ZY5bPAIyHCEJdaahwOY0km3mrm2/y0FUwWppRadYHhCYroW+zaRT9mMLKFCV72j6
         azH+8XaRtgmsk3oWoexNUcjKt5bpwJdZ5UjNnaVt2z3/W/OaTFR7oSdzwJIzDcS6zr
         ev5BXflFBpblC6WNNP3QuUuDUobLiVj2DNmN8vHBg7eIhKDytH0IrYzA5ahEPQBNsO
         1UNHc0635SKLA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 3/6] drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
Date:   Tue,  2 Mar 2021 17:24:00 +0100
Message-Id: <20210302162403.983585-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfC3izUHoGEhUuhakLv2+dkIjeIDtYHJO1pPfWD8nhP0CbF8pP8lcKrrDjdGvxaxHQng+R8j+ekxirIIpQGQ0/8Le44tj2HOvxPeBSA/oVA8c20A3KlJI
 qAwivk7ksrQFTk/ZGgDyWVboNo5Z3fy0f0Wcwgmrx1yeumIeRb9Ce3enmtGjOTVvYH9h3nnfjAzMEgPSXPOfVnMBMKXJaghj0zC1k/IgBSL57TXssDv7kADO
 x7B0m73iHBAZJmlGeQOYVeauXwHYL0oGnIShi+kdnpkD/dLpOSM0VKOLRXOT1cufIH8REhhe0Py/sC9HHl+q12wS5a07+4bNz1CSD25AhU5Ik3ebj2swsi7U
 xqEC/NeO80+yW2FWOFbj0vnkTPAUXH+BYT2UmY1t5qHG8s2S6w+QGwl+1008KMedN4h+Gu1Oc6M6nf1//gQvD6slMVqeQIJJonHCwaij0rcCr6SRQ43KDPBw
 1mYZXqz1cq+oZzKWp+p7gx5Mhhc80hGfiS0vJrua2C6Dy5XjG++fKgZ2bSw=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Switch to using cec_s_phys_addr_from_edid() instead of a two-step process
of calling cec_get_edid_phys_addr() followed by cec_s_phys_addr().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 13 ++-----------
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  4 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  5 +++--
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index c387156a5cbb..73f6ed3b75ee 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -432,7 +432,7 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
 	if (status == connector_status_disconnected)
-		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
+		hdmi4_cec_set_phys_addr(&hdmi->core, NULL);
 }
 
 static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
@@ -440,7 +440,6 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 	struct edid *edid = NULL;
-	unsigned int cec_addr;
 	bool need_enable;
 	int r;
 
@@ -466,15 +465,7 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 	hdmi_runtime_put(hdmi);
 	mutex_unlock(&hdmi->lock);
 
-	if (edid && edid->extensions) {
-		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
-
-		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
-	} else {
-		cec_addr = CEC_PHYS_ADDR_INVALID;
-	}
-
-	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
+	hdmi4_cec_set_phys_addr(&hdmi->core, edid);
 
 	if (need_enable)
 		hdmi4_core_disable(&hdmi->core);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
index 80ec52c9c846..cf406d86c845 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -329,9 +329,9 @@ static const struct cec_adap_ops hdmi_cec_adap_ops = {
 	.adap_transmit = hdmi_cec_adap_transmit,
 };
 
-void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
+void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, struct edid *edid)
 {
-	cec_s_phys_addr(core->adap, pa, false);
+	cec_s_phys_addr_from_edid(core->adap, edid);
 }
 
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
index b59a54c3040e..16bf259643b7 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
@@ -26,13 +26,14 @@ struct platform_device;
 
 /* HDMI CEC funcs */
 #ifdef CONFIG_OMAP4_DSS_HDMI_CEC
-void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
+void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, struct edid *edid);
 void hdmi4_cec_irq(struct hdmi_core_data *core);
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 		   struct hdmi_wp_data *wp, struct drm_connector *conn);
 void hdmi4_cec_uninit(struct hdmi_core_data *core);
 #else
-static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
+static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core,
+					   struct edid *edid)
 {
 }
 
-- 
2.30.1

