Return-Path: <linux-omap+bounces-472-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7752B843CBB
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 11:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3E81C2A4E0
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 10:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7722F69DE7;
	Wed, 31 Jan 2024 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="UYaJh06j"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10669D14;
	Wed, 31 Jan 2024 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706697069; cv=none; b=TWwshj3tgU27fLGZ05dOewc2Hcfy5m6qjnb913bcq/xWjXKvyN2FS68osRbOz43DzpjvVVQW7BD3jYvxdbS3NqOr+VvLs+PfA5auQo1BBEXUumou7hlhio9ui6U0VkrMvd+buZ5zUipeR0k4ZwVqltjCmryl6iPVunYee12fVa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706697069; c=relaxed/simple;
	bh=OKMAsBTM/1VljsglYXR5me+Kb542IzlUxDDlvfBFuqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLhU5WYqBtJmAJQFHfT+uTkCTrS4vMe0yVRIo62TOYcSSawLxDZ1sMJH3ormo0Z6r5Szzmf2rJOJneLk/N7vxCwzLj7Qb9XIOhTHWgn24LfsClQwZuRjY4CFK2a0kgOuHoYz4ckMYFha83iFXIity5u1nTTgz0HaYxY0REU+iZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=UYaJh06j; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id D1A4360873;
	Wed, 31 Jan 2024 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1706697065;
	bh=OKMAsBTM/1VljsglYXR5me+Kb542IzlUxDDlvfBFuqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYaJh06j9b5yTkeLiouHRXBFVkQlt3rAVJ7rbG2SJ69v0lpWEMeUr78jdCZHKUjwx
	 BVHyWJ50PQAUK9q3eBpk8YjtIzxX6RcfTvcTzdrYRqv0VLUY+eg1Gz2m0QSEyo187o
	 6aJ8rrnI3A7l9lQAeSqNaMX+xVg5z0+oecvhFL9dPOQtfEFpCU41PPDiUeS11KP6Bb
	 ZLXsUFuBCwqbXhVBFF0W/KyiZZ6IAxdEXpcT3Jc6JBjsCU5lbvR3FPe0b/qY0HFuoS
	 RXfY+AiLz1LsQVENbfUO4z8cBJIA6GjcM8agXbnRjD8x7HFDMLyGcXnWXN4/zjiM95
	 ZfUSuwaDFhJIQ==
Date: Wed, 31 Jan 2024 12:30:50 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240131103050.GZ5185@atomide.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>

Hi,

Adding the linux-mmc folks to Cc too.

* Romain Naour <romain.naour@smile.fr> [240130 11:20]:
> Le 29/01/2024 à 18:42, Romain Naour a écrit :
> > Le 29/01/2024 à 12:17, Tony Lindgren a écrit :
> >> So I'm still guessing your issue is with emmc not getting reinitialized
> >> properly as there's no mmc-pwrseq-emmc configured. Can you give it a
> >> try? See am5729-beagleboneai.dts for an example.
> 
> I can't add such mmc-pwrseq-emmc on the custom board, there is no gpio available
> to reset the emmc device.
> 
> To resume:
> - the emmc doesn't work with mmc-hs200-1_8v mode with PM runtime enabled
> - the emmc works with mmc-hs200-1_8v mode without PM runtime (patch series reverted)
> - the emmc works with mmc-ddr-1_8v mode with PM runtime enabled
> 
> AFAIU the hs200 mode requires some pin iodelay tuning (SDHCI_OMAP_REQUIRE_IODELAY)
> is sdhci_omap_runtime_{suspend,resume} needs to take care of that?
> 
> The mmc2 clock seems idle when mmc-hs200-1_8v and PM runtime are used.
> 
> omapconf dump prcm l3init
> 
> (mmc2 clock idle)
> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01070000 |
> 
> (mmc2 clock running)
> | CM_L3INIT_MMC2_CLKCTRL           | 0x4A009330   | 0x01040002 |
> 
> Thoughts?

OK so if the emmc reset gpio is not available, seems we should do something
like the following patch to not set MMC_CAP_POWER_OFF_CARD unless the
cap-power-off-card devicetree property is set.

Care to give it a try and see if it helps?

Regards,

Tony

8< ----------------
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1339,8 +1339,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	/* R1B responses is required to properly manage HW busy detection. */
 	mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-	/* Allow card power off and runtime PM for eMMC/SD card devices */
-	mmc->caps |= MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_PM;
+	/*
+	 * Allow runtime PM for eMMC/SD card devices. Note that to power off
+	 * the card, the devicetree property cap-power-off-card must be set.
+	 */
+	mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
 
 	ret = sdhci_setup_host(host);
 	if (ret)
-- 
2.43.0

