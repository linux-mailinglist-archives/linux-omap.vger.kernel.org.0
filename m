Return-Path: <linux-omap+bounces-3600-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A4A989EB
	for <lists+linux-omap@lfdr.de>; Wed, 23 Apr 2025 14:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 005154403E0
	for <lists+linux-omap@lfdr.de>; Wed, 23 Apr 2025 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FF0266B65;
	Wed, 23 Apr 2025 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="Msb2GjoA"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942726E165;
	Wed, 23 Apr 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411990; cv=none; b=hl48F8P+LbQ2lJia7l+KSVB2+UFAbuRxuaAik9vXujZlO7Z7NVGgpu8MIH5XY9wjpxb7MHf6ekxQvzFbuuU9U5XBorgCgKIS1/P//3KUh+ygc9IFotx2JPKeSDRFnwGXaJX/4SNmNL3HxK3ia269IUkRBrBi+cqe/TdxFucGQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411990; c=relaxed/simple;
	bh=bqsE/wefBMSFpl+lZS8viS6c+r4FhfHizYbstk43JFU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RlIQkicEu9cWKfy/VNunw3OkDinXNYhkBIr0O0YbBhdpeSLvC9mAf3mdmHMFce4hF+2gcv7qIUu+bfapMQjMCora1BLYI+iTfndX/RH3UPyD2pNIUtokvp433ewXXNyLoA5W+X/qEsghjM5Pc2d+WiqDe9HeAQWx53nMHTZ2Z8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=Msb2GjoA; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+785VF6wf30WYbsN36DFocTAix1Cw2QRRtSgmA1b0mA=; b=Msb2GjoAwZAIjJl8zVc/M8FmVw
	pYxra9w5JfOBQHdCvh+gnNpkASeHxNUqeaQWQcsGtbwnAzi8dFPm5YZ3dTftgckx5kbQVhRgNq9K9
	h19oy09iu0vCYYnvDfgbKReOZ07kR02HLT2Wn67szJEvyR2ztkRAvI3XN0yIHuKr1w5Ch9pJDQPA4
	1Bx1mevYKhtn1el3BT1MXT2n/YSOLkwYIi9difoKs7V5Czgwrbwen0IqB4CYT7DPje9kjj33aiF1z
	1x0SJYvkRyA2ukHxrN64t5S49VVOEglV3+3DBNV9J9jISx2F4PPPeRQT8retbOaPd0DyHa8pj2mOd
	D/n7m6Og==;
Received: from [122.175.9.182] (port=50077 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u7ZOB-000000002Er-2d9B;
	Wed, 23 Apr 2025 18:09:43 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id B1C601781E1E;
	Wed, 23 Apr 2025 18:09:37 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 981B01781F8D;
	Wed, 23 Apr 2025 18:09:37 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SUAdxjcaZ9Di; Wed, 23 Apr 2025 18:09:37 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 4D4C51781E1E;
	Wed, 23 Apr 2025 18:09:37 +0530 (IST)
Date: Wed, 23 Apr 2025 18:09:37 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: aaro koskinen <aaro.koskinen@iki.fi>, andreas@kemnade.info, 
	Kevin Hilman <khilman@baylibre.com>, rogerq <rogerq@kernel.org>, 
	tony <tony@atomide.com>
Cc: linux-omap <linux-omap@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, nm <nm@ti.com>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	danishanwar <danishanwar@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, afd <afd@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>, basharath <basharath@couthit.com>, 
	parvathi <parvathi@couthit.com>
Message-ID: <724357882.1133776.1745411977085.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250407072134.1044797-1-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
Subject: Re: [PATCH v1 0/1] Adds support for OCP master port configuration
 of PRU-ICSS
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: Adds support for OCP master port configuration of PRU-ICSS
Thread-Index: 7g8Hzj8NpLh4XB+icw2rQ1sMuCtyyQ==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi,

> 
> This patch updates OCP master port configuration to enable memory access
> outside of the PRU-ICSS subsystem.
> 
> It configures PRUSS_SYSCFG.STANDBY_INIT bit to enable the OCP master ports
> on AM335x, AM437x and AM57x devices.
> 
> Thanks and Regards,
> Parvathi.
> 
> Parvathi Pudi (1):
>  bus: ti-sysc: PRUSS OCP configuration
> 
> drivers/bus/ti-sysc.c | 17 ++++++++++++++++-
> 1 file changed, 16 insertions(+), 1 deletion(-)
> 

This is a follow-up request for feedback in case this patch is missed, as it's
been two weeks since the patch was submitted and no feedback has been received.


Thanks and Regards,
Parvathi.

