Return-Path: <linux-omap+bounces-4041-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D31AF7411
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jul 2025 14:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83BF5188DD45
	for <lists+linux-omap@lfdr.de>; Thu,  3 Jul 2025 12:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA791E1308;
	Thu,  3 Jul 2025 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xSESKE3N"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC52E0400;
	Thu,  3 Jul 2025 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545709; cv=none; b=OWLcTG3TepINJJBpCVzjX1ZD1tO90d5CplrMToNp1yLUNosxnLAZRveIWzASIix2YOSc6v2rALlrONxH3rWI1hSSps+I8pLL7FRVxqQq/v5LnQ9x10TZmDcxOIkT907buGY1jNnU4zk1fIRipvUd5ejkrObJymRsIfG/scMDiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545709; c=relaxed/simple;
	bh=lYJtB3BUv3ryRW6Pav7t47SkGDd0CG+E4VY+ajNdzLY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY3vZ2TZWZuSx9uLH/3GGpNC5pwqB48WMJzmBYSrAOMAFmHU/DIQbELwo93KpXHaZ3UXsO4ybCoCiR14MJlXyH/nuWPX7q++2sd5Xw9WQ1g9Ra3RNNpKmD2uOPoy9kU2TyevmK3+g3DVS7qhW4WGx9YydfJpvDP2ECTrhFyHBhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xSESKE3N; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563CSDqS3538125;
	Thu, 3 Jul 2025 07:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751545693;
	bh=QkjKWy8yhoZ987+3foqsduRcrWwEcugIYUWq0+gy8nE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xSESKE3NFLWEFLG+QvGZeMTwqbPd/t/LVxDEh+a2/IbU0FGTHUk0YFVjJRqxXetSj
	 tIv//kknACE2fQ1ITzU7SCSypIJMIxDU9F5KFlvyTxuByPBDdp8fIVOy/Fm0Wl1KmZ
	 VOA5N9v678rCXKZngrEqBCBc6DeuKdR2dyHLRR3w=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563CSD7n725387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 07:28:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 07:28:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 07:28:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563CSDWQ1103740;
	Thu, 3 Jul 2025 07:28:13 -0500
Date: Thu, 3 Jul 2025 07:28:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Guillaume La Roque <glaroque@baylibre.com>, Andrew Davis <afd@ti.com>,
        <vishalm@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Message-ID: <20250703122813.jh2muwzwe4ok6b6d@process>
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 09:25-20250702, Matthias Schiffer wrote:
> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
> > 
> > Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
> > > On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
> > > > 
> > > > After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> > > > select on ARCH_K3 are not needed anymore.
> > > > Select MAILBOX by default is not needed anymore[3],
> > > > PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> > > 
> > > Hi,
> > 
> > Hi,
> > 
> > > 
> > > what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
> > > on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
> > > not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
> > > enabling other unneeded features to pull it in.
> > > 
> > With master branch if i apply this patch and i do make ARCH=arm64 
> > defconfig and check in .config  both TI_SCI_PM_DOMAINS and 
> > PM_GENERIC_DOMAINS are enabled.
> > with linux-next it's same. i don't really understand link with  PM part 
> > in this patch and boot issue on your SOM.
> > 
> > I probably misunderstand something.
> > 
> > 
> > what is your problem exactly ?
> > 
> > if you can share log or link to jobs
> 
> 
> Hi Guillaume,
> 
> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
> 
> We are using a smaller config specific to our K3-based SOMs however. I have
> attached a defconfig that shows the problem - if you use this as the base for
> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
> selects PM_GENERIC_DOMAINS.
> 
> So unless I'm missing some other configuration that would actually be useful on
> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
> needs to be reverted. I can send a patch to that effect later.

Is a better approach to select PM_GENERIC_DOMAINS in
drivers/pmdomain/ti/Kconfig instead of depends (similar to what
drivers/pmdomain/qcom/Kconfig or drivers/pmdomain/arm/Kconfig does since
TI_SCI_PM_DOMAINS requires PM_GENERIC_DOMAINS?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

