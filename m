Return-Path: <linux-omap+bounces-1348-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D838BD789
	for <lists+linux-omap@lfdr.de>; Tue,  7 May 2024 00:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7861F24B68
	for <lists+linux-omap@lfdr.de>; Mon,  6 May 2024 22:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A78315CD58;
	Mon,  6 May 2024 22:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UujdRw8N"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D413D2BC;
	Mon,  6 May 2024 22:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715033383; cv=none; b=DIstzl2o84hBH9u/PZVhsQyhdXGBTdkoAbhWfRuGkKL83ItJO6LsSpbUPu1men4iun//Yy0DqeoKNfaiWwkKhe0l0Jj0/21zKa87/KQtOljo9Wp9Hd2127zM3uHxYd4V5qVknvTE9GNVoY5RhBRE1gLVA4ptVTR/s+Tp7sk5bXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715033383; c=relaxed/simple;
	bh=r9BFmWG8V1HVuQ4IJR5EcoibqvPzjOfGBGYBkHWhi+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=BgJAsLCuwC1cbUgQjEbnxXjkRhITexVZ+pJ+kPoFALQgdfkYf8NG3wRC/lT/+Kxc8sHY8IYvAByIZDJoqwmLqm9dZB3QixRloXP0kaTA8yeQc0pFIlpZpFFfBAbKdFc8TQ5ApLm3EXAnnW0SRlDA/iCotJj8ZCPEPcIceLhtOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UujdRw8N; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446M9XNn076862;
	Mon, 6 May 2024 17:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715033374;
	bh=10wWVMhpZZp5B3uqn2MuHEK3VuAoIokX6nqD6qsNfl8=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=UujdRw8NAd23gEHguZJfZrn540v/EhRp9VbQfMYSm2RQUXz3iMZj6RR7Va9SRklgq
	 ESQ+7QtGfQLtPx8ICwP3mAqz+QdfEkDDWW8BK7urQnQdXOK6BIEym/5oX2Vhds5pJ2
	 IblpC0RdGQu8ZTXIhpaZayo7m+Z9yHEJmSPgBy9Q=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446M9Xch021857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 17:09:33 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 17:09:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 17:09:33 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446M9XUX120857;
	Mon, 6 May 2024 17:09:33 -0500
Message-ID: <8651bce3-d097-465d-b8a7-c12e9d8a77b1@ti.com>
Date: Mon, 6 May 2024 17:09:33 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: am335x: Add PRU system events for virtio
From: Judith Mendez <jm@ti.com>
To: <linux-omap@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Rob Herring
	<robh@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>
References: <20240501194157.2727136-1-jm@ti.com>
Content-Language: en-US
In-Reply-To: <20240501194157.2727136-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi all,

On 5/1/24 2:41 PM, Judith Mendez wrote:
> From: Nick Saulnier <nsaulnier@ti.com>
> 
> A PRU system event "vring" has been added to each of the PRU nodes in
> the PRU-ICSS remote processor subsystem to enable the virtio/rpmsg
> communication between MPU and that PRU core. The additions are done
> in the base am33xx-l4.dtsi, and so are inherited by all the AM335x
> boards. Do note that PRUSS is available only on all AM3356+ SoCs.
> 
> The PRU system events is the preferred approach over using OMAP
> mailboxes, as it eliminates an external peripheral access from
> the PRU-side, and keeps the interrupt generation internal to the
> PRUSS. The difference from MPU would be minimal in using one
> versus the other.
> 
> Mailboxes can still be used if desired, but currently there is no
> support on firmware-side for the SoC to use mailboxes. Either approach
> would require that an appropriate firmware image is loaded/booted on
> the PRU.

Please ignore this patch,

Thanks,
Judith


