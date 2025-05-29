Return-Path: <linux-omap+bounces-3745-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC0AC7F98
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 16:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 762B43ABA9A
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 14:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D8B1E9B2A;
	Thu, 29 May 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=ltec.ch header.i=@ltec.ch header.b="/tg5MDE3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ltec.ch header.i=@ltec.ch header.b="Z4Vam7we"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.ltec.ch (mail.ltec.ch [95.143.48.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0C1DC075;
	Thu, 29 May 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.48.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748528504; cv=none; b=l03DUdqSS8CrhRcPVdFYrqdeffELZMsJt+iF+aTLBYWzjt2GMLN/SKVhTF66Qz359GIN3Yn3S+LorN6e5fThmVe2RBoiVuqsf+Hr1xdm37B2ZSZl9d6RWGJSRwLfPv6MK6Wfyrt5edQ0CBGul2W5AqIXhMUXso8gQmljLM2UPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748528504; c=relaxed/simple;
	bh=pnOeuLVvoGhxI9QE7V69Klv9q3SpI04PooUYZCiq2UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9Qm7ADkTNB4T3U47VkcnBEUIlzXWcrztcR9EhHFWbxRAPyuPgUGlf+4dTw+hQ0EBoTMHK6zxSL2yllhtY6Q5x/rCniwUdr9FlW/s8hm76mXFboiXZCNMJ6eMSObHNJm/tpc/JXbkg0osE7802QV/G1iKlqz8vRY0mjFmJ5PtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ltec.ch; spf=pass smtp.mailfrom=ltec.ch; dkim=permerror (0-bit key) header.d=ltec.ch header.i=@ltec.ch header.b=/tg5MDE3; dkim=pass (2048-bit key) header.d=ltec.ch header.i=@ltec.ch header.b=Z4Vam7we; arc=none smtp.client-ip=95.143.48.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ltec.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltec.ch
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed; d=ltec.ch
	; s=ec-sel; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=20lWbhN2MmPbIZRs+wuEiLtogdwAF/uD3/PsgRMN/1s=; b=/tg5MDE3pEY3MSfpL3xu6MuU3d
	XFU1r8nwL3BzB2TRBTgLj26yntHPnpQKN6/TCYERatd+AExBQmG/rMdBMuDg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ltec.ch;
	s=rsa-sel; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=20lWbhN2MmPbIZRs+wuEiLtogdwAF/uD3/PsgRMN/1s=; b=Z4Vam7weU0qIZwRgq7MHz7oBz8
	RqVtemlvRIzhMaTr8nCgknEpBLKpWDGzZlIwk2zsZG0LYyha6IDeJzLbcn4ghkvmVFigj6gPCaDvV
	eyX2W02zVc5WKxgw6QUUwsCGNfR7QbC8K27vJyCiFQRQMyoaUaMPNmmxKFgzs6Mcf2IeOEiYJMfjf
	LpupnPMdZeHUS5XgbKMMfSDHrj9YNwbAI3qVWUKd9uZyhs+QNrqzMfPjLBeyaYMdi7DsshOvOu9bg
	LfZGmqBo8UMcaMUt9H26Lig/cOd5iDw0BrohhR3n+kYsVmqGPlliQSxZaSlpxWT0yZfVWwjMzy/d5
	hZ6UsojA==;
Received: from nebula.ltec ([172.27.11.2] helo=localhost.localdomain)
	by mail.ltec.ch with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <fb@ltec.ch>)
	id 1uKdhJ-006Vmc-0W;
	Thu, 29 May 2025 15:53:29 +0200
From: Felix Brack <fb@ltec.ch>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	fb@ltec.ch
Subject: [PATCH] ARM: dts: am335x-pdu001: Fix RS-485 transceiver switching
Date: Thu, 29 May 2025 15:53:24 +0200
Message-ID: <20250529135324.182868-1-fb@ltec.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wiring of the RS-485 transceiver of UART0 of the PDU-001 board
allows sending or receiving date exclusively. In other words: no
character transmitted will ever be received.
Hence the tx-filter counter in the OMAP serial driver can't work
correctly as it relies on receiving the transmitted characters.
This in turn will prevent reception of data unless we disable the
tx-filter counter.
This patch disables the tx-filter counter by enabling the DTS setting
rs485-rx-during-tx. This might sound like the opposite to be done but
it uses the enabling of rs485-rx-during-tx not for receiving the data
transmitted but for disabling the tx-fiter counter.

Tested-by: Felix Brack <fb@ltec.ch>
Signed-off-by: Felix Brack <fb@ltec.ch>
---
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index ded19e24e666..6c96840fe8be 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -258,6 +258,7 @@ &uart0 {
 
 	rts-gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 	rs485-rts-active-high;
+	rs485-rx-during-tx;
 	rs485-rts-delay = <0 0>;
 	linux,rs485-enabled-at-boot-time;
 
-- 
2.43.0


