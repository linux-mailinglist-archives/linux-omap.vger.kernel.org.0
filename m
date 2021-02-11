Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505E531888B
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 11:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBKKsI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 05:48:08 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33305 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230443AbhBKKp1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 05:45:27 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A9LMlXsw2Zvk6A9LRlud2N; Thu, 11 Feb 2021 11:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613039829; bh=/RluaKkbRNT2NovseHLdwP2LHjAtvTSvmGfevXfdf8k=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Xx9Zy8qj/2qvTXI7KeJTjqbBhpFirb/Sp0fB83aUZOItnUhfMGLHLZvIzuEYLcVkW
         Gom/KgD/3rwKj8/oDn+crYN8mXoYJKGA2Y2j8NuJfPsVYNtrDE5rf+0NgDERoogKuR
         45801SRsnybeCZMFCP3m1oBppW3YmjijcZhvFGxrCSkkkQNZ9dkjTAWFsMRMFhs4If
         lwNSR547gnX/51IhTEeByC7hmMDKHW0uJ4gwrKsImIHOQdAaaDLop3sgTJueYN4TPc
         ccJOinboQ+MIazam0ArKWAiQqBkgCd/dr51ZuGrGuDPyYIcys2oxaZLfodPalcaayz
         Vhrn9KhpgJfjA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/5] drm/omap: hdmi4: simplify CEC Phys Addr handling
Date:   Thu, 11 Feb 2021 11:37:01 +0100
Message-Id: <20210211103703.444625-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMVufYRA30s44XrBb7euBEAQNI5/5ADL4UTGWENhEPzj1BFYGkaXvMAzCILkhgdqiEvezzzaB7alvVEsKWc9B88x5HTsVXcOAqHNIwxL+GgEGzmJzkmr
 jSfaU8y7Slnxk+eS9d0F2rEiadkHCYpBSaTxoZvsB9/szwrcx7r94iII37kpcbbj6e9W+fxiIke4l2k6la8Ajvhpyporg2A8oVTgSVc3AJ7JRJ1QJqhDK37Y
 F9h6T3vxvs8fGvB5rH3uKMVAsxNtXAALIfHFVXyM/gBKqrGH9jay1+EqicrPDRZlwJVmvJMRG80yzJtiXXK5OcHEMAGJ5SzNOUMgH468olz2F3m2EuiiCW4k
 x8fuVR2WFaZLPKWzWsdPh8eMgi3IYG8TDagsSyj0fOnzlCCjqy2990y+o88+yplSD3owzSTF2eJFhlwNWes/PI9IHmb7oIJ/9etlHTv5dNlIc28IGyo=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Switch to using cec_s_phys_addr_from_edid() instead of a two-step process
of calling cec_get_edid_phys_addr() followed by cec_s_phys_addr().

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 13 ++-----------
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  4 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  5 +++--
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 765379380d4b..ac142f870109 100644
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
index 64f5ccd0f11b..68b4c84e1864 100644
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
2.30.0

