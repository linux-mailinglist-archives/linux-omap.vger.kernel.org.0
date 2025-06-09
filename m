Return-Path: <linux-omap+bounces-3773-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEEAD1E81
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 15:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D96711886E3E
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 13:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F7D2571C2;
	Mon,  9 Jun 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0wN1IPY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB7C148
	for <linux-omap@vger.kernel.org>; Mon,  9 Jun 2025 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474596; cv=none; b=KTwJGzVEsAim7rWsCN9tk6+3lnGue4jKWcBm4RuUXIJjB0bTxvE0tYttomrAs09+gYAL7qNP2UrHFqVbl7KQ/Cb2fdcpeGzlNFCEbogZqVw5JX0qIIOKqqxQyrkjG0/BUig9gojOzxSO+iblxMApp7e+6cx5xoQKaHCBLDWQ1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474596; c=relaxed/simple;
	bh=WmbHRh0xs1vMU36jY2dvZxixhiAmfmMlA4DmT0bejCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4C+gCMI0it8tgOvkD4BCeO4Eots43GDs7WJfxvUbXNAxZanzilm4QzxO9KPiyTlJQFIJvYSxHp8Dh0IQbMlorDFB5BHXOjviLEnwhdJxR/VCnEYsVh1yPZnbPThy96JzfsP9AFL0hCaH+uIhHD9ZP+SLb+KeGX8oxCWvclLxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0wN1IPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A922C4CEEB;
	Mon,  9 Jun 2025 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749474596;
	bh=WmbHRh0xs1vMU36jY2dvZxixhiAmfmMlA4DmT0bejCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I0wN1IPYzjQmcULO/jx+YZrUrL44e2po3BfXAL6VK7vSmlM/q+KnLgtEGc9lS9uIg
	 ydAnf1d2QFZSiOm+wLuoYG0ELBKLmw/IFcgr7LDftBrxGulu/Z6wQUPFCXz66PUo5I
	 f0az6hhp03yTOQQsonovur9sPKMF1OBzggdilxPUqaVOOhb6lnAVW9wBQHCNaXHIwd
	 nthyjMpxQX+IHbqZTjxW6fZrfmEy51RLcaeAtGdXZZljkUZaFt4WdT4JNGdyOI6cC6
	 GXFhJJS9M7+L+tUuo3DxbSJBHNeWXHoES5fVP2K8yXs31UdL6g9tRXqbo+xe/SsT2v
	 InhKaKlFAzzHw==
Message-ID: <6fc05e73-1110-4316-994e-85a7d1c63d2f@kernel.org>
Date: Mon, 9 Jun 2025 08:09:51 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: Fix compilation without CONFIG_OF
To: Jiri Slaby <jirislaby@kernel.org>, mario.limonciello@amd.com,
 lee@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
 tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-omap@vger.kernel.org
References: <20250602201008.1850418-1-superm1@kernel.org>
 <9feed8e3-e831-4096-8a4a-0ceca7d18f61@kernel.org>
 <a3754c77-b85c-48f7-aacf-b50725b2dd01@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <a3754c77-b85c-48f7-aacf-b50725b2dd01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/2025 3:31 AM, Jiri Slaby wrote:
> On 09. 06. 25, 10:29, Jiri Slaby wrote:
>> On 02. 06. 25, 22:09, Mario Limonciello wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> When compiling without CONFIG_OF but with CONFIG_WERROR enabled
>>> several mfd drivers fail with -Werror=unused-variable.
>>>
>>> The assignment from these variables is only used in of_fwnode_handle()
>>> and thus they can be moved to only be used directly in the macro.
>>>
>>> Fixes: a36aa0f7226a2 ("mfd: Switch to irq_domain_create_*()")
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Arnd sent a fix for this already:
>> https://lore.kernel.org/all/20250520154106.2019525-1-arnd@kernel.org/
> 
> And actually Nathan even before:
> https://lore.kernel.org/all/20250508-mfd-fix-unused-node-variables-v1-1- 
> df84d80cca55@kernel.org/

Thanks for sharing those.

> 
>> Hopefully all the fixes can be applied now, so no more duplicated 
>> efforts. Sorry for the breakage.
>>
> 



