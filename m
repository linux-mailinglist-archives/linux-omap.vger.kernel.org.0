Return-Path: <linux-omap+bounces-4408-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A3FB3BD67
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 16:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1431AA260D1
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 14:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DD131E103;
	Fri, 29 Aug 2025 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rmmBG933"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0330CDAD;
	Fri, 29 Aug 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756477344; cv=none; b=GQOGq3DgFbzN4+iu9PW0FZYwOHDJFjR1TZZ3HPK30CdprxjPKMLRvbZjfikoF1RJIuACW8Wc35snyHl7Wtje2rE43esjgzRd2eWlLULiS/cul/MRqd7h+DQmFZgPN8tpcEAdyujBRfTHqExBIW1qDLBEEU/zKQMwmJsK5Uh79FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756477344; c=relaxed/simple;
	bh=EX+RLzqUWzx8KTJDgIN1X0xa1vIKyjds0wvW7uxsgD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FtEVAa9gWErRWtVijGj+h6zrTqVQVWgi/AxG+TsZxK0RdKO1YNb6L5Xy0HH8ClAjEXAoGDa8YV+qI3Dxxqs3Fz+KQ/7bgEtmoJp7k3shvLpAjCSqwXr0S2Ux677VbK/dPaz/T3DM8EoXUn/IqHnOiT/6Lgcutf7RrwjFUqTxgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rmmBG933; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57TEM7Xx1769146;
	Fri, 29 Aug 2025 09:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756477327;
	bh=iHVvtoDZ3ivvpr0Hfy2a/LGMHCA+J9l4iivxra5wOZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rmmBG933C7Qjtn6mEkcYzHGUfLNwo+xlBdy1UM8v1HDNjusm77sV2dcM5oWjzJvpz
	 7onyjsOqnDdX0T6s5sFm7l+zy20WbJrdTjDrbQcUzb4Im6CJAwNVnWbVy9BKNzQtQr
	 ++VoSlWlsaPYs/ToybgMap1Lpd83YsACj8K6ICMU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57TEM7br078287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 09:22:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 09:22:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 09:22:06 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57TEM3qe2191185;
	Fri, 29 Aug 2025 09:22:04 -0500
Message-ID: <8259de18-2b5d-4b54-a8ab-f4c3e956b577@ti.com>
Date: Fri, 29 Aug 2025 19:52:02 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bus: ti-sysc: Add DRA7 SoC matching
To: Anurag Dutta <a-dutta@ti.com>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
References: <20250829092947.855974-1-a-dutta@ti.com>
 <20250829092947.855974-2-a-dutta@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250829092947.855974-2-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 8/29/2025 2:59 PM, Anurag Dutta wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> Kernel Commit 25de4ce5ed02 ("clocksource/drivers/timer-ti-dm: Handle
> dra7 timer wrap errata i940") states that "There is a timer wrap issue
> on dra7 and as a work around, we need to use timer-ti-dm percpu timers
> instead. So, configure dmtimer3 and 4 as percpu timers by default." In
> this commit, the author has used ti,no-reset-on-init and ti,no-idle quirks.
>
> The sysc_check_active_timer() checks for these quirks and accordingly,
> returns EBUSY error if the quirks match. Because of this, the timer
> modules fail to probe as can be observed during bootup :"ti-sysc
> 4882c000.target-module: probe with driver ti-sysc failed with error -16"
>
> Return 'ENXIO' instead of 'EBUSY' for DRA7 SoC, so that the error is set
> to ENXIO and the module gets probed under "certain conditions".

Please define, what are "certain conditions".

With addition of conditions in commit message, for this patch

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>   drivers/bus/ti-sysc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 5566ad11399e..90766f804706 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -3117,7 +3117,8 @@ static int sysc_check_active_timer(struct sysc *ddata)
>   	 * can be dropped if we stop supporting old beagleboard revisions
>   	 * A to B4 at some point.
>   	 */
> -	if (sysc_soc->soc == SOC_3430 || sysc_soc->soc == SOC_AM35)
> +	if (sysc_soc->soc == SOC_3430 || sysc_soc->soc == SOC_AM35 ||
> +					 sysc_soc->soc == SOC_DRA7)
>   		error = -ENXIO;
>   	else
>   		error = -EBUSY;

