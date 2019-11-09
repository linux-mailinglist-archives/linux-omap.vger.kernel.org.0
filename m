Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66548F5FCB
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2019 16:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfKIPQB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Nov 2019 10:16:01 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39496 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfKIPQA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Nov 2019 10:16:00 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA9FFrgQ067040;
        Sat, 9 Nov 2019 09:15:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573312553;
        bh=XXR2u0gdRak80i7pzoRzSNxStU4rnWKt2lklBYWgMGg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BT4vH0lE8+W8ClqDQlMkXiby7CHOUvhkRUBk8gk2k8MrX7QndsGdKFJ7iUIq0vSfP
         UtqCcRYoRRz2DfcYcGlNvJSFjrQQxp1x79MIgG8X8/m6dTxdiIzs1DZMwtLA6f3XE5
         Uy2ags8qsUD6A0+I9ZZue8oS+TmgPX2edsxr6AHk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA9FFreF087406
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 9 Nov 2019 09:15:53 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 9 Nov
 2019 09:15:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 9 Nov 2019 09:15:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA9FFpBA047269;
        Sat, 9 Nov 2019 09:15:52 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Florian Fainelli <f.fainelli@gmail.com>, <netdev@vger.kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Jiri Pirko <jiri@resnulli.us>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Ivan Vecera <ivecera@redhat.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v6 net-next 03/13] net: ethernet: ti: ale: modify vlan/mdb api for switchdev
Date:   Sat, 9 Nov 2019 17:15:15 +0200
Message-ID: <20191109151525.18651-4-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191109151525.18651-1-grygorii.strashko@ti.com>
References: <20191109151525.18651-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>

