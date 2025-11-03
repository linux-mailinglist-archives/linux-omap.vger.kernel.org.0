Return-Path: <linux-omap+bounces-4826-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DCFC2C013
	for <lists+linux-omap@lfdr.de>; Mon, 03 Nov 2025 14:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E16644F815D
	for <lists+linux-omap@lfdr.de>; Mon,  3 Nov 2025 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400FD30BBAE;
	Mon,  3 Nov 2025 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="vpmKuysz"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.couthit.com (server.couthit.com [162.240.164.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF913019AA;
	Mon,  3 Nov 2025 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.164.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762174521; cv=none; b=BakNIwOVBROhQ9Sn+k0vqPzOHCjNS2hS4zYE9zQQ22Y6yKmx5Jkx9lnf6bP8P3K5aesPbRuByI3ywAH9MAj3H1rmiyH4I3Wu04Qg2eXm+gKYVZiDxwhlmG60Pz8vgzcSeG6FDvcmk8YvVjYc+/gM2/OvO5Gmg+COMYhWA1zf/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762174521; c=relaxed/simple;
	bh=yCmFucSa1G5Pp8A+zeDRmnSqkeT+4p7344eckqskHHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kU2JbHS5fHBfiHFnzEUryNCJgIR8UTPzXma40NsA83MeOj3Kt/BvLUKeg0zIilwzf92LZ8ktH3lM0pJcXZh+VLClLiq26trOVF45AKaMElRAh7vfWMxg7OFOo+CnQn4kGtcdbRO6wZ7MVEKqyhQ4VQakoH5KMD1gwfNHIRhazCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=vpmKuysz; arc=none smtp.client-ip=162.240.164.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=N3mC2IrimTjppkhXo9GUUy1X4ukV/Q/7Ytq5A8GyzSw=; b=vpmKuyszMO0JHXCxcB4jw6giy/
	RP+CNNXBYo3crdrkF0RI8Xs1z1Yfc9QpALKfLQPZoIyn5Y1CldkDLEP4CKsE10imD9ulsinGjBq3y
	k81XRKIy7KbZupH324bZjB6bS9oJO5blv8i0sz7ZNyQZkz5tM76mB3AU2tbyUFEsAeQWOrdxdvOT5
	XANrGLLvvFOAJdrOT8hXJRvyfuG138RqFCKrYt2PjTShQOzmQZQuJTGzu1Bbw+SAULz78kWAQuWGt
	jvQLUVnJsA321xYrQ+N30A4nrWxb2q3VlNI/T6v45r0AxUV/f1Y/kfWhAGy4bmesxk26DbToJoAVq
	turj3K7w==;
Received: from [122.175.9.182] (port=36484 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vFu5d-00000006SKR-2YOn;
	Mon, 03 Nov 2025 07:55:18 -0500
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	danishanwar@ti.com,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com,
	Parvathi Pudi <parvathi@couthit.com>
Subject: [RESEND PATCH] ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver
Date: Mon,  3 Nov 2025 18:24:51 +0530
Message-ID: <20251103125451.1679404-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The Programmable Real-time Unit and Industrial Communication Subsystem
Megabit (ICSSM) is a microcontroller subsystem in TI SoCs such as
AM57x, AM437x, and AM335x. It provides real-time processing
capabilities for industrial communication and custom peripheral interfaces.

Currently, EVMs based on AM57x, AM437x, and AM335x use the ICSSM driver
for PRU-based Ethernet functionality.

This patch enables TI_PRUSS and TI_PRUETH as a module for TI SoCs.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 12f706e2ded5..7f1fa9dd88c9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -281,6 +281,8 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
+CONFIG_TI_PRUSS=m
+CONFIG_TI_PRUETH=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m
 CONFIG_BROADCOM_PHY=y
-- 
2.43.0


