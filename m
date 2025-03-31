Return-Path: <linux-omap+bounces-3519-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53853A768E1
	for <lists+linux-omap@lfdr.de>; Mon, 31 Mar 2025 16:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3197A188AED2
	for <lists+linux-omap@lfdr.de>; Mon, 31 Mar 2025 14:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E1121CC64;
	Mon, 31 Mar 2025 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8FmvORjO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3E211713;
	Mon, 31 Mar 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432312; cv=none; b=BgjTJVmI0WVeS2JRdFqnllOfdx0XT4Myo5ut6UOaOJCKBaxKuwZzNxl9av3d4LUIKx8R7qVORe+VBgQBW4yBmOmM5og29t3mLwulm5XczdpitEambQVRVE5XT0CaW9OzcggussbxBlRn8iFzHVKuQtRVWk5Iy24mMnZd/QVfwTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432312; c=relaxed/simple;
	bh=YApsrKM8DyFkh+XvownztzgAayZLg8pnNtfiw6TlSIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rOlX74INrzr6Wg2TsDG7SxkoiWOa78AEO6It0DG2CDgQ1FqegMoKAqigVpseoj29vKCvZQ0XljCtAsv5ZEVjpUZfcDfcBSow7+qQlSfKyJiygOTJ7FrRUXof/N6bO/fFzukRc0t2Qy7dOkXKaxcVTdEDJI0d09jqdN/vQ95uINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8FmvORjO; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=iL+CVdfL8Afw85HRQfP4vuDu9KQwd7yFTXpR+xQAW8s=; b=8FmvORjOMjHdHCznVGwfqsi4af
	xnmXRzdYYwkyWsjiB7DUbcQLh4JprvuVtfYq/toqsNUQGYaTICQJoNnvC8+GVshryeBFFEsGsDIUy
	S0cjFktfQUnin2WswLFdVIk5019BV6bVMj4sop00x/0Mikn7kydLgeY1ljAMt1UMjVfcI7VAuVcCU
	6701R3StJdsev1ywyFhrvAcN3ITrfCBNagtm2MqJ8Cex1CjbR4wOFEuRwdm0BuIls/5ov2BkTIXJ/
	89v1UB68yrc8O5iGpUz+6rA11ALRGU5F6Iz7zrQSs3F7r1Hvw9DhMLs+v/MtniJESJ/zJNDgQr6un
	Tf91RIEw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: khilman@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sre@kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
Date: Mon, 31 Mar 2025 16:44:39 +0200
Message-Id: <20250331144439.769697-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The late init call just writes to omap4 registers as soon as
CONFIG_MFD_CPCAP is enabled without checking whether the
cpcap driver is actually there or the SoC is indeed an
OMAP4.
Rather do these things only with the right device combination.

Fixes booting the BT200 with said configuration enabled and non-factory
X-Loader and probably also some surprising behavior on other devices.

Fixes: c145649bf262 ("ARM: OMAP2+: Configure voltage controller for cpcap to low-speed")
CC: <stable@vger.kernel.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/pmic-cpcap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 4f31e61c0c90..9f9a20274db8 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -264,7 +264,11 @@ int __init omap4_cpcap_init(void)
 
 static int __init cpcap_late_init(void)
 {
-	omap4_vc_set_pmic_signaling(PWRDM_POWER_RET);
+	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+		return 0;
+
+	if (soc_is_omap443x() || soc_is_omap446x() || soc_is_omap447x())
+		omap4_vc_set_pmic_signaling(PWRDM_POWER_RET);
 
 	return 0;
 }
-- 
2.39.5


