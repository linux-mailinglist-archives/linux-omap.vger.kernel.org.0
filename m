Return-Path: <linux-omap+bounces-5316-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C4CF2CDA
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 10:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81964304DD9E
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 09:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374C132C326;
	Mon,  5 Jan 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="TOWfQzGK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C362D73A3;
	Mon,  5 Jan 2026 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605316; cv=none; b=H/a0X81flg0xRPQsx+EdrJVI1CnadqeS0wiJfjrKHb+fgIrVWVfT8rmTbB9JbCir0f/z4FWyakseyZl7WcQVRR38Lu3djhOyWR4BQ5C52tT22giBjiQRkFpvOvFXJcupjMTQX+Dl1bF/nguvx05JfZHdq+Wh0h1UZ+OLJgXgT8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605316; c=relaxed/simple;
	bh=Z+Mf2OJd/f8FCFLXymRmlLvwckLFVln2kGBpPKbdcYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QULf5UFa4zli0QABg42PpD5GGlk3INfyGzGoKaAucG7uWmT+qATM3UyCq7dUSVOi25eT6r/aZqf7S5erNG0AU3j240C33TCsxf+f0ZhbX7TIxAlyXw0h7sV1wiO1mwlw3/YbI8C0bjdqApjV8dJ82rSoGNEn0ZR9mPcQkpdeL88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=TOWfQzGK; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=emKIByfXGmPnCS6jAiZsoKAy6fQFYwuuRgiRa12+j8g=; b=TOWfQzGKPksIysId1zH63kpqpa
	EcO2JNyxw2G88PRxMO76uG1Vdt1iyA+QW/O23xppemvAsbhNACSL4MnpergTnAAeGFPLFfIPA4ASo
	9O0iNRTYZkHsf05jyv46P8hTk6FpF2/PORUdVI58W/2gvm8KpnQpVOYc6F9LlDjqjqXWzYZRf4Z0E
	NqPNU6XBARYNNtS2zpG1rGUwaHHNhABmw9LHjYep937mBVmVEU/ub0p3RW7TWEB95wZt8vaLmQZ/G
	mg73CcMSdh+HO2AKdIVaxjh/RWtP4Ff8IOU3VaIR7yLZkSCyMf4CM5a7S2bxvuoTDjiQ6i38gI1c+
	ogAmf1Fw==;
Date: Mon, 5 Jan 2026 10:27:04 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2: Fix reference count leaks in
 omap_control_init()
Message-ID: <20260105102704.77d4c9d1@kemnade.info>
In-Reply-To: <20251217142122.1861292-1-vulab@iscas.ac.cn>
References: <20251217142122.1861292-1-vulab@iscas.ac.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Dec 2025 14:21:22 +0000
Wentao Liang <vulab@iscas.ac.cn> wrote:

> The of_get_child_by_name() function increments the reference count
> of child nodes, causing multiple reference leaks in omap_control_init():
> 
> 1. scm_conf node never released in normal/error paths
> 2. clocks node leak when checking existence
> 3. Missing scm_conf release before np in error paths
> 
> Fix these leaks by adding proper of_node_put() calls and separate error
> handling.
> 
> Fixes: e5b635742e98 ("ARM: OMAP2+: control: add syscon support for register accesses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

