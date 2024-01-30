Return-Path: <linux-omap+bounces-438-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9498422C4
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jan 2024 12:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 007381F227C1
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jan 2024 11:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F231067E62;
	Tue, 30 Jan 2024 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="PtClXVh+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA26772E
	for <linux-omap@vger.kernel.org>; Tue, 30 Jan 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706613323; cv=none; b=OYJ9+LW79hJ4UmcAJUNHwZ1//wsZHG8DKZO6laQpnSqiMn0tDzhqoeFHS4CC3lL20nC4VC5SKIokmeQw9OK9qrl0Km8115pUhiH848hkGbAHcLeHoQcZU319DZjS7JiVO+jPJM776hNIGLP4xkFqZKfnBYUjNYtCizbA9nnLYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706613323; c=relaxed/simple;
	bh=vzupzw0UdjiTEZ+tLpF2I4yxpnLTi9RGWttTiICNBhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0tRVePDUEo+KYWeUevYQtaV+CISkEYVSKbiRh6p6F8JxGeTV3PYmXJXH/xzMwsQNn7UTAnta/4bkCOXdZkBbLx437A7diuruFJVw6hw5li9dHZoJ6JTP08vPmCXXOyqG3LjzP57QKKZ09ceeMyRroS0m5RrEciALwJ6fQ0BSQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=PtClXVh+; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E9DE660365;
	Tue, 30 Jan 2024 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1706613320;
	bh=vzupzw0UdjiTEZ+tLpF2I4yxpnLTi9RGWttTiICNBhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtClXVh+xld8EEJ4jDNxa7rICNg+bvCxZipcJ9UYYgC1R/a/T1ZI7D/jslFB3uCP4
	 YCicghttA7FyGfwNdiqVHxb5i2UPp76onQNN0tNLPYhYa08asE3lB1VVk82Q9EVgcQ
	 6r4MYE+hZ21zE1fY4LF6KEvCpAVK2AF5jPmvlsj1G2/BJhEDoLa7e3xvtw8TJfZdMH
	 rdte4+6r8iiamFG44jha3oTmbNXq3zk52MotZiO2dhdOww7XfIx/CYi7/mD34DCy8i
	 dDEOZRWe9kkUaqbiS+9nsfOqmYyAAZBG2xmwxqxfEqoDEnIppHSxF8X2s0f/ioVLGJ
	 Qmr9V+NBlX0mw==
Date: Tue, 30 Jan 2024 13:15:11 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240130111511.GY5185@atomide.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>

* Romain Naour <romain.naour@smile.fr> [240129 17:42]:
> OK, I reproduced the same behavior on the AM574x evaluation board. I didn't know
> that ios can report clock 0 Hz and vdd invalid when the device is idle. I
> thought that was a symptom of my initial issue "mmc1: cache flush error -110".
> 
> So, there is no issue on AM574x evaluation board.

OK

> I don't understand how the emmc_pwrseq node can work on am5729-beagleboneai
> using gpio5_7 as reset-gpio since this pin it's not connected (F13 ball)
> 
> 	emmc_pwrseq: emmc_pwrseq {
> 		compatible = "mmc-pwrseq-emmc";
> 		reset-gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
> 	};
> 
> https://openbeagle.org/beagleboard/beaglebone-ai/-/blob/master/BeagleBone-AI_RevA2_sch.pdf

Sounds like that's only wired for some different revisions then?

> Note that mmc2 node is using ti,needs-special-reset property that is not used in
> shdci-omap driver but only in omap_hsmmc.

OK I think that's leftover from the earier use of omap_hsmmc.

Can you check that you have the dts property non-removable set for the emmc?

Regards,

Tony

