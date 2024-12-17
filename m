Return-Path: <linux-omap+bounces-2849-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210E9F5897
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 22:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2192166563
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DBF1F9AAE;
	Tue, 17 Dec 2024 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UAdrKaHI"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131D192D69;
	Tue, 17 Dec 2024 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734470229; cv=none; b=aS66kX6F/qgax/w0ST44uzvprp0WOdtP7vBieNChRzOGiCrLYizl0tG+gxnN+h8o3ny3peGxBdNDwPzdnfFs7VHXDvJJPxaBjMIrPQDlMLs6ibaMr82ogvxEIt/Kwt3ezKhmEZze0cYM8WrdmbYbPsp4KyjL3IgUS11+4UZ+FDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734470229; c=relaxed/simple;
	bh=rRuqQWHCRh/L2HMMYesVvKdsrU626UbHdu7OsM0npT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qQCZXiRHNXhr7gMASsJJ2ofnOYom62vJYCLdj6mq6DcYM+0/ilu2BIYPO9BRPfJ45n+QijgwF9497i+O7PM8pTUxf3kUudInpn75sj76cXCFhmIXrE5nUOmcHx6oVNlJ/nZR+orevGVQencv+lZNFNwsmE719h++IAZQAoZC2XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UAdrKaHI; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHLGjoD058263
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 15:16:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734470205;
	bh=AWyN1W0khLp3wZTvJXUm8eER3uSe9m0A8SxumxnNAy4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UAdrKaHIfVGFiAAUxjV/c2RbMiQHaR6oYUdHwiwzvDuu19jV5BrfW0uSpx/DonQpn
	 9xy5UtnTGEF6xV9e/Kj9LXOWPjdfpRG+ImJW7M8ok/VxiJhD9RKHYZvqIqlmEs48VT
	 qyDbjTBXT/+hs/n8Ot1ybOoGWDuUsUzP+UWWMfsc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHLGjL5005367
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 15:16:45 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 15:16:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 15:16:44 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHLGit0127738;
	Tue, 17 Dec 2024 15:16:44 -0600
Message-ID: <2fdf8fd0-b764-4720-8f7b-71b5d63d2541@ti.com>
Date: Tue, 17 Dec 2024 15:16:44 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] regulator: tps65219: Update driver name
To: Mark Brown <broonie@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lgirdwood@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
 <20241217204526.1010989-3-s-ramamoorthy@ti.com>
 <23dd1912-31cf-4e99-8fb0-0fbd68eee8e2@sirena.org.uk>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <23dd1912-31cf-4e99-8fb0-0fbd68eee8e2@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/17/24 3:01 PM, Mark Brown wrote:
> On Tue, Dec 17, 2024 at 02:45:24PM -0600, Shree Ramamoorthy wrote:
> 
>> Follow the same naming convention in tps6594-regulator.c with
>> tpsxxx-regulator instead of tpsxxx-pmic.
> 
>>   static struct platform_driver tps65219_regulator_driver = {
>>   	.driver = {
>> -		.name = "tps65219-pmic",
>> +		.name = "tps65219-regulator",
>>   		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> 
> This isn't just a naming convention thing AFACIT, the MFD registers the
> new name so the driver wouldn't previously have loaded.  How did this
> ever work?

It matches based on the platform device .id_table[0] which does have
"tps65219-regulator" listed, the driver .name itself is only used
as a last fallback when there is no .id_table.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c#n1352

Andrew

