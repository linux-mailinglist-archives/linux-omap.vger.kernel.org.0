Return-Path: <linux-omap+bounces-3614-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA373A9DA14
	for <lists+linux-omap@lfdr.de>; Sat, 26 Apr 2025 12:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8F4D7AF371
	for <lists+linux-omap@lfdr.de>; Sat, 26 Apr 2025 10:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C522A251783;
	Sat, 26 Apr 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1pEJTd38"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63A251780;
	Sat, 26 Apr 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662795; cv=none; b=tTtwmK9t8vOk88TPNm6zyYwAc/l821eoZE4YM24PD1WWz4MBvOmvWc5bjpkD8IH2UCNYFpZrB9kTjv2SG8/n9asB1sMHOmBrSboXHMcH4TeKNRMijJ0nNgnOFcV04xuyhAD3A3c4igVf7KgGFoSIrwca6bBopSaFvxJrSEmv+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662795; c=relaxed/simple;
	bh=Gi4j3/CStBhVaColCj9R9LbTwPaj/OLr7aMH5pr1hDI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOpOR/LneKLJuERs9I39YjpMgCFdQFmO2kWuIkXdq1EmzlikxjPusIUbJemVhPWH9lO/Clak+ThUTYxvD2FbGDrPi20LaQy812tExgIFe3nR3FZ0WHDzQ8TDSkNWgu2ZJT/PTfOTclfMMQBSYXKv95OEE+XpNUj7Wjq2WuH41ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1pEJTd38; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vUfBLhny/0NLdb0Q3q96q+rAFFUP94yvmCb4kfOb41o=; b=1pEJTd38fUuMwt9fBRDqdD6DAB
	vMcI6iM52egg2hGUOUJfAoTdol0Bjyf8adf1LnKmx0159/xAy1HGTCFJ9yjRW99rWfdJM3crXL3hK
	DoxjvUN/3HEJusEs4UcPkKgIzKV6Mi9zKx3lZiTZxQXB8dOVGB62wVgo7ETAz7y2S6CFRBQxtPzEX
	H86ggO93qASnN7/iyW0Xw8uABpr4TS4Eh14syuPS5987La2V2/qYqAdWMvvJK5SiGv8RK0/PvXI/b
	V/fVSm5yjqgUvAbbdzd2K3aRE183gorJ+VpKW5R2GtHJZnHYpZz6hBUe2TxgIFWqIppuuFhqKRE3x
	2YzdlIZA==;
Date: Sat, 26 Apr 2025 11:54:24 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 nm@ti.com, pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com,
 danishanwar@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com, afd@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com,
 basharath@couthit.com
Subject: Re: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
Message-ID: <20250426115424.518cfe88@akair>
In-Reply-To: <20250407072134.1044797-2-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
	<20250407072134.1044797-2-parvathi@couthit.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon,  7 Apr 2025 12:51:34 +0530
schrieb Parvathi Pudi <parvathi@couthit.com>:

> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
> 
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
> the OCP master ports during resume sequence and disables the OCP master
> ports during suspend sequence (applicable only on SoCs using OCP
> interconnect like the OMAP family).
> 
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>

mirrors what is done on module disable, so it looks sane.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

