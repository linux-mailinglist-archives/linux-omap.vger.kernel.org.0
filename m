Return-Path: <linux-omap+bounces-3629-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA7AA60C7
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 17:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057361BC2D5B
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 15:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABF71F4C90;
	Thu,  1 May 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="V9jgnpew"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9E18024;
	Thu,  1 May 2025 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746113561; cv=none; b=OkhlK0INeqIUZhf6Qmte0wB0HvPBR0CKLiogZLM6rFHfqEhxvQvthVM2rpg+yXxWdX3HFamrzEeLuGmk06MV+QXOgsptwul40qoRfE7VoqDuIr9bDmCG4RPei2EBZZq1SMNwQnpIjvt4zEwjPPFcrThVqHJBtL+Fzhqv1ijMTDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746113561; c=relaxed/simple;
	bh=D6pjwDkJw5GCeQlKhtOE6jupK1U+XwChcLYv6fVkUOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YV6Ne+51lyHBYY6SsLDVpDCRd7Zn0WsGxXtwvu79v0mAhXHLXPLVrn/CJxqI7iQJQixuBnufs6iOZN+fjofdFcVq2MtcQ3njuCQwll7KtT3spE9hjyJ3b/Kkivnjb7ZEefXxbt07V62w5982lozvn9NzU3EgDiuqgBvk5zBjU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=V9jgnpew; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541FWDb4030130
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 10:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746113533;
	bh=Avx9tdK85l3d/nVpozm+EccWjdAmRqwmN4UjN0biPaQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V9jgnpewHDIsQyhE5/cdnlw/0vRRYASnMCSFBjujTDZN/d3iJKByTWOnhaF+uTO9J
	 9KVDiQnd5Vo4HuqNr8uOluLPNMR1A/+jd3gw/LKhIH1ovbRmyHb9ftN+0iOVh9n3g+
	 U/kKT0xK48cjKq1yF6vHaefbpwG9gAgkmjJhYSS4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541FWDY2112900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 10:32:13 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 10:32:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 10:32:12 -0500
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541FWC3n116896;
	Thu, 1 May 2025 10:32:12 -0500
Message-ID: <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
Date: Thu, 1 May 2025 10:32:12 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tps65219/am62p kernel oops
To: Francesco Dolcini <francesco@dolcini.it>
CC: Andreas Kemnade <andreas@kemnade.info>,
        Jerome Neanne
	<jneanne@baylibre.com>, Mark Brown <broonie@kernel.org>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair> <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 4/30/25 5:21 AM, Francesco Dolcini wrote:
> On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
>> On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
>>> Am Tue, 29 Apr 2025 15:21:19 +0200
>>> schrieb Francesco Dolcini <francesco@dolcini.it>:
>>>
>>>> Hello all,
>>>> while working on adding support in mainline for a new board based on TI
>>>> AM62P SoC I noticed the following Kernel Oops.
>>>>
>>>> This oops was reproduced running current Linux
>>>> master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
>>>> to reproduce the same with 6.14.4.
>>>>
>>> [...]
>>>> [  +0.000022] Call trace:
>>>> [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
>>>> [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
>>> wild guessing: maybe because irqdata->rdev is not initalized in
>>> _probe()? At least I do not see where it would be initialized.
>> your wild guess seems correct, I'll send a proper patch with your
>> suggested-by after doing a couple of more tests, thanks.
> so, the bug is clear, however the fix is not an obvious one liner as I was
> wishing.
>
> we would need to add a link from each of the interrupts to the specific
> regulator. as of now such a connection is not existing in the code.
>
> I would not have the time to fix the code in the next few days, if someone is
> able to pick this up before, just let me know ...
>
> Francesco
>
I'll try out implementing and testing the solution, but will get to it early next week. Will email with any updates!


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


