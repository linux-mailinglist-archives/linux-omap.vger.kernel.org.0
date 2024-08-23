Return-Path: <linux-omap+bounces-1990-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB395CC45
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 14:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 902891C2148B
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BC2185923;
	Fri, 23 Aug 2024 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="ZnApYPWG";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="ZnApYPWG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617AB1514CE;
	Fri, 23 Aug 2024 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724415739; cv=none; b=mpvT+tktSrRr3EEpu6NYAmvD+/BSvkAef0AM6ImxMicJ4OBD5k1k7kt29Wa/bu44CP3AcC0JiIU1P/exN+MqIBLm3Z9y5/LZNBDrxlLCdqSmAEPgQfsUD8xaFKOhPpS65/psQ2+GzvFfwGffRMM3YgMsSO8r2vaM5UXgvqDuYaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724415739; c=relaxed/simple;
	bh=f+NuqhZjRHZbBqrs9y2qAX9r8GwPk4kk8ED8bPJBYh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsjVgY69NWI1ROrspsP1lMXeKNWfgyCbZ6FyNscvT0FNpm35RGdFaszDmWpNBVu6GxllTrqt5zSuP5wOf9ImkW0Bex7bwYAegAOqf6E5+IDPN+zSZG0fFgFrquwk7olTOnlh1ncWlFWnqRSWiyFjKgDkHEUBGYzrlsBydTwrQeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=ZnApYPWG; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=ZnApYPWG; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724415729; bh=f+NuqhZjRHZbBqrs9y2qAX9r8GwPk4kk8ED8bPJBYh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnApYPWGP9egeOLlu+AoszVlc9S4YgwRj4tvdyNcO7rxUY2xgXCpCfv8Vk+FBs1g7
	 bpO9g2w93z2F7PoMzMvEGWOQV9je0MzP68K24QnHSL0T+ls1NKDr+AZQzB9794GOJP
	 yPbeJIFZUA24vmGpOjS9GejNYoCIbGf+VmwwP+CFUerDk995IbDkHqiucUwLgF9hnG
	 WOh33McEY0TzdRPgmfW5yu1ovhCxHgdSzesJYk28nyT3jfB75NWrWbolDAQ1E8Buvs
	 s79+mtPyCoPMV5LPFLqFUwUCtjCkH0bh3HNSa7YKKAln/clekW89danJB62Zc0B9AQ
	 2TDHayoNITkbA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id A97FD133C;
	Fri, 23 Aug 2024 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724415729; bh=f+NuqhZjRHZbBqrs9y2qAX9r8GwPk4kk8ED8bPJBYh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnApYPWGP9egeOLlu+AoszVlc9S4YgwRj4tvdyNcO7rxUY2xgXCpCfv8Vk+FBs1g7
	 bpO9g2w93z2F7PoMzMvEGWOQV9je0MzP68K24QnHSL0T+ls1NKDr+AZQzB9794GOJP
	 yPbeJIFZUA24vmGpOjS9GejNYoCIbGf+VmwwP+CFUerDk995IbDkHqiucUwLgF9hnG
	 WOh33McEY0TzdRPgmfW5yu1ovhCxHgdSzesJYk28nyT3jfB75NWrWbolDAQ1E8Buvs
	 s79+mtPyCoPMV5LPFLqFUwUCtjCkH0bh3HNSa7YKKAln/clekW89danJB62Zc0B9AQ
	 2TDHayoNITkbA==
Message-ID: <70ff79d1-ffed-442d-901d-c693736ec778@mleia.com>
Date: Fri, 23 Aug 2024 15:22:04 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] memory: pl172: simplify with dev_err_probe()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
 <20240823-b4-cleanup-h-guard-v1-4-01668915bd55@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-4-01668915bd55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20240823_122209_730872_534329F8 
X-CRM114-Status: UNSURE (   4.50  )
X-CRM114-Notice: Please train this message. 

On 8/23/24 13:15, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
> the code also simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