A following patch introduces switchdev functionality, so modify
ALE engine VLANs/MDBs API:
- cpsw_ale_del_mcast(): update so it will remove only selected ports from
mcast port_mask or delete whole mcast record if !port_mask
- cpsw_ale_del_vlan(): update so it will remove only selected ports from
all VLAN record's masks or delete whole VLAN record if !port_mask
- add cpsw_ale_vlan_add_modify() to add or modify existing VLAN record's
masks
- add cpsw_ale_set_unreg_mcast() for enabling unreg mcast on port VLANs

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 127 ++++++++++++++++++++++++++---
 drivers/net/ethernet/ti/cpsw_ale.h |   6 ++
 2 files changed, 123 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 977bb4251100..1d9214b0cd11 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -384,6 +384,7 @@ int cpsw_ale_del_mcast(struct cpsw_ale *ale, const u8 *addr, int port_mask,
 		       int flags, u16 vid)
 {
 	u32 ale_entry[ALE_ENTRY_WORDS] = {0, 0, 0};
+	int mcast_members;
 	int idx;
 
 	idx = cpsw_ale_match_addr(ale, addr, (flags & ALE_VLAN) ? vid : 0);
@@ -392,11 +393,15 @@ int cpsw_ale_del_mcast(struct cpsw_ale *ale, const u8 *addr, int port_mask,
 
 	cpsw_ale_read(ale, idx, ale_entry);
 
-	if (port_mask)
-		cpsw_ale_set_port_mask(ale_entry, port_mask,
+	if (port_mask) {
+		mcast_members = cpsw_ale_get_port_mask(ale_entry,
+						       ale->port_mask_bits);
+		mcast_members &= ~port_mask;
+		cpsw_ale_set_port_mask(ale_entry, mcast_members,
 				       ale->port_mask_bits);
-	else
+	} else {
 		cpsw_ale_set_entry_type(ale_entry, ALE_TYPE_FREE);
+	}
 
 	cpsw_ale_write(ale, idx, ale_entry);
 	return 0;
@@ -428,7 +433,7 @@ static void cpsw_ale_set_vlan_untag(struct cpsw_ale *ale, u32 *ale_entry,
 		bitmap_clear(ale->p0_untag_vid_mask, vid, 1);
 }
 
-int cpsw_ale_add_vlan(struct cpsw_ale *ale, u16 vid, int port, int untag,
+int cpsw_ale_add_vlan(struct cpsw_ale *ale, u16 vid, int port_mask, int untag,
 		      int reg_mcast, int unreg_mcast)
 {
 	u32 ale_entry[ALE_ENTRY_WORDS] = {0, 0, 0};
@@ -450,7 +455,8 @@ int cpsw_ale_add_vlan(struct cpsw_ale *ale, u16 vid, int port, int untag,
 	} else {
 		cpsw_ale_set_vlan_mcast(ale, ale_entry, reg_mcast, unreg_mcast);
 	}
-	cpsw_ale_set_vlan_member_list(ale_entry, port, ale->vlan_field_bits);
+	cpsw_ale_set_vlan_member_list(ale_entry, port_mask,
+				      ale->vlan_field_bits);
 
 	if (idx < 0)
 		idx = cpsw_ale_match_free(ale);
@@ -463,6 +469,41 @@ int cpsw_ale_add_vlan(struct cpsw_ale *ale, u16 vid, int port, int untag,
 	return 0;
 }
 
+static void cpsw_ale_del_vlan_modify(struct cpsw_ale *ale, u32 *ale_entry,
+				     u16 vid, int port_mask)
+{
+	int reg_mcast, unreg_mcast;
+	int members, untag;
+
+	members = cpsw_ale_get_vlan_member_list(ale_entry,
+						ale->vlan_field_bits);
+	members &= ~port_mask;
+
+	untag = cpsw_ale_get_vlan_untag_force(ale_entry,
+					      ale->vlan_field_bits);
+	reg_mcast = cpsw_ale_get_vlan_reg_mcast(ale_entry,
+						ale->vlan_field_bits);
+	unreg_mcast = cpsw_ale_get_vlan_unreg_mcast(ale_entry,
+						    ale->vlan_field_bits);
+	untag &= members;
+	reg_mcast &= members;
+	unreg_mcast &= members;
+
+	cpsw_ale_set_vlan_untag(ale, ale_entry, vid, untag);
+
+	if (!ale->params.nu_switch_ale) {
+		cpsw_ale_set_vlan_reg_mcast(ale_entry, reg_mcast,
+					    ale->vlan_field_bits);
+		cpsw_ale_set_vlan_unreg_mcast(ale_entry, unreg_mcast,
+					      ale->vlan_field_bits);
+	} else {
+		cpsw_ale_set_vlan_mcast(ale, ale_entry, reg_mcast,
+					unreg_mcast);
+	}
+	cpsw_ale_set_vlan_member_list(ale_entry, members,
+				      ale->vlan_field_bits);
+}
+
 int cpsw_ale_del_vlan(struct cpsw_ale *ale, u16 vid, int port_mask)
 {
 	u32 ale_entry[ALE_ENTRY_WORDS] = {0, 0, 0};
@@ -473,18 +514,84 @@ int cpsw_ale_del_vlan(struct cpsw_ale *ale, u16 vid, int port_mask)
 		return -ENOENT;
 
 	cpsw_ale_read(ale, idx, ale_entry);
-	cpsw_ale_set_vlan_untag(ale, ale_entry, vid, 0);
 
-	if (port_mask)
-		cpsw_ale_set_vlan_member_list(ale_entry, port_mask,
-					      ale->vlan_field_bits);
-	else
+	if (port_mask) {
+		cpsw_ale_del_vlan_modify(ale, ale_entry, vid, port_mask);
+	} else {
+		cpsw_ale_set_vlan_untag(ale, ale_entry, vid, 0);
 		cpsw_ale_set_entry_type(ale_entry, ALE_TYPE_FREE);
+	}
 
 	cpsw_ale_write(ale, idx, ale_entry);
+
 	return 0;
 }
 
+int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
+			     int untag_mask, int reg_mask, int unreg_mask)
+{
+	u32 ale_entry[ALE_ENTRY_WORDS] = {0, 0, 0};
+	int reg_mcast_members, unreg_mcast_members;
+	int vlan_members, untag_members;
+	int idx, ret = 0;
+
+	idx = cpsw_ale_match_vlan(ale, vid);
+	if (idx >= 0)
+		cpsw_ale_read(ale, idx, ale_entry);
+
+	vlan_members = cpsw_ale_get_vlan_member_list(ale_entry,
+						     ale->vlan_field_bits);
+	reg_mcast_members = cpsw_ale_get_vlan_reg_mcast(ale_entry,
+							ale->vlan_field_bits);
+	unreg_mcast_members =
+		cpsw_ale_get_vlan_unreg_mcast(ale_entry,
+					      ale->vlan_field_bits);
+	untag_members = cpsw_ale_get_vlan_untag_force(ale_entry,
+						      ale->vlan_field_bits);
+
+	vlan_members |= port_mask;
+	untag_members = (untag_members & ~port_mask) | untag_mask;
+	reg_mcast_members = (reg_mcast_members & ~port_mask) | reg_mask;
+	unreg_mcast_members = (unreg_mcast_members & ~port_mask) | unreg_mask;
+
+	ret = cpsw_ale_add_vlan(ale, vid, vlan_members, untag_members,
+				reg_mcast_members, unreg_mcast_members);
+	if (ret) {
+		dev_err(ale->params.dev, "Unable to add vlan\n");
+		return ret;
+	}
+	dev_dbg(ale->params.dev, "port mask 0x%x untag 0x%x\n", vlan_members,
+		untag_mask);
+
+	return ret;
+}
+
+void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
+			      bool add)
+{
+	u32 ale_entry[ALE_ENTRY_WORDS];
+	int unreg_members = 0;
+	int type, idx;
+
+	for (idx = 0; idx < ale->params.ale_entries; idx++) {
+		cpsw_ale_read(ale, idx, ale_entry);
+		type = cpsw_ale_get_entry_type(ale_entry);
+		if (type != ALE_TYPE_VLAN)
+			continue;
+
+		unreg_members =
+			cpsw_ale_get_vlan_unreg_mcast(ale_entry,
+						      ale->vlan_field_bits);
+		if (add)
+			unreg_members |= unreg_mcast_mask;
+		else
+			unreg_members &= ~unreg_mcast_mask;
+		cpsw_ale_set_vlan_unreg_mcast(ale_entry, unreg_members,
+					      ale->vlan_field_bits);
+		cpsw_ale_write(ale, idx, ale_entry);
+	}
+}
+
 void cpsw_ale_set_allmulti(struct cpsw_ale *ale, int allmulti, int port)
 {
 	u32 ale_entry[ALE_ENTRY_WORDS];
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 93d6d56d12f4..70d0955c2652 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -120,4 +120,10 @@ static inline int cpsw_ale_get_vlan_p0_untag(struct cpsw_ale *ale, u16 vid)
 {
 	return test_bit(vid, ale->p0_untag_vid_mask);
 }
+
+int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
+			     int untag_mask, int reg_mcast, int unreg_mcast);
+void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
+			      bool add);
+
 #endif
-- 
2.17.1

