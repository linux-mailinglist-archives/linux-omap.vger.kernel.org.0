Return-Path: <linux-omap+bounces-3022-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C028A04C1A
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 23:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D34A3A2463
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 22:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6483D19EED3;
	Tue,  7 Jan 2025 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AJT/0EwA"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA27732C8E;
	Tue,  7 Jan 2025 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288165; cv=none; b=IJx+Byz78GCx6+fFHYjR7g5m+tv1MUNL5ftZ3pAW7jwWlPqTdWNq79sR5CNEjn9Y3jJ5e9TeJnYvfvyWk6kjWkKv1v4oBqLwa/tDMwSYX0aOqW/v6HcYufLLJGfDFnicABUnfi7sJ6mL14C2Zy2aIXqjND8JGzBFTf+HnRzh8Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288165; c=relaxed/simple;
	bh=kuEEjphSxErraNhn1mWari0QwOGtGfIGYC9PFyVGtPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ot4oqtK90bhyYfJKvOkxc83Xa6Lz7iPo4JxJXNrGlPR+RClzTLPBK+NRnrGVB71KPz+r8kiMTCrf7Q95h7/vTKAr0CpgWBU5RsnElx1l0XwI0goUnU093Pku4HgG0bXqNTp/drmIGmdQz0XyL+sUPiD1k6fCnjmyPYl6raRJEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AJT/0EwA; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 507MFXT9065415;
	Tue, 7 Jan 2025 16:15:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736288133;
	bh=7jXV7H+K5NqHYckCa00pL9iCLkeia5AVvR8TPe5J2t0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AJT/0EwAs0uGltOfBCL21zJLHDmxT9UQuDYvR9k7I90S8PhJwjDLUHbchsHp8ptmS
	 uQBulswFlUeScIT4M+GUCHaXSbuDtZ/bQq/4WCBGGnTkWV7y/zYcazEudA7nPBF5Rl
	 uFNF3TVN2BfLoT0xSeYJ2cJcwneUTV7iWp8jdKtg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507MFXrG093325
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jan 2025 16:15:33 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 16:15:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 16:15:32 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507MFWba079968;
	Tue, 7 Jan 2025 16:15:32 -0600
Message-ID: <46a2804b-4dd6-4ece-9cf2-b05dd47a4c19@ti.com>
Date: Tue, 7 Jan 2025 16:15:32 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] regulator: tps65215: Update platform_device_id
 table
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>,
        <christophe.jaillet@wanadoo.fr>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
 <20250103230446.197597-6-s-ramamoorthy@ti.com>
 <rnqlswgkn2gl4yprxu4h4a3fp3ajelf2ksinjjq72f73bqzxsl@icxg7v5ujzbs>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <rnqlswgkn2gl4yprxu4h4a3fp3ajelf2ksinjjq72f73bqzxsl@icxg7v5ujzbs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,


On 1/4/25 4:14 AM, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 05:04:44PM -0600, Shree Ramamoorthy wrote:
>> Add TI TPS65215 PMIC to the existing platform_device_id struct, so the
>> regulator probe() can match which PMIC chip_data information.
> Why is this a separate commit? Adding new device support is one commit -
> so the tables, regulator definition and the quirks/ID table.
>
> The next commit will be adding new entry to of_device_id?
>
> Best regards,
> Krzysztof

I'll reorganize the commits to define and use the new resources &
functions within the same patch.


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


