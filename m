Return-Path: <linux-omap+bounces-3826-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BDAD5203
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 12:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975BD1BC4469
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 10:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B533275861;
	Wed, 11 Jun 2025 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJP8xgu2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2762741C6
	for <linux-omap@vger.kernel.org>; Wed, 11 Jun 2025 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637940; cv=none; b=c1aaWX1oz/Fu6Yz8b6kIgudSAtjuR+appkvKqefK52M+NLKJh6GBZ66gSNSQ/SDcLtNBsDHhZg17sN3pesevV6gSiOGN9NluNcUUmbBTFpQ0gSjzNWcdFziCNiUIG1Ea7N2uC4QBdjgfQnhV0H/lHi6GYM5k1RAjQoGU/N1WwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637940; c=relaxed/simple;
	bh=jWDCBNpRQYgur7RNxKM2hlskoQUX524yO46lq5HIY/Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XjBoWKFCE+Ks/LHO9hI9nOVBCjmmkg0fzl4aVNcQvAm05dszAeKoGPTiiUbs0kUUf6OaglfoEDBRFOYkdEJWLlfUmcqzUQzNPRVqPtDk7oNSgnH0sdIWFcOo/WKb9s505XJXw7Us0leb4ZcD8p5NqdtR8akFvM70H0aVGGWjyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJP8xgu2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57044C4CEEE;
	Wed, 11 Jun 2025 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749637937;
	bh=jWDCBNpRQYgur7RNxKM2hlskoQUX524yO46lq5HIY/Q=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=uJP8xgu2rYKO2gt0cv3EJ54Qlg60R4VdBIOdmOW8aenX8BVQr15uI+t0nK5mLKd47
	 Do+cbGIl5oaWZrvn2ygQwMnLawAgKzZ27vTVLQmeF6mnf9x9/Kk+9kA9jG9Olbc87N
	 PyONYF4lz3ny46Ws3o2kfwBbwCk34JkGRlZU1Auvg3CkZez+0s6HRcujyul8RBUshY
	 YxgU1txhgvhAJaoESZrF7xEH70prldFy3/HLb8NS8heUMGQRfg7drk5yQfEwks9QFd
	 DhwRpx/DpOoTK3Yqi6lck3N3aTpa83II7/6/Z5uF89Fo/PgpiipowT3pHe9CRWi8bz
	 UHBrNbtPGh1vA==
Message-ID: <56d755fb-67d2-414a-bb49-7444a55332cb@kernel.org>
Date: Wed, 11 Jun 2025 12:32:13 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: Fix compilation without CONFIG_OF
From: Jiri Slaby <jirislaby@kernel.org>
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 lee@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
 tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-omap@vger.kernel.org
References: <20250602201008.1850418-1-superm1@kernel.org>
 <9feed8e3-e831-4096-8a4a-0ceca7d18f61@kernel.org>
 <a3754c77-b85c-48f7-aacf-b50725b2dd01@kernel.org>
Content-Language: en-US
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <a3754c77-b85c-48f7-aacf-b50725b2dd01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09. 06. 25, 10:31, Jiri Slaby wrote:
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

Sorry to interrupt once again. It turns out Arnd used dev_fwnode() -- my 
intention, so I actually prefer that version.

>> Hopefully all the fixes can be applied now, so no more duplicated 
>> efforts. Sorry for the breakage.

thanks,
-- 
js
suse labs


