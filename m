Return-Path: <linux-omap+bounces-3541-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BEBA7D5E2
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 09:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85E8162B23
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 07:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBAE22E011;
	Mon,  7 Apr 2025 07:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="xq7RKH2R"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA7227B9C;
	Mon,  7 Apr 2025 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010540; cv=none; b=aij2Sf/DnBrEqWAzMmZHe/LqWaptWRZBOFA354Bog3rT3C+sVjelZXQEwE1yMspglkJ5Ip48DOEFhNlGmEjQw2NdRQCOboEPk3q/7PNB/nfy8MYYBIEcGIef+oAeqk5pltororrtdTWLTLsnSdUy2Rm37WgFMKQc90TVuJuD46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010540; c=relaxed/simple;
	bh=yPEzC0gwQng+Oc7Szx+kcyGdLZFLkKaiQ6hrmBo9uec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GjOjxn/NX1vSdTgPIhCwyz2gloEQfx0dMvZWawDqojeQka7PGunkKMiDdeaDp8ow1HVrnkb5C+zgR/s5oVT4xiuYXf1V2Xmln3YAyGIIiO90ekoiYGq4bjBsJ7dsPuWDg4M+H43nLit6jno28p9zC9EkPHyrurKFLWCypIkvVpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=xq7RKH2R; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U2QwO5sDwv/sq+d8XmQYXvqQRIgODo8flPtBC8LyvfU=; b=xq7RKH2RYuilh0DvtQSePlW6se
	PIyWAn+2wSQcRpnvGp4BijmON7sWSkC6n7kNTctg872jmfVDpmzPZg8UTis9ORe+lzm3BCk+qQ11j
	n2R1/lG5TBLgxqa35YGN7OQoNMnlbZtQjAzduB2MVVigEmr96p8zr5aLHVusV0Dk3nJ35OgfV0kVQ
	oMSKcq+nfP4DK8oMmOXrlG3MUqbk2Psl8p8JTdIWnSMUmYsR83pgypjHVJ9dSXuPgMAH11glkltS+
	elLOWTccs8nPSMdNRmsEiS1LTZjvDvUWzB9QvLzl5t9HSDYiE+XbB4txVKkm4p2t2fdah1BmhzhWI
	wcg4+iew==;
Received: from [122.175.9.182] (port=46259 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u1go5-000000005lp-3ZEE;
	Mon, 07 Apr 2025 12:52:10 +0530
From: Parvathi Pudi <parvathi@couthit.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nm@ti.com,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	danishanwar@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	afd@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com,
	parvathi@couthit.com,
	basharath@couthit.com
Subject: [PATCH v1 0/1] Adds support for OCP master port configuration of PRU-ICSS
Date: Mon,  7 Apr 2025 12:51:33 +0530
Message-Id: <20250407072134.1044797-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

This patch updates OCP master port configuration to enable memory access
outside of the PRU-ICSS subsystem.

It configures PRUSS_SYSCFG.STANDBY_INIT bit to enable the OCP master ports
on AM335x, AM437x and AM57x devices.

Thanks and Regards,
Parvathi.

Parvathi Pudi (1):
  bus: ti-sysc: PRUSS OCP configuration

 drivers/bus/ti-sysc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

-- 
2.34.1


