Return-Path: <linux-omap+bounces-2165-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD021972A77
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 09:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40AFD2864D7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 07:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF9117E009;
	Tue, 10 Sep 2024 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIIt7Okv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2717C220;
	Tue, 10 Sep 2024 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725952696; cv=none; b=G6t2UArudFIMQZK56W3ca3LUcU2B3sd6lh8yLUXOD7kFfJLpn6wN1c0pXX7seXHTO4uLCmPhadsURP+K2/qhC0G013I+swhThh1PrHb95FxpLDaIHROgvYh2o5Af0FRRXuluPevw/6emzs+gZoANV3i2umSzEUiZvltfib+Gvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725952696; c=relaxed/simple;
	bh=NOxllPH2PP4WOuk3fpLA0dWR+hDfbMp6Vr45BvUQFYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uThjerVETpCj5PEo25sGraRWQoAplaQS6ODNz2w8KfRparh2zbBOlI0GidVh6hEv7AfkkWZ83FrkMlup2oXQ/+GzZAu4NuYH5DVB/MPjxASKayVJpzsS2bhQD2e7YJAgbBU+CqcTCvSjFrO1ifdq3ci5ylQANmpOMLMBVpJtUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIIt7Okv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF805C4CECB;
	Tue, 10 Sep 2024 07:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725952696;
	bh=NOxllPH2PP4WOuk3fpLA0dWR+hDfbMp6Vr45BvUQFYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vIIt7Okv9nLoiFTdgUQvkQHBhWks5ULy1gVJPQ2nDE8HCftGYXTI8PgPDHWC7jdmv
	 mOqvW5DnhpALQWd0BqRhzTrDzsWWXTEn6WVOZsnHdZT7i3ugngkiEUslxmBklfHj2M
	 2ONyyMzFIrJoFdvPGoc/H4Tl/PtrIufK8UfBMIrAzy+gQ7TcvQHlqg2CN46VnYnyJW
	 iowz72M6bDLUtKl5gpgFQAUK7PibMQDLW4umbmak2KT2jIMidlCx5c8oUHwa+qrQp0
	 XootMVpXO2rzl/COOkpWiDzeMxDfXWp7IDVsbyJS1j3wsIvgKCScdRQYn/JK2EudYe
	 LdXYhk+qn9Wqw==
From: Simon Horman <horms@kernel.org>
Date: Tue, 10 Sep 2024 08:17:58 +0100
Subject: [PATCH net-next 3/3] net: ethernet: ti: cpsw_ale: Remove unused
 accessor functions
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-ti-warn-v1-3-afd1e404abbe@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-omap@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.14.0

W=1 builds flag that some accessor functions for ALE fields are unused.

Address this by splitting up the macros used to define these
accessors to allow only those that are used to be declared.

The warnings are verbose, but for example, the mcast_state case is
flagged by clang-18 as:

.../cpsw_ale.c:220:1: warning: unused function 'cpsw_ale_get_mcast_state' [-Wunused-function]
  220 | DEFINE_ALE_FIELD(mcast_state,           62,     2)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.../cpsw_ale.c:145:19: note: expanded from macro 'DEFINE_ALE_FIELD'
  145 | static inline int cpsw_ale_get_##name(u32 *ale_entry)                   \
      |                   ^~~~~~~~~~~~~~~~~~~
<scratch space>:196:1: note: expanded from here
  196 | cpsw_ale_get_mcast_state
      | ^~~~~~~~~~~~~~~~~~~~~~~~

Compile tested only.
No functional change intended.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 64bf22cd860c..d37b4ddd6787 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -141,27 +141,39 @@ static inline void cpsw_ale_set_field(u32 *ale_entry, u32 start, u32 bits,
 	ale_entry[idx] |=  (value << start);
 }
 
-#define DEFINE_ALE_FIELD(name, start, bits)				\
+#define DEFINE_ALE_FIELD_GET(name, start, bits)				\
 static inline int cpsw_ale_get_##name(u32 *ale_entry)			\
 {									\
 	return cpsw_ale_get_field(ale_entry, start, bits);		\
-}									\
+}
+
+#define DEFINE_ALE_FIELD_SET(name, start, bits)				\
 static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value)	\
 {									\
 	cpsw_ale_set_field(ale_entry, start, bits, value);		\
 }
 
-#define DEFINE_ALE_FIELD1(name, start)					\
+#define DEFINE_ALE_FIELD(name, start, bits)				\
+DEFINE_ALE_FIELD_GET(name, start, bits)					\
+DEFINE_ALE_FIELD_SET(name, start, bits)
+
+#define DEFINE_ALE_FIELD1_GET(name, start)				\
 static inline int cpsw_ale_get_##name(u32 *ale_entry, u32 bits)		\
 {									\
 	return cpsw_ale_get_field(ale_entry, start, bits);		\
-}									\
+}
+
+#define DEFINE_ALE_FIELD1_SET(name, start)				\
 static inline void cpsw_ale_set_##name(u32 *ale_entry, u32 value,	\
 		u32 bits)						\
 {									\
 	cpsw_ale_set_field(ale_entry, start, bits, value);		\
 }
 
+#define DEFINE_ALE_FIELD1(name, start)					\
+DEFINE_ALE_FIELD1_GET(name, start)					\
+DEFINE_ALE_FIELD1_SET(name, start)
+
 enum {
 	ALE_ENT_VID_MEMBER_LIST = 0,
 	ALE_ENT_VID_UNREG_MCAST_MSK,
@@ -217,14 +229,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
 
 DEFINE_ALE_FIELD(entry_type,		60,	2)
 DEFINE_ALE_FIELD(vlan_id,		48,	12)
-DEFINE_ALE_FIELD(mcast_state,		62,	2)
+DEFINE_ALE_FIELD_SET(mcast_state,	62,	2)
 DEFINE_ALE_FIELD1(port_mask,		66)
 DEFINE_ALE_FIELD(super,			65,	1)
 DEFINE_ALE_FIELD(ucast_type,		62,     2)
-DEFINE_ALE_FIELD1(port_num,		66)
-DEFINE_ALE_FIELD(blocked,		65,     1)
-DEFINE_ALE_FIELD(secure,		64,     1)
-DEFINE_ALE_FIELD(mcast,			40,	1)
+DEFINE_ALE_FIELD1_SET(port_num,		66)
+DEFINE_ALE_FIELD_SET(blocked,		65,     1)
+DEFINE_ALE_FIELD_SET(secure,		64,     1)
+DEFINE_ALE_FIELD_GET(mcast,		40,	1)
 
 #define NU_VLAN_UNREG_MCAST_IDX	1
 

-- 
2.45.2


