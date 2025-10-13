Return-Path: <linux-omap+bounces-4671-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7C2BD2E96
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 14:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86B594F132C
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 12:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD35326E703;
	Mon, 13 Oct 2025 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="x8P93qoZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8774C79;
	Mon, 13 Oct 2025 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357314; cv=none; b=LN9aByzpmxt+BrVneSwdrBLLcaHqqZvqtmVVs7LKBdeBUuRD7Ze4lwYAJFQ/LO5Nb5U9zw9KSl9Zfv57b8U3/juvMYVVIuizSxJd3Vuod0unueuNRT8ODO0P+HQrgQEXfsdO6Wj25IPSVCuSeQnaLo9JJtQeM2oFq6X9utJTLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357314; c=relaxed/simple;
	bh=efSCtLh7MUTISE1ZJRcipjqOo8L4DWgK1HOI8dkCz4Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=jfplk7h6DrLW31sFuJkA68p21av5z2RnxNaySPQHRs+1Wfb/eW+3Uf4ivewddiMfqa70xnvUGOcrs8QSr36cI75N1bNPH0TFuJauP/cQiEI2yQoCyDj0z6DG3tvjLpV5f0f74XW0qZzi3A812xVGqZR9kGrGSZCoy7Mr4ygfnWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=x8P93qoZ; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=VybiMm2sR5Hp/9bOjAy99uv6Gp6PKEssL2EO94O+66I=; b=x8P93qoZt30yoY13ulxO+o8Byg
	F44gLzclJ6IM+jP2+U5GA+ahryq2WqbnzfZNgGGbBz/kgwoPelErDKRtNjiLKem8aOdmEvV0eVqe6
	13W0DPgOdx7jIfq7IfxjTRkAQ6qcPQIxs168bljMXCPcemA3pczi3/NaOa0Lf8ntrMwlWzwNVbY3u
	+h8ZXSe44UdNC/qtBhTLr8MC4FOqngH3OOV8jDa3cg3K0RNhQ9/2PeEcygza6vAOUGlcP5c1NluL9
	5+FBd5V8vTgsvYKJJjeLbcvH5JBbZJMbEZzxfM2vU5J3hxti7mxpRRV/qndy2nleRFL6If+NfFNEQ
	ahRWdIuQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	tytso@mit.edu,
	lukas.bulwahn@redhat.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: omap2plus_defconfig: enable ext4 directly
Date: Mon, 13 Oct 2025 14:07:53 +0200
Message-ID: <20251013120753.101582-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In former times, ext4 was enabled implicitely by enabling ext3 but with
the ext3 fs gone, it does not get enabled, which lets devices fail to
mount root on non-initrd based boots with an ext4 root.

Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 1d5f752417398..1499e1744dafb 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -679,7 +679,8 @@ CONFIG_TWL4030_USB=m
 CONFIG_COUNTER=m
 CONFIG_TI_EQEP=m
 CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
 CONFIG_FANOTIFY=y
 CONFIG_QUOTA=y
-- 
2.47.3


