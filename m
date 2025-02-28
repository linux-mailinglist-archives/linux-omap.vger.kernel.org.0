Return-Path: <linux-omap+bounces-3315-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDBA4A06E
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2025 18:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFB5B189936B
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2025 17:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA7227127A;
	Fri, 28 Feb 2025 17:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TOY1b1hx"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D4B1F0998;
	Fri, 28 Feb 2025 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740763877; cv=none; b=CzJpNfgf7oCtX3eqGspGcqC3gtSdETC9MR6VpvrNJPsFaEGT6+MUkjhuUiBKjVDXDeiNqD1lGBdce8ZngL1W5lwsMoZH0gSqGtDvC4yLK7GPbTCbuNoSSLTN909FPd52txqG+5ysveCiKQc2TOUrMAvY909N6Jomryx/Z+xXiaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740763877; c=relaxed/simple;
	bh=39retTV/xxCmJWFQh/hhZZzKU1boJMrgs1KEpweaGKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rxUSR986TmE2qimKOIb+lIPDLAAxmNIubZjgilwatHrvunwaT4mG15YNUKxz4lYucHsLYh3sE/sj7ZuAqIx2ZCgNuybvFaPVNNAjhxrP4giNbPNZTsST1qyNhsDUPhQelvEbedU0COj1UcyFhHpPa8EnKYyoYjhc3HW6jOVBLBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TOY1b1hx; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SHUhl02703503
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 28 Feb 2025 11:30:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740763843;
	bh=4ujCYaCP29A07JkqiTt3zzdl3CMkn0y2Yn+laSob1ws=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TOY1b1hx6n3kx94TggMPbw6UYQmS8KywVQduy42w+9nAoNVcmtFfEf7g8GU0ljuy0
	 aLV58FoUq8Gp8p7JwOjfsNS93JU6uin8VQzP2btmQXg7VXHTOn9xQFlIo8x3JmGYOr
	 w+JKV9CJs4Gx8MZVWvJWbvjj4EjlZGwcu4SrPqvo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SHUhsO122348;
	Fri, 28 Feb 2025 11:30:43 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 11:30:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 11:30:43 -0600
Received: from [10.247.21.102] (lt5cd3040qtn.dhcp.ti.com [10.247.21.102])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SHUhm3074392;
	Fri, 28 Feb 2025 11:30:43 -0600
Message-ID: <40bd4297-ad4f-41e2-8bd3-e6c11dc40a17@ti.com>
Date: Fri, 28 Feb 2025 11:30:43 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add TI TPS65214 & TPS65215 Regulator Support
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250212191129.467728-1-s-ramamoorthy@ti.com>
 <131466cc-dc54-4251-82f7-5ec9e9c20f26@sirena.org.uk>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <131466cc-dc54-4251-82f7-5ec9e9c20f26@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Mark,

On 2/26/2025 4:40 PM, Mark Brown wrote:
> On Wed, Feb 12, 2025 at 01:11:25PM -0600, Shree Ramamoorthy wrote:
>
>> Dependencies:
>> - Patches 2 & 3 depend on https://lore.kernel.org/all/20250206173725.386720-5-s-ramamoorthy@ti.com/
>> - Patch 4 depends on https://lore.kernel.org/all/20250206173725.386720-6-s-ramamoorthy@ti.com/
> These all appear to be in the MFD tree without a tag to pull from or
> anything so I can't apply any of this stuff until after the merge
> window.  I'm not clear why they weren't sent as part of the MFD series?
> You should probably resend copying Lee.

I wasn't sure if the MFD + entire regulator patches could be sent in the same series, so this is good to know!
I will resend a v5 Regulator series with Lee cc'd asking if he can take the series if you give the patches an ACK when ready.


