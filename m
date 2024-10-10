Return-Path: <linux-omap+bounces-2379-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C857998464
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 13:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E73E2833D0
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E407A1C2DD4;
	Thu, 10 Oct 2024 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9CzpfCl"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58D29AF;
	Thu, 10 Oct 2024 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558268; cv=none; b=SXuV/q1crVPFvux9b0xp9CtdOdxSmgnpUe/pUhvWps6xiHROyD2IHjTWENki8yiJB7tEHM+LPHxeMlD+q+1L+esaNJx+PP4W9iIqPz4JP+Bf8NPWTPR1DOxoL+Vq3VBHERR3XNbFnlq4qu0f32K26ouCzijMr5n2Zh7E+5pHv5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558268; c=relaxed/simple;
	bh=6TMgSvGiDN6j/aETnpccRiSZui1zKiAqfIErIRFhoAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maOp3fmxVE+7udSH/28Yl02BXPHGNP1THVyVtFAMzojLPMcMLEwBIocISAgboTuOuKuyLjGzzOs6sufI5QrIGYNmKyl8PWrd6KxJwri1Jn5uPoNtHynwFuDHBX6X7t+u0TFKsbd//gvW3zebVSDKD0rk3TcMjy8eiy4Y/BT+ZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9CzpfCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDCEC4CEC6;
	Thu, 10 Oct 2024 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728558268;
	bh=6TMgSvGiDN6j/aETnpccRiSZui1zKiAqfIErIRFhoAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c9CzpfClOoeeZPFOvP1nVC4mppmn395JbKixYEukMIE/O/kby46lN061iY16l7VYX
	 AAqg+yB2uC4iHPcNBf6BY8MITistn8S5sNVAiWCrThBs6y+ePCDkIflKX+aVbXOum5
	 fFnlHm8Q934hdSk5aoOaGZ1hZHR2jEagWOkdBQSn7XDu6TqkhyOrCMJRzdgexxksBi
	 r/fVeCn8xXgRBYi+dp0ujvEXxMoLO6Ac5m+blEy5ZxC1QENX2X4/cljsTxuMlPymbt
	 D+txoVhtkJ0TsalFLz/01v7D1cxEpcRUYdyZsELV7Bf0yeHxuJTuDjk1H0BBOLNk6j
	 ZYrgFjNQShZHA==
From: Simon Horman <horms@kernel.org>
Date: Thu, 10 Oct 2024 12:04:12 +0100
Subject: [PATCH net-next v2 3/3] net: ethernet: ti: cpsw_ale: Remove unused
 accessor functions
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-ti-warn-v2-3-9c8304af5544@kernel.org>
References: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
In-Reply-To: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, netdev@vger.kernel.org, 
 linux-omap@vger.kernel.org, llvm@lists.linux.dev
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
index 8d02d2b21429..d361caa80d05 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -162,27 +162,39 @@ static inline void cpsw_ale_set_field(u32 *ale_entry, u32 start, u32 bits,
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
@@ -238,14 +250,14 @@ static const struct ale_entry_fld vlan_entry_k3_cpswxg[] = {
 
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


