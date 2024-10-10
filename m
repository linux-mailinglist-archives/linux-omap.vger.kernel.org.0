Return-Path: <linux-omap+bounces-2380-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C96679984FB
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 13:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BE34B224BF
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719E81BFDEE;
	Thu, 10 Oct 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0wM1ASZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48F183CD9;
	Thu, 10 Oct 2024 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559890; cv=none; b=Ji+wsvMX8I79Kz1BrgPXMwoeVYLoTn8yzDD5TEhJvzZGDEHjbiSRMMMPjZpoEnSSylrlj2BSDuoC0kyaFK55spfrluYFH6oLNeZrFm5XWj0Aj6Xiy8rDHJxOC/uPaQ4qzc8lyGORffl/6Uur3i6LkL+OA0JLZBwV3MqMSBQrhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559890; c=relaxed/simple;
	bh=6kZxYCKvv6k0kzD63s3zngdbwEofAsvTXacllI/8md0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzu3bstRd0uUx66Q+3L9ySi/BrdLx15rGXhJHhUj2u8qcKp4ELHga5K4IckvxJ2p9n6QjtcI+6vEoeSKqo1yK7S9M3tQ+hMWYl2nk3jEq597BgPH/xh36t7NNWU1oZxi04r7iA/pX+MEA8sDyG49hQ6kaRDSYDUxcsWeH2ivpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0wM1ASZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7045FC4CEC5;
	Thu, 10 Oct 2024 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728559889;
	bh=6kZxYCKvv6k0kzD63s3zngdbwEofAsvTXacllI/8md0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M0wM1ASZMdvxnCcoHagAoKRg05CCqBv5nVQrpEapZmr/yoSw9eZ6Yu9oqmLP30pe6
	 S0vachKk7sx+RvCnXtaYrvDM3VelhChPi8SFyHa1Bz2Faa5rDf0uCSJoeioSqD42CB
	 m9j50qT+rG41dImhwuDDJXJkJCLoVmsdwwOeuibbVwIAkx/nuwZs6TCvxKTiyfJTmV
	 a6Jj7CWl4saKrFnq9bkYFBx/PCUOBua9f6DdaQDdToTxrJSFmrsfaIYe8g0jOcWzUp
	 WLVjyn6nQKlxZqD1/guFqfacLbVARtkLaW+O5zqFu0gLmedeAKHDBNUQYqxkorgHXW
	 ucRqCpmsjV3eQ==
Message-ID: <eaf8485b-8791-4c3c-a9af-cdb7bb80804a@kernel.org>
Date: Thu, 10 Oct 2024 14:31:23 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] ARM: dts: ti: omap: fix dtbs_check warnings for
 ti,gpmc-nand and ti,gpmc-onenend
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>, Nishanth Menon <nm@ti.com>,
 srk@ti.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
 <20241010113557.1c987754@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010113557.1c987754@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 10/10/2024 12:35, Andreas Kemnade wrote:
> Am Wed, 09 Oct 2024 16:16:53 +0300
> schrieb Roger Quadros <rogerq@kernel.org>:
> 
>> This series fixes dtbs_check warnings on OMAP platforms
>> for ti,gpmc-nand and ti,gpmc-onenand.
>>
>> The following warnings are fixed
>> - "nand@0,0: Unevaluated properties are not allowed ('linux,mtd-name'
>> was unexpected)"
>> - "nand@0,0: Unevaluated properties are not allowed
>> ('gpmc,device-nand' was unexpected)"
>> - "omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not
>> allowed ('linux,mtd-name' was unexpected)"
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>> Changes in v2:
>> - Rebased on v6.12-rc1
>> - Link to v1:
>> https://lore.kernel.org/r/20240903-gpmc-dtb-v1-0-380952952e34@kernel.org
>>
> hmm, v1 seems to be applied. 
> see
> https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git/commit/?h=for-next&id=ea453dc2d4d6b7bed89386fe76916252993676ab
> Kevin seems to only have pushed the for-next branch and not the
> individual topic-6.13 branches.

Thank for pointing out.

Please ignore this and sorry for the noise.

-- 
cheers,
-roger

