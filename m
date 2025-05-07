Return-Path: <linux-omap+bounces-3673-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B8AAE1AB
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 15:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A394522DBB
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 13:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C11128B40A;
	Wed,  7 May 2025 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aLlV+rCS"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0CF28A1E4;
	Wed,  7 May 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625960; cv=none; b=mEpkIbkwR5AYaZgRbdmMLA9MoReQW50exCC07NNytZZySoWeSSsoYpF/9yXCGSEOr/xcJwGa79wDLEwEll7bOjmzCYMFMmc+4eJfi1OeO219YeTh5/mGogHwfr48vLojHP/k33mGJySuOLMPYl0LU29QN8o0lWsd1tNCEYx9BoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625960; c=relaxed/simple;
	bh=FFX+dl/GhsusXaQJ5VK1uk9708RlbzuTFb6DU2mI0N4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRwa78BrLzccqfBbLHrvbMuk4svBWZJeO//p2TSpVJY5WTtXPIO4/qRq3KNHZwh9iTnLhS7rgHCak8nypsYP3Fywjin9vO5Gbv3qlm2ttEGc/SuGT5YIvAJIt1o8qOURwdzBN92NPwjaVNKYj+IoDr+cFNhRtbBTgwWXYd5seYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aLlV+rCS; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547DqEwB828907
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 08:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746625934;
	bh=qjPNmdnxXBiIPY12FlXpuGsba5Ly/JzhgqEh19IK/qs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aLlV+rCS4UXbBRkkQGHsgQTtC8TBe08x9WPBgrBV7dGGYurJQ79bZtmlgY4nZDPn5
	 rQyhSYA5xFwtBFO+XheQdWIysa51siZ0+ItsG1uwoUtyNB5Fk8UHDZUXH8k/sQv192
	 AOmfc8HVi50LfduXmpxtKNcHQoeXVhUiI/pzg/xA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547DqEno009511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 08:52:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 08:52:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 08:52:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547DqDpr032312;
	Wed, 7 May 2025 08:52:13 -0500
Date: Wed, 7 May 2025 08:52:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Davis <afd@ti.com>, <vishalm@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Message-ID: <20250507135213.g6li6ufp3cosxoys@stinging>
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
 <20250505123615.yqzdv7dlel7kyojf@degrease>
 <fa33b7d6-8e28-40bc-9219-41dab643e88f@baylibre.com>
 <b1949ec7-a0b3-4c4c-a439-93afced7bb0c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1949ec7-a0b3-4c4c-a439-93afced7bb0c@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:28-20250507, Guillaume La Roque wrote:
> Hi Nishanth,
> 
> if i remove MAILBOX it's  enabled by some  non TI drivers and/or ARCH_XXX
> which have it in deps so all TI drivers are still enabled properly but not
> sure it's safe.
> and PM_GENERIC_DOMAINS look OK to remove it.
> 
> if i try a defconfig based on android defconfig (more simple than default
> defconfig) with only ARCH_K3 enabled i need to set CONFIG_MAILBOX flag to
> still have same TI drivers enabled.
> let me know what you want to do.


Let us drop both from the select statement - from our K3 perspective
there is no longer a need for them to be built-in. Thank you for working
through this.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

