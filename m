Return-Path: <linux-omap+bounces-213-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED382199D
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 11:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF133B212F3
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 10:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841B6DF63;
	Tue,  2 Jan 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRyNBBCu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA4DF4F;
	Tue,  2 Jan 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704190966; x=1735726966;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OBQk73341+djhon5WELMC9IP5rLjglMURaoNrqXUyYY=;
  b=TRyNBBCuNArfgyFiOfwEHkm9T4jJogyHb8Kn54j7YX4Av8U2hGGK1A7f
   O9SVV+siToqn32PonwnttWfkWYmHaLQ8tuq4VhDoScrzBXR7Es6c4eVXG
   B/y8rcGU1fMp63xe2dAaDSMKTkmKGFlCwmbhKJCZNV9TVcYEyDy1TID1b
   RKqvfKtCgaJxBhADduukyztXoDnDR6UMr4JarnlLBfVey1imYLTqELaUi
   /so7G7IJ/lD/hi1WYUTAKR6AOMzzk1kmlEIJF76HzfcKAPTYyIE5/exGr
   CCYaO0MBSLoynf88AFSCZISgO7U5UL/l0WGvpisEZwRf8nugWPTTHOXFL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3701525"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="3701525"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 02:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="783171902"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="783171902"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.51.83])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 02:22:42 -0800
Message-ID: <cb726c1c-4ce3-454e-b8cb-fd14d18b8359@intel.com>
Date: Tue, 2 Jan 2024 12:22:41 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mmc: sdhci_am654: Fix TI SoC dependencies
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Faiz Abbas <faiz_abbas@ti.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Tony Lindgren <tony@atomide.com>,
 linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231220135950.433588-1-pbrobinson@gmail.com>
 <0fe97709-6b6c-4c66-82a1-ecf58dde5b3f@intel.com>
 <CALeDE9Ndke9YTCeiJJWBtHAbrShEEr1bv67Cwu1LWJAXs6Ad2A@mail.gmail.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <CALeDE9Ndke9YTCeiJJWBtHAbrShEEr1bv67Cwu1LWJAXs6Ad2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/01/24 12:10, Peter Robinson wrote:
> On Tue, Jan 2, 2024 at 10:06 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
>>
>> On 20/12/23 15:59, Peter Robinson wrote:
>>> The sdhci_am654 is specific to recent TI SoCs, update the
>>> dependencies for those SoCs and compile testing. While we're
>>> at it update the text to reflect the wider range of
>>> supported TI SoCS the driver now supports.
>>>
>>> Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")
>>
>> Is this really a fix?  Seems like a minor improvement.
>> Same question for patch 2/2.
> 
> It is for distro kernels at least :)

Distros ship thousands of modules.  I am not sure one more or
less makes any difference?

> 
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>
>> It would be good to get an Ack from a TI person.
>> Same for patch 2/2.
>>
>>> ---
>>>  drivers/mmc/host/Kconfig | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
>>> index 58bd5fe4cd25..24ce5576b61a 100644
>>> --- a/drivers/mmc/host/Kconfig
>>> +++ b/drivers/mmc/host/Kconfig
>>> @@ -1041,14 +1041,15 @@ config MMC_SDHCI_OMAP
>>>
>>>  config MMC_SDHCI_AM654
>>>       tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
>>> +     depends on ARCH_K3 || COMPILE_TEST
>>>       depends on MMC_SDHCI_PLTFM && OF
>>>       select MMC_SDHCI_IO_ACCESSORS
>>>       select MMC_CQHCI
>>>       select REGMAP_MMIO
>>>       help
>>>         This selects the Secure Digital Host Controller Interface (SDHCI)
>>> -       support present in TI's AM654 SOCs. The controller supports
>>> -       SD/MMC/SDIO devices.
>>> +       support present in TI's AM65x/AM64x/AM62x/J721E SOCs. The controller
>>> +       supports SD/MMC/SDIO devices.
>>>
>>>         If you have a controller with this interface, say Y or M here.
>>>
>>


